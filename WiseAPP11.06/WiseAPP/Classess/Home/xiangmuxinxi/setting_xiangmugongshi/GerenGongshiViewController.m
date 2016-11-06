//
//  GerenGongshiViewController.m
//  WiseAPP
//
//  Created by app on 16/10/31.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "GerenGongshiViewController.h"
#import "GerenQuebianTableViewCell.h"
#import "GerenZhangchangTableViewCell.h"

@interface GerenGongshiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* geRenGongshiTableview;
//@property(nonatomic,strong)UITableView* fourCellTableview;
@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)NSMutableArray* otherArray;
@property(nonatomic,strong)NSMutableArray* yuangongArray;
@property(nonatomic,strong)UIView* headView;
@property(nonatomic,strong)NSMutableArray* queBianDataArray;

@property(nonatomic,strong)UILabel* gongshiLa;
@property(nonatomic,strong)UILabel* renshuLa;

@end

@implementation GerenGongshiViewController
//-(NSMutableArray *)dataArray{
//    if (_dataArray) {
//        _dataArray=[NSMutableArray array];
//    }
//
//    return _dataArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addData];
    [self addView];
}
-(void)addData{
  self.dataArray=[NSMutableArray array];
    self.dataArray=(NSMutableArray*)@[@"11",@"22",@"33",@"44",@"55",@"66",@"77",@"88"];
    self.queBianDataArray=[NSMutableArray array];
    self.queBianDataArray= (NSMutableArray*)@[@"aa",@"bb",@"cc",@"dd"];


}

-(void)addView{
    
    self.headView=[[UIView alloc]init];
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 150);
    //CGRect frame= CGRectMake(0, 0, SCREEN_WIDTH, 500);
    self.headView.backgroundColor = GlobBackGroundColor;
    self.geRenGongshiTableview=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
    [self.view addSubview:self.geRenGongshiTableview];
    self.geRenGongshiTableview.dataSource = self;
    self.geRenGongshiTableview.delegate = self;
    //[self.geRenGongshiTableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.geRenGongshiTableview.tableHeaderView = self.headView;
    
    //左边圆
    UIView* leftView=[[UIView alloc]init];
    leftView.frame = CGRectMake(PROPORTION_WIDTH(62), 20, PROPORTION_WIDTH(120), PROPORTION_HIGHT(120));
    leftView.layer.cornerRadius = leftView.width/2;
    leftView.layer.borderWidth = 2;
    leftView.layer.borderColor = [UIColor blueColor].CGColor;
    [self.headView addSubview:leftView];
    
    UILabel* leftLa=[[UILabel alloc]init];
    leftLa.frame = CGRectMake(10, leftView.width/3, leftView.width-20, 20);
    leftLa.text=@"核定工时";
    leftLa.backgroundColor=[UIColor redColor];
    leftLa.textAlignment = NSTextAlignmentCenter;
    leftLa.textColor =textCententColor;
    leftLa.font =[UIFont systemFontOfSize:14];
    [leftView addSubview:leftLa];
    
    self.gongshiLa=[[UILabel alloc]init];
    self.gongshiLa.frame =CGRectMake(10, CGRectGetMaxY(leftLa.frame)+1, leftLa.width, 20);
    self.gongshiLa.text =@"0";
    self.gongshiLa.font = [UIFont systemFontOfSize:20];
    self.gongshiLa.textAlignment = NSTextAlignmentCenter;
    self.gongshiLa.textColor =[UIColor redColor];
    [leftView addSubview:self.gongshiLa];
    
    //右边圆
    
    UIView* rightView=[[UIView alloc]init];
    rightView.frame = CGRectMake(PROPORTION_WIDTH(194), 20, PROPORTION_WIDTH(120), PROPORTION_HIGHT(120));
    rightView.layer.cornerRadius = leftView.width/2;
    rightView.layer.borderWidth = 2;
    rightView.layer.borderColor = [UIColor blueColor].CGColor;
    [self.headView addSubview:rightView];
    
    UILabel* rightLa=[[UILabel alloc]init];
    rightLa.frame = CGRectMake(10, leftView.width/3, leftView.width-20, 20);
    rightLa.text=@"核定人数";
    rightLa.backgroundColor=[UIColor redColor];
    rightLa.textAlignment = NSTextAlignmentCenter;
    rightLa.textColor =textCententColor;
    rightLa.font =[UIFont systemFontOfSize:14];
    [rightView addSubview:rightLa];
    
    self.renshuLa=[[UILabel alloc]init];
    self.renshuLa.frame =CGRectMake(10, CGRectGetMaxY(leftLa.frame)+1, leftLa.width, 20);
    self.renshuLa.text =@"0";
    self.renshuLa.font =[UIFont systemFontOfSize:20];
    self.renshuLa.textAlignment = NSTextAlignmentCenter;
    self.renshuLa.textColor =[UIColor redColor];
    [rightView addSubview:self.renshuLa];
    


}

#pragma mark ----------delegate--------------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.queBianDataArray.count;
    }else {
        return self.dataArray.count;
    }

}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 20;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 static NSString* qiebianCellID = @"qiebianCellID";
     static NSString* zhangchangCellID = @"zhengchangCellID";
    if (indexPath.section ==0) {
       
       GerenQuebianTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:qiebianCellID];
        
        if (cell==nil) {
            cell=[[GerenQuebianTableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:qiebianCellID];
        }
        
        return cell;
    }
    //else if (indexPath.section ==1){
    
        GerenZhangchangTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:zhangchangCellID];
        
        if (cell==nil) {
            cell=[[GerenZhangchangTableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:zhangchangCellID];
        }
        
        return cell;
    
   // }
//    UITableViewCell *cell=[self.geRenGongshiTableview dequeueReusableCellWithIdentifier:@"cell"];
//
//    cell.textLabel.text =@"213232435";
//    
//    self.geRenGongshiTableview.tableFooterView=[[UIView alloc]init];
    
    //return nil;
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
