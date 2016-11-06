//
//  BaoGangSelectGangweiViewController.m
//  WiseAPP
//
//  Created by app on 16/11/3.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BaoGangSelectGangweiViewController.h"
#import "SelectgangweiTableViewCell.h"


@interface BaoGangSelectGangweiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView* selectGangweiTableView;
@property(nonatomic,strong)NSMutableArray* dataArray;
@end
static NSString* selectCell=@"selectCell";
@implementation BaoGangSelectGangweiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    [self addData];
    [self addView];
    
}
-(void)addData{
    self.dataArray=[NSMutableArray array];
    self.dataArray = (NSMutableArray*)@[@"11",@"22",@"33",@"44"];

}

-(void)addView{
    
    self.selectGangweiTableView=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
    [self.view addSubview:self.selectGangweiTableView];
    self.selectGangweiTableView.dataSource =self;
    self.selectGangweiTableView.delegate = self;
    [self.selectGangweiTableView registerClass:[SelectgangweiTableViewCell class] forCellReuseIdentifier: selectCell];
    
}

-(void)saveAction:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark --------tableviewDelegate-----

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectgangweiTableViewCell *cell=[self.selectGangweiTableView dequeueReusableCellWithIdentifier:selectCell];
    
    self.selectGangweiTableView.tableFooterView =[[UIView alloc]init];
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
