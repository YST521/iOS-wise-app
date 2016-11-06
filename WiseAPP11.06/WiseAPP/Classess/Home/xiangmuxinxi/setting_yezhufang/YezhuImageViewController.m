//
//  YezhuImageViewController.m
//  WiseAPP
//
//  Created by app on 16/10/27.
//  Copyright © 2016年 YST. All rights reserved.
//

#import "YezhuImageViewController.h"
#import "UIimage+round.h"


#define arcWitch [UIScreen mainScreen].bounds.size.width/2
@interface YezhuImageViewController ()
@property(nonatomic,strong)UIImageView* HeadImage;
@property(nonatomic,strong)UIButton* doneBtn;

@property(nonatomic,strong)UIImageView* roundImage;
@property(nonatomic,strong)UIView* roundView;


@end

@implementation YezhuImageViewController




- (void)viewDidLoad {
    [super viewDidLoad];
 self.navigationItem.title = @"用户头像编辑";
    [self addView];

}
-(void)addView{
    self.HeadImage=[[UIImageView alloc]init];
    self.HeadImage.frame= CGRectMake(0, PROPORTION_HIGHT(20), SCREEN_WIDTH, SCREEN_HEIGHT-PROPORTION_HIGHT(150));
    self.HeadImage.image= self.userImage;
    //self.HeadImage.alpha =0.5;
    self.HeadImage.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.HeadImage];

    self.doneBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    self.doneBtn.frame = CGRectMake(STANDARD_X, CGRectGetMaxY(self.HeadImage.frame)+PROPORTION_HIGHT(20), STANDARD_WIDTH, STANDARD_HEIGHT);
    KUIbutton(self.doneBtn);
    KUIbuttonClick(self.doneBtn);
    [self.doneBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    [self.view addSubview:self.doneBtn];
    [self.doneBtn addTarget:self action:@selector(doneAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
//    UIImageView*imageVV  = [[UIImageView alloc]init];
//    imageVV.frame =CGRectMake(100, 50, 200,200);
//    [self.view addSubview:imageVV];

    //self.roundImage.image =[UIimage_round circleImageWithName:imageVV borderWidth:0 borderColor:nil];
//    self.roundImage.image = [UIImage imagewithImage:imageVV.image];
//    
    self.roundImage=[[UIImageView alloc]init];
    self.roundImage.frame= CGRectMake(100, 50, 200,200);
    self.roundImage.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/3);
    self.roundImage.backgroundColor=[UIColor greenColor];
    [self.view addSubview:self.roundImage];
    self.roundImage.layer.cornerRadius = self.roundImage.width/2;
    self.roundImage.layer.masksToBounds=YES;
    self.roundImage.layer.borderWidth = 4;
    self.roundImage.layer.borderColor=[UIColor whiteColor].CGColor;
    //self.HeadImage.image = [UIImage imagewithImage:self.userImage];
 }

//获得某个范围内的屏幕图像
- (UIImage *)imageFromView: (UIView *) theView  atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}

//-(void)drawRect:(CGRect)rect
//{
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextAddRect(ref, rect);
//    CGContextAddArc(ref, [UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2, arcWitch, 0, M_PI*2, NO);
//    [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]setFill];
//    CGContextDrawPath(ref, kCGPathEOFill);
//    
//    CGContextAddArc(ref, [UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2, arcWitch, 0, M_PI*2, NO);
//    [[UIColor whiteColor]setStroke];
//    CGContextStrokePath(ref);
//}

//高斯模糊
-(void)addImage{

    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:self.userImage];
    // create gaussian blur filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:1.0] forKey:@"inputRadius"];//调整模糊度
    // blur image
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    self.roundImage.image = image;
    
}
-(void)doneAction:(UIButton*)sender{
    
    UIImage*image=[[UIImage alloc]init];
    
   // UIView*vieww=[[UIView alloc]initWithFrame:self.roundImage.bounds];
    image=[self imageFromView:self.view atFrame: CGRectMake(100, 50, 200,200)];
     self.HeadImage.image = image;
    //  self.roundImage.image = image;
    [self.navigationController popViewControllerAnimated:YES];
}


//- (UIImage *)getImageWithView:(UIView *)view {
//    //此处的CGSizeMake是根据需要制定截取图片的宽、高；NO/YES表示是否透明
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100,300), NO, 1.0);  //NO，YES 控制是否透明
//    [view.layer renderInContext:UIGraphicsGetCurrentContext()];    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();    UIGraphicsEndImageContext();
//    // 生成后的image
//    return image;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
