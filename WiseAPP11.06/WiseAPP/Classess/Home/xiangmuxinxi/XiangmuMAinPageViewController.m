//
//  XiangmuMAinPageViewController.m
//  WiseAPP
//
//  Created by app on 16/10/14.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "XiangmuMAinPageViewController.h"
#import "SettingViewController.h"
#import "XiangmuMainCollectionViewCell.h"
#import "SectionModel.h"

NS_ENUM(NSInteger,CellState){
    
    //右上角编辑按钮的两种状态；
    //正常的状态，按钮显示“编辑”;
    NormalState,
    //正在删除时候的状态，按钮显示“完成”；
    DeleteState
    
};

@interface XiangmuMAinPageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
  
    
}

@property(nonatomic,strong)UICollectionView*collectView;
@property(nonatomic,strong)NSMutableArray*dataArray;

@end

static NSString*collectId= @"collectID";

@implementation XiangmuMAinPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"添加项目";
    
    UIImage*moreImage = [UIImage imageNamed:@"icon_home_sousou"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:moreImage style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemAction:)];
    
    [self addData];
    [self creaTUI];
    
}
-(void)addData{
    self.dataArray=[NSMutableArray array];
    self.dataArray =(NSMutableArray*)@[@"文化广场",@"国金中心",@"汇德丰"];


}
-(void)rightItemAction:(UIBarButtonItem*)sender{
    
    self.collectView.backgroundColor=[UIColor yellowColor];
    
    
}


-(void)creaTUI{
    
    
    //创建布局对象
    UICollectionViewFlowLayout*flowlayout=[[UICollectionViewFlowLayout alloc]init];
    
    
    //距离屏幕上下左右的间距
    flowlayout.sectionInset = UIEdgeInsetsMake(10*SCREEN_WIDTH/375, 10*SCREEN_WIDTH/375, 10*SCREEN_WIDTH/375,10*SCREEN_WIDTH/375);
    //flowlayout.itemSize =CGSizeMake(SCREEN_WIDTH-50*SCREEN_WIDTH/375, 78*SCREEN_HEIGHT*667);
    flowlayout.itemSize =CGSizeMake((SCREEN_WIDTH-40*SCREEN_WIDTH/375)/2, PROPORTION_HIGHT(80));
    
    //设置滑动方向
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //初始化
    self.collectView =[[UICollectionView alloc]initWithFrame: CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)   collectionViewLayout:flowlayout];
    
    //背景色
    self.collectView.backgroundColor=GlobBackGroundColor;
    
    self.collectView.dataSource =self;
    
    self.collectView.delegate =self;
    
    [self.view addSubview:self.collectView];
    
    [self.collectView registerClass:[XiangmuMainCollectionViewCell class] forCellWithReuseIdentifier:collectId];
}
#pragma mark ========datasourse方法==============
//设置分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return 1;
    
}

//设置单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    //return self.collectDataArray.count;
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   XiangmuMainCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier: collectId forIndexPath:indexPath];
    
    
    // cell点击变色
    
    UIImageView*imageV = [[UIImageView alloc]init];
    imageV.frame = cell.bounds;
    imageV.image = [UIImage imageNamed:@"Rectangle 2  8"];
    UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];
    selectedBGView.backgroundColor = [UIColor grayColor];
    [selectedBGView addSubview:imageV];
    cell.selectedBackgroundView = selectedBGView;
    cell.backgroundColor =[UIColor greenColor];
    cell.descLabel.text = self.dataArray[indexPath.row];
     cell.xiangmuTitle.text = self.dataArray[indexPath.row];
    
    
//点击item添加一行最后加号
//    if (indexPath.row != 1 && indexPath.row == self.dataArray.count-1) {
//    cell.xiangmuTitle.text = @"+";
//    }
//    
    
    return  cell;
}


//点击跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //     //点击第一个添加一个项目
 //if (indexPath.row == self.dataArray.count-1) {

//        NSMutableArray *arrM = [[NSMutableArray alloc] init];
//        for (int i = 0 ;i< self.dataArray.count ; i++) {
//            [arrM addObject:self.dataArray[i]];
//        }
//        [arrM addObject:@"666"];
//        self.dataArray = arrM;
//        YSTLog(@"HHHH%@",self.dataArray);
//        YSTLog(@"%lu",(unsigned long)self.dataArray.count);
//        [self.collectView reloadData];
//     
//
//    }else if (YES){
//    
//    
//        SettingViewController*settingVC = [[SettingViewController alloc]init];
//        
//        [self.navigationController pushViewController:settingVC animated:YES];
//        
//    }
     
        SettingViewController*settingVC = [[SettingViewController alloc]init];
      settingVC.projectTitle = self.dataArray[indexPath.row];
    
      [self.navigationController pushViewController:settingVC animated:YES];
    
    
}
#pragma mark - 弹出输入环境名称的提示框
//- (void)popEnvirnmentNameDialog{
//    
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入Section名称" preferredStyle:UIAlertControllerStyleAlert];
//    //以下方法就可以实现在提示框中输入文本；
//    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        UITextField *envirnmentNameTextField = alertController.textFields.firstObject;
//        
//        SectionModel *sec = [[SectionModel alloc] init];
//        sec.sectionName = envirnmentNameTextField.text;
//        sec.cellArray = self.dataArray;
//        //增加一个section，就要加入到dataSectionArray中；
////        [self.dataSectionArray addObject:sec];
////        [self.headerArray addObject:envirnmentNameTextField.text];
////        [self.collectionView reloadData];
//        NSLog(@"你输入的文本%@",envirnmentNameTextField.text);
//    }]];
//    
//    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"请输入Section名称";
//    }];
//    [self presentViewController:alertController animated:true completion:nil];
//}


//// cell点击变色
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
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
