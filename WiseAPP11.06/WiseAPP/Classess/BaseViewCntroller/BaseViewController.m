//
//  BaseViewController.m
//  WiseAPP
//
//  Created by app on 16/10/9.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BaseViewController.h"
#import "Header.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

//定位
//- (CLLocationManager *)locationManager{
//    if (!_locationManger) {
//        _locationManger = [[CLLocationManager alloc]init];
//        
//        _locationManger.delegate = self;
//        
//        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ) {
//            
//            [_locationManger requestAlwaysAuthorization];
//            [_locationManger requestWhenInUseAuthorization];
//            
//        }
//    }
//    return _locationManger;
//}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:21],NSFontAttributeName, [UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addView];
    self.view.backgroundColor = YSTGlobBg;
    
//    self.mapView = [[MKMapView alloc] init];
//    [self.view addSubview:self.mapView];
//    self.mapView.delegate = self;
//    
//    //开启定位 不开定位 视图不显示
//    [self.locationManager startUpdatingLocation];
//    MKPointAnnotation *annotation0 = [[MKPointAnnotation alloc] init];
//    [annotation0 setCoordinate:CLLocationCoordinate2DMake(31.213468, 121.458356)];
//    [annotation0 setTitle:@"重庆理工大学"];
//    [annotation0 setSubtitle:@"重庆市巴南区红光大道69号"];
//    [self.mapView addAnnotation:annotation0];
//    
   NSLog(@"----edrrffffff");
    NSLog(@"6666666");

}

-(NSString*)curretDateMM{

    
   
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss SS"];
      [dateFormatter setDateFormat:@"YYYY年MM月 "];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);
    return dateString;
}
-(NSString*)curretDateDD{
    
    
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"YYYY年MM月dd日 "];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);
    return dateString;
}

-(NSString*)curretDatehhSS{
    
    
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"YYYY年MM月dd日 hh时:mm分 "];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);
    return dateString;
}

-(void)addView{


    //self.view.backgroundColor = [UIColor colorWithRed:244/255 green:244/255 blue:244/255 alpha:1];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:21],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

//定位
//
//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    //将经度显示到label上
//
//    self.longNum =newLocation.coordinate.longitude;
//    //将纬度现实到label上
//
//    self.laNum =newLocation.coordinate.latitude;
//    NSLog(@"KKKKK****%f %f",self.laNum,self.longNum);
//    MKPointAnnotation *annotation0 = [[MKPointAnnotation alloc] init];
//    [annotation0 setCoordinate:CLLocationCoordinate2DMake(self.laNum, self.longNum)];
//    [annotation0 setTitle:@"上海市文化广场"];
//    [annotation0 setSubtitle:@"上海市永嘉路36号"];
//    [self.mapView addAnnotation:annotation0];
//
//    
//    // 获取当前所在的城市名
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    //根据经纬度反向地理编译出地址信息
//    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
//        if (array.count > 0){
//            CLPlacemark *placemark = [array objectAtIndex:0];
//            //将获得的所有信息显示到label上
//            //self.location.text = placemark.name;
//            //获取城市
//            NSString *city = placemark.locality;
//            if (!city) {
//                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
//                city = placemark.administrativeArea;
//            }
//            NSLog(@"city = %@", city);
//        self.cityName = city;
//      
//        }
//        else if (error == nil && [array count] == 0)
//        {
//            NSLog(@"No results were returned.");
//        }
//        else if (error != nil)
//        {
//            NSLog(@"An error occurred = %@", error);
//        }
//        
//        
//    }];
//    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
//    [manager stopUpdatingLocation];
//}
//
//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    // If the annotation is the user location, just return nil.
//    if ([annotation isKindOfClass:[MKUserLocation class]])
//        return nil;
//    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
//        MKAnnotationView* aView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"MKPointAnnotation"];
//        aView.image = [UIImage imageNamed:@"iconfont-dizhi copy"];
//        aView.canShowCallout = YES;
//        return aView;
//    }
//    return nil;
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
