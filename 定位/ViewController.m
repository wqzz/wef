//
//  ViewController.m
//  定位
//
//  Created by 钟文秋 on 16/8/2.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property(nonatomic,strong)CLLocationManager*mager;

@end

@implementation ViewController

-(CLLocationManager*)mager
{

    if (!_mager) {
        _mager=[[CLLocationManager alloc]init];
        
        
        _mager.delegate=self;
        
        
        
        //位置间隔之后重新定位；
        
        
        _mager.distanceFilter=10;
        
        
        //两点之间的距离；.定位的精确度
        _mager.desiredAccuracy=kCLLocationAccuracyBestForNavigation;
    }

    

    return _mager;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CLLocationManager*manager=[[CLLocationManager alloc]init];
//    manager.delegate=self;
    
    [self.mager startUpdatingLocation];
    
    [self countDistance];
}


- (void)countDistance
{
    
    CLLocation*location1=[[CLLocation alloc]initWithLatitude:23.23 longitude:113.33];
    CLLocation*location2=[[CLLocation alloc]initWithLatitude:40.06 longitude:116.39];
  CLLocationDistance disloc=[location1 distanceFromLocation:location2];
    
    NSLog(@"%f",disloc);
    
    
    }



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{

    ///拿到当前的位置；
    
    CLLocation*loaction=[locations lastObject];
    
    //返回当前位置的坐标；
    CLLocationCoordinate2D coordation=loaction.coordinate;
    
    NSLog(@"经度%f 纬度%f",coordation.longitude ,coordation.latitude);
    
    
    [manager stopUpdatingLocation];

    NSLog(@"用户的位置");









}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
