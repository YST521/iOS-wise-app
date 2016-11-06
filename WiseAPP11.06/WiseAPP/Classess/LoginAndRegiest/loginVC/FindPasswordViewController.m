//
//  FindPasswordViewController.m
//  WiseAPP
//
//  Created by app on 16/10/16.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "FindView.h"
#import "ChangePasswordSucessView.h"
#import "LoginViewController.h"

@interface FindPasswordViewController ()
@property(nonatomic,strong)FindView*findView;
@property(nonatomic,strong)ChangePasswordSucessView*sucessView;

@end

@implementation FindPasswordViewController
-(void)loadView{
    self.findView=[[FindView alloc]initWithFrame:UIScreenBpunds];
    self.view = self.findView;


}
-(void)viewWillAppear:(BOOL)animated{
    
   self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
self.navigationItem.title = @"重置密码";
    [self addView];
}
-(void)addView{

    [self.findView.getCodeBtn addTarget:self action:@selector(getCodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.findView.firstBtneye addTarget:self action:@selector(firstActin:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.findView.secendBtneye addTarget:self action:@selector(secendEyeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.findView.commitButton addTarget:self action:@selector(commitAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

//获取验证码
-(void)getCodeAction:(UIButton*)sender{

    
    [MHNetworkManager postReqeustWithURL:@"http://118.178.88.132:8000/api/fetch_sms_code" params:@{@"telephone": self.findView.find_phoneNum.text} successBlock:^(NSDictionary *returnData) {
        NSLog(@"wwwwww%@",returnData);
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            //        NSData*Datadic=[NSJSONSerialization JSONObjectWithData:returnData options:(NSJSONReadingMutableLeaves) error:nil];
            //回调或者说是通知主线程刷新，
            
                        NSLog(@"wwwwww%@",returnData);
        });
    } failureBlock:^(NSError *error) {
        YSTLog(@"请求失败");
    } showHUD:YES];
    
}

//提交
-(void)commitAction:(UIButton*)sender{

    self.sucessView=[[ChangePasswordSucessView alloc]initWithFrame:UIScreenBpunds];
    [self.findView addSubview:self.sucessView];
    
    [self.sucessView.loginButton addTarget:self action:@selector(loginBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)firstActin:(UIButton*)sender{
self.findView.firstBtneye.selected =  !self.findView.firstBtneye.selected;
    if (self.findView.firstBtneye.selected == YES) {
        self.findView.firstPassword.secureTextEntry = NO;
    } else {
        self.findView.firstPassword.secureTextEntry = YES;
    }
}

-(void)secendEyeAction:(UIButton*)sender{

    self.findView.secendPassword.selected = !self.findView.secendPassword.selected;
    if (self.findView.secendPassword.selected == YES) {
        self.findView.secendPassword.secureTextEntry = NO;
    }else{
        self.findView.secendPassword.secureTextEntry = YES;
    }



}

//修改完密码跳转到登陆密码
-(void)loginBtnAction:(UIButton*)sender{

    //LoginViewController *loginVC=[[LoginViewController alloc]init];
    
    //[UIApplication sharedApplication].keyWindow.rootViewController = loginVC;
    [self.navigationController popViewControllerAnimated:YES];

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
