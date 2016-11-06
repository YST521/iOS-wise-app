//
//  RegestViewController.m
//  WiseAPP
//
//  Created by app on 16/10/16.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "RegestViewController.h"
#import "RegestView.h"
#import "WuGuanRegestViewController.h"
#import "WorkTypeViewController.h"
#import "GetcodeModel.h"
#import "LoginViewController.h"
#import "AgreementViewController.h"

@interface RegestViewController ()<UINavigationControllerDelegate,MHAsiNetworkDelegate>
@property(nonatomic,strong)RegestView*regestView;
@property(nonatomic,strong)NSString*nextType;
@property(nonatomic,strong)NSMutableDictionary*dataDic;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,assign)BOOL popAsLoginFlag;
@property(nonatomic,assign)BOOL flagAgress;

@end

@implementation RegestViewController
-(void)loadView{

    //替换view
    self.regestView =[[RegestView alloc]initWithFrame:UIScreenBpunds];
    self.view = self.regestView;
}

-(void)viewWillAppear:(BOOL)animated{

 self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor=[UIColor greenColor];
    
    self.navigationController.delegate = self;
    self.nextType = @"workType";
    self.dataDic =[NSMutableDictionary dictionary];
    self.dataArray =[NSMutableArray array];
    
    [self creatUI];
}

