//
//  SampleProjectViewController.m
//  SampleProject
//
//  Created by David Porter on 12/10/10.
//  Copyright 2010 David Porter Apps. All rights reserved.
//

#import "SampleProjectViewController.h"

@implementation SampleProjectViewController
- (IBAction)pressButton:(id)sender {
	if (currentConnectivity.isConnected) {
		
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Yeah!" 
													message:@"Look's like you're connected to the internet!" delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
		[alert show];
		[alert release];
		
	}
	else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoops!" 
														message:@"Look's like you're not connected to the internet!" delegate:nil 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
		
	}
	
}
- (void)viewDidLoad {
	currentConnectivity = [[DPConnectionState alloc] init];
	currentConnectivity.delegate = self; //set the delegate
	[currentConnectivity startMonitoringConnection]; //call this when you are ready for DPConnection state to monitor the connection
	
}

#pragma mark -
#pragma mark DPConnectionState Delegate Methods
- (void)connectivityStateDidChange {

}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[currentConnectivity release]; 
    [super dealloc];
}

@end
