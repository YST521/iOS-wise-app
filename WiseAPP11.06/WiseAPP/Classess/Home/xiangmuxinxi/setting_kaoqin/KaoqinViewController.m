//
//  KaoqinViewController.m
//  WiseAPP
//
//  Created by app on 16/10/13.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "KaoqinViewController.h"
#import "LocationHander.h"
#import "AnnotionModel.h"
#import<CoreLocation/CoreLocation.h>//定位
#import <MapKit/MapKit.h> //地图

@interface KaoqinViewController ()<CLLocationManagerDelegate,MKMapViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)MKMapView* mapView;
//创建管理者
//@property(nonatomic,strong)CLLocationManager *locationManger;

@property(nonatomic,strong)UITableView* kaoqinTableView;
@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)UILabel* longitude;
@property(nonatomic,strong)UILabel* latitude;
@property(nonatomic,strong)UILabel* location;
@property(nonatomic,strong)UILabel* cityLable;
@property(nonatomic,strong)UILabel* addressLa;
//弹框
@property(nonatomic,strong)POPView* diZhiView;
@property(nonatomic,strong)POPView* fanWeiView;
@property(nonatomic,strong)POPView* yueTianshuView;
@property(nonatomic,strong)POPView* LuRuView;
@property(nonatomic,strong)POPView* tiShiView;
@property(nonatomic,strong)UIView* headView;

@property(nonatomic,assign)CGFloat la;
@property(nonatomic,assign)CGFloat lon;
@property(nonatomic,assign)NSInteger fanweiInt;
@property(nonatomic,strong)CLGeocoder* geocoder;


@end

@implementation KaoqinViewController
-(CLGeocoder *)geocoder{
    if (!_geocoder) {
        _geocoder =[[CLGeocoder alloc]init];
    }
    return _geocoder;
}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   self.navigationItem.title =@"考勤设置";

    [self addData];
    [self addView];
}
-(void)addData{
    //红色覆盖物范围
    self.fanweiInt= 200;
    
self.dataArray =(NSMutableArray*) @[@"签到地址",@"考勤范围",@"月可出勤天数",@"提示录入指纹时间",@"提示签合同时间"];
    
    //编码
  
    
    //反编码
    [self getCoordinateByAddress:@"上海市上汽上海文化广场"];
}

//-(void)getLocation{
//    self.locationManger=[[CLLocationManager alloc]init];
//    //开启定位 不开定位 视图不显示
//    [self.locationManger startUpdatingLocation];
//
//}

-(void)addView{
    
    if ([LocationHander handleCoo2D].handercoo2dArray.count ==0) {
        NSLog(@"定位失败，请重新定位");
    }else{
//self.la = [[[LocationHander handleCoo2D].handercoo2dArray firstObject]  doubleValue ];
    
        self.la=31.21217300;
        self.lon =121.46099300;
 //self.lon = [[LocationHander handleCoo2D].handercoo2dArray[1]  doubleValue];
    }
    ///<31.21217300,+121.46099300>
    
    self.headView =[[UIView alloc]init];
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, PROPORTION_HIGHT(220));
    self.headView.backgroundColor = popBGColore;
    
    self.mapView=[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
    
   self.mapView.frame = CGRectMake(0, 0, SCREEN_WIDTH, PROPORTION_HIGHT(190));
    [self.headView addSubview:self.mapView];
    //设置代理
    self.mapView.delegate =self;
    //添加圆形覆盖物
    [self MKCircleSetting];
    
    self.mapView.mapType = MKMapTypeStandard;//有多个样式此处用标准类型
    //设置追踪模式
   self.mapView.userTrackingMode = MKUserTrackingModeFollow;
     [self.mapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake(self.la, self.lon), MKCoordinateSpanMake(0.006, 0.006))];

    
    self.addressLa=[[UILabel alloc]init];
    self.addressLa.frame =CGRectMake(0,CGRectGetMaxY(self.mapView.frame), SCREEN_WIDTH, 30);
    self.addressLa.font =[UIFont systemFontOfSize:14];
    [self.headView addSubview:self.addressLa];
    

    self.kaoqinTableView=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
    [self.view addSubview:self.kaoqinTableView];
    self.kaoqinTableView.tableHeaderView = self.headView;
    
    self.kaoqinTableView.dataSource = self;
    self.kaoqinTableView.delegate = self;
    [self.kaoqinTableView registerClass:[PublieTableViewCell class] forCellReuseIdentifier:@"kaoqinCellId"];
   


    NSLog(@"ppOOOOp%@",[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"place"]);
    self.addressLa.text =[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"place"];
   MKPointAnnotation *annotation0 = [[MKPointAnnotation alloc] init];
    [annotation0 setCoordinate:CLLocationCoordinate2DMake(self.la, self.lon)];
   [annotation0 setTitle:[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"city"]];
    [annotation0 setSubtitle:self.addressLa.text];
    [self.mapView addAnnotation:annotation0];
    //是否自动显示大头针内容
   [self.mapView selectAnnotation:annotation0 animated:YES];
    
