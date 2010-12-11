//
//  SampleProjectAppDelegate.h
//  SampleProject
//
//  Created by David Porter on 12/10/10.
//  Copyright 2010 David Porter Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SampleProjectViewController;

@interface SampleProjectAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SampleProjectViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SampleProjectViewController *viewController;

@end

