//
//  BanciAddViewController.m
//  WiseAPP
//
//  Created by app on 16/10/13.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BanciAddViewController.h"
#import "CustonTextfile.h"
#import "BanCiViewController.h"

@interface BanciAddViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)CustonTextfile* banciName;
@property(nonatomic,strong)CustonTextfile*  starTime;
@property(nonatomic,strong)CustonTextfile*  endTime;


@end

@implementation BanciAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.title = @"班次设置";
    self.view.backgroundColor = GlobBackGroundColor;
    [self  addView];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    
    
}
-(void)saveAction:(UIButton*)sender{

    [self.navigationController popViewControllerAnimated:YES];

}


-(void)addView{


    
    UILabel*titleLabel= [[UILabel alloc]init];
    titleLabel.text = @"班次名称";
    titleLabel.textColor = textCententColor;
    titleLabel.frame =CGRectMake(PROPORTION_WIDTH(15), 0, STANDARD_WIDTH, 30);
    //titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    self.banciName=[[CustonTextfile alloc]initWithFrame:CGRectMake(STANDARD_X, CGRectGetMaxY(titleLabel.frame)+10, STANDARD_WIDTH, STANDARD_HEIGHT)];
    [self.view addSubview:self.banciName];
    self.banciName.customTextfile.placeholder= @"请输入班次名称 例如：日班";
    self.banciName.customTextfile.delegate = self;
    UILabel*label=[[UILabel alloc]init];
    label.frame = CGRectMake(PROPORTION_WIDTH(15), CGRectGetMaxY(self.banciName.frame)+PROPORTION_HIGHT(20), 100, 20);
    label.text = @"班次时间";
    label.textColor = textCententColor;
    [self.view addSubview:label];
    
    self. starTime = [[CustonTextfile alloc]initWithFrame:CGRectMake(STANDARD_X, CGRectGetMaxY(label.frame)+10, STANDARD_WIDTH, STANDARD_HEIGHT)];
    self.starTime.customTextfile.placeholder= @"请输入开始时间";
    [self.view addSubview:self.starTime];
    
    self. endTime = [[CustonTextfile alloc]initWithFrame:CGRectMake(STANDARD_X, CGRectGetMaxY(self.starTime.frame)+10, STANDARD_WIDTH, STANDARD_HEIGHT)];
     self. endTime.customTextfile.placeholder= @"请输入下班时间";
    [self.view addSubview: self. endTime];
    
    
    
    

}
//提交数据
-(void)commitButtonAction:(UIButton*)sender{
    
   // BanCiViewController*banciVC=[[BanCiViewController alloc]init];
//    NSMutableArray*passArray=[NSMutableArray array];
//    [passArray addObject:self.banciName.customTextfile.text];
//    [passArray addObject:self.starTime.customTextfile.text];
//     [passArray addObject:self.endTime.customTextfile.text];
//    
//    self.passBanciArray(passArray);
    //NSMutableDictionary*dic=[NSMutableDictionary dictionary];
//    dic = (NSMutableDictionary*)@{self.banciName.customTextfile.text:@"1",self.starTime.customTextfile.text:@"2",self.endTime.customTextfile.text:@"3"};
//    
//    self.passBanciVlue(dic);
 
    
    

    
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.banciName.customTextfile resignFirstResponder];

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
