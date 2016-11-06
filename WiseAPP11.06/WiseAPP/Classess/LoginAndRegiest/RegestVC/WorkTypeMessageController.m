//
//  WorkTypeMessageController.m
//  WiseAPP
//
//  Created by app on 16/10/17.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "WorkTypeMessageController.h"
#import "WoryTypeMessageCell.h"
#import "SucessPopView.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "CellShenGaoView.h"
#import "CellShowCompanyNameView.h"
#import "CellShowDizhiView.h"
#import "CellJinjiLianxirenView.h"
#import "DoenList.h"
#import "HangyeViewController.h"
#import "QudaoView.h"
#import "QudaoFirstView.h"
#import "JINengViewController.h"


@interface WorkTypeMessageController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UITableView* customTableview;
@property(nonatomic,strong)SucessPopView* popView;
@property(nonatomic,strong)CellShenGaoView* heightView;
@property(nonatomic,strong)CellShowCompanyNameView* companyNameView;
@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)NSMutableArray* leftIconArray;
@property(nonatomic,strong)NSArray* titleArray;
@property(nonatomic,strong)NSArray* pickArray;
@property(nonatomic,strong)UIView* pickBGView;
@property(nonatomic,strong)UIPickerView* pickView;
@property(nonatomic,strong)CellShowDizhiView* dizhiView;
@property(nonatomic,strong)CellJinjiLianxirenView* contentView;
@property(nonatomic,strong)QudaoView* qudaoView;
@property(nonatomic,strong)QudaoFirstView* qudaoFirstView;
@property(nonatomic,strong)NSString* qudaoFriendName;
@property(nonatomic,strong)NSString* qudaoFrientPnum;

@end

static NSString*workTypeCellID= @"workTypeCellID";


