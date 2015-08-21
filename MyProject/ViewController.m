//
//  ViewController.m
//  MyProject
//
//  Created by omoa on 2015/8/21.
//  Copyright (c) 2015年 omoa. All rights reserved.
//

#import "ViewController.h"
#import <KWService/KWService.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // initiate network service
    [KWNetworkService setBaseURL:[NSURL URLWithString:@"https://naviking3d.localking.com.tw/api/cht/"]];

    
    // set position
    CLLocationManager *locationManager = [[CLLocationManager alloc]init];
    CGFloat lat = locationManager.location.coordinate.latitude;
    CGFloat lon = locationManager.location.coordinate.longitude;
    NSMutableDictionary *param = [@{@"updatetime": @""} mutableCopy];
    [param setObject:@((int)(lat * 1000000)) forKey:@"lat"];
    [param setObject:@((int)(lon * 1000000))  forKey:@"lon"];
    
    [[KWNetworkService performRequestWithMethod:KWRequestMethodPOST function:@"GetOnlineCPInfo" parameters:@[param]]
     setJSONResponder:^(KWRequest *request, id responseObject, NSError *error) {
         
         if (!error) {
         }
     }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
