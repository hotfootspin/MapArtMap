//
//  LocationViewController.m
//  MapArtMap
//
//  Created by Mark Brautigam on 4/26/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "LocationViewController.h"
#import "MapListTableTableViewController.h"
#import "Data.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

@synthesize nearbyMaps;
@synthesize mapDistances;
@synthesize locationManager;
@synthesize currentLocation;
@synthesize requestedLocation;
@synthesize requestedLocationField;

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

    if (currentLocation == nil) {
        currentLocation = [[CLLocation alloc] init];
    }

    locationManager = [[CLLocationManager alloc] init];
    currentLocation = locationManager.location;

    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    // This causes an immediate segue we don't want
    // [self.locationManager startUpdatingLocation];
}

- (void) viewWillAppear:(BOOL)animated
{
    for (int i=1; i<=3; ++i) {
        UIButton *b = (UIButton*)[[[self view] subviews] objectAtIndex:i];
        
        [b.layer setMasksToBounds:YES];
        [b.layer setCornerRadius:8.0f];
        [b.layer setBorderColor:[UIColor whiteColor].CGColor];
        [b.layer setBorderWidth:1.0f];
        
        CAGradientLayer *grad = [CAGradientLayer layer];
        [grad setBounds:b.bounds];
        NSArray *colors = [NSArray arrayWithObjects:
                           (id) [UIColor colorWithRed:180.0f / 255.0f green:90.0f / 255.0f blue:44.0f / 255.0f alpha:1.0f].CGColor, // top
                           (id) [UIColor colorWithRed:150.0f / 245.0f green:70.0f / 255.0f blue:27.0f / 255.0f alpha:1.0f].CGColor, // bottom
                           nil];
        [grad setPosition:CGPointMake([b bounds].size.width / 2, [b bounds].size.height / 2)];
        [grad setColors:colors];
        
        // if we never assigned a gradient before
        if ([b.layer.sublayers count] < 1)
            [b.layer insertSublayer:grad atIndex:0];
        // if there is already a gradient assigned - replace it instead of adding one
        else
            [b.layer replaceSublayer:[b.layer.sublayers objectAtIndex:0] with:grad];
        /*
         */
        
        // hide the "previous location" button; we no longer need it
        if (i==3)
            b.hidden = YES;
    }
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

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // this one is for iOS 5 only (my real iPad)
    NSLog(@">> didUpdateToLocation:fromLocation:");
    
    currentLocation = newLocation;
    
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          currentLocation.coordinate.latitude,
          currentLocation.coordinate.longitude);
    
    [self.locationManager stopUpdatingLocation];
    // [self.locationManager setDelegate:nil];
    
    // assign the distances from the current location
    [self computeAllMapDistances:currentLocation];
    [self performSegueWithIdentifier:@"currentLocationSegue" sender:self];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations lastObject];
    
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          currentLocation.coordinate.latitude,
          currentLocation.coordinate.longitude);
    
    [self.locationManager stopUpdatingLocation];
    [self.locationManager setDelegate:nil];

    // assign the distances from the current location
    [self computeAllMapDistances:currentLocation];
    [self performSegueWithIdentifier:@"currentLocationSegue" sender:self];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    // The location "unknown" error simply means the manager is currently unable to get the location.
    // We can ignore this error for the scenario of getting a single location fix, because we already have a
    // timeout that will stop the location manager to save power.
    NSLog(@"%@",[error localizedDescription]);
    if ([error code] != kCLErrorLocationUnknown) {
        [self.locationManager stopUpdatingLocation]; // :NSLocalizedString(@"Error", @"Error")];
    }
}

