//
//  GerenZhangchangTableViewCell.m
//  WiseAPP
//
//  Created by app on 16/11/4.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "GerenZhangchangTableViewCell.h"

@implementation GerenZhangchangTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //self.backgroundColor=[UIColor greenColor];
        [self addTabView];
    }
    return self;
}
-(void)addTabView{
    
    self.zhangchangLeLa =[[UILabel alloc]init];
   self.zhangchangLeLa.frame =CGRectMake(10, STANDRD_H_20_y, 100, 20);
   self.zhangchangLeLa.text = @"缺编人员01";
    [self.contentView addSubview:self.zhangchangLeLa];
    
    self.zhangchangLeftBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.zhangchangLeftBtn.frame = CGRectMake(PROPORTION_WIDTH(240), 15/2, PROPORTION_WIDTH(30), PROPORTION_HIGHT(30));
    self.zhangchangLeftBtn.backgroundColor =[UIColor purpleColor];
    [self.contentView addSubview:self.zhangchangLeftBtn];
    
    self.zhangchangFi =[[UITextField alloc]init];
    self.zhangchangFi.frame = CGRectMake(PROPORTION_WIDTH(280), 15/2, PROPORTION_WIDTH(45), PROPORTION_HIGHT(30));
   self.zhangchangFi.backgroundColor=[UIColor blueColor];
    [self.contentView addSubview:self.zhangchangFi];
    
    self.zhangchangRightBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
     self.zhangchangRightBtn.frame = CGRectMake(PROPORTION_WIDTH(335), 15/2, PROPORTION_WIDTH(30), PROPORTION_HIGHT(30));
     self.zhangchangRightBtn.backgroundColor =[UIColor purpleColor];
    [self.contentView addSubview: self.zhangchangRightBtn];

    
    
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
