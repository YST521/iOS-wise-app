//
//  BanhuiAddViewController.m
//  WiseAPP
//
//  Created by app on 16/11/4.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BanhuiAddViewController.h"

@interface BanhuiAddViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)UITableView* XunjianTypeTableView;
@property(nonatomic,strong)UITextField * banhuiStarTimeFi;
@property(nonatomic,strong)UITextView* banhuiContentFv;
@property(nullable,strong)UITextField* banhuiAddressFi;

@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UILabel* titleLa;
@property(nonatomic,strong)NSArray* pickArray;
@property(nonatomic,strong)UIPickerView*pickView;

@end
static NSString* xunjiandianweiID = @"xunjiandianweiID";
@implementation BanhuiAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"班会设置";
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    [self addData];
    [self addView];
    
}
-(void)saveAction:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)addData{
    self.dataArray=[NSMutableArray array];
    self.dataArray=(NSMutableArray*) @[@"11",@"22",@"33",@"55",@"66"];
    self.pickArray=[NSArray array];
    self.pickArray= @[@"日班",@"夜班",@"常日班",@""];
    
}
-(void)addView{
    
    self.XunjianTypeTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, STANDARD_HEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:self.XunjianTypeTableView];
    self.XunjianTypeTableView.dataSource = self;
    self.XunjianTypeTableView.delegate = self;
    [self.XunjianTypeTableView registerClass:[PublieTableViewCell class] forCellReuseIdentifier:xunjiandianweiID];
    
    UILabel* titleLa=[[UILabel alloc]init];
    titleLa.frame = CGRectMake(10, CGRectGetMaxY(self.XunjianTypeTableView.frame)+10, 120, 30);
    titleLa.text = @"班会开始时间";
    titleLa.textColor = textCententColor;
    [self.view addSubview:titleLa];
    
    UIImageView*imagBg=[[UIImageView alloc]init];
    imagBg.frame = CGRectMake(SCREEN_WIDTH -120, titleLa.y, 110, 30);    //textfilebackgroundimage.png // textfile
    imagBg.image =[UIImage imageNamed:@"textfilebackgroundimage.png"];
    
    [self.view addSubview:imagBg];
    imagBg.userInteractionEnabled = YES;
    
    self.banhuiStarTimeFi=[[UITextField alloc]init];
     self.banhuiStarTimeFi.frame = CGRectMake(0, 0, imagBg.width-20, imagBg.height);
    self.banhuiStarTimeFi.placeholder =@"开始时间";
     self.banhuiStarTimeFi.textColor = textCententColor;
    //self.produceFile.backgroundColor=[UIColor blueColor];
    [imagBg addSubview: self.banhuiStarTimeFi];
    
    UILabel* renwuLa=[[UILabel alloc]init];
    renwuLa.frame = CGRectMake(10, CGRectGetMaxY(imagBg.frame)+10, SCREEN_WIDTH-20, 30);
    renwuLa.text = @"班会地点";
    renwuLa.textColor = textCententColor;
    [self.view addSubview:renwuLa];
    
    UIImageView*addressBg=[[UIImageView alloc]init];
   addressBg.frame = STANDARDWH(CGRectGetMaxY(renwuLa.frame)+10);    //textfilebackgroundimage.png // textfile
    addressBg.image =[UIImage imageNamed:@"textfilebackgroundimage.png"];
    
    [self.view addSubview:addressBg];
    addressBg.userInteractionEnabled = YES;
    
    self.banhuiStarTimeFi=[[UITextField alloc]init];
    self.banhuiStarTimeFi.frame = CGRectMake(STANDARD_X, 0, STANDARD_WIDTH, addressBg.height);
    self.banhuiStarTimeFi.placeholder =@"例如：1号会议室";
    self.banhuiStarTimeFi.textColor = textCententColor;
    //self.produceFile.backgroundColor=[UIColor blueColor];
    [addressBg addSubview: self.banhuiStarTimeFi];

    UILabel* contentLa=[[UILabel alloc]init];
    contentLa.frame = CGRectMake(10, CGRectGetMaxY(addressBg.frame)+10, SCREEN_WIDTH-20, 30);
   contentLa.text = @"班会内容";
   contentLa.textColor = textCententColor;
    [self.view addSubview:contentLa];
    
    
    self.banhuiContentFv=[[UITextView alloc]init];
    self.banhuiContentFv.frame = CGRectMake(STANDARD_X, CGRectGetMaxY(contentLa.frame)+10, addressBg.width, 150);
   self.banhuiContentFv.backgroundColor =[UIColor redColor];
    [self.view addSubview:self.banhuiContentFv];
    
    UIView* photoView=[[UIView alloc]init];
    photoView.frame = CGRectMake(STANDARD_X, CGRectGetMaxY(self.banhuiContentFv.frame)+10, addressBg.width, 80);
    photoView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:photoView];
    
    
    
    
}
#pragma mark ------tableviewdelegate ----------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PublieTableViewCell*cell=[self.XunjianTypeTableView dequeueReusableCellWithIdentifier:xunjiandianweiID];
     cell.leftLa.text = @"班次选择";
        //cell.rightLa.text = @"去选择";
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self creatPickView:@"巡检方式"];
}


