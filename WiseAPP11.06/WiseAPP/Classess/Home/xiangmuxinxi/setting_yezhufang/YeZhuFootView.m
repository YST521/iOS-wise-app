//
//  YeZhuFootView.m
//  WiseAPP
//
//  Created by app on 16/10/12.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "YeZhuFootView.h"

@interface YeZhuFootView()
@property(nonatomic,strong)UIView*creatDataView;

@end

@implementation YeZhuFootView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
      
        //[self addView];
        [self addDataView];
    }

    return self;

}
//-(void)addView{
//    self.index = 0;
//
//    self.YezhufootView =[[UIView alloc]initWithFrame: self.bounds];
//   self.YezhufootView.backgroundColor = [UIColor greenColor];
//    [self addSubview:self.YezhufootView];
//    self.addButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    self.addButton.frame =CGRectMake(00, 0, 60, 60);
//    [self.addButton setImage:[UIImage imageNamed:@"plus_Last"] forState:(UIControlStateNormal)];
//    self.addButton.center = self.center;
//    [self.YezhufootView addSubview:self.addButton];
//    //self.addButton.hidden = NO;
//    [self.addButton addTarget:self action:@selector(addButton:) forControlEvents:(UIControlEventTouchUpInside)];
//    self.addButton.userInteractionEnabled =YES;
//  
//
//}

//-(void) addButton:(UIButton*)sender{
//    
// 
//    self.YezhufootView.backgroundColor = [UIColor redColor];
//    [UIView animateWithDuration:0.01 animations:^{
//        
//          self.YezhufootView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height+300);
//        //self.addButton. hidden =YES;
//        
//        [self addDataView];
//        
//    } completion:^(BOOL finished) {
//        //self.addButton. hidden =YES;
//        
//    }];
////
//    
//    
//}

-(void)addDataView{
//    self.YezhufootView.userInteractionEnabled = YES;
//    self.creatDataView = [[UIView alloc]initWithFrame:self.YezhufootView.bounds];
//    self.creatDataView.backgroundColor = [UIColor grayColor];
//    [self.YezhufootView addSubview:self.creatDataView];

    self.yezhuNameText = [[UITextField alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, 30)];
    self.yezhuNameText.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.yezhuNameText];
    self.YezhufootView.userInteractionEnabled = YES;
    self.addButton.userInteractionEnabled =YES;
    
     UIButton*donebutton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    donebutton.frame =CGRectMake(30,  self.yezhuNameText.y+150, SCREEN_WIDTH, 30);
    [donebutton setImage:[UIImage imageNamed:@"plus_Last"] forState:(UIControlStateHighlighted)];

    donebutton.backgroundColor = [UIColor blueColor];
    
    [self.YezhufootView addSubview:donebutton];
    donebutton.hidden = NO;
  
     [donebutton addTarget:self action:@selector(addDoneAction:) forControlEvents:(UIControlEventTouchUpInside)];
//    UIView*view = [[UIView alloc]initWithFrame:CGRectMake(30,  self.yezhuNameText.y+200, SCREEN_WIDTH, 30)];
//    view.backgroundColor =[UIColor greenColor];
//    [self.YezhufootView addSubview:view];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addDta:)];
//    [self.YezhufootView addGestureRecognizer:tap];
//    
}
-(void)addDta:(UITapGestureRecognizer*)sender{

YSTLog(@"donrbutton");
}
-(void)addDoneAction:(UIButton*)sender{
     YSTLog(@"donrbutton");

//    [UIView animateWithDuration:0.01 animations:^{
//        
//        self.YezhufootView.frame =  self.bounds;
//        //self.addButton. hidden =YES;
//        YSTLog(@"donrbutton");
//       
//        
//    } completion:^(BOOL finished) {
//        self.YezhufootView.frame =  self.bounds;
//        // self.addButton. hidden =YES;
//        
//        YSTLog(@"donrbutton");
//
//        
//    }];




}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.creatDataView endEditing:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
