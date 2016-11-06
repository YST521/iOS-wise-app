//
//  GangweiPeixunView.m
//  WiseAPP
//
//  Created by app on 16/11/1.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "GangweiPeixunView.h"

@implementation GangweiPeixunView
-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
       
        [self addView];
    }

    return self;
}

-(void)addView{
    UILabel* titleLa=[[UILabel alloc]init];
    titleLa.frame = CGRectMake(10, 0, SCREEN_WIDTH-20, 30);
    titleLa.text = @"交接班注意事项名称";
    titleLa.textColor = textCententColor;
    [self addSubview:titleLa];
    
    
    UIImageView*imagBg=[[UIImageView alloc]init];
    imagBg.frame = STANDARDWH(CGRectGetMaxY(titleLa.frame)+10);
    //textfilebackgroundimage.png // textfile
    imagBg.image =[UIImage imageNamed:@"textfilebackgroundimage.png"];
    
    [self addSubview:imagBg];
    imagBg.userInteractionEnabled = YES;
    
    
    self.produceFile=[[UITextField alloc]init];
    self.produceFile.frame = imagBg.bounds;
    self.produceFile.placeholder =@"例如： 物品交接";
    self.produceFile.textColor = textCententColor;
    //self.produceFile.backgroundColor=[UIColor blueColor];
    [imagBg addSubview:self.produceFile];
    
    UILabel* contentLa=[[UILabel alloc]init];
    contentLa.frame = CGRectMake(STANDARD_X, CGRectGetMaxY(imagBg.frame)+PROPORTION_HIGHT(20), STANDARD_WIDTH , 30);
    contentLa.text = @"交接班注意事项内容";
    contentLa.textColor = textCententColor;
    [self addSubview:contentLa];
    
    self.contentFile=[[UITextView alloc]init];
    self.contentFile.frame = CGRectMake(STANDARD_X, CGRectGetMaxY(contentLa.frame)+10, STANDARD_WIDTH, 300);
    self.contentFile.backgroundColor=[UIColor greenColor];
    [self addSubview:self.contentFile];
    UILabel*warinLa=[[UILabel alloc]init];
    warinLa.frame = CGRectMake(self.contentFile.width-100, self.contentFile.height-20, 100, 20);
    warinLa.text =@"210字";
    warinLa.textAlignment = NSTextAlignmentCenter;
    [self.contentFile addSubview:warinLa];
    
    self.addImageView=[[UIView alloc]init];
    self.addImageView.frame = CGRectMake(STANDARD_X, CGRectGetMaxY(self.contentFile.frame)+10, STANDARD_WIDTH, 100);
    self.addImageView.backgroundColor=[UIColor yellowColor];
    [self addSubview:self.addImageView];
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
