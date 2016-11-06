//
//  QudaoFirstView.m
//  WiseAPP
//
//  Created by app on 16/10/24.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "QudaoFirstView.h"


#define Start_X 0.0f           // 第一个按钮的X坐标
#define Start_Y 0.0f           // 第一个按钮的Y坐标
#define Width_Space 0.0f        // 2个按钮之间的横间距
#define Height_Space 2.0f      // 竖间距
//#define Button_Height 45.0f    // 高
//#define Button_Width 88.0f      // 宽

@interface QudaoFirstView()


@property(nonatomic,strong)NSArray*dataArray;
@end

@implementation QudaoFirstView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addView];
    }
    
    return self;
    
}

-(void)addView{
    self.dataArray = @[@"朋友",@"58同城",@"劳务介绍所"];
    
     self.indexBtn = 200;
    self.backgroundColor=popBGColore;
    UIView*bgView=[[UIView alloc]init];
    bgView.frame = CGRectMake(PROPORTION_WIDTH(15),PROPORTION_HIGHT(100) , SCREEN_WIDTH-PROPORTION_WIDTH(30), PROPORTION_HIGHT(300));
    bgView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgView];
    
    UIImageView*titleBg=[[UIImageView alloc]init];
    titleBg.frame = CGRectMake(0, 0, bgView.width,  STANDARD_HEIGHT);
    titleBg.image =[UIImage imageNamed:@"nabackgroundImage.png"];
    [bgView addSubview:titleBg];
    
    
    
   UILabel* titleL=[[UILabel alloc]initWithFrame:titleBg.bounds];
 titleL.text = @"应聘渠道";
    titleL.textAlignment =NSTextAlignmentCenter;
    titleL.textColor =  [UIColor whiteColor];
    [bgView addSubview: titleL];
    
    UIView*btnView=[[UIView alloc]init];
    btnView.frame = CGRectMake(0,0, bgView.width, PROPORTION_HIGHT(45*self.dataArray.count));
    //btnView.backgroundColor=[UIColor greenColor];
    [bgView addSubview:btnView];
    
//    
//    for (int i = 0 ; i < self.dataArray.count; i++) {
//        NSInteger index = i % 3;
//       // NSInteger page = i / 3;
//        
//        // 圆角按钮
//        self.listBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        
//        self.listBtn.frame = CGRectMake(0,(index+1)*PROPORTION_HIGHT(45) , bgView.width,PROPORTION_HIGHT(45));
//        //self.listBtn.backgroundColor=[UIColor redColor];
////        KUIbutton(self.listBtn);
////        KUIbuttonClick(self.listBtn);
//        self.listBtn.backgroundColor=textColorPlace;
//        self.listBtn.titleLabel.textColor = [UIColor whiteColor];
//        
//        [self.listBtn setTitle:self.dataArray[i] forState:(UIControlStateNormal)];
//        self.listBtn.tag = self.indexBtn+i;
//        [btnView addSubview:self.listBtn];
//    
//    }
//    
    self.firstBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.firstBtn.frame =CGRectMake(0, PROPORTION_HIGHT(45), bgView.width, PROPORTION_HIGHT(45));
    self.firstBtn.backgroundColor= textColorPlace;
    [self.firstBtn setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted)];
    [self.firstBtn setTitle:@"朋友" forState:(UIControlStateNormal)];
    [bgView addSubview:self.firstBtn];
    
    self.secendBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.secendBtn.frame =CGRectMake(0, PROPORTION_HIGHT(45*2), bgView.width, PROPORTION_HIGHT(45));
   self.secendBtn.backgroundColor= textColorPlace;
    [self.secendBtn setTitle:@"58同城" forState:(UIControlStateNormal)];
    [self.secendBtn setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted)];
    [bgView addSubview:self.secendBtn];
    
    self.thirdBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
  self.thirdBtn.frame =CGRectMake(0, PROPORTION_HIGHT(45*3), bgView.width, PROPORTION_HIGHT(45));
    self.thirdBtn.backgroundColor= textColorPlace;
    [self.thirdBtn setTitle:@"劳务中介" forState:(UIControlStateNormal)];
    [self.thirdBtn setTitleColor:[UIColor redColor] forState:(UIControlStateHighlighted)];
    [bgView addSubview:self.thirdBtn];
    
    
    
    
    self.qudaoBackBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
   self.qudaoBackBtn.frame = CGRectMake(PROPORTION_WIDTH(16), CGRectGetMaxY(btnView.frame)+PROPORTION_HIGHT(20+45+10), (btnView.width-PROPORTION_WIDTH(16)*2-10)/2, STANDARD_HEIGHT);
    KUIbutton( self.qudaoBackBtn);
    KUIbuttonClick( self.qudaoBackBtn);
    [self.qudaoBackBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    [bgView addSubview:self.qudaoBackBtn];
    
    
    self.qudaoDoneBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
  self.qudaoDoneBtn.frame=CGRectMake(CGRectGetMaxX( self.qudaoBackBtn.frame)+10,  self.qudaoBackBtn.y, self.qudaoBackBtn.width,  self.qudaoBackBtn.height);
    KUIbutton(self.qudaoDoneBtn);
    KUIbuttonClick(self.qudaoDoneBtn);
    [ self.qudaoDoneBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    [bgView addSubview:self.qudaoDoneBtn];
    self.hidden = NO;
    
    
    
}
@end
