//
//  BaogangAddViewController.m
//  WiseAPP
//
//  Created by app on 16/11/3.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BaogangAddViewController.h"
#import "PublieTableViewCell.h"
#import "BaoGangSelectGangweiViewController.h"

@interface BaogangAddViewController ()<UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong)UITableView *baogangAddTabView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UIView* headView;
@property(nonatomic,strong)UITextField* timeLa;

@property(nonatomic,strong)NSMutableArray* timeDataArray;
@property(nonatomic,strong)NSMutableArray* banciArray;
@property(nonatomic,strong)UIPickerView *pickView;
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UILabel* titleLa;
@property(nonatomic,strong)NSArray* pickArray;

@end

@implementation BaogangAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"报岗信息设置";
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    [self addData];
    [self addView];
    
}
-(void)saveAction:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)addData{
    self.dataArray=[NSMutableArray array];
    self.timeDataArray=[NSMutableArray array];
    self.banciArray = [NSMutableArray array];
    self.pickArray=[NSArray array];
    self.dataArray =(NSMutableArray*)@[@"11",@"22",@"33"];
    self.timeDataArray = (NSMutableArray*)@[@"5分钟",@"10分钟",@"15分钟"];
    self.banciArray = (NSMutableArray*)@[@"常日班",@"日班",@"夜班"];

}

-(void)addView{
    self.headView=[[UIView alloc]init];
    self.headView.frame =CGRectMake(0, 0, SCREEN_WIDTH,PROPORTION_HIGHT(64));
    UILabel* starTimeLa=[[UILabel alloc]init];
    starTimeLa.frame = CGRectMake(10,PROPORTION_HIGHT(22), PROPORTION_WIDTH(120), 20);
    starTimeLa.text = @"报岗开始时间";
    starTimeLa.textColor = textColorPlace;
    [self.headView addSubview:starTimeLa];
    
    UIImageView*imageBg=[[UIImageView alloc]init];
    imageBg.frame =CGRectMake(SCREEN_WIDTH-150, PROPORTION_HIGHT(5), PROPORTION_WIDTH(140), STANDARD_HEIGHT);
    imageBg.backgroundColor=[UIColor greenColor];
    [self.headView addSubview:imageBg];
    imageBg.userInteractionEnabled = YES;
    
    self.timeLa=[[UITextField alloc]init];
    self.timeLa.frame = CGRectMake(10, 5, imageBg.width-20, imageBg.height-10);
    self.timeLa.backgroundColor=[UIColor redColor];
    [imageBg addSubview:self.timeLa];
    
    self.baogangAddTabView=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
    [self.view addSubview:self.baogangAddTabView];
    self.baogangAddTabView.tableHeaderView = self.headView;
    self.baogangAddTabView.dataSource = self;
    self.baogangAddTabView.delegate = self;
    [self.baogangAddTabView registerClass:[PublieTableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark-------tableviewdelegate----------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PublieTableViewCell*cell=[self.baogangAddTabView  dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue2) reuseIdentifier:@"cell"];
//    }
//    //显示最右边的箭头
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //
//    
//    //cell.textLabel.text = self.dataArray[indexPath.row];
//    cell.textLabel.textAlignment = NSTextAlignmentLeft;
//    cell.textLabel.font = [UIFont systemFontOfSize:16];
//    cell.textLabel.textColor = textCententColor;
//    //cell.textLabel.textColor = textCententColor;
//    cell.textLabel.textColor =  [UIColor blackColor];
    
    if (indexPath.row ==0) {
        cell.leftLa.text = @"报岗允许时间差";
       // cell.rightLa.text = @"去选择";
        
    }else if (indexPath.row==1){
     cell.leftLa.text = @"选择班次";
   // cell.rightLa.text = @"去选择";
    
    }else if (indexPath.row ==2){
          cell.leftLa.text = @"选择岗位";
       // cell.rightLa.text = @"去选择";
    }

    self.baogangAddTabView.tableFooterView=[[UIView alloc]init];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        [self addDevitainTime];
    
    }else if (indexPath.row==1){
        [self addBanci];
    }else{
      [self addJobs];
    
    }


}

-(void)addDevitainTime{
 
   // [self addPickView:@"允许偏差时间选择" dataArray:self.timeDataArray];
    self.pickArray = @[@"5分钟",@"10分钟",@"15分钟"];
    [self creatPickView:@"允许偏差时间选择"];
   
}

-(void)addBanci{
   //[self addPickView:@"班次选择" dataArray:self.banciArray];
      self.pickArray = self.banciArray;
    [self creatPickView:@"班次选择"];
  
}


//pickViewdelegate 学历
-(void)creatPickView:(NSString*)title {
    self.bgView=[[UIView alloc]initWithFrame:UIScreenBpunds];
    self.bgView.backgroundColor = popBGColore;
    [self.view addSubview:self.bgView];
    self.bgView.userInteractionEnabled = YES;
    
    UIView*bgView=[[UIView alloc]init];
    bgView.frame = CGRectMake(PROPORTION_WIDTH(15),PROPORTION_HIGHT(100) , SCREEN_WIDTH-PROPORTION_WIDTH(30), PROPORTION_HIGHT(300));
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
    XueLibackBtn.frame = CGRectMake(PROPORTION_WIDTH(16), CGRectGetMaxY(self.pickView.frame)+PROPORTION_HIGHT(50), (bgView.width-PROPORTION_WIDTH(16)*2-10)/2, STANDARD_HEIGHT);
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
 [self.baogangAddTabView reloadData];
}

//指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;//第一个展示字母、第二个展示数字
}

//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return self.pickArray.count;
}
#pragma mark UIPickerView Delegate Method 代理方法

//指定每行如何展示数据（此处和tableview类似）
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString * title = nil;
    title = self.pickArray[row];
    
    NSIndexPath *indexPath = [self.baogangAddTabView indexPathForSelectedRow];
    PublieTableViewCell *cell = [self.baogangAddTabView cellForRowAtIndexPath: indexPath];
    cell.rightLa.text = self.pickArray[row];
    
    cell.rightLa.textColor= textCententColor;

    return title;
}


-(void)addJobs{

    BaoGangSelectGangweiViewController* selectGangweiVC=[[BaoGangSelectGangweiViewController alloc]init];
selectGangweiVC.navigationItem .title =@"岗位选择";
    [self.navigationController pushViewController:selectGangweiVC animated:YES];
}

//#pragma mark -----------pickViewdelegate-----------------
//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//
//    return 1;
//}
//
//-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
//   if ([self.titleLa.text isEqualToString:@"允许偏差时间选择"]) {
//        
//        return self.timeDataArray.count;
//    }else{
//       return self.banciArray.count;
//    }
//
//
//}
//
////指定每行如何展示数据（此处和tableview类似）
//-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    NSString * title = nil;
//  NSIndexPath *indexPath = [self.baogangAddTabView indexPathForSelectedRow];
//    
//  PublieTableViewCell *cell = [self.baogangAddTabView cellForRowAtIndexPath: indexPath];
//    
//    if ([self.titleLa.text isEqualToString:@"允许偏差时间选择"]) {
//        
//        title = self.timeDataArray[row];
//    }else{
//        title = self.banciArray[row];
//    }
//    
//    cell.rightLa.textColor= textCententColor
//    cell.rightLa.text = title;
//
//    NSLog(@"%@%@%@",title,self.banciArray[row],cell.rightLa.text);
//    
//    [self.baogangAddTabView reloadData];
//
//    return title;
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