//pickViewdelegate
-(void)creatPickView:(NSString*)title {
    self.bgView=[[UIView alloc]initWithFrame:UIScreenBpunds];
    self.bgView.backgroundColor = popBGColore;
    [self.view addSubview:self.bgView];
    self.bgView.userInteractionEnabled = YES;
    
    UIView*bgView=[[UIView alloc]init];
    bgView.frame = CGRectMake(PROPORTION_WIDTH(15),PROPORTION_HIGHT(100) , SCREEN_WIDTH-PROPORTION_WIDTH(30), PROPORTION_HIGHT((self.pickArray.count+2)*45)+30);
    bgView.backgroundColor=[UIColor whiteColor];
    [self.bgView addSubview:bgView];
    
    UIImageView*titleBg=[[UIImageView alloc]init];
    titleBg.frame = CGRectMake(0, 0, bgView.width,  STANDARD_HEIGHT);
    titleBg.image =[UIImage imageNamed:@"nabackgroundImage.png"];
    [bgView addSubview:titleBg];
    
    UILabel* titleLabel=[[UILabel alloc]initWithFrame:titleBg.bounds];
    titleLabel.text =  title;
    titleLabel.textAlignment =NSTextAlignmentCenter;
    titleLabel.textColor =  [UIColor whiteColor];
    [bgView addSubview: titleLabel];
    
    self.pickView=[[UIPickerView alloc]init];
    self.pickView.frame = CGRectMake(0, CGRectGetMaxY(titleBg.frame), bgView.width, PROPORTION_HIGHT(45*self.pickArray.count));
    [bgView addSubview:self.pickView];
    self.pickView.delegate =self;
    self.pickView.dataSource = self;
    self.pickView.userInteractionEnabled = YES;
    self.bgView.hidden = NO;
    
    UIButton* XueLibackBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    XueLibackBtn.frame = CGRectMake(PROPORTION_WIDTH(16), CGRectGetMaxY(self.pickView.frame)+10, (bgView.width-PROPORTION_WIDTH(10)*2-10)/2, STANDARD_HEIGHT);
    KUIbutton( XueLibackBtn);
    KUIbuttonClick(XueLibackBtn);
    [ XueLibackBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    [bgView addSubview: XueLibackBtn];
    
    UIButton* XueLidoneBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    XueLidoneBtn.frame=CGRectMake(CGRectGetMaxX( XueLibackBtn.frame)+10,  XueLibackBtn.y,  XueLibackBtn.width,  XueLibackBtn.height);
    KUIbutton(XueLidoneBtn);
    KUIbuttonClick(XueLidoneBtn);
    [XueLidoneBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    [bgView addSubview:XueLidoneBtn];
    
    
    [XueLibackBtn addTarget:self action:@selector(xueliBackAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [XueLidoneBtn addTarget:self action:@selector(xueliDoneAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
}

-(void)xueliBackAction:(UIButton*)sender{
    
    self.bgView.hidden = YES;
    
}
-(void)xueliDoneAction:(UIButton*)sender{
    
    self.bgView.hidden = YES;
    [self.XunjianTypeTableView reloadData];
}
#pragma mark UIPickerView Delegate Method 代理方法
//指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;//第一个展示字母、第二个展示数字
}
//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return self.pickArray.count;
}

//指定每行如何展示数据（此处和tableview类似）
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * title = nil;
    title = self.pickArray[row];
    
    NSIndexPath *indexPath = [self.XunjianTypeTableView indexPathForSelectedRow];
    PublieTableViewCell *cell = [self.XunjianTypeTableView cellForRowAtIndexPath: indexPath];
    cell.rightLa.text = self.pickArray[row];
    
    cell.rightLa.textColor= textCententColor;
    
    return title;
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
