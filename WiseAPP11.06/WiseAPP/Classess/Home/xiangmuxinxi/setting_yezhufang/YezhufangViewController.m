//
//  YezhufangViewController.m
//  WiseAPP
//
//  Created by app on 16/10/11.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "YezhufangViewController.h"
#import "YeZhuFootView.h"

#import "POPView.h"
#import "SelectPhotoView.h"
#import "YezhuImageViewController.h"

@interface YezhufangViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,assign)UITableViewCellEditingStyle myStaly;
@property(nonatomic,strong)YeZhuFootView*yezhufootView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UITableView*tableview;
@property(nonatomic,strong)UIView*headView;
@property(nonatomic,strong)UIButton*addButton;
@property(nonatomic,strong)UITextField *yezhuTextfile;
@property(nonatomic,strong)UITextField*yezhuGender;
@property(nonatomic,strong)UIImageView*yezhuImage;
@property(nonatomic,strong)UITextField*yezhuPoslition;
@property(nonatomic,strong)UITextField*yezhuWorkTIME;
@property(nonatomic,strong)UITextField *carNumber;

@property(nonatomic,strong)UIImageView* userImage;
@property(nonatomic,strong)POPView* PnameView;
@property(nonatomic,strong)POPView* PgenderView;
@property(nonatomic,strong)POPView* PageView;
@property(nonatomic,strong)POPView* PheightView;
@property(nonatomic,strong)POPView* PositionView;
@property(nonatomic,strong)POPView* PtimeView;
@property(nonatomic,strong)POPView* PcarNumView;
@property(nonatomic,strong)SelectPhotoView* selectView;
@property(strong,nonatomic)UIImagePickerController *imagePickerController;



@end
static NSString*yezhuCellID =@"yezhuCellID";

@implementation YezhufangViewController

//-(NSMutableArray *)dataArray{
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray alloc];
//    }
//    return _dataArray;
//}
-(void)viewWillAppear:(BOOL)animated{
[self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:20],NSFontAttributeName, [UIColor whiteColor],NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"业主方信息设置";
    self.dataArray = [[NSMutableArray alloc]init];
    
    
     [self addData];
    [self addView];
    
    //navigationBar
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],
//    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //改系统的rightBarButtonItem的颜色,只需要在代码中添加如下代码即可:
    
    //修改系统自带的navigationItem的rightBarButtonItem的颜色
//    NSMutableAttributedString*string=[[NSMutableAttributedString alloc]initWithString:@"请输入身高"];
//    [string setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:53/255 green:53/255 blue:53/255 alpha:1]} range:NSMakeRange(0, 5)];
    
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
 //[self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];

    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
//    
//    self.navigationItem.rightBarButtonItem.tintColor =[UIColor whiteColor];
   
}
-(void)saveAction:(UIBarButtonItem*)sender{

    NSLog(@"666");
}


-(void)addData{
    
    self.dataArray =(NSMutableArray*) @[@"姓名",@"性别",@"年龄",@"身高",@"职务",@"工作时间",@"车牌号",@"其它"];
}


-(void)addView{

    self.tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  SCREEN_HEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableview];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.tableview registerClass:[PublieTableViewCell class] forCellReuseIdentifier:yezhuCellID];
    
    //添加footView
        [self addFootView];
  //相机相关
    self.imagePickerController = [[UIImagePickerController alloc]init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.allowsEditing = YES;
    

}
-(void)addFootView{

    //footView
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    self.headView.backgroundColor = [UIColor greenColor];
    self.tableview.tableHeaderView = self.headView ;
//    self.yezhuTextfile=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
//    self.yezhuTextfile.backgroundColor=[UIColor blueColor];
//    [self.footView addSubview:self.yezhuTextfile];
//    self.yezhuTextfile.delegate= self;
    
//    self.addButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    self.addButton.frame =CGRectMake(SCREEN_WIDTH/2-30, 30, 60, 60);
//    [self.addButton setImage:[UIImage imageNamed:@"plus_Last"] forState:(UIControlStateNormal)];
    UILabel*leftLabel=[[UILabel alloc]init];
    leftLabel.frame = CGRectMake(10,  self.headView .height/2-10, 100, 20);
    leftLabel.text = @"业主方头像";
    [ self.headView  addSubview:leftLabel];
    UILabel*rightLa = [[UILabel alloc]init];
    rightLa.frame = CGRectMake(SCREEN_WIDTH/2.5, leftLabel.y, 80, 20);
    rightLa.text = @"显示头像";
    [ self.headView addSubview:rightLa];
    UIButton*  rightBtn =[UIButton buttonWithType:(UIButtonTypeCustom)];
    rightBtn.frame = CGRectMake(CGRectGetMaxX(rightLa.frame)+10, leftLabel.y, 20, 20) ;
    rightBtn.backgroundColor=[UIColor redColor];
    [ self.headView  addSubview:rightBtn];
    
    self.userImage=[[UIImageView alloc]init];
    self.userImage.frame = CGRectMake(0, 0, PROPORTION_WIDTH(60), PROPORTION_HIGHT(60));
    self.userImage.center = CGPointMake(CGRectGetMaxX(rightBtn.frame)+5+self.userImage.width/2, self.headView .height/2);
                                      
    self.userImage.backgroundColor=[UIColor yellowColor];
    self.userImage.layer.cornerRadius = self.userImage.width/2;
    self.userImage.layer.masksToBounds = YES;
    [ self.headView  addSubview:self.userImage
     ];
    UIButton*  nextBtn =[UIButton buttonWithType:(UIButtonTypeCustom)];
    nextBtn.frame = CGRectMake(SCREEN_WIDTH-30, leftLabel.y, 20, 20);
    nextBtn.backgroundColor=[UIColor purpleColor];
    [self.headView  addSubview:nextBtn];
    //headvewTap
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.headView addGestureRecognizer:tap];

}

