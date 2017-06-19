//
//  ViewController.m
//  iphoneimages
//
//  Created by Jimmy Hoang on 2017-06-19.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions
- (IBAction)randomImage:(id)sender {
    int randomImage = arc4random_uniform(5) + 1;
    NSLog(@"%d",randomImage);
    NSString* urlString;
    
    switch (randomImage) {
        case 1:
            urlString = @"http://i.imgur.com/bktnImE.png";
            break;
        case 2:
            urlString = @"http://i.imgur.com/zdwdenZ.png";
            break;
        case 3:
            urlString = @"http://i.imgur.com/CoQ8aNl.png";
            break;
        case 4:
            urlString = @"http://i.imgur.com/2vQtZBb.png";
            break;
        case 5:
            urlString = @"http://i.imgur.com/y9MIaCS.png";
            break;
        default:
            break;
    }
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error: %@",error.localizedDescription);
            return;
        }
        
        NSData* data = [NSData dataWithContentsOfURL:location];
        UIImage* image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iPhoneImageView.image = image;
        }];
    }];
    
    [downloadTask resume];
}

@end
