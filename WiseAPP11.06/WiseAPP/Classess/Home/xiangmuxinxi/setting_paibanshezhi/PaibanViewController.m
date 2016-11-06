//
//  PaibanViewController.m
//  WiseAPP
//
//  Created by app on 16/10/13.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "PaibanViewController.h"
#import "BanciAddPeopleViewController.h"

@interface PaibanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)LDCalendarView    *calendarView;//日历控件
@property (nonatomic, strong)NSMutableArray *seletedDays;//选择的日期

@property(nonatomic,strong)UITableView* selectPeopleTaView;
@property(nonatomic,strong)NSMutableArray* dataArray;

@property(nonatomic,strong)UIButton* changRiBtn;
@property(nonatomic,strong)UIButton* ribanBtn;
@property(nonatomic,strong)UIButton* yebanBtn;

@end

@implementation PaibanViewController

-(NSMutableArray *)dataArray{
    if (_dataArray) {
        _dataArray =[NSMutableArray array];
    }
    return _dataArray;
}
- (NSString *)showStr {
    NSMutableString *str = [NSMutableString string];
    
    [str appendString:@"已选择日期:\r\n"];
    //从小到大排序
    [self.seletedDays sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    for (NSNumber *interval in self.seletedDays) {
        NSString *partStr = [NSDate stringWithTimestamp:interval.doubleValue/1000.0 format:@"MM.dd"];
        [str appendFormat:@"%@ ",partStr];
    }
    return [str copy];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    [self addView];
    
}
-(void)saveAction:(UIButton*)sender{
    
   // [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)addView{
   //当前时间设置
    UIImageView*imageV=[[UIImageView alloc]init];
    imageV.frame =CGRectMake(10, PROPORTION_HIGHT(15), PROPORTION_WIDTH(20), PROPORTION_HIGHT(20));
    imageV.backgroundColor=[UIColor blueColor];
    [self.view addSubview:imageV];
    
    UILabel* dateLa=[[UILabel alloc]init];
    dateLa.frame = CGRectMake(CGRectGetMaxX(imageV.frame)+10, imageV.y, 200, 20);
    dateLa.text = [self curretDateMM];
    [self.view addSubview:dateLa];
    
    //日期选择
    if (!_calendarView) {
        _calendarView = [[LDCalendarView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageV.frame)+10, SCREEN_WIDTH,380)];
        [self.view addSubview:_calendarView];
        
        __weak typeof(self) weakSelf = self;
        _calendarView.complete = ^(NSArray *result) {
            if (result) {
                weakSelf.seletedDays = [result mutableCopy];
             
            }
        };
    }
    [self.calendarView show];
    self.calendarView.defaultDates = _seletedDays;
    
   // self.showLa.text =self.showStr;
    NSLog(@"dddday%@%@",self.showStr,self.seletedDays);
    UIView* banciView=[[UIView alloc]init];
    banciView.frame= CGRectMake(0, CGRectGetMaxY(self.calendarView.frame)+5, SCREEN_WIDTH, STANDARD_HEIGHT);
    banciView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:banciView];
    banciView.userInteractionEnabled = YES;
    //班次选择
    self.changRiBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.changRiBtn.frame = CGRectMake(10, STANDRD_H_20_y, 20, 20);
    [banciView addSubview:self.changRiBtn];
    self.changRiBtn.backgroundColor=[UIColor redColor];
   
    UILabel*changriLa=[[UILabel alloc]init];
    changriLa.frame = CGRectMake(CGRectGetMaxX(self.changRiBtn.frame)+5, STANDRD_H_20_y, 60, 20);
    changriLa.text = @"常日班";
    [banciView addSubview:changriLa];
    
    self.ribanBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.ribanBtn.frame = CGRectMake(PROPORTION_WIDTH(160), STANDRD_H_20_y, 20, 20);
    [banciView addSubview:self.ribanBtn];
    self.ribanBtn.backgroundColor=[UIColor redColor];
    
    UILabel*ribanLa=[[UILabel alloc]init];
    ribanLa.frame = CGRectMake(CGRectGetMaxX(self.ribanBtn.frame)+5, STANDRD_H_20_y, 60, 20);
    ribanLa.text = @"日班";
    [banciView addSubview:ribanLa];
    
    self.yebanBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
   self.yebanBtn.frame = CGRectMake(PROPORTION_WIDTH(308), STANDRD_H_20_y, 20, 20);
    [banciView addSubview:self.yebanBtn];
    self.yebanBtn.backgroundColor=[UIColor redColor];
    
    UILabel*yebanLa=[[UILabel alloc]init];
  yebanLa.frame = CGRectMake(CGRectGetMaxX( self.yebanBtn.frame)+5, STANDRD_H_20_y, 60, 20);
   yebanLa.text = @"日班";
    [banciView addSubview:yebanLa];
    [self.changRiBtn addTarget:self action:@selector(changriBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.ribanBtn addTarget:self action:@selector(ribanBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.yebanBtn addTarget:self action:@selector(yebanBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];

    
//     self.changRiBtn.titleLabel.backgroundColor =  self.changRiBtn.backgroundColor;
//  self.changRiBtn.imageView.backgroundColor =  [UIColor greenColor];
    //在使用一次titleLabel和imageView后才能正确获取titleSize
//    CGSize titleSize =  self.changRiBtn.titleLabel.bounds.size;
//    CGSize imageSize =  self.changRiBtn.imageView.bounds.size;
//    CGFloat interval = 1.0;
//    
//    self.changRiBtn.imageEdgeInsets = UIEdgeInsetsMake(0,titleSize.width + interval, 0, -(titleSize.width + interval));
//     self.changRiBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize.width + interval), 0, imageSize.width + interval);
    
    
    self.selectPeopleTaView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(banciView.frame), SCREEN_WIDTH, 45) style:(UITableViewStylePlain)];
    [self.view addSubview:self.selectPeopleTaView];
    self.selectPeopleTaView.dataSource =self;
    self.selectPeopleTaView.delegate = self;
    
    //[self.selectPeopleTaView registerClass:[UITableViewCell class] forCellReuseIdentifier:@""];
    
}
-(void)changriBtnAction:(UIButton*)sender{
    NSLog(@"常日");
    
}
-(void)ribanBtnAction:(UIButton*)sender{
    NSLog(@"日班");
    
}
-(void)yebanBtnAction:(UIButton*)sender{
    NSLog(@"夜班");
    
}



#pragma mark ---------------------tableViewdelegate----------------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell=[self.selectPeopleTaView dequeueReusableCellWithIdentifier:@"cell" ];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"选择人员";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.text = @"去选择";
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BanciAddPeopleViewController* addPeopleVC=[[BanciAddPeopleViewController alloc]init];
    addPeopleVC.navigationItem.title = @"选择人员";
    [self.navigationController pushViewController:addPeopleVC animated:YES];

 }

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