-(void)tapAction:(UITapGestureRecognizer*)sender{
    self.selectView =[[SelectPhotoView alloc]initWithFrame:UIScreenBpunds];
    [self.view addSubview:self.selectView];
    self.selectView.hidden = NO;
    
    UITapGestureRecognizer*selectPhotoTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectPhotoTapActin:)];
    [self.selectView.photoview addGestureRecognizer:selectPhotoTap];
    
    UITapGestureRecognizer*selectCameraTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectcamerTapActin:)];
    [self.selectView.cameraView addGestureRecognizer:selectCameraTap];


}
-(void)selectPhotoTapActin:(UITapGestureRecognizer*)sender{

     _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePickerController.delegate = self;


        // 3、推送图片拾取器控制器
        if([[[UIDevice
              currentDevice] systemVersion] floatValue]>=8.0) {
            
            self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }
        [self presentViewController:_imagePickerController animated:YES completion:nil];
        
    self.selectView.hidden = YES;

}
-(void)selectcamerTapActin:(UITapGestureRecognizer*)sender{
    
    // 获取支持的媒体格式
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    
    // 判断是否支持需要设置的sourceType
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // 1、设置图片拾取器上的sourceType
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // 2、设置支持的媒体格式
        _imagePickerController.mediaTypes = @[mediaTypes[0]];
        // 3、其他设置
        // 设置相机模式
        _imagePickerController.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        // 设置摄像头：前置/后置
        _imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        // 设置闪光模式
        _imagePickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
        
        
        // 4、推送图片拾取器控制器
        if([[[UIDevice
              currentDevice] systemVersion] floatValue]>=8.0) {
            
            self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
            
        }
        [self presentViewController:_imagePickerController animated:YES completion:nil];
        
    }else {
        NSLog(@"当前设备不支持拍照");
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                                  message:@"当前设备不支持拍照"
                                                                           preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {
                                                          }]];
        
        
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
    }
    
    self.headView.hidden = YES;
    

    
}

