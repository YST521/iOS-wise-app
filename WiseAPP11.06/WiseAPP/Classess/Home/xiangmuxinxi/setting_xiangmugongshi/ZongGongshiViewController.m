//
//  ZongGongshiViewController.m
//  WiseAPP
//
//  Created by app on 16/10/31.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "ZongGongshiViewController.h"
#import "ZonggongshiView.h"
#import "LDCalendarView.h" //日历
#import "NSDate+extend.h"
@interface ZongGongshiViewController ()
@property(nonatomic,strong)ZonggongshiView*zonggongshiView;
@property (nonatomic, strong)LDCalendarView    *calendarView;//日历控件
@property (nonatomic, strong)NSMutableArray *seletedDays;//选择的日期
@property(nonatomic,strong)UITableView* zongGongshiTableview;

@property (nonatomic, copy)NSString *showStr;
@property(nonatomic,strong)UIView* upView;
@property(nonatomic,strong)UILabel* gongshiNumLa;
@property(nonatomic,strong)UILabel* showLa;

@end

@implementation ZongGongshiViewController

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

//-(void)loadView{
//    self.zonggongshiView=[[ZonggongshiView alloc]initWithFrame:UIScreenBpunds];
//    self.view = self.zonggongshiView;
//
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addView];
}

-(void)addView{
//    self.zongGongshiTableview=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
//    [self.view addSubview:self.zongGongshiTableview];

    self.upView=[[UIView alloc]init];
    self.upView.frame = CGRectMake(0, 0, PROPORTION_WIDTH(80), PROPORTION_HIGHT(80));
    self.upView.center = CGPointMake(SCREEN_WIDTH/2, PROPORTION_HIGHT(40)+10);
    [self.view addSubview:self.upView];
    self.upView.layer.cornerRadius = self.upView.width/2;
    self.upView.layer.borderWidth = 2;
    self.upView.layer.borderColor=[UIColor blueColor].CGColor;
    
    self.showLa=[[UILabel alloc]init];
    self.showLa.frame = CGRectMake(CGRectGetMaxX(self.upView.frame)+3, 0, 100, 100);
    [self.upView addSubview:self.showLa];
    
    
    UILabel*upLa=[[UILabel alloc]init];
    upLa.frame = CGRectMake(self.upView.width/5, self.upView.height/4, self.upView.width-(self.upView.width/5)*2, 20);
    upLa.text = @"总计工时";
    upLa.font =[UIFont systemFontOfSize:12];
    upLa.textColor = textCententColor;
    upLa.textAlignment =NSTextAlignmentCenter;
    [self.upView addSubview:upLa];
    
    self.gongshiNumLa=[[UILabel alloc]init];
    self.gongshiNumLa.frame =CGRectMake(upLa.x, CGRectGetMaxY(upLa.frame), upLa.width, 30);
    self.gongshiNumLa.textColor =[UIColor redColor];
    self.gongshiNumLa.font =[UIFont systemFontOfSize:14];
    self.gongshiNumLa.text =@"0";
    self.gongshiNumLa.textAlignment =NSTextAlignmentCenter;
    [self.upView addSubview:self.gongshiNumLa];
    
    //日期选择
    if (!_calendarView) {
        _calendarView = [[LDCalendarView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.upView.frame)+10, SCREEN_WIDTH,380)];
        [self.view addSubview:_calendarView];
        
        __weak typeof(self) weakSelf = self;
        _calendarView.complete = ^(NSArray *result) {
            if (result) {
                weakSelf.seletedDays = [result mutableCopy];
             NSLog(@"kkkkdddday%@",self.seletedDays);
            }
        };
    }
    [self.calendarView show];
    self.calendarView.defaultDates = _seletedDays;
    
    self.showLa.text =self.showStr;
    NSLog(@"dddday%@",self.seletedDays);

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
