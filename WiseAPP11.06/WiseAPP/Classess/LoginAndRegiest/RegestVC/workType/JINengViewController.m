//
//  JINengViewController.m
//  WiseAPP
//
//  Created by app on 16/10/24.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "JINengViewController.h"


#define Start_X 46.0f           // 第一个按钮的X坐标
#define Start_Y 20.0f           // 第一个按钮的Y坐标
#define Width_Space 5.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 45.0f    // 高
#define Button_Width 88.0f      // 宽
@interface JINengViewController ()
@property(nonatomic,assign)NSInteger indexBtn;
@property(nonatomic,strong)UIButton*opBtn;
@end

@implementation JINengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indexBtn = 1000;
    self.navigationItem.title = @"技能";
    
    [self addButtonS];
    [self addView];
}
-(void)addView{
    
    
    
    
    
}
-(void)addButtonS
{
    UIView*bgView=[[UIView alloc]init];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, PROPORTION_HIGHT(220));
    //bgView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:bgView];
    
    
    for (int i = 0 ; i < 7; i++) {
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        
        // 圆角按钮
        self.opBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        self.opBtn.frame = CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height);

        KUIbutton(self.opBtn);
        //KUIbuttonClick(self.opBtn);
        [self.opBtn setBackgroundImage:[UIImage imageNamed:@"regest_hangye"] forState:(UIControlStateSelected)];
        
        NSArray*array=@[@"武术",@"散打",@"拳击",@"退伍",@"美术",@"其它",@"+"];
        
        [self.opBtn setTitle:array[i] forState:(UIControlStateNormal)];
        self.opBtn.tag = self.indexBtn+i;
        [bgView addSubview:self.opBtn];
        [self.opBtn addTarget:self action:@selector(abtAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    
    UIButton*commitBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    commitBtn.frame =  STANDARDWH(CGRectGetMaxY(bgView.frame)+10);
    KUIbuttonClick(commitBtn);
    KUIbutton(commitBtn);

    [commitBtn setTitle:@"提交" forState:(UIControlStateNormal)];
    [self.view addSubview:commitBtn];
    [commitBtn addTarget:self action:@selector(commitBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    UILabel*label=[[UILabel alloc]init];
    label.frame = CGRectMake(PROPORTION_WIDTH(46), CGRectGetMaxY(commitBtn.frame)+PROPORTION_HIGHT(20), SCREEN_WIDTH-PROPORTION_WIDTH(46*2), 20);
    label.text = @"* 请选择您的技能，最多选择3个";
    label.font =[UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    
    
}
-(void)commitBtnAction:(UIButton*)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)abtAction:(UIButton*)sender{
    if (sender.tag == 1000) {
        
        NSLog(@"1111");
        
    }else if (sender.tag == 1001){
        
        NSLog(@"2222");
        
    }else if (sender.tag == 1002){
        
        NSLog(@"2222");
        
    }else if (sender.tag == 1003){
        
        NSLog(@"2222");
        
    }else if (sender.tag == 1004){
        
        NSLog(@"2222");
        
    }else if (sender.tag == 1005){
        
        NSLog(@"2222");
        
    }else if (sender.tag == 1006){
        
        NSLog(@"2222");
        
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
