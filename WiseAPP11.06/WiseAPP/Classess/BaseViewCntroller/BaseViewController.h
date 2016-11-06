//
//  BaseViewController.h
//  WiseAPP
//
//  Created by app on 16/10/9.
//  Copyright © 2016年 YST. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <MapKit/MapKit.h>
//#import <CoreLocation/CoreLocation.h>

@interface BaseViewController : UIViewController
//@property(nonatomic,strong)MKMapView* mapView;
//@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//@property(nonatomic,assign) CGFloat  longNum;
//@property(nonatomic,assign)CGFloat laNum;
//@property(nonatomic,assign)CGRect frame;
//@property(nonatomic,strong)NSString* cityName;
//@property(nonatomic,strong)CLLocationManager *locationManger;
-(NSString*)curretDateMM;
-(NSString*)curretDateDD;
-(NSString*)curretDatehhSS;
@end
