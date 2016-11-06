//
//  JiaojiebanAddViewController.m
//  WiseAPP
//
//  Created by app on 16/11/1.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "JiaojiebanAddViewController.h"
#import "JIaojiebanView.h"

@interface JiaojiebanAddViewController ()
@property(nonatomic,strong)JIaojiebanView*jiaojieView;

@end

@implementation JiaojiebanAddViewController
-(void)loadView{
    self.jiaojieView=[[JIaojiebanView alloc]initWithFrame:UIScreenBpunds];
    self.view = self.jiaojieView;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveAction:)];
    [self addView];
    
}
-(void)saveAction:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)addView{
    
    
    
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
