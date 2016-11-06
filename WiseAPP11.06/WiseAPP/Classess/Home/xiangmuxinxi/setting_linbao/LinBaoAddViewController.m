//
//  LinBaoAddViewController.m
//  WiseAPP
//
//  Created by app on 16/11/3.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "LinBaoAddViewController.h"
#import "LinbaoAddView.h"

@interface LinBaoAddViewController ()///<,UITableViewDataSource>
@property(nonatomic,strong)UITableView* linBaoTabView;
@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)LinbaoAddView*linbaoAddView;

@end
static NSString* linbaoCellID =@"linbaoCellID";
@implementation LinBaoAddViewController
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}

-(void)loadView{
    self.linbaoAddView =[[LinbaoAddView alloc]initWithFrame:UIScreenBpunds];
    self.view = self.linbaoAddView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationItem.title =@"临保设置";;
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    [self addData];
    [self addView];
    
}
-(void)saveAction:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)addData{
    self.dataArray =(NSMutableArray*)@[@"11",@"22",@"33"];

}

-(void)addView{
    
    
}

//    self.linBaoTabView=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
//    [self.view addSubview:self.linBaoTabView];
//    self.linBaoTabView.dataSource =self;
//    self.linBaoTabView.delegate =self;
//    [self.linBaoTabView registerClass:[UITableViewCell class] forCellReuseIdentifier:linbaoCellID];
//
//}
//
//#pragma mark ---tableviewdelegate------
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return self.dataArray.count;
//}
//
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell*cell=[self.linBaoTabView dequeueReusableCellWithIdentifier:linbaoCellID ];
//    cell
//    
//    return cell;
//
//
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
