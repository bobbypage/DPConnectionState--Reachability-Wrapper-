//
//  DPConnectionState.h
//  SampleProject
//
//  Created by David Porter on 12/10/10.
//  Copyright 2010 David Porter Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@protocol DPConnectionStateDelegate <NSObject>
@optional
- (void) connectivityStateDidChange;
@end


@interface DPConnectionState : NSObject {
	BOOL isConnected;
	id <DPConnectionStateDelegate> delegate;
	Reachability *siteStatus;
}

@property (nonatomic, readonly) BOOL isConnected;
@property (retain) id delegate;

- (void)startMonitoringConnection;
- (void)configureForNetworkStatus:(NetworkStatus)status;
@end
