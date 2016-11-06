//
//  CellShowDizhiView.m
//  WiseAPP
//
//  Created by app on 16/10/18.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "CellShowDizhiView.h"

@implementation CellShowDizhiView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addView];
    }
    
    return self;
    
}

-(void)addView{
    
    
    self.backgroundColor=popBGColore;
    UIView*bgView=[[UIView alloc]init];
    bgView.frame = CGRectMake(PROPORTION_WIDTH(15),PROPORTION_HIGHT(80) , SCREEN_WIDTH-PROPORTION_WIDTH(30), PROPORTION_HIGHT(300));
    bgView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgView];
    
    UIImageView*titleBg=[[UIImageView alloc]init];
    titleBg.frame = CGRectMake(0, 0, bgView.width,  STANDARD_HEIGHT);
    titleBg.image =[UIImage imageNamed:@"nabackgroundImage.png"];
    [bgView addSubview:titleBg];
    
    
    
    self.titleLabel=[[UILabel alloc]initWithFrame:titleBg.bounds];
    self.titleLabel.text = @" 现居住地";
    self.titleLabel.textAlignment =NSTextAlignmentCenter;
    self.titleLabel.textColor =  [UIColor whiteColor];
    [bgView addSubview: self.titleLabel];
    
    //输入框
    UIImageView*textfBg=[[UIImageView alloc]init];
    textfBg.frame = CGRectMake(PROPORTION_WIDTH(15),CGRectGetMaxY(_titleLabel.frame)+PROPORTION_HIGHT(20), bgView.width-PROPORTION_WIDTH(30),120);
    textfBg.image=[UIImage imageNamed:@"textfilebackgroundimage.png"];
    //textfBg.backgroundColor=[UIColor greenColor];
    [bgView addSubview:textfBg];
    textfBg.userInteractionEnabled = YES;
    
    
    self.heightFile=[[UITextField alloc]init];
    self.heightFile.frame = titleBg.bounds;
    //self.phoneNum.backgroundColor=[UIColor redColor];
    NSMutableAttributedString*string=[[NSMutableAttributedString alloc]initWithString:@"请输入现居住地地址"];
    [string setAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:53/255 green:53/255 blue:53/255 alpha:1]} range:NSMakeRange(0, 5)];
    self.heightFile.attributedPlaceholder= string;
    self.heightFile.textColor = textCententColor;
    
    [textfBg addSubview:self.heightFile];
    
    
    self.backBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.backBtn.frame = CGRectMake(PROPORTION_WIDTH(16), CGRectGetMaxY(textfBg.frame)+PROPORTION_HIGHT(20), (bgView.width-PROPORTION_WIDTH(16)*2-10)/2, STANDARD_HEIGHT);
    KUIbutton(self.backBtn);
    KUIbuttonClick(self.backBtn);
    [self.backBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    [bgView addSubview:self.backBtn];
    
    self.doneBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.doneBtn.frame=CGRectMake(CGRectGetMaxX(self.backBtn.frame)+10, self.backBtn.y, self.backBtn.width, self.backBtn.height);
    KUIbutton(self.doneBtn);
    KUIbuttonClick(self.doneBtn);
    [self.doneBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    [bgView addSubview:self.doneBtn];
    self.hidden = NO;
    
    
    
}

@end
