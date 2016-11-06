//
//  BanciAddPeopleViewController.m
//  WiseAPP
//
//  Created by app on 16/11/2.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BanciAddPeopleViewController.h"
#import "PaddPeopleTableViewCell.h"

@interface BanciAddPeopleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* addPeopleTabView;
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

static NSString *addPeopleID = @"addPeopleID";
@implementation BanciAddPeopleViewController
//-(NSMutableArray *)dataArray{
//    if (_dataArray) {
//        _dataArray=[NSMutableArray array];
//    }
//
//    return _dataArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


}
-(void)addView{

    self.addPeopleTabView=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
    [self.view addSubview:self.addPeopleTabView];
    self.addPeopleTabView.dataSource =self;
    self.addPeopleTabView.delegate =self;
    [self.addPeopleTabView registerClass:[PaddPeopleTableViewCell class] forCellReuseIdentifier:addPeopleID];

}

#pragma mark -------tableviewDeleagte-------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PaddPeopleTableViewCell* cell=[self.addPeopleTabView dequeueReusableCellWithIdentifier:addPeopleID];
    
    
    if (indexPath.row ==0) {
        cell.leftLa.text = @"缺编人员01";
        cell.leftLa.textColor =[UIColor cyanColor];
        
    }else if (indexPath.row ==1){
        cell.leftLa.text = @"缺编人员02";
        cell.leftLa.textColor =[UIColor cyanColor];
    }else{
    cell.leftLa.text = @"张三";
          cell.leftLa.textColor =[UIColor grayColor];
        }
    cell.rightLa.text = @"剩余班次";
    cell.rightLa.textColor = textColorPlace;
    cell.rightNumLa.text =@"26";
    cell.rightNumLa.font = [UIFont systemFontOfSize:12];
    cell.rightNumLa.textAlignment = NSTextAlignmentCenter;
    self.addPeopleTabView.tableFooterView=[[UIView alloc]init];

    return  cell;
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
