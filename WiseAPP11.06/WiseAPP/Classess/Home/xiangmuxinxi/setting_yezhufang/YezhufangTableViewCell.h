//
//  YezhufangTableViewCell.h
//  WiseAPP
//
//  Created by app on 16/10/14.
//  Copyright © 2016年 YST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YezhufangTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView*userImage;
@property(nonatomic,strong)UILabel*userName;
@property(nonatomic,strong)UILabel*userGender;
@property(nonatomic,strong)UILabel*userOplition;
@property(nonatomic,strong)UILabel*userWorkTime;
@property(nonatomic,strong)UILabel*carNumber;

//cell
@property(nonatomic,strong)UILabel* leftLa;
@property(nonatomic,strong)UILabel* rightLa;
@property(nonatomic,strong)UIButton* rightBtn;

@end
