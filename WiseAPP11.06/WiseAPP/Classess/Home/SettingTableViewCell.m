//
//  SettingTableViewCell.m
//  WiseAPP
//
//  Created by app on 16/10/10.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

 -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{


    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addVIEW];
    }
    return  self;
}

-(void)addVIEW{
    
    self.titleLabel=[[UILabel alloc]init];
    self.titleLabel.frame = CGRectMake(38, 0,self.contentView.width-80, self.contentView.height);
    //self.titleLabel.backgroundColor = [UIColor greenColor];
    self.titleLabel.textColor = textCententColor;
    [self.contentView addSubview:self.titleLabel];
    
    //navigationButtonReturnClick  iconfont-back
    self.rightImage = [[UIImageView alloc]init];
    self.rightImage.frame = CGRectMake( SCREEN_WIDTH-40,  10, 11.85, 20);
    self.rightImage.image = [UIImage imageNamed:@"icon_right"];
    //self.rightImage.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.rightImage];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
 

}


@end
