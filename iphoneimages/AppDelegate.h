//
//  AppDelegate.h
//  iphoneimages
//
//  Created by Jimmy Hoang on 2017-06-19.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

