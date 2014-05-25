//
//  PinViewController.m
//  MapArtMap
//
//  Created by Mark Brautigam on 4/19/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "PinViewController.h"
#import "MapViewController.h"
#import "MBMapPin.h"
#import "Data.h"
#import "AppDelegate.h"
#import "UserMapBookmark.h"

// SF is -122
// Florida is 26, -80
// Minnesota is 48
#define US_CENTER_LAT 38.0
#define US_CENTER_LON -96.0
// #define US_SPAN_LAT 22.0
// #define US_SPAN_LON 40.0
#define US_SPAN_LAT 60.0
#define US_SPAN_LON 65.0

@interface PinViewController ()

@end

@implementation PinViewController

@synthesize mapView;

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

    [self.mapView setDelegate:self];
    
    // define region
    MKCoordinateRegion region;
    region.center.latitude = US_CENTER_LAT;
    region.center.longitude = US_CENTER_LON;
    region.span.latitudeDelta = US_SPAN_LAT;
    region.span.longitudeDelta = US_SPAN_LON;
    [self.mapView setRegion:region animated:NO];

    // annotations
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    MBMapPin *ann;
    
    // core data - pin lists
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [myAppDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MapBookmark"];

    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    int numMaps = maps.count;
    for (int i=0; i<numMaps; ++i) {
        Map *map = [maps objectAtIndex:i];

        // more core data
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"mapId == %i", map.mapId];
        [fetchRequest setPredicate:predicate];
        NSArray *userMapBookmarks = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
        UserMapBookmark *umb;
        if (userMapBookmarks.count > 0)
            umb = [userMapBookmarks objectAtIndex:userMapBookmarks.count-1];
        else
            umb = nil;
        
        location.latitude = [map latitude];
        location.longitude = [map longitude];
        ann = [[MBMapPin alloc] init];
        [ann setCoordinate:location];
        ann.title = [map subtitle];
        ann.company = [map company];
        ann.mapIndex = i;
        ann.normalBeenWant = 0;
        if (umb != nil) {
            if ([umb.beenHere intValue] == 1)
                ann.normalBeenWant = 1;
            if ([umb.wantToGo intValue] == 1)
                ann.normalBeenWant = 2;
        }
        
        [annotations addObject:ann];
    }

    [self.mapView addAnnotations:annotations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc]
                                 initWithAnnotation:annotation reuseIdentifier:@"pin"];

    MBMapPin *mapPin = (MBMapPin *) view.annotation;
    NSString *company = mapPin.company;
    
    NSString *imgPath;
    if ([company  isEqual: @"Shell"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"shell_logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Chevron"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"chevron-logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Kyso"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"kyso-circles-logo" ofType:@"png"];
    else if ([company  isEqual: @"Esso"] || [company isEqual:@"Enco"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"esso-logo-square-2" ofType:@"png"];
    else if ([company  isEqual: @"Calso"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"calso-logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Texaco"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"texaco-logo" ofType:@"png"];
    else if ([company  isEqual: @"Gulf"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"gulf_logo" ofType:@"png"];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imgPath]];
    imageView.frame = CGRectMake(0,0,31,31); // Change the size of the image to fit the callout
    view.leftCalloutAccessoryView = imageView;

    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    if (mapPin.normalBeenWant == 2)
        view.pinColor = MKPinAnnotationColorPurple;
    else if (mapPin.normalBeenWant == 1)
        view.pinColor = MKPinAnnotationColorGreen;
    else
        view.pinColor = MKPinAnnotationColorRed;

    view.enabled = YES;
    view.canShowCallout = YES;

    return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // if (![view.annotation isKindOfClass:[MyLocation class]])
       // return;
    
    // use the annotation view as the sender
    
    [self performSegueWithIdentifier:@"PinVCSegue" sender:view];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MKAnnotationView *)sender
{
    if ([segue.identifier isEqualToString:@"PinVCSegue"])
    {
        MapViewController *next = [segue destinationViewController];
        MBMapPin *pin = (MBMapPin *) sender.annotation;
        
        // Pass the selected object to the new view controller.
        // NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        next.map = [[[Data sharedMapData] getMaps] objectAtIndex:pin.mapIndex];
    }
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
