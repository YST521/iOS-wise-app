//
//  ViewController.m
//  WQEWQ
//
//  Created by app on 16/10/9.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "ViewController.h"
#import "MHUploadParam.h"
#import "MBProgressHUD+Add.h"

@interface ViewController ()<MHAsiNetworkDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor redColor];
    UIButton*button=[UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(50, SCREEN_HEIGHT-100, SCREEN_WIDTH-100, 40);
    button.backgroundColor=[UIColor greenColor];
    [button setTitle:@"返回" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(backFun) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void)backFun{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self dismissViewControllerAnimated:YES completion:nil];
    
    //block回调
//    [MHNetworkManager postReqeustWithURL:DEF_GetHomepage params:@{@"account":@"13103859179",@"sign":@"0c1fc7f08389e844a62d428152caedf6",@"token":@"26713f368ced59a9a25e3afd077e3a05"} successBlock:^(NSDictionary *returnData) {
//        
//    } failureBlock:^(NSError *error) {
//        
//    } showHUD:YES];
    
    //代理回调
    [MHNetworkManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} delegate:self showHUD:YES];
    //sel回调
    [MHNetworkManager postReqeustWithURL:@"http://www.perasst.com:8081/perasst_v2/user/login.pa" params:@{@"userName":@"18538320461",@"password":@"123456"} target:self action:@selector(finishedRequest:didFaild:) showHUD:YES];
    //
    UIImage *image = [UIImage imageNamed:@"112.jpg"];
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    // 上传配置文件的模型
    MHUploadParam *upload = [[MHUploadParam alloc] init];
    upload.data           = data;
    upload.name = @"filename";
    // fileName 写死 因为自动获取的fileName是当前日期格式化MD5+png 跟接口参数sign不一致 下边的参数是写死的只是为了测试 sign 签名的格式 account + token + fileName +MD5K 项目中签名是按照这个规则 这里测试数据都是写好的
    // 自己在使用是 只需要调用get 方法 便可以获取一个图片名 [upload fileName]
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSString *account = @"13103859179";
    NSString *token = @"26713f368ced59a9a25e3afd077e3a05";
    //    NSString *fileName = upload.fileName;
    NSString *fileName = @"411f7256446f518061d4264d834094b5.png";
    NSString *sign = @"fcb9b9690e36a1a542b850dc2aaa4e78";
    [dict setObject:account forKey:@"account"];
    [dict setObject:sign forKey:@"sign"];
    [dict setObject:token forKey:@"token"];
    [dict setObject:fileName forKey:@"filename"];
    // 开始上传头像
//    [MHNetworkManager uploadFileWithURL:DEF_UploadHeadImg params:dict successBlock:^(id returnData) {
//        
//        
//    } failureBlock:^(NSError *error) {
//        [MBProgressHUD showError:@"上传头像失败!" toView:self.view];
//    } uploadParam:upload showHUD:YES];
//

    [self dismissViewControllerAnimated:YES completion:nil];
    
   
    
}


#pragma mark - MHAsiNetworkDelegate

- (void)requestDidFinishLoading:(NSDictionary *)returnData
{
    NSLog(@"-----%@",returnData);
}

- (void)requestdidFailWithError:(NSError *)error
{
    
}
#pragma mark - target
- (void)finishedRequest:(id)data didFaild:(NSError*)error
{
    NSLog(@"---%@-%@",data,error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
