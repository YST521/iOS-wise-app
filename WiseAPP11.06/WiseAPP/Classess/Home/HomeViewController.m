//
//  HomeViewController.m
//  WiseAPP
//
//  Created by app on 16/10/9.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "HomeViewController.h"
#import "CycleUpImagewViewController.h"
#import "MiddleCollectionViewCell.h"
#import "SettingViewController.h"
#import <AVFoundation/AVFoundation.h>//扫描二维
#import "FindCompanyViewController.h"
#import "QrViewController.h"
#import "XiangmuMAinPageViewController.h"


@interface HomeViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,AVCaptureMetadataOutputObjectsDelegate,UIWebViewDelegate>

@property(nonatomic ,strong)UIScrollView*scrollerView;
@property(nonatomic,strong)UIView*upCycleImage;
@property(nonatomic,strong)NSMutableArray*collectDataArray;
@property(nonatomic,strong)UICollectionView*collectionView;
@property(nonatomic,strong)UIView*downCycleImageView;
@property(nonatomic,strong)NSMutableArray*collectIconArray;
@property(nonatomic,strong)NSMutableArray*collectTitleArray;

@property (nonatomic, weak) AVCaptureSession *session;
@property (nonatomic, weak) AVCaptureVideoPreviewLayer *layer;
@property(nonatomic,assign)CGRect frame;

//展示二维码内容
@property(nonatomic,strong)UIWebView*webview;


@end

static NSString *cellID = @"homecellID";
@implementation HomeViewController
-(NSMutableArray *)collectIconArray
{
    if (!_collectIconArray) {
        _collectIconArray = [NSMutableArray array];
    }

    return _collectIconArray;
}
-(NSMutableArray *)collectTitleArray{
    if (!_collectTitleArray) {
        _collectTitleArray = [NSMutableArray array];
    }

    return  _collectTitleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
        self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"上海优驰保安服务有限公司";
    //[self setupLabel];
    //数据
    [self creadData];
    [self creatNaitem];
    [self addScrollerView];
    [self upCycleImageView];
    //集合视图
    [self creatCollectView];
    [self addDownCycleImageview];
    
}

- (void)setupLabel {
        //准备工作
        UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = [UIFont systemFontOfSize:16];
        NSString *str = @"222222222222222222222222222222222222222222";
        textLabel.text = str;
       textLabel.backgroundColor = [UIColor redColor];
           textLabel.numberOfLines = 0;//根据最大行数需求来设置
        textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
         CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
         //关键语句
        CGSize expectSize = [textLabel sizeThatFits:maximumLabelSize];
         //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
         textLabel.frame = CGRectMake(50, 22, expectSize.width, expectSize.height);
        [self.view addSubview:textLabel];
}
-(void)creadData{

    self.collectTitleArray = (NSMutableArray*)@[@"考勤",@"考勤统计",@"巡检",@"巡检统计",@"表单上传",@"访客通行",@"会议",@"项目信息"];
    self.collectIconArray =(NSMutableArray*)@[@"collect_icon_kaoqin",@"collect_icon_tongji",@"collect_icon_xunjian",@"collect_icon_xunjiantongji",@"collect_icon_xunjiantongji",@"collect_icon_biaodan",@"collect_icon_fangke",@"collect_icon_huiyi",@"collect_icon_xiangmu"];


}
//布局
-(void)creatNaitem{
    
    UIImage*moreImage = [UIImage imageNamed:@"icon_home_sousou"];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:moreImage style:(UIBarButtonItemStylePlain) target:self action:@selector(rightItemAction:)];
    
    UIImage*leftImage = [UIImage imageNamed:@"icon_home_saosao"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:leftImage style:(UIBarButtonItemStylePlain) target:self action:@selector(leftItemAction:)];
    
}
//rightItemAction 寻找公司
-(void)rightItemAction:(UINavigationItem*)sender{
    
    FindCompanyViewController*findVC =[[FindCompanyViewController alloc]init];
    [self.navigationController pushViewController:findVC animated:YES];

    YSTLog(@"666");

}
//leftItemAction
-(void)leftItemAction:(UINavigationItem*)sender{
    
   //[self lookAction];
    YSTLog(@"666");
    
    QrViewController*qrVC =[[QrViewController alloc]init];
    [self.navigationController pushViewController:qrVC animated:YES];
    
}
-(void)addScrollerView{
    self.scrollerView = [[UIScrollView alloc]init];
    self.scrollerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.scrollerView.backgroundColor = GlobBackGroundColor;
    [self.view addSubview:self.scrollerView];
    
}
-(void)upCycleImageView{

    self.upCycleImage = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 148 * SCREEN_HEIGHT/667)];
    self.upCycleImage.backgroundColor = [UIColor redColor];
    [self.scrollerView addSubview:self.upCycleImage];