@implementation WorkTypeMessageController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title =@"个人信息完善";
    [self addDate];
    [self addView];
    NSLog(@"%@%@%@",self.modelB,self.modelA,self.modelA.address);
    
}
-(void)addDate{
    self.dataArray=[NSMutableArray array];
    self.leftIconArray=[NSMutableArray array];
    self.titleArray=[NSArray array];
    self.pickArray =[NSArray array];
    self.leftIconArray = (NSMutableArray*)@[@"iconfont-shengaoo.png",@"iconfont-xueli.png",@"iconfont-hunyin.png",@"iconfont-dizhi.png",@"iconfont-lianxiren.png",@"iconfont-danweitijian.png",@"iconfont-xingye.png",@"iconfont-woquan.png",@"iconfont-qudao.png"];
    self.titleArray =@[@"身高",@"学历",@"婚姻状况",@"现居住地址",@"紧急联系人",@"现单位名称",@"行业",@"技能",@"应聘渠道"];

}
-(void)addView{

    
    self.customTableview=[[UITableView alloc]initWithFrame:UIScreenBpunds style:(UITableViewStylePlain)];
    [self.view addSubview:self.customTableview];
    [self.customTableview registerClass:[WoryTypeMessageCell class] forCellReuseIdentifier:workTypeCellID];
    self.customTableview.dataSource= self;
    self.customTableview .delegate = self;
    
    UIView*footview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    //footview.backgroundColor=[UIColor redColor];
    self.customTableview.tableFooterView = footview;
    
    UIButton*commitBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    commitBtn.frame = CGRectMake(STANDARD_X, PROPORTION_HIGHT(20), STANDARD_WIDTH, STANDARD_HEIGHT);
    KUIbutton(commitBtn);
    KUIbuttonClick(commitBtn);
    [commitBtn setTitle:@"提交" forState:(UIControlStateNormal)];
    [footview addSubview:commitBtn];
    [commitBtn addTarget:self action:@selector(commitBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
}

-(void)commitBtnAction:(UIButton*)sender{

 
    self.popView=[[SucessPopView alloc]initWithFrame:UIScreenBpunds];
    
    [self.view addSubview:self.popView];
    
    [self.popView.backBtn addTarget:self action:@selector(backAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.popView.doneBtn addTarget:self action:@selector(doneBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];

}

-(void)backAction:(UIButton*)sender{

    self.popView.hidden = YES;
}

-(void)doneBtnAction:(UIButton*)sender{

    MainTabBarController*mainTabbar=[[MainTabBarController alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController = mainTabbar ;
    
    
}


#pragma marl-----tableview delegate -----

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.leftIconArray.count;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return PROPORTION_HIGHT(45);
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WoryTypeMessageCell*cell=[self.customTableview dequeueReusableCellWithIdentifier:workTypeCellID];
    cell.leftIcon.image = [UIImage imageNamed:self.leftIconArray[indexPath.row]];
    cell.leftLabel.text = self.titleArray[indexPath.row];
    cell.rightImage.image=[UIImage imageNamed:@"icon_right"];
    
    return cell;
}
#pragma mark ------cellAction--------------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        self.heightView=[[CellShenGaoView alloc]initWithFrame:UIScreenBpunds];
        self.heightView.titleLabel.text= @"身高";
       
        [self.view addSubview:self.heightView];
        
        [self.heightView.backBtn addTarget:self action:@selector(backHBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.heightView.doneBtn addTarget:self action:@selector(doneHBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        YSTLog(@"666666");
        
    }else if (indexPath.row == 1){
        
        self.pickArray= @[@"初中",@"高中",@"大学"];
        [self  creatPickView:@"学历" ];
        
    }else if (indexPath.row == 2){
        
        self.pickArray= @[@"未婚",@"已婚"];
        [self  creatPickView:@"婚姻状况" ];
        
    }else if (indexPath.row == 3){
        self.dizhiView=[[CellShowDizhiView alloc]initWithFrame:UIScreenBpunds];
        self.dizhiView.titleLabel.text= @"现居住地址";
        
        [self.view addSubview:self.dizhiView];
        
        [self.dizhiView.backBtn addTarget:self action:@selector(dizhiBackCaction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.dizhiView.doneBtn addTarget:self action:@selector(dizhiDoneCAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        
    }else if (indexPath.row == 4){
        
        
        self.contentView=[[CellJinjiLianxirenView alloc]initWithFrame:UIScreenBpunds];
        
//         self.contentView.contanctName.text= @"j";
        
          [self.view addSubview:self.contentView];
         [self.contentView.saveBtn addTarget:self action:@selector( ContentSaveBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        

        
    }else if (indexPath.row == 5){
        self.companyNameView=[[CellShowCompanyNameView alloc]initWithFrame:UIScreenBpunds];
        
        
        [self.view addSubview:self.companyNameView];
        
        [self.companyNameView.backCBtn addTarget:self action:@selector(backCaction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.companyNameView.doneCBtn addTarget:self action:@selector(doneCAction:) forControlEvents:(UIControlEventTouchUpInside)];
   
    }else if (indexPath.row == 6){
        
        HangyeViewController*hangyeVC=[[HangyeViewController alloc]init];
        [self.navigationController pushViewController:hangyeVC animated:YES];
        
    }else if (indexPath.row == 7){
        
       JINengViewController*hangyeVC=[[JINengViewController alloc]init];
    
        
        [self.navigationController pushViewController:hangyeVC animated:YES];
        
    }else if (indexPath.row == 8){
        
        self.qudaoFirstView=[[QudaoFirstView alloc]initWithFrame:UIScreenBpunds];
     
        
        [self.view addSubview:self.qudaoFirstView];
       
//        self.pickArray= @[@"58同城",@"劳务介绍所",@"朋友"];
//        [self  creatPickView:@"应聘渠道" ];
        self.qudaoFirstView.userInteractionEnabled =YES;
        
        [self.qudaoFirstView.firstBtn addTarget:self action:@selector(lisbtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
         [self.qudaoFirstView.secendBtn addTarget:self action:@selector(qudaoSecendAction:) forControlEvents:(UIControlEventTouchUpInside)];
         [self.qudaoFirstView.thirdBtn addTarget:self action:@selector(qudaoThirdAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.qudaoFirstView.qudaoBackBtn addTarget:self action:@selector(qudaoFBackAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [self.qudaoFirstView.qudaoDoneBtn addTarget:self action:@selector(qudaoFdoneAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    
}



//渠道first点击事件

-(void)qudaoFBackAction:(UIButton*)sender{
    self.qudaoFirstView.hidden = YES;
    
    
}
-(void)qudaoFdoneAction:(UIButton*)sender{
    self.qudaoFirstView.hidden = YES;
}
-(void)lisbtnAction:(UIButton*)sender{
    
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    
    self.qudaoView=[[QudaoView alloc]init];
    self.qudaoView.frame = UIScreenBpunds;
    [self.view addSubview:self.qudaoView];
    
   //渠道选择朋友数据
        cell.rightLabel.text =  @"朋友";
     self.qudaoFriendName = self.qudaoView.FriendName.text;
     self.qudaoFrientPnum = self.qudaoView.frientNum.text;
        self.heightView.heightFile.delegate =self;
        cell.rightLabel.textColor = textCententColor;
;
    
    [self.qudaoView.cannelBtn addTarget:self action:@selector(qudaoCanBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
        [self.qudaoView.doneBtn addTarget:self action:@selector(qudaoDonbeBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];

    
    [self.customTableview reloadData];

}
-(void)qudaoSecendAction:(UIButton*)sender{
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    cell.rightLabel.text =  @"58同城";
    cell.rightLabel.textColor = textCententColor;
    ;
    [self.customTableview reloadData];

}
-(void)qudaoThirdAction:(UIButton*)sender{
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    cell.rightLabel.text =  @"劳务中介";
    cell.rightLabel.textColor = textCententColor;
    ;
    [self.customTableview reloadData];
    
}



//选择紧急联系人点击事件

-(void)ContentSaveBtnAction:(UIButton*)sender{
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    
    cell.rightLabel.text = self.contentView.contanctName.text ;
    cell.rightLabel.textColor = textColorPlace;
    self.contentView.hidden = YES;
    [self.customTableview reloadData];
}


//身高点击事件
-(void)backHBtnAction:(UIButton*)sender{

    YSTLogFunc
    self.heightView.hidden=YES;

}

-(void)doneHBtnAction:(UIButton*)sender{
  
//   WoryTypeMessageCell* myCell = (myTableViewCell *)[aButton superView]; //表示Button添加在了Cell中。
//    //如果将Button添加在myCell.contentView 中，
//    //myCell = (myTableViewCell *)[[aButton superView] superView];
//    
//    indexPath cellPath = [self.tableView indexPathForCell:myCell];
//    NSIntage i = cellPath.row; //这个就是cell的indexPath.row;
    
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    
   cell.rightLabel.text = self.heightView.heightFile.text;
    self.heightView.heightFile.delegate =self;
    cell.rightLabel.textColor = textCententColor;
    [self.customTableview reloadData];
    self.heightView.hidden =YES;
    YSTLogFunc
    //http://www.jianshu.com/p/bd9b823a1673
    
}
//公司名称
-(void)backCaction:(UIButton*)sender{
self.companyNameView.hidden=YES;

}

-(void)doneCAction:(UIButton*)sender{

    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    
    cell.rightLabel.text = self.companyNameView.heightFile.text;
    self.heightView.heightFile.delegate =self;
    cell.rightLabel.textColor = textCententColor;
    [self.customTableview reloadData];
    self.companyNameView.hidden =YES;

}
//现居住位置点击事件

-(void)dizhiBackCaction:(UIButton*)sender{
    self.dizhiView.hidden=YES;
    
}

-(void)dizhiDoneCAction:(UIButton*)sender{
    
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    
    cell.rightLabel.text = self.dizhiView.heightFile.text;
    self.dizhiView.heightFile.delegate =self;
    cell.rightLabel.textColor = textCententColor;
    [self.customTableview reloadData];
    self.dizhiView.hidden =YES;
    
}




//pickViewdelegate 学历
-(void)creatPickView:(NSString*)title {
    self.pickBGView=[[UIView alloc]initWithFrame:UIScreenBpunds];
    self.pickBGView.backgroundColor = popBGColore;
    [self.view addSubview:self.pickBGView];
    
    UIView*bgView=[[UIView alloc]init];
    bgView.frame = CGRectMake(PROPORTION_WIDTH(15),PROPORTION_HIGHT(100) , SCREEN_WIDTH-PROPORTION_WIDTH(30), PROPORTION_HIGHT(300));
    bgView.backgroundColor=[UIColor whiteColor];
    [self.pickBGView addSubview:bgView];
    
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
    self.pickBGView.userInteractionEnabled = YES;
    
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
    self.pickBGView.hidden = NO;
    
    [XueLibackBtn addTarget:self action:@selector(xueliBackAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
        [XueLidoneBtn addTarget:self action:@selector(xueliDoneAction:) forControlEvents:(UIControlEventTouchUpInside)];

}

-(void)xueliBackAction:(UIButton*)sender{
YSTLogFunc
 self.pickBGView.hidden = YES;

}
-(void)xueliDoneAction:(UIButton*)sender{
    YSTLogFunc
     self.pickBGView.hidden = YES;
    
    
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
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
    
         cell.rightLabel.text = title;

    cell.rightLabel.textColor= textCententColor;
    [self.customTableview reloadData];
    return title;
}

//应聘渠道
-(void)qudaoCanBtnAction:(UIButton*)sender{

 self.qudaoView.hidden = YES;
    self.qudaoFirstView.hidden = YES;
}

-(void)qudaoDonbeBtnAction:(UIButton*)sender{
    
    NSIndexPath *indexPath = [self.customTableview indexPathForSelectedRow];
    
    WoryTypeMessageCell *cell = [self.customTableview cellForRowAtIndexPath: indexPath];
            cell.rightLabel.text = @"朋友";
    self.qudaoView.hidden=YES;
    self.qudaoFirstView.hidden = YES;
    [self.customTableview reloadData];
}

-(void)commitData{
//    UIImage *image = [UIImage imageNamed:@"aa.jpg"];
//    
//    UIImage*img =[UIimageScaleImage scaleImage:image toKb:190];
//    
//   NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
    // 上传配置文件的模型
    //    MHUploadParam *upload = [[MHUploadParam alloc] init];
    //    upload.data           = data;
    //    upload.name = @"filename";
    
    //NSLog(@"lllllllll%lu",imageData.length/1024);
    UIImage *m_imgFore= [UIImage imageNamed:@"aa.jpg"];
    UIImage*imgg =[UIimageScaleImage scaleImage:m_imgFore toKb:190];
    //png格式
    NSData *imagedata=UIImagePNGRepresentation(imgg);
    // UIImage*iiM=[[UIImage alloc]initWithData:imagedata];
    NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *documentsDirectory=[paths objectAtIndex:0];
    
    NSString *savedImagePath=[documentsDirectory stringByAppendingPathComponent:@"11.png"];
    
    [imagedata writeToFile:savedImagePath atomically:YES];
    
    // 上传配置文件的模型
    MHUploadParam *upload = [[MHUploadParam alloc] init];
    upload.data           = imagedata;
    upload.name = @"id_card_head_image";
    
    MHUploadParam *uploadd = [[MHUploadParam alloc] init];
    uploadd.data           = imagedata;
    uploadd.name = @"id_card_negative";
    
    MHUploadParam *uploaddd = [[MHUploadParam alloc] init];
    uploaddd.data           = imagedata;
    uploaddd.name = @"id_card_positive";
    
    //JEPG格式
    //NSData *imagedata=UIImageJEPGRepresentation(m_imgFore,1.0);
//NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //    NSString *documentsDirectory=[paths objectAtIndex:0];
    //    NSString *savedImagePath=[documentsDirectorystringByAppendingPathComponent:@"saveFore.png"];
    //
    //    [imagedata writeToFile:savedImagePath atomically:YES];
    
    // fileName 写死 因为自动获取的fileName是当前日期格式化MD5+png 跟接口参数sign不一致 下边的参数是写死的只是为了测试 sign 签名的格式 account + token + fileName +MD5K 项目中签名是按照这个规则 这里测试数据都是写好的
    // 自己在使用是 只需要调用get 方法 便可以获取一个图片名 [upload fileName]
    //    NSString *fileName = upload.fileName;
    //NSString *fileName = @"55.png";
    //    NSDate *date = [NSDate date];
    //    NSLog(@"当前日期为:%@",date);
    //    NSTimeInterval timeStamp= [date timeIntervalSince1970];
    //    NSLog(@"日期转换为时间戳 %@ = %f", date, timeStamp);
    //    时间戳转日期 (秒数转日期
    //    NSString *timeStamp2 = @"1414956901";
    //    long long int date1 = (long long int)[timeStamp2 intValue];
    //    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:date1];
    //    NSLog(@"时间戳转日期 %@  = %@", timeStamp2, date2);
    //[NSDate date]
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"15021218935" forKey:@"username"];
    [dict setObject:@"123456" forKey:@"password"];
    [dict setObject:@"1111" forKey:@"name"];
    [dict setObject:@"nan" forKey:@"gender"];
    [dict setObject:[NSDate date] forKey:@"birthday"];
    [dict setObject:@"qewqewrewrww" forKey:@"address"];
    [dict setObject:@"77777" forKey:@"number"];
    [dict setObject:@"666" forKey:@"publisher"];
    [dict setObject:@"6667" forKey:@"validate"];
    
    [dict setObject:savedImagePath forKey:@"id_card_negative"];
    [dict setObject:savedImagePath forKey:@"id_card_positive"];
    [dict setObject:savedImagePath forKey:@"id_card_head_image"];
    
    NSString *Membership_Id1  = @"100";
    int  Membership_Id11 = [Membership_Id1 intValue];
    
    //用NSNnmber 来转int 类型的   这样子Membership_Id  就可以放进字典里面｀
    NSNumber * Membership_Id =  [NSNumber numberWithInt:Membership_Id11];
    [dict setObject:Membership_Id forKey:@"height"];
    [dict setObject:@"555" forKey:@"graduate"];
    [dict setObject:@"15021218935" forKey:@"telephone"];
    [dict setObject:@"emergency_conntact" forKey:@"living_address"];
    
    //
    NSDictionary*diem=[NSDictionary dictionary];
    diem = @{@"name":@"zhangsan",@"relation":@"2222",@"telephone":@"15021218935"};
    NSString*json=[self dictionaryToJson:diem];
    [dict setObject:json forKey:@"emergency_conntact"];
    
    //    NSDictionary*diem=[NSDictionary dictionary];
    //    diem = @{@"name":@"zhangsan",@"relation":@"2222",@"telephone":@"15021218935"};
    //    NSString*json=[self dictionaryToJson:diem];
    //    [dict setObject:json forKey:@"emergency_conntact"];
    //    http://blog.csdn.net/dlg1992/article/details/49176843
    NSArray*array=[NSArray array];
    array=@[@"11",@"33"];
    NSData*dataJS=[self toJSONData:array];
    
    NSString *jsonString = [[NSString alloc] initWithData:dataJS
                                                 encoding:NSUTF8StringEncoding];
    
    [dict setObject:jsonString forKey:@"industry"];
    
    NSArray*arrayyy=[NSArray array];
    arrayyy=@[@"11",@"33"];
    NSData*dataJSss=[self toJSONData:array];
    
    NSString *jsonStringgg = [[NSString alloc] initWithData:dataJSss
                                                   encoding:NSUTF8StringEncoding];
    
    [dict setObject:jsonStringgg forKey:@"skill"];
    [dict setObject:@"uuuu" forKey:@"channel"];
    
    
    
    
    // 开始上传头像
    [MHNetworkManager uploadFileWithURL:@"http://118.178.88.132:8000/api/register/user" params:dict successBlock:^(id returnData) {
        
        NSLog(@"kkkkkkkkkkkkkkk%@",returnData);
     
        
    } failureBlock:^(NSError *error) {
        
        [MBProgressHUD showError:@"上传头像失败!" toView:self.view];
        
    } uploadParam:upload showHUD:YES];
    


}
//字典转json
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

// 将字典或者数组转化为JSON串
- (NSData *)toJSONData:(id)theData{
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
    
    
}

//键盘回收
-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.heightView.heightFile resignFirstResponder];

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