//拍照照片选取
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage * image = info[UIImagePickerControllerEditedImage];
    if (!image) {
        image = info[UIImagePickerControllerOriginalImage];
    }
    YezhuImageViewController*yezhuImageVC=[[YezhuImageViewController alloc]init];
    yezhuImageVC.userImage = image;
    [self.navigationController pushViewController:yezhuImageVC animated:YES];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark ---- tableviewdelegate--------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return  PROPORTION_HIGHT(45);

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.dataArray.count ;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  PublieTableViewCell*cell = [self.tableview dequeueReusableCellWithIdentifier:yezhuCellID];
    
    cell.leftLa.text = self.dataArray[indexPath.row];
    self.tableview.tableFooterView=[[UIView alloc]init];

    return cell;

}
-(void) addButton:(UIButton*)sender{
    NSMutableArray *arrM = [[NSMutableArray alloc] init];
    for (int i = 0 ;i< self.dataArray.count ; i++) {
        [arrM addObject:self.dataArray[i]];
     }

    [arrM addObject:self.yezhuTextfile.text];
    self.dataArray = arrM;
    YSTLog(@"%lu",(unsigned long)self.dataArray.count);
    [self.tableview reloadData];
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if ( indexPath.row == 0) {
 
        self.PnameView =[[POPView alloc]initWithFrame:UIScreenBpunds];
        self.PnameView.popTitle.text = @"设置姓名";
        self.PnameView.popTextFile.placeholder = @"请输入姓名";
        [self.view addSubview:self.PnameView];
        [self.PnameView.popDoneBtn addTarget:self action:@selector(namePopAction:) forControlEvents:(UIControlEventTouchUpInside )];
        
    } else if (indexPath.row ==1){
        self.PgenderView =[[POPView alloc]initWithFrame:UIScreenBpunds];
       self.PgenderView.popTitle.text = @"设置性别";
     self.PgenderView.popTextFile.placeholder = @"请输入性别";
        [self.view addSubview:self.PgenderView];
        [self.PgenderView.popDoneBtn addTarget:self action:@selector(genderAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }else if (indexPath.row ==2){
        self.PageView =[[POPView alloc]initWithFrame:UIScreenBpunds];
        self.PageView.popTitle.text = @"设置年龄";
        self.PageView.popTextFile.placeholder = @"请输入年龄";
        [self.view addSubview:self.PageView];
        [self.PageView.popDoneBtn addTarget:self action:@selector(ageAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }else if (indexPath.row ==3){
        self.PheightView =[[POPView alloc]initWithFrame:UIScreenBpunds];
        self.PheightView.popTitle.text = @"设置身高";
        self.PheightView.popTextFile.placeholder = @"请输入身高";
        [self.view addSubview:self.PheightView];
        [self.PheightView.popDoneBtn addTarget:self action:@selector(heightAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }else if (indexPath.row ==4){
        self.PositionView =[[POPView alloc]initWithFrame:UIScreenBpunds];
       self.PositionView.popTitle.text = @"设置职务";
        self.PositionView.popTextFile.placeholder = @"请输入职务";
        [self.view addSubview: self.PositionView];
        [ self.PositionView.popDoneBtn addTarget:self action:@selector(opstionAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }else if (indexPath.row ==5){
        self.PtimeView =[[POPView alloc]initWithFrame:UIScreenBpunds];
        self.PtimeView.popTitle.text = @"设置工作时间";
        self.PtimeView.popTextFile.placeholder = @"请输入工作时间";
        [self.view addSubview:self.PtimeView];
        [self.PtimeView.popDoneBtn addTarget:self action:@selector(timeAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }else if (indexPath.row ==6){
        self.PcarNumView =[[POPView alloc]initWithFrame:UIScreenBpunds];
       self.PcarNumView.popTitle.text = @"设置车牌号";
       self.PcarNumView.popTextFile.placeholder = @"请输入车牌号";
        [self.view addSubview:self.PcarNumView];
        [self.PcarNumView.popDoneBtn addTarget:self action:@selector(carAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }else if (indexPath.row ==7){
        self.PcarNumView =[[POPView alloc]initWithFrame:UIScreenBpunds];
        self.PcarNumView.popTitle.text = @"其他";
        self.PcarNumView.popTextFile.placeholder = @"请输入其他描述";
        [self.view addSubview:self.PcarNumView];
        [self.PcarNumView.popDoneBtn addTarget:self action:@selector(carAction:) forControlEvents:(UIControlEventTouchUpInside )];
    }


}

//弹框点击事件
//姓名
-(void)namePopAction:(UIButton*)sender{


    [self popCellBack:self.PnameView.popTextFile.text];
     self.PnameView.hidden = YES;
}
//性别
-(void)genderAction:(UIButton*)sender{

    [self popCellBack:self.PgenderView.popTextFile.text];
     self.PgenderView.hidden = YES;
}
//年龄
-(void)ageAction:(UIButton*)sender{
    
    [self popCellBack:self.PageView.popTextFile.text];
    self.PageView.hidden = YES;
}
//身高
-(void)heightAction:(UIButton*)sender{
    [self popCellBack:self.PheightView.popTextFile.text];
    self.PheightView.hidden = YES;
}
//职务
-(void)opstionAction:(UIButton*)sender{
    [self popCellBack:self.PositionView.popTextFile.text];
    self.PositionView.hidden = YES;
}
//工作时间
-(void)timeAction:(UIButton*)sender{
    [self popCellBack:self.PtimeView.popTextFile.text];
    self.PtimeView.hidden = YES;
}
//工作时间
-(void)carAction:(UIButton*)sender{
    [self popCellBack:self.PcarNumView.popTextFile.text];
    self.PcarNumView.hidden = YES;
}




-(void)popCellBack:(NSString*)backString{

    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    
    PublieTableViewCell *cell = [self.tableview cellForRowAtIndexPath: indexPath];
    cell.rightLa.text = backString;
    cell.rightLa.textColor = textCententColor;
   
    [self.tableview reloadData];


}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.yezhuTextfile resignFirstResponder];


    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
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
