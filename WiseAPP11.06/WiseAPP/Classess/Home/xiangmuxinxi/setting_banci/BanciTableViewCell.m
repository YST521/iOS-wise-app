//
//  BanciTableViewCell.m
//  WiseAPP
//
//  Created by app on 16/10/13.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BanciTableViewCell.h"

@implementation BanciTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addView];
    }
    return self;
}
-(void)addView{
    
    self.titleLabel=[[UILabel alloc]init ];
                     self.titleLabel.frame= CGRectMake(0, 0, self.contentView.width/3,  self.contentView.height);
    self.titleLabel.backgroundColor=[UIColor redColor];
    [ self.contentView addSubview:self.titleLabel];
    
    self.starTime=[[UILabel alloc]init];
        self.starTime.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame),0, self.contentView.width/2, self.contentView.height);
    self.starTime.backgroundColor=[UIColor greenColor];
    [ self.contentView addSubview:self.starTime];
//
//    self.endTimeLabel=[[UILabel alloc]init];
//                     self.endTimeLabel.frame = CGRectMake( self.contentView.width/2, self.starTime.y,  self.contentView.width/2, 30);
//    self.endTimeLabel.backgroundColor=[UIColor yellowColor];
//    [ self.contentView addSubview:self.endTimeLabel];

}
-(void)layoutSubviews{
    [super layoutSubviews];
    
   self.titleLabel.frame= CGRectMake(0, 0, self.contentView.width/3,  self.contentView.height);
    
    self.starTime.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame),0, self.contentView.width/2, self.contentView.height);
    
//    self.starTime.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+2, self.contentView.width/2, 30);
//    self.endTimeLabel.frame = CGRectMake( self.contentView.width/2, self.starTime.y,  self.contentView.width/2, 30);
    

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
