//
//  HangyeViewController.m
//  WiseAPP
//
//  Created by app on 16/10/24.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "HangyeViewController.h"

#define Start_X 46.0f           // 第一个按钮的X坐标
#define Start_Y 20.0f           // 第一个按钮的Y坐标
#define Width_Space 5.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 45.0f    // 高
#define Button_Width 88.0f      // 宽

@interface HangyeViewController ()
@property(nonatomic,assign)NSInteger indexBtn;
@property(nonatomic,strong)UIButton*opBtn;
@property(nonatomic,strong)NSMutableArray*array;

@end

@implementation HangyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.modalPresentationStyle = .custom
  
    //self.view.backgroundColor = popBGColore;
        self.indexBtn = 1000;
    self.navigationItem.title = @"行业";
    self.array=[NSMutableArray array];
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
        
        self.opBtn.frame = CGRectMake(index * (Button_Width + Width_Space) + PROPORTION_WIDTH(46), page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height);
       
        KUIbutton(self.opBtn);
        [self.opBtn setBackgroundImage:[UIImage imageNamed:@" "] forState:(UIControlStateSelected)];
        
        NSArray*array=@[@"保安",@"消防",@"工程",@"保洁",@"客服",@"其它",@"+"];
        
        [self.opBtn setTitle:array[i] forState:(UIControlStateNormal)];
        self.opBtn.tag = self.indexBtn+i;
        [bgView addSubview:self.opBtn];
        [self.opBtn addTarget:self action:@selector(abtAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    
    UIButton*commitBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    commitBtn.frame =  STANDARDWH(CGRectGetMaxY(bgView.frame)+10);


    KUIbutton(commitBtn);
    KUIbuttonClick(commitBtn);
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
        
        [self.array addObject:@"武术"];
        
    }else if (sender.tag == 1001){
    
        [self.array addObject:@"武术"];
    
    }else if (sender.tag == 1002){
        
  [self.array addObject:@"武术"];
    }else if (sender.tag == 1003){
        
       [self.array addObject:@"武术"];
        
    }else if (sender.tag == 1004){
        
        [self.array addObject:@"武术"];
        
    }else if (sender.tag == 1005){
        
        [self.array addObject:@"武术"];
        
    }else if (sender.tag == 1006){
        
      [self.array addObject:@"武术"];
        
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