//    AnnotionModel *annotation=[[AnnotionModel alloc]init];
//    annotation.coordinate=CLLocationCoordinate2DMake(self.la, self.lon);
//    annotation.title=[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"city"];
//    annotation.subtitle=self.addressLa.text;
//    //添加
//    [self.mapView addAnnotation:annotation];
//     [self.mapView selectAnnotation:annotation animated:YES];
   
}
-(void)MKCircleSetting{
MKCircle * cirle = [MKCircle circleWithCenterCoordinate:CLLocationCoordinate2DMake(self.la, self.lon) radius:self.fanweiInt];
[_mapView addOverlay:cirle];
}



-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    MKCircleRenderer * render=[[MKCircleRenderer alloc]initWithCircle:overlay];
        render.lineWidth=1;    //填充颜色
    render.fillColor=[UIColor colorWithRed:250 green:0 blue:0 alpha:0.5];    //线条颜色
        render.strokeColor=[UIColor redColor];
    return render;
    }

//定位大头针
//- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id )annotation
//{
//    MKPinAnnotationView *pinView = nil;
//    
//    static NSString *defaultPinID = @"com.invasivecode.pin";
//    pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
//    if ( pinView == nil ) pinView = [[[MKPinAnnotationView alloc]
//                                      initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
//    pinView.pinColor = MKPinAnnotationColorRed;
//    pinView.canShowCallout = YES;
//    pinView.animatesDrop = YES;
//    [mapView.userLocation setTitle:[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"city"]];
//    [mapView.userLocation setSubtitle:[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"place"]];
//    return pinView;
//}

//
//- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id )annotation
//{
//    MKPinAnnotationView *pinView = nil;
//    
//    static NSString *defaultPinID = @"com.invasivecode.pin";
//    pinView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
//    if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc]
//                                      initWithAnnotation:annotation reuseIdentifier:defaultPinID];
//    //pinView.pinColor = MKPinAnnotationColorRed;
//    pinView.tintColor = [UIColor greenColor];
//    pinView.canShowCallout = YES;
//    pinView.animatesDrop = YES;
//    [self.mapView .userLocation setTitle:[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"city"]];
//    [self.mapView .userLocation setSubtitle:[[LocationHander handleCoo2D].handelcoo2dDic objectForKey:@"place"]];
//    NSLog(@"AAAAAA%@",annotation);
//
//    return pinView;
//}

//给经纬度大头针
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If the annotation is the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKAnnotationView* aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"MKPointAnnotation"];
        aView.image = [UIImage imageNamed:@"iconfont-dizhi copy"];
        aView.canShowCallout = YES;
        
        return aView;
    }
    return nil;
}

#pragma mark -------------delegate------------
//根据地名获取坐标
-(void)getCoordinateByAddress:(NSString*)address {
    
   // CLLocation* location=[[CLLocation alloc]init];
    [self.geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        //获取第一个坐标
        CLPlacemark* placeMark =[placemarks firstObject];
        CLLocation* location = placeMark.location;//位置
        CLRegion* region = placeMark.region;
        NSDictionary* addressDic= placeMark.addressDictionary;//详细地址
        
        NSLog(@"%@%@%@%@",placeMark,location,region,addressDic);
       // if (location==nil) {
             [ [LocationHander handleCoo2D].handercoo2dArray  addObject:location];
//        }else{
//            NSLog(@"获取经纬度失败");
//        }
      

    }];

}

//根据坐标获取地名
-(void)getAddressLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitiude{
//反地理编码
    CLLocation* location =[[CLLocation alloc]initWithLatitude:latitude longitude:longitiude];
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark*placeMark =[placemarks firstObject];
        
        NSLog(@"%@",placeMark.addressDictionary);
    }];



}



#pragma mark ======delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   PublieTableViewCell*cell=[self.kaoqinTableView dequeueReusableCellWithIdentifier:@"kaoqinCellId"];

    cell.textLabel.text = self.dataArray[indexPath.row];
    
    //去除多余cell
    self.kaoqinTableView.tableFooterView=[[UIView alloc]init];
    
    return  cell;
}
//cell跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row ==0) {
        [self address];
    }else if (indexPath.row ==1 ){
      
        [self fanWei];
       
    }else if (indexPath.row == 2){
        [self yueTianShu];
    
    }else if (indexPath.row == 3){
        [self luruView];
    }else if (indexPath.row == 4){
        [self Tishi];
    }


}

