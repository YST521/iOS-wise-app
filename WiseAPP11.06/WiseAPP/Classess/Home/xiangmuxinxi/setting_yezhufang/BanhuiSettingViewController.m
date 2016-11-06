//
//  BanhuiSettingViewController.m
//  WiseAPP
//
//  Created by app on 16/10/28.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BanhuiSettingViewController.h"
#import "BanhuiAddViewController.h"


@interface BanhuiSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel*label2;
@property(nonatomic,strong)UITableView* BanhuiAddtableView;
@property(nonatomic,strong)NSMutableArray
*dataArray;
@property(nonatomic,strong)UIView* footView;
@property(nonatomic,strong)UIButton* addBtn;
@end

static NSString* banhuicellID =@"banhuicellID";
@implementation BanhuiSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addData];
    [self addView];
}
-(void)addData{
    
    self.dataArray=[NSMutableArray array];
    //self.dataArray = (NSMutableArray*)@[@"111",@"222",@"333",@"66",@"33",@"77"];
    self.dataArray = (NSMutableArray*)@[@"111",@"222",@"333"];
}
-(void )addView{
    if (self.dataArray.count ==0) {
        self.view.backgroundColor= GlobBackGroundColor;
        //第一次为空 提示添加
        [self noDataPageLabel];
    }else{
        self.view.backgroundColor= GlobBackGroundColor;
        self.BanhuiAddtableView.backgroundColor = GlobBackGroundColor;
        self.BanhuiAddtableView=[[UITableView alloc]initWithFrame:UIScreenBpunds];
        [self.view addSubview: self.BanhuiAddtableView];
         self.BanhuiAddtableView.delegate = self;
         self.BanhuiAddtableView.dataSource = self;
        [ self.BanhuiAddtableView registerClass:[UITableViewCell class] forCellReuseIdentifier:banhuicellID];
    }
    //添加footview
    self.footView=[[UIView alloc]init];
    self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
    self.BanhuiAddtableView.tableFooterView = self.footView;
    self.footView.backgroundColor = GlobBackGroundColor;
    self.addBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.footView.hidden = NO;
    self.footView.backgroundColor=[UIColor greenColor];
    
    self.addBtn.backgroundColor=[UIColor redColor];
    if (self.dataArray.count <5) {
        self.addBtn.frame = CGRectMake(0, 0, PROPORTION_WIDTH(60), PROPORTION_HIGHT(60));
        self.addBtn.center = CGPointMake(SCREEN_WIDTH/2 ,  self.footView.height/2);
        self.addBtn.layer.cornerRadius = self.addBtn.width/2;
        [self.footView addSubview:self.addBtn];
    }else{
        
        self.addBtn.frame = CGRectMake(0, 0, PROPORTION_WIDTH(60), PROPORTION_HIGHT(60));
        self.addBtn.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT-100);
        self.footView.hidden = YES;
        self.addBtn.layer.cornerRadius = self.addBtn.width/2;
        [self.view addSubview:self.addBtn];
    }
    
    
    [self.addBtn addTarget:self action:@selector(yezhuSettingAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    
}
-(void)noDataPageLabel{
    
    //超链接label
    
    //添加手势的方法
    self.label2=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 200, 40)];
    //self.label2.backgroundColor=[UIColor greenColor];
    [self.view addSubview:self.label2];
    //self.label2.text=@"还没有任何信息，去添加信息";
    //self.title = @"For iOS 6 & later";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"Using NSAttributed String"];
    //[str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,5)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(6,12)];
    // [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(19,6)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
    // [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0] range:NSMakeRange(6, 12)];
    //[str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
    self.label2.attributedText = str;
    
    UITapGestureRecognizer*tapRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yezhuSettingAction:)];
    //打开交互
    self.label2.userInteractionEnabled=YES;
    
    [self.label2 addGestureRecognizer:tapRecognizer1];
}
-(void)yezhuSettingAction:(id)sender

{
    BanhuiAddViewController* banhuiaddVC =[[BanhuiAddViewController alloc]init];
    [self.navigationController pushViewController:banhuiaddVC animated:YES];
    
    //    NSString* path=[NSString stringWithFormat:@"http://www.baidu.com"];
    //
    //    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path]];
    //
    //    //跳转网址
    //    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.apple.com.cn/"]];
    //    //打电话
    //    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  PROPORTION_HIGHT(80);
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   UITableViewCell*cell =[self.BanhuiAddtableView dequeueReusableCellWithIdentifier:banhuicellID];
  
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BanhuiAddViewController* banhuiaddVC =[[BanhuiAddViewController alloc]init];
    [self.navigationController pushViewController:banhuiaddVC animated:YES];
    
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