- (void) computeAllMapDistances:(CLLocation*) loc
{
    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    int nMaps = [maps count];
    CLLocation *mapLoc;
    for (int i=0; i<nMaps; ++i) {
        Map *map = [maps objectAtIndex:i];
        mapLoc = [[CLLocation alloc] initWithLatitude:map.latitude longitude:map.longitude];
        CLLocationDistance cld = [loc distanceFromLocation:mapLoc];
        map.distance = cld;
        
        double dy = mapLoc.coordinate.latitude - loc.coordinate.latitude;
        double dx = mapLoc.coordinate.longitude - loc.coordinate.longitude;
        char dir_y, dir_x;
        if (dy > 0) dir_y = 'N'; else dir_y = 'S';
        if (dx > 0) dir_x = 'E'; else dir_x = 'W';
        if (dy == 0)
            map.direction = [NSString stringWithFormat:@"%s", dir_x == 'E' ? "East" : "West" ];
        double ratio = fabs (dx/dy);
        // NSLog(@"Ratio = %f / %f = %f", dx, dy, ratio);
        if (ratio > 4.80)
            map.direction = [NSString stringWithFormat:@"%s", dir_x == 'E' ? "East" : "West" ]; // E or W
        else if (ratio > 1.50)
            map.direction = [NSString stringWithFormat:@"%c%c%c", dir_x, dir_y, dir_x ]; // ENE
        else if (ratio > 0.67)
            map.direction = [NSString stringWithFormat:@"%c%c", dir_y, dir_x ]; // NE
        else if (ratio > 0.20)
            map.direction = [NSString stringWithFormat:@"%c%c%c", dir_y, dir_y, dir_x ]; // NNE
        else
            map.direction = [NSString stringWithFormat:@"%s", dir_y == 'N' ? "North" : "South" ]; // N or S
        // if (ratio > 2.41)
        // else if (ratio < 0.41)
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    MapListTableTableViewController *next = [segue destinationViewController];
    next.bShowNearby = YES;
}

- (void) recolorButton: (id) button
{
    UIButton *b = (UIButton*) button;
    CAGradientLayer *grad = [CAGradientLayer layer];
    [grad setBounds:b.bounds];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id) [UIColor colorWithRed:0.4 green:0.6 blue:0.8 alpha:1.0f].CGColor, // top
                       (id) [UIColor colorWithRed:0.3 green:0.5 blue:0.7 alpha:1.0f].CGColor, // bottom
                       nil];
    [grad setPosition:CGPointMake([b bounds].size.width / 2, [b bounds].size.height / 2)];
    [grad setColors:colors];
    // [b.layer insertSublayer:grad atIndex:0];
    [b.layer replaceSublayer:[b.layer.sublayers objectAtIndex:0] with:grad];
}

- (IBAction)doCurrentLocation:(id)sender
{
    [self recolorButton:sender];
    
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current Location" message:@"Current Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    NSLog(@"%s", "Current Location");
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          currentLocation.coordinate.latitude,
          currentLocation.coordinate.longitude);
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          locationManager.location.coordinate.latitude,
          locationManager.location.coordinate.longitude);

    /*if (currentLocation.coordinate.latitude < 1.0 && currentLocation.coordinate.latitude > -1.0 &&
        currentLocation.coordinate.longitude < 1.0 && currentLocation.coordinate.longitude > -1.0)
    {*/
       [self.locationManager startUpdatingLocation];
    /*}
    else {
        [self computeAllMapDistances:currentLocation];
        [self performSegueWithIdentifier:@"currentLocationSegue" sender:self];
    }*/
}

- (IBAction)doRequestedLocation:(id)sender
{
    [self recolorButton:sender];
    
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Requested Location" message:@"Requested Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    NSLog(@"%s", "Requested Location");

    // geocode the requested location
    // https://developer.apple.com/library/ios/documentation/userexperience/conceptual/LocationAwarenessPG/UsingGeocoders/UsingGeocoders.html
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo geocodeAddressString:[requestedLocationField text] completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         CLPlacemark *pm = [placemarks objectAtIndex:0];
         requestedLocation = pm.location;
         NSLog(@"latitude %+.6f, longitude %+.6f\n",
               requestedLocation.coordinate.latitude,
               requestedLocation.coordinate.longitude);
         // then assign the distances from the requested location
         [self computeAllMapDistances:requestedLocation];
         [self performSegueWithIdentifier:@"requestedLocationSegue" sender:self];
     }];
}

- (IBAction)doCachedLocation:(id)sender {
    [self recolorButton:sender];
    
    if (currentLocation.coordinate.latitude < 1.0 && currentLocation.coordinate.latitude > -1.0 &&
        currentLocation.coordinate.longitude < 1.0 && currentLocation.coordinate.longitude > -1.0)
    {
        [self.locationManager startUpdatingLocation];
    }
    else {
        [self computeAllMapDistances:currentLocation];
        [self performSegueWithIdentifier:@"currentLocationSegue" sender:self];
    }
}
@end
