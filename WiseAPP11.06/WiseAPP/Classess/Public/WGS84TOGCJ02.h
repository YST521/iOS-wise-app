//
//  WGS84TOGCJ02.h
//  WiseAPP
//
//  Created by app on 16/11/1.
//  Copyright © 2016年 YST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>  

@interface WGS84TOGCJ02 : NSObject
//判断是否已经超出中国范围

+(BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;

//转GCJ-02

+(CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLoc;
@end