//    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 148 * SCREEN_HEIGHT/667)];
//    demoContainerView.contentSize = CGSizeMake(SCREEN_WIDTH, 1200);
//    [self.scrollerView addSubview:demoContainerView];
   
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
//    NSArray *titles = @[@"新建交流QQ群：185534916 ",
//                        @"感谢您的支持，如果下载的",
//                        @"如果代码在使用过程中出现问题",
//                        @"您可以发邮件到gsdios@126.com"
//                        ];
    

    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 148*SCREEN_HEIGHT/667) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    //cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.upCycleImage addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    /*
     block监听点击方式
     
     cycleScrollView2.clickItemOperationBlock = ^(NSInteger index) {
     NSLog(@">>>>>  %ld", (long)index);
     };
     
     */
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    //cycleScrollView.autoScrollTimeInterval = 4.0;
}
//底部轮播图
-(void)addDownCycleImageview{

    self.downCycleImageView = [[UIView alloc]initWithFrame:CGRectMake(PROPORTION_WIDTH(16), CGRectGetMaxY(self.collectionView.frame), SCREEN_WIDTH-PROPORTION_WIDTH(32), SCREEN_HEIGHT-CGRectGetMaxY(self.collectionView.frame))];
    //self.downCycleImageView.backgroundColor = [UIColor greenColor];
    [self.scrollerView addSubview:self.downCycleImageView];
    UIView*newView=[[UIView alloc]init];
    newView.frame = CGRectMake(0, 0, SCREEN_WIDTH-PROPORTION_WIDTH(32), PROPORTION_HIGHT(50));
    newView.backgroundColor=[UIColor whiteColor];
    [self.downCycleImageView addSubview:newView];
    
    UILabel*newsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 90, 30)];
    newsLabel.text = @"公司新闻";
    newsLabel.font = [UIFont systemFontOfSize:20];
    [newView addSubview:newsLabel];
    
    UIImageView*bellImage = [[UIImageView alloc]init];
    bellImage.frame = CGRectMake(CGRectGetMaxX(newsLabel.frame)+7, newsLabel.y, 15, 20);
    bellImage.image = [UIImage imageNamed:@"home_bell"];
   // bellImage.backgroundColor = [UIColor yellowColor];
    [newView addSubview:bellImage];
    UILabel*newsDetallLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bellImage.frame)+10, newsLabel.y, SCREEN_WIDTH/2, 20)];
    newsDetallLabel.text = @"国务院新闻办发表方法，关于办保安管理条例";
   newsDetallLabel.font = [UIFont systemFontOfSize:14];
    newsDetallLabel.textColor = textColorPlace
    [newView addSubview:newsDetallLabel];
    
    // //底部轮播图
    // 情景二：采用网络图片实现
    // 情景二：采用网络图片实现
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    // 情景三：图片配文字
        NSArray *titles = @[@"新建交流QQ群：185534916 ",
                            @"感谢您的支持，如果下载的",
                            @"如果代码在使用过程中出现问题",
                            @"您可以发邮件到gsdios@126.com"
                            ];
    
    
    // 网络加载 --- 创建带标题的图片轮播器
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, CGRectGetMaxY(newView.frame)+5, self.downCycleImageView.width, 168*SCREEN_HEIGHT/667) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    [self.downCycleImageView addSubview:cycleScrollView2];
    
    //         --- 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    /*
     block监听点击方式
     
     cycleScrollView2.clickItemOperationBlock = ^(NSInteger index) {
     NSLog(@">>>>>  %ld", (long)index);
     };
     
     */
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView2.autoScrollTimeInterval = 8.0;

}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    CycleUpImagewViewController*upVC = [[CycleUpImagewViewController alloc]init];
    [self.navigationController pushViewController:upVC animated:YES];
    
}

#pragma mark ---- collectview-------
-(void)creatCollectView{
    self.collectDataArray = [NSMutableArray array];
    
    //创建布局对象
    UICollectionViewFlowLayout*flowlayout=[[UICollectionViewFlowLayout alloc]init];
    
    
    //距离屏幕上下左右的间距
    flowlayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    //flowlayout.itemSize =CGSizeMake(SCREEN_WIDTH-50*SCREEN_WIDTH/375, 78*SCREEN_HEIGHT*667);
    flowlayout.itemSize =CGSizeMake((SCREEN_WIDTH-50)/4,(SCREEN_WIDTH-50)/4);
    
    //设置滑动方向
    //    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    if(SCREEN_WIDTH>374){
        self.frame =CGRectMake(0, CGRectGetMaxY(self.upCycleImage.frame), SCREEN_WIDTH, PROPORTION_HIGHT((SCREEN_WIDTH-50)/2)+30) ;
        
    }else{
        self. frame =CGRectMake(0, CGRectGetMaxY(self.upCycleImage.frame), SCREEN_WIDTH, PROPORTION_HIGHT((SCREEN_WIDTH-50)/2)+50) ;
    }

    //初始化
    self.collectionView =[[UICollectionView alloc]initWithFrame: self.frame   collectionViewLayout:flowlayout];
  
                          
    
  //  self.collectionView.backgroundColor=[UIColor greenColor];
    
    //背景色
    self.collectionView.backgroundColor=GlobBackGroundColor;
    
    self.collectionView.dataSource =self;
    
    self.collectionView.delegate =self;
    
    [self.scrollerView addSubview:self.collectionView];
    
    [self.collectionView registerClass:[MiddleCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
    
    
}
//方式item滚动
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.collectionView setContentSize:CGSizeMake(0, 0)];
}

