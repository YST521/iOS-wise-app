//
//  BanciAddViewController.h
//  WiseAPP
//
//  Created by app on 16/10/13.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "BaseViewController.h"

//传值block
//1
typedef void(^passBanciValue)(NSMutableDictionary*banciArray);

typedef void(^passBanciValueArray)(NSMutableArray*banciArray);

@interface BanciAddViewController : BaseViewController
//2
@property(nonatomic,strong)passBanciValue passBanciVlue;

//
@property(nonatomic,strong)passBanciValueArray passBanciArray;

@end
