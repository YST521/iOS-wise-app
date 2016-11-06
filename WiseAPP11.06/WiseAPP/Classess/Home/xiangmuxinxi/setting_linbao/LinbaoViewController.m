//
//  LinbaoViewController.m
//  WiseAPP
//
//  Created by app on 16/10/31.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "LinbaoViewController.h"
#import "LinBaoAddViewController.h"

@interface LinbaoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UILabel* superLabel;
@property(nonatomic,strong)NSMutableArray*dataArray;

@property(nonatomic,strong)UITableView* linBaoTabView;
@property(nonatomic,strong)UIView* footView;
@end

@implementation LinbaoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addData];
    [self addview];
}
-(void)addData{
    self.dataArray=[NSMutableArray array];
    self.dataArray= (NSMutableArray*)@[@"11",@"22"];
    
}
-(void)addview{
    //self.dataArray =(NSMutableArray*)@[@"11",@"22"];
    
    NSLog(@"*********%@",self.dataArray);
    if (self.dataArray.count ==0) {
        self.view.backgroundColor= GlobBackGroundColor;
        //第一次为空 提示添加
        [self noDataPageLabel];
    }else{
        self.linBaoTabView=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
        //self.jiaoJieBanTabView.frame = UIScreenBpunds;
        [self.view addSubview:self.linBaoTabView];
        
       self.linBaoTabView.delegate = self;
      self.linBaoTabView.dataSource = self;
        
        [self.linBaoTabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        //footview
        self.footView=[[UIView alloc]init];
        self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, PROPORTION_HIGHT(100));
       self.linBaoTabView.tableFooterView = self.footView;
        self.footView.backgroundColor=[UIColor greenColor];
        
        UIButton* addBtrn=[UIButton buttonWithType:(UIButtonTypeCustom)];
        addBtrn.frame = CGRectMake(0, 0, PROPORTION_WIDTH(60), PROPORTION_HIGHT(60));
        [self.footView addSubview:addBtrn];
        addBtrn.backgroundColor=[UIColor redColor];
        addBtrn.center = CGPointMake(SCREEN_WIDTH/2, self.footView.height/2);
        [addBtrn addTarget:self action:@selector(addBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    
}
//foot Btn 下个页面
-(void)addBtnAction:(UIButton*)sender{
  LinBaoAddViewController* addVC=[[LinBaoAddViewController alloc]init];
    
    [self.navigationController pushViewController:addVC animated:YES];
}


-(void)noDataPageLabel{
    
    //超链接label
    
    //添加手势的方法
    self.superLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 200, 40)];
    //self.label2.backgroundColor=[UIColor greenColor];
    [self.view addSubview:self.superLabel];
    //self.label2.text=@"还没有任何信息，去添加信息";
    //self.title = @"For iOS 6 & later";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"Using NSAttributed String"];
    //[str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0,5)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(6,12)];
    // [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(19,6)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 5)];
    // [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0] range:NSMakeRange(6, 12)];
    //[str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier-BoldOblique" size:30.0] range:NSMakeRange(19, 6)];
    self.superLabel.attributedText = str;
    
    UITapGestureRecognizer*tapRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(superLabelAction:)];
    //打开交互
    self.superLabel.userInteractionEnabled=YES;
    
    [self.superLabel addGestureRecognizer:tapRecognizer1];
}
//超链接la
-(void)superLabelAction:(id)sender

{
    LinBaoAddViewController* addVC=[[LinBaoAddViewController alloc]init];
    
    [self.navigationController pushViewController:addVC animated:YES];
    
}

-(void)commitButtonAction:(UIButton*)sender{
    
    
}

-(void)addButtonAction:(UIButton*)sender{
    
    YSTLog(@"addButton");
    
}
#pragma mark -----------------tableviewdelegate------------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell=[self.linBaoTabView  dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    
    return cell;
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