#pragma mark ========datasourse方法==============
//设置分区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return 1;
    
}

//设置单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    //return self.collectDataArray.count;
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   MiddleCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier: cellID forIndexPath:indexPath];

    cell.iconImageView .image = [UIImage imageNamed:self.collectIconArray[indexPath.row]];
    cell.bgimageView.image = [UIImage imageNamed:@"home_collectbg"];
    cell.titleLabel.text = self.collectTitleArray[indexPath.row];
    //cell.backgroundColor=[UIColor redColor];
    
    // cell点击变色
    
    UIImageView*imageV = [[UIImageView alloc]init];
    imageV.frame = cell.bounds;
    imageV.image = [UIImage imageNamed:@"Rectangle 2  8"];
    UIView* selectedBGView = [[UIView alloc] initWithFrame:cell.bounds];

    [selectedBGView addSubview:imageV];
 
    //[cell.contentView addSubview:imageV];
    cell.selectedBackgroundView = selectedBGView;
     return  cell;
}


//点击跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    

//    
//    MiddleCollectionViewCell *cell = (MiddleCollectionViewCell *)[self collectionView:collectionView cellForItemAtIndexPath:indexPath];
//    
//    [self updateCollectionViewCellStatus:cell selected:YES];
    
    //项目设置
    //if (indexPath.row == 7) {
//        SettingViewController*settingVC = [[SettingViewController alloc]init];
//        
//        [self.navigationController pushViewController:settingVC animated:YES];
    
    if (indexPath.row == 0) {
        
        ChangeImageViewController*changeVC=[[ChangeImageViewController alloc]init];
        [self.navigationController pushViewController:changeVC animated:YES];
        
    }else{
        XiangmuMAinPageViewController*xiangmuMainVC=[[XiangmuMAinPageViewController alloc]init];
        [self.navigationController pushViewController:xiangmuMainVC animated:YES];
    }
    
//    }
//else{
//    
//        UIViewController*vc=[UIViewController new];
//      
//        
//            [self presentViewController:vc animated:YES completion:nil];
//    }
    
    
    
}

//// cell点击变色
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//
//// cell点击变色
//- (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([colView isEqual:self.traitCollection]) {
//        MiddleCollectionViewCell *cell = [colView cellForItemAtIndexPath:indexPath];
//        cell.upView.backgroundColor =  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
//        
//    } else {
//        MiddleCollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
//cell.upView.backgroundColor =  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
//
//    }
//}


//二维码扫描
//读取二维码
-(void)lookAction{
    
    // 1.创建捕捉会话
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    self.session = session;
    
    // 2.添加输入设备(数据从摄像头输入)
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    [session addInput:input];
    
    // 3.添加输出数据(示例对象-->类对象-->元类对象-->根元类对象)
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [session addOutput:output];
    
    // 3.1.设置输入元数据的类型(类型是二维码数据)
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    // 4.添加扫描图层
    AVCaptureVideoPreviewLayer *layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    //扫描匡大小
    layer.frame=self.view.bounds;
    //layer.frame = CGRectMake(0, 150, 200, 200);
    //    layer.center=self.view.center;
    
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
    // 5.开始扫描
    [session startRunning];
    
    
}
#pragma mark - 实现output的回调方法
// 当扫描到数据时就会执行该方法
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
       
        NSString*string = object.stringValue;
        // 停止扫描
        [self.session stopRunning];
        
        // 将预览图层移除
        [self.layer removeFromSuperlayer];
        
        if (![string  isEqual: @""]) {
            //网络加载扫描结果
            [self loadweb:object.stringValue];
        }else{
            UIAlertController*alerVC= [UIAlertController alertControllerWithTitle:@"提醒" message:@"没有扫描到信息，请重新扫描" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction*al = [UIAlertAction actionWithTitle:@"重新扫描" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                [self lookAction];
                
                [alerVC addAction:al];
                [self presentViewController:alerVC animated:YES completion:nil];
            }];
        
        }
      
        
    } else {
        NSLog(@"没有扫描到数据");
    }
}

//展示二维码内容
-(void)loadweb:(NSString*)string{
    
    self.webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100)];
    [self.view addSubview:self.webview];
    
    NSURLRequest*request=[NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    [self.webview loadRequest: request];
    
    self.webview.delegate=self;
    
    
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