//地址
-(void)address{
    self.diZhiView=[[POPView alloc]initWithFrame:UIScreenBpunds];
    [self.view addSubview:self.diZhiView];
    self.diZhiView.popTitle.text=@"签到地址";
    self.diZhiView.popTextFile.placeholder = @"例如： 复兴中路100号";
    [self.diZhiView.popDoneBtn addTarget:self action:@selector(dizhiAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
//范围
-(void)fanWei{
    self.fanWeiView =[[POPView alloc]initWithFrame:UIScreenBpunds];
    [self.view addSubview:self.fanWeiView];
   self.fanWeiView.popTitle.text=@"考勤范围";
   
    self.fanWeiView.popTextFile.placeholder = @"例如： 200 (米)";
    [self.fanWeiView.popDoneBtn addTarget:self action:@selector(fanWeiAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
//月考勤天数
-(void)yueTianShu{
    self.yueTianshuView =[[POPView alloc]initWithFrame:UIScreenBpunds];
    [self.view addSubview:self.yueTianshuView];
 self.yueTianshuView.popTitle.text=@"月出勤天数";
 self.yueTianshuView.popTextFile.placeholder = @"例如： 26 (天)";
    [self.yueTianshuView.popDoneBtn addTarget:self action:@selector(yueTianShuAction:) forControlEvents:(UIControlEventTouchUpInside)];
}
//范围
-(void)Tishi{
    self.tiShiView =[[POPView alloc]initWithFrame:UIScreenBpunds];
    [self.view addSubview:  self.tiShiView];
     self.tiShiView.popTitle.text=@"提示签合同时间";
     self.tiShiView.popTextFile.placeholder = @"例如： 26 (天)";
    [  self.tiShiView.popDoneBtn addTarget:self action:@selector(tiShiAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

//范围
-(void)luruView{
    self.LuRuView =[[POPView alloc]initWithFrame:UIScreenBpunds];
    [self.view addSubview: self.LuRuView];
    self.LuRuView.popTitle.text=@"提示录入指纹时间";
    self.LuRuView.popTextFile.placeholder = @"例如： 26 (天)";
    [ self.LuRuView.popDoneBtn addTarget:self action:@selector(luruAction:) forControlEvents:(UIControlEventTouchUpInside)];
}


// address
-(void)dizhiAction:(UIButton*)sender{
    [self popCellBack:self.diZhiView.popTextFile.text];
    
    [self  getCoordinateByAddress:@"上海市人民广场"];
    [[LocationHander handleCoo2D].handercoo2dArray firstObject];
    NSLog(@"经纬度%@", [[LocationHander handleCoo2D].kaoqinNocationArray firstObject]);
    self.diZhiView.hidden = YES;
}
//fanwei
-(void)fanWeiAction:(UIButton*)sender{
    
    [self popCellBack:self.fanWeiView.popTextFile.text];
         self.fanweiInt = [self.fanWeiView.popTextFile.text integerValue];
    //添加圆形覆盖物
    [self MKCircleSetting];
    self.fanWeiView.hidden = YES;
}
//yuetianshu
-(void)yueTianShuAction:(UIButton*)sender{
    [self popCellBack:self.yueTianshuView.popTextFile.text];
    self.yueTianshuView.hidden = YES;
}
//yuetianshu
-(void)tiShiAction:(UIButton*)sender{
    [self popCellBack:self.tiShiView.popTextFile.text];
    self.tiShiView.hidden = YES;
}

//yuetianshu
-(void)luruAction:(UIButton*)sender{
    [self popCellBack:self.LuRuView.popTextFile.text];
    self.LuRuView.hidden = YES;
}




-(void)popCellBack:(NSString*)backString{
    
    NSIndexPath *indexPath = [self.kaoqinTableView indexPathForSelectedRow];
    
    PublieTableViewCell *cell = [self. kaoqinTableView cellForRowAtIndexPath: indexPath];
    cell.rightLa.text = backString;
    cell.rightLa.textColor = textCententColor;
    
    [self.kaoqinTableView reloadData];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}
//自定义大头针
//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    // If the annotation is the user location, just return nil.
//    if ([annotation isKindOfClass:[MKUserLocation class]])
//        return nil;
//    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
//        MKAnnotationView* aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"MKPointAnnotation"];
//        aView.image = [UIImage imageNamed:@"myimage"];
//        aView.canShowCallout = YES;
//        return aView;
//    }
//    return nil;
//}


//获得经纬度
//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    //将经度显示到label上
//    self.longitude.text = [NSString stringWithFormat:@"%lf", newLocation.coordinate.longitude];
//    //将纬度现实到label上
//    self.latitude.text = [NSString stringWithFormat:@"%lf", newLocation.coordinate.latitude];
//    // 获取当前所在的城市名
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    //根据经纬度反向地理编译出地址信息
//    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
//        if (array.count > 0){
//            CLPlacemark *placemark = [array objectAtIndex:0];
//            //将获得的所有信息显示到label上
//            self.location.text = placemark.name;
//            //获取城市
//            NSString *city = placemark.locality;
//            if (!city) {
//                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
//                city = placemark.administrativeArea;
//            }
//            NSLog(@"city = %@", city);
//            _cityLable.text = city;
//           // [_cityButton setTitle:city forState:UIControlStateNormal];
//        }
//        else if (error == nil && [array count] == 0)
//        {
//            NSLog(@"No results were returned.");
//        }
//        else if (error != nil)
//        {
//            NSLog(@"An error occurred = %@", error);
//        }
//    }];
//    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
//    [manager stopUpdatingLocation];
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
