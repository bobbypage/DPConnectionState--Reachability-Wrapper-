//
//  DPConnectionState.m
//  SampleProject
//
//  Created by David Porter on 12/10/10.
//  Copyright 2010 David Porter Apps. All rights reserved.
//

#import "DPConnectionState.h"


@implementation DPConnectionState
@synthesize isConnected;
@synthesize delegate;


- (void)startMonitoringConnection {	
	[[NSNotificationCenter defaultCenter] addObserver: self 
											 selector: @selector(reachabilityChanged:) 
												 name: kReachabilityChangedNotification object: nil];
	
	siteStatus = [[Reachability reachabilityWithHostName:@"www.google.com"]
				  retain];
	
	NetworkStatus siteNetworkStatus = [siteStatus currentReachabilityStatus];
	
	[self configureForNetworkStatus:siteNetworkStatus];
	
	[siteStatus startNotifier];	
	
}
- (void) reachabilityChanged: (NSNotification* )note //network status has changed
{
	Reachability* curReach = [note object];
	
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	
	NetworkStatus siteNetworkStatus = [curReach currentReachabilityStatus];
	
	[self configureForNetworkStatus:siteNetworkStatus];
	
	if(delegate != nil && [delegate conformsToProtocol:@protocol(DPConnectionStateDelegate)]) {
		if([delegate respondsToSelector:@selector(connectivityStateDidChange)]) {
			[[self delegate] connectivityStateDidChange];
		}
    }
	
}
- (void)configureForNetworkStatus:(NetworkStatus)status
{	switch (status) 
	{
		case NotReachable:
			isConnected = NO;
			break;
		case ReachableViaWiFi:
			isConnected = YES;
			break;
		case ReachableViaWWAN:
			isConnected = YES;
			break;
		default:
			break;
	}
}
- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[siteStatus release]; 
	[super dealloc];	
}

@end
