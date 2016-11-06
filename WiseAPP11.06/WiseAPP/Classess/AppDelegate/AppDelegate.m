//
//  AppDelegate.m
//  WQEWQ
//
//  Created by app on 16/10/9.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "AppDelegate.h"
#import "RootUITabBarController.h"
//#import "MainTabBarController.h"
#import "RootUINavigationController.h"

#import "ImageViewController.h"//引导页
#import "LoginViewController.h"
#import "Header.h"
#import <CoreLocation/CoreLocation.h>
#import "LocationHander.h"



@interface AppDelegate ()<CLLocationManagerDelegate>



@end

@implementation AppDelegate

//定位
- (CLLocationManager *)locationManager{
    if (!_locationManger) {
        _locationManger = [[CLLocationManager alloc]init];
        
        _locationManger.delegate = self;
       _locationManger.desiredAccuracy = kCLLocationAccuracyBest;
        
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ) {
            
            [_locationManger requestAlwaysAuthorization];
            [_locationManger requestWhenInUseAuthorization];
            
        }
    }
    return _locationManger;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

   // com.yishantaoiOS.WiseAPPP 941a66ca-da28-4b86-870e-a9e49158f3e7
    //com.yishantaoiOS.WiseAPP
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //开始定位
    [self.locationManager startUpdatingLocation];
    
    //偏好设置存一个字符串判断是否是第一次登陆
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"FirstEnterApp"])
    {
        ImageViewController*imageVC= [[ImageViewController alloc]init];
        imageVC.view.backgroundColor = [UIColor whiteColor];
        self.window.rootViewController =  imageVC;
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FirstEnterApp"];
        [self.window makeKeyAndVisible];
    }
    else
    {
        //tabar插入button框架
        //    RootUITabBarController*rootTabar = [[RootUITabBarController alloc]init];
        //     self.window.rootViewController = rootTabar;
        //自定义tabbar框架
//        MainTabBarController*mainTabbar = [[MainTabBarController alloc]init];
//   
//         self.window.rootViewController = mainTabbar;
        
  
        //测试登陆注册
        LoginViewController*loginVC = [[LoginViewController alloc]init];
       RootUINavigationController*na=[[RootUINavigationController alloc]initWithRootViewController:loginVC];
       self.window.rootViewController = na;
       
        
        [self.window makeKeyAndVisible];
     
        
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FirstEnterApp"];
        
        //测试
        
    }
    
    // 监听网络状态
    [MHAsiNetworkHandler startMonitoring];
    
    //去除多余打印信息  OS_ACTIVITY_MODE  disable
  

    NSLog(@"22%@",NSHomeDirectory());
   
    NSLog(@"99999");

    printf("222222");
 

    return YES;
}

#pragma MARK -----------获取经纬度-------
//定位
//-(void)location{
//
//    self.locationManger = [[CLLocationManager alloc]init];
//    
//    self.locationManger.delegate = self;
//    
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ) {
//        
//        [self.locationManger requestAlwaysAuthorization];
//        [self.locationManger requestWhenInUseAuthorization];
//    }
//
//    
//    //开启定位 不开定位 视图不显示
//    [self.locationManger startUpdatingLocation];
//}
//CLLocationManager委托方法

//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    
//    //得到newLocation
//    
//    CLLocation *loc = [locations objectAtIndex:0];
//    
//    //判断是不是属于国内范围
//    
//    if (![WGS84TOGCJ02 isLocationOutOfChina:[loc coordinate]]) {
//        
//        //转换后的coord
//        
//        CLLocationCoordinate2D coord = [WGS84TOGCJ02 transformFromWGSToGCJ:[loc coordinate]];
//        NSLog(@"CCCCC%f,%f",coord.latitude,coord.longitude);
//    }
//}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //将经度显示到label上
    
 CGFloat longNum =newLocation.coordinate.longitude;
    //将纬度现实到label上
    
 CGFloat  laNum =newLocation.coordinate.latitude;

    NSLog(@"PPPPPKKKKK****%f %f",laNum,newLocation.coordinate.longitude);
//    NSMutableArray*locaArray=[NSMutableArray array];
//    [locaArray addObject:[NSNumber numberWithDouble:laNum]];
//    [locaArray addObject:[NSNumber numberWithDouble:longNum]];
    //cgfloat 转字符串
   // 可以先转换为NSNumber，然后在转换为NSString
//    NSNumber *number = [NSNumber numberWithDouble:345.2343434343];
//    NSString *aString = [number stringValue];];
    if (laNum != 0 & longNum !=0) {
        [ [LocationHander handleCoo2D].handercoo2dArray  addObject:[NSString stringWithFormat:@"%g",laNum]];
        [ [LocationHander handleCoo2D].handercoo2dArray  addObject:[NSString stringWithFormat:@"%g",longNum]];
    }else{
        NSLog(@"经纬度为空");
    
    }
 
    
 // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            //获取城市
//            NSLog(@"name = %@",place.name);                                    //  位置名
//            NSLog(@"thoroughfare = %@",place.thoroughfare);                    //  街道
//            NSLog(@"subAdministrativeArea = %@",place.subAdministrativeArea);  //  子街道
//            NSLog(@"locality = %@",place.locality);                            //  市
//            NSLog(@"subLocality = %@",place.subLocality);                      //  区
//            NSLog(@"country = %@",place.country);                              //  国家
     
     
            NSString *city = placemark.locality;
            
            
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
               
            }
            
            //  NSString* county = placemark.country;
            NSString* subLocality = placemark.subLocality;
            NSString* thorough = placemark.thoroughfare;
           // NSString*subAdmin = placemark.subAdministrativeArea;
            NSString* name =placemark.name;
//            NSString*string =[NSString stringWithFormat:@"%@%@%@%@",city, subLocality,thorough,subAdmin];
            NSLog(@"%@",name);
             NSString*string =[NSString stringWithFormat:@"%@%@%@%@",city, subLocality,thorough,name];
            //准确
            NSLog(@"kkkk%@%@",placemark,string);
            //街道具体信息
            [[LocationHander handleCoo2D].handelcoo2dDic setObject:string forKey:@"place"];
              // [[LocationHander handleCoo2D].handelcoo2dDic setObject:placemark forKey:@"mark"];
     
            //单例保存城市名
            [[LocationHander handleCoo2D].handelcoo2dDic setObject:city forKey:@"city"];
            
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
        
        
    }];
# warning =======
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
      
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"WQEWQ"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
