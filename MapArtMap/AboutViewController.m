//
//  AboutViewController.m
//  MapArtMap
//
//  Created by Mark Brautigam on 5/28/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self orient];
}

- (void) hide:(int) index hide:(BOOL) hidden
{
    UIView *v = (UIView*)[[[self view] subviews] objectAtIndex:index];
    v.hidden = hidden;
}

- (void)orient {
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight||[[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft) {
        for (int i=0; i<12; i++)
            [self hide:i hide:YES];
        for (int i=12; i<24; i++)
            [self hide:i hide:NO];
    }
    else {
        for (int i=0; i<12; i++)
            [self hide:i hide:NO];
        for (int i=12; i<24; i++)
            [self hide:i hide:YES];
    }
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation duration:(NSTimeInterval)duration
{
    [self orient];
}

// for ios6
- (BOOL)shouldAutorotate {
    return YES;
}

// for ios5
-(BOOL)shouldAutoRotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
