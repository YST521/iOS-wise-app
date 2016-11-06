//
//  BanCiViewController.m
//  WiseAPP
//
//  Created by app on 16/10/12.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BanCiViewController.h"
#import "BanciAddViewController.h"
#import "BanciTableViewCell.h"
#import "LookBanciViewController.h"


@interface BanCiViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong) NSMutableArray* passArray;
@property(nonatomic,strong)NSMutableDictionary*paddDic;
@property(nonatomic,strong)UILabel* superLabel;
@property(nonatomic,strong)NSMutableArray*dateArray;
//@property(nonatomic,strong)BanciTableViewCell*banciCell;

@end

static NSString*banciCellID = @"bancicellID";
@implementation BanCiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"班次设置";
  
     [self creatData];
      [self creatView];

}
//数据
-(void)creatData{
    self.dataArray =[NSMutableArray array];
    self.dataArray  = (NSMutableArray*)@[@"日班",@"夜班"];
    self.dateArray=[NSMutableArray array];
    self.dateArray= (NSMutableArray*)@[@"8:00 - 20:00",@"20:00 - 8:00"];
    
}
-(void)creatView{
    if (self.dataArray.count ==0) {
        self.view.backgroundColor= GlobBackGroundColor;
        //第一次为空 提示添加
        [self noDataPageLabel];
    }else{
    self.banciTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:self.banciTableview];
    self.banciTableview .delegate = self;
    self.banciTableview.dataSource = self;
    
    [self.banciTableview registerClass:[BanciTableViewCell class] forCellReuseIdentifier:banciCellID];
    
    UIView*footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    footView.backgroundColor =[UIColor redColor];
    self.banciTableview.tableFooterView = footView;
    UIButton*commitButton =[[CustomButton_Extension alloc]init];
    commitButton.frame = CGRectMake(0, 0,PROPORTION_WIDTH(60),PROPORTION_HIGHT(60));
        commitButton.center = CGPointMake(SCREEN_WIDTH/2,self.banciTableview.tableFooterView.height/2 );
    commitButton.backgroundColor =[UIColor greenColor];
    [commitButton setTitle:@"+" forState:(UIControlStateNormal)];
    [self.banciTableview.tableFooterView addSubview:commitButton];
    [commitButton addTarget:self action:@selector(commitButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }

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
    
    UITapGestureRecognizer*tapRecognizer1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yezhuSettingAction:)];
    //打开交互
   self.superLabel.userInteractionEnabled=YES;
    
   [self.superLabel addGestureRecognizer:tapRecognizer1];
}
-(void)yezhuSettingAction:(id)sender

{
   BanciAddViewController* addVC =[[BanciAddViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];

    
    
}

-(void)commitButtonAction:(UIButton*)sender{
    self.passArray =[NSMutableArray array];
    self.paddDic =[NSMutableDictionary dictionary];
   // NSMutableArray *arrM = [NSMutableArray array];
    BanciAddViewController*banciAddVC =[[BanciAddViewController alloc]init];
//    banciAddVC.passBanciArray = ^(NSMutableArray*array){
//      
//        for (int i = 0 ;i< self.dataArray.count ; i++) {
//            //self.passArray = array;
//             [self.passArray addObject:self.dataArray[i]];
//        }
//        [self.passArray addObjectsFromArray:array];
//       
//        
//        self.dataArray =self.passArray;
//        YSTLog(@"%@^^^^^^^",self.dataArray);
//        
//        [self.banciTableview reloadData];
//    };
//    
    
//    NSMutableArray *arrM = [[NSMutableArray alloc] init];
//    for (int i = 0 ;i< self.dataArray.count ; i++) {
//        [arrM addObject:self.dataArray[i]];
//    }
//    
//    [arrM addObject:@"55"];
//    self.dataArray = arrM;
    
//    banciAddVC.passBanciVlue = ^(NSMutableDictionary*array){
//        self.paddDic = array;
//        
//          for (int i = 0 ;i< self.dataArray.count ; i++) {
//            [self.dataArray addObject:self.paddDic];
//        }
//        
       //NSMutableArray *arrM =[ [ NSMutableArray alloc]initWithObjects:self.paddDic, nil];
        //NSMutableArray *aa= [NSMutableArray array];
//        [aa addObject:@"44444"];
//        [aa addObject:@"666"];
//        
//     [arrM   addObjectsFromArray:(NSMutableArray*)self.paddDic];
       // [arrM   addObject:self.paddDic];
       // YSTLog(@"aaaa%@",self.paddDic);
//      arrM =(NSMutableArray*) [[NSArray alloc]initWithObjects:@[@"3",@"4"],@[@"4",@"6"], nil];
        
       //[arrM  addObject:self.paddDic];
//        [self.dataArray  addObjectsFromArray:@[@"3",@"5"]];
//        [self.dataArray addObjectsFromArray:aa];
       // [arrM addObject:self.passArray];
       // self.dataArray= arrM;
        
     //YSTLog(@"dataArray%lu",(unsigned long)self.dataArray.count);
     
        //self.dataArray = self.passArray;
        //YSTLog(@"^^^^^^^%@",self.dataArray);
        
      //  [self.banciTableview reloadData];

       
        
           // };
   
    [self.navigationController pushViewController:banciAddVC animated:YES];

}

-(void)addButtonAction:(UIButton*)sender{

    YSTLog(@"addButton");

}




#pragma mark ====== tableviewddelegate==========
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArray.count;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   BanciTableViewCell *cell  =[self.banciTableview dequeueReusableCellWithIdentifier:banciCellID];

    cell.titleLabel.text = self.dataArray[indexPath.row];
    cell.starTime .text = self.dateArray[indexPath.row];


    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LookBanciViewController*lookVC=[[LookBanciViewController alloc]init];

    [self.navigationController pushViewController:lookVC animated:YES];

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
