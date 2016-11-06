//
//  LinbaoAddView.m
//  WiseAPP
//
//  Created by app on 16/11/3.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "LinbaoAddView.h"

@implementation LinbaoAddView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self addView];
    }
    return  self;
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
    
    self.activeNameFi=[[UITextField alloc]init];
   self.activeNameFi.frame = CGRectMake(10, 0, imagBg.width-20, imagBg.height);
   self.activeNameFi.placeholder =@"例如： 物品交接";
   self.activeNameFi.textColor = textCententColor;
    //self.produceFile.backgroundColor=[UIColor blueColor];
    [imagBg addSubview:self.activeNameFi];

    UILabel* peopleLa=[[UILabel alloc]init];
    peopleLa.frame = CGRectMake(titleLa.x , CGRectGetMaxY(imagBg.frame)+10, titleLa.width, 30);
    peopleLa.text = @"活动负责人";
   peopleLa.textColor = textCententColor;
    [self addSubview:peopleLa];
    
    UIImageView*peopleBg=[[UIImageView alloc]init];
   peopleBg.frame = STANDARDWH(CGRectGetMaxY( peopleLa.frame)+10);
    //textfilebackgroundimage.png // textfile
    peopleBg.image =[UIImage imageNamed:@"textfilebackgroundimage.png"];
    
    [self addSubview:peopleBg];
    peopleBg.userInteractionEnabled = YES;
    
    self.peopleFi=[[UITextField alloc]init];
   self.peopleFi.frame = CGRectMake(10, 0, imagBg.width-20, imagBg.height);
    self.peopleFi.placeholder =@"例如： 物品交接";
 self.peopleFi.textColor = textCententColor;
    //self.produceFile.backgroundColor=[UIColor blueColor];
    [ peopleBg addSubview:self.peopleFi];
    
    UILabel* activeTimLa=[[UILabel alloc]init];
   activeTimLa.frame = CGRectMake(titleLa.x , CGRectGetMaxY( peopleBg.frame)+10, titleLa.width, 30);
   activeTimLa.text = @"活动时间";
   activeTimLa.textColor = textCententColor;
    [self addSubview:activeTimLa];
    
    UIImageView*starBg=[[UIImageView alloc]init];
    starBg.frame = CGRectMake( imagBg.x, CGRectGetMaxY(activeTimLa.frame)+10, peopleBg.width/2 -30/2, peopleBg.height);
    //textfilebackgroundimage.png // textfile
   starBg.image =[UIImage imageNamed:@"textfilebackgroundimage.png"];
    
    [self addSubview:starBg];
    starBg.userInteractionEnabled = YES;
    
    self.starTimFi=[[UITextField alloc]init];
   self.starTimFi.frame = CGRectMake(10, 0, starBg.width/2 -30/2, starBg.height);
    self.starTimFi.placeholder =@"例如： 物品交接";
    self.starTimFi.textColor = textCententColor;
    //self.produceFile.backgroundColor=[UIColor blueColor];
    [ starBg addSubview:self.starTimFi];
    
    UIImageView*endBg=[[UIImageView alloc]init];
    endBg.frame = CGRectMake(CGRectGetMaxX(starBg.frame)+20, CGRectGetMaxY(activeTimLa.frame)+10, peopleBg.width/2 -30/2, peopleBg.height);
    //textfilebackgroundimage.png // textfile
    endBg.image =[UIImage imageNamed:@"textfilebackgroundimage.png"];
    
    [self addSubview:endBg];
    endBg.userInteractionEnabled = YES;
    
    self.endTimFi=[[UITextField alloc]init];
   self.endTimFi.frame = CGRectMake(10, 0, ( endBg.width-30)/2,  endBg.height);
    self.endTimFi.placeholder =@"例如： 物品交接";
   self.endTimFi.textColor = textCententColor;
   [endBg addSubview:self.endTimFi];
//
    UILabel* descLa=[[UILabel alloc]init];
    descLa.frame = CGRectMake(titleLa.x , CGRectGetMaxY(starBg.frame)+10, titleLa.width, 30);
    descLa.text = @"活动时间";
   descLa.textColor = textCententColor;
    [self addSubview:descLa];
    
    self.describeFv=[[UITextView alloc]init];
    self.describeFv.frame = CGRectMake(imagBg.x, CGRectGetMaxY(descLa.frame)+10, imagBg.width, 200);
    self.describeFv.backgroundColor=[UIColor redColor];
    [self addSubview:self.describeFv];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
