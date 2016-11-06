//
//  GerenQuebianTableViewCell.m
//  WiseAPP
//
//  Created by app on 16/11/4.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "GerenQuebianTableViewCell.h"

@implementation GerenQuebianTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
      
        //self.backgroundColor=[UIColor redColor];
        [self addTabView];
    }
    return self;
}
-(void)addTabView{
   
    self.quebianLeftLa =[[UILabel alloc]init];
    self.quebianLeftLa.frame =CGRectMake(10, STANDRD_H_20_y, 100, 20);
    self.quebianLeftLa.text = @"缺编人员01";
    [self.contentView addSubview:self.quebianLeftLa];
    self.quebianleftBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.quebianleftBtn.frame = CGRectMake(PROPORTION_WIDTH(146), 15/2,PROPORTION_WIDTH(30) , PROPORTION_HIGHT(30));
    self.quebianleftBtn.backgroundColor =[UIColor purpleColor];
    [self.contentView addSubview:self.quebianleftBtn];
    
    self.quebianFi =[[UITextField alloc]init];
    self.quebianFi.frame = CGRectMake(CGRectGetMaxX(self.quebianleftBtn.frame)+10, 15/2, PROPORTION_WIDTH(45), PROPORTION_HIGHT(30));
    self.quebianFi.backgroundColor=[UIColor blueColor];
    [self.contentView addSubview:self.quebianFi];
    
    self.quebianRightBtn =[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.quebianleftBtn.frame = CGRectMake(PROPORTION_WIDTH(236), 15/2,PROPORTION_WIDTH(30) , PROPORTION_HIGHT(30));
    self.quebianRightBtn.backgroundColor=[UIColor yellowColor];
    [self.contentView addSubview:self.quebianRightBtn];
    
    self.quebianrightLa=[[UILabel alloc]init];
    self.quebianrightLa.frame =CGRectMake(PROPORTION_WIDTH(287), STANDRD_H_20_y, 60, 20);
    self.quebianrightLa.text = @"申请班次";
    self.quebianrightLa.font =[UIFont systemFontOfSize:14];
    //自适应
    self.quebianrightLa.adjustsFontForContentSizeCategory = YES;
    [self.contentView addSubview:self.quebianrightLa];
    self.quebianrightImageV=[[UIImageView alloc]init];
    self.quebianrightImageV.frame = CGRectMake(SCREEN_WIDTH-30 , STANDRD_H_20_y, PROPORTION_WIDTH(12), PROPORTION_HIGHT(20));
    self.quebianrightImageV.image =[UIImage imageNamed:@"icon_right"];
    self.quebianrightImageV.backgroundColor =[UIColor redColor];
    [self.contentView addSubview:self.quebianrightImageV];
    
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.quebianLeftLa.frame =CGRectMake(10, STANDRD_H_20_y, 100, 20);
      self.quebianleftBtn.frame = CGRectMake(PROPORTION_WIDTH(146), 15/2,PROPORTION_WIDTH(30) , PROPORTION_HIGHT(30));
      self.quebianRightBtn.frame = CGRectMake(PROPORTION_WIDTH(236), 15/2,PROPORTION_WIDTH(30) , PROPORTION_HIGHT(30));
    self.quebianrightLa.frame =CGRectMake(PROPORTION_WIDTH(287), STANDRD_H_20_y, 60, 20);
        self.quebianrightImageV.frame = CGRectMake(SCREEN_WIDTH-PROPORTION_WIDTH(30) , STANDRD_H_20_y, PROPORTION_WIDTH(12), PROPORTION_HIGHT(20));


}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
