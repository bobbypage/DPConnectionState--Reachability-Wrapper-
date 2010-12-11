//
//  SampleProjectViewController.h
//  SampleProject
//
//  Created by David Porter on 12/10/10.
//  Copyright 2010 David Porter Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPConnectionState.h"
@interface SampleProjectViewController : UIViewController <DPConnectionStateDelegate> {
	DPConnectionState *currentConnectivity;
}
- (IBAction)pressButton:(id)sender;
@end