-(void)creatUI{

    [self.regestView.backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.regestView.typeBtn addTarget:self action:@selector(typeAction:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.regestView.viditionBtn addTarget:self action:@selector(getCodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.regestView.nextBtn addTarget:self action:@selector(nextPageAction:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.regestView.firstEyeBtn addTarget:self action:@selector(firstEye:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.regestView.secendEyeBtn addTarget:self action:@selector(secentEye:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.regestView.agreeBtn addTarget:self action:@selector(aggressAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.regestView.agreeContentBtn addTarget:self action:@selector(agreeAction:) forControlEvents:(UIControlEventTouchUpInside)];

}

#pragma mark ===Action==------
//物管家协议
-(void)agreeAction:(UIButton*)sender{
    
    AgreementViewController*agreeVC=[[AgreementViewController alloc]init];
    [self.navigationController pushViewController:agreeVC animated:YES];

}

-(void)viewDidDisappear:(BOOL)animated{
    
    //因为点击登录离开页面时
    if (YES == _popAsLoginFlag) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
    
    
}

//返回按钮
-(void)backBtnAction:(UIButton*)sender{
 

   [self.navigationController popViewControllerAnimated:YES];
    
    for (UIViewController *controller in self.navigationController.viewControllers) {
        
        if ([controller isKindOfClass:[ LoginViewController class]]) {
            
           LoginViewController *loginVC =(LoginViewController *)controller;
          [self.navigationController popToViewController:loginVC animated:YES];
        }
    }
    
}

// 类型选择
-(void)typeAction:(UIButton*)sendr{
    
    self.regestView.typeBtn.selected = !self.regestView.typeBtn.selected;
    if (self.regestView.typeBtn.selected == YES) {

  
        self.nextType= @"NoWork";
    }else{
           self.nextType = @"workType";
        
    }
    

    

}
//获取验证码
-(void)getCodeAction:(UIButton*)sender{
    
          GetcodeModel*model=[[GetcodeModel alloc]init];
    //验证码
    if ([self valiMobile:self.regestView.userPhoneNum.text]) {
        
     
        [MHNetworkManager postReqeustWithURL:@"http://118.178.88.132:8000/api/fetch_sms_code" params:@{@"telephone": self.regestView.userPhoneNum.text} successBlock:^(NSDictionary *returnData) {
            
            NSLog(@"wwwwww%@",returnData);
         
            //通知主线程刷新
            dispatch_async(dispatch_get_main_queue(), ^{
//        NSData*Datadic=[NSJSONSerialization JSONObjectWithData:returnData options:(NSJSONReadingMutableLeaves) error:nil];
                //回调或者说是通知主线程刷新，
      
            [model setValuesForKeysWithDictionary:returnData];
            [self.dataArray addObject:model];
            
            NSLog(@"%@--%@--%@",model.date,model.reultCode,model.reultMessage);
            NSLog(@"wwwwww%@",returnData);
            });
            
        } failureBlock:^(NSError *error) {
            YSTLog(@"请求失败");
        } showHUD:YES];
                      
        }else{
    
        [self AlerVCtitleString:@"提示" messageString:@"你的手机号码格式不对，请重新输入" doneString:@"重新输入"];
       }
    



}



//词典转换为json字符串

- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

//进入下一页面
-(void)nextPageAction:(UIButton*)sendr{
 
    
    
//    //判断账号密码不能为空
    if(![self.regestView.userPhoneNum.text isEqual:@""]&&![self.regestView.userPassword.text isEqual:@""]){
    //判断两次密码不一致
    if ([self.regestView.userPassword.text isEqual:self.regestView.userPsAgain.text]&&![self.regestView.userPassword.text isEqual: @" "]) {
        //if (self.flagAgress ) {
            
      //根据type判断
    if([self.nextType isEqualToString:@"workType"]){
    
        WorkTypeViewController*workVC=[[WorkTypeViewController alloc]init];
       workVC.wgPhoneNum = self.regestView.userPhoneNum.text;
       workVC.wgPassword = self.regestView.userPsAgain.text;
    
        [self.navigationController pushViewController:workVC animated:YES];
    }else{
        WuGuanRegestViewController*wuguanVC =[[WuGuanRegestViewController alloc]init];
        wuguanVC.wgPhoneNum = self.regestView.userPhoneNum.text;
        wuguanVC.wgPassword = self.regestView.userPsAgain.text;
        
    
        [self.navigationController pushViewController:wuguanVC animated:YES];
    }
//        }else{
//            [self AlerVCtitleString:@"提示" messageString:@"您未同意物管家协议" doneString:@"确定"];
//        }
        
    }else{
        [self AlerVCtitleString:@"提示" messageString:@"两次密码不一致，请重新输入" doneString:@"请重新输入"];
    }
        

    }else{
        [self AlerVCtitleString:@"提示" messageString:@"账号密码不能为空" doneString:@"请重新输入"];
    }

    
    
    

}

//看密码
-(void)firstEye:(UIButton*)sender{
    self.regestView.firstEyeBtn.selected = !self.regestView.firstEyeBtn.selected;
    if (self.regestView.firstEyeBtn.selected == YES) {
        self.regestView.userPassword.secureTextEntry = NO;
    }else{
        self.regestView.userPassword.secureTextEntry = YES;
    }
}

-(void)secentEye:(UIButton*)sender{


    self.regestView.secendEyeBtn.selected =  ! self.regestView.secendEyeBtn.selected;
    
    if (self.regestView.secendEyeBtn.selected == YES) {
       self.regestView.userPsAgain.secureTextEntry = NO;
    }else{
       self.regestView.userPsAgain.secureTextEntry = YES;
    }
    


}
//同意协议
-(void)aggressAction:(UIButton*)ssender{
    YSTLogFunc
    self.regestView.agreeBtn.selected  = !self.regestView.agreeBtn.selected;
    
    if (self.regestView.agreeBtn.selected == YES) {
        self.flagAgress = NO;
    }else{
          self.flagAgress = YES;
    }


}



#pragma mark - UINavigationControllerDelegate
//// 将要显示控制器
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    // 判断要显示的控制器是否是自己
//    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
//    
//    
//    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
//}
//
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.regestView endEditing:YES];
}

-(void)AlerVCtitleString:(NSString*)title messageString:(NSString*)message doneString:(NSString*)doneString{
    
    UIAlertController*alerVC= [UIAlertController alertControllerWithTitle:title message:message preferredStyle:( UIAlertControllerStyleAlert)];
    UIAlertAction*al= [UIAlertAction actionWithTitle:doneString style:(UIAlertActionStyleDefault) handler:nil];
    [alerVC addAction:al];
    [self presentViewController:alerVC animated:YES completion:nil];
    
}

//判断手机号码格式是否正确  正则表达式
-(BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
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
