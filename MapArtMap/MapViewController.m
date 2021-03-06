//
//  MapViewController.m
//  MapArtMap
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "MapViewController.h"
#import "MoreTableViewController.h"
#import "UserMapBookmark.h"
#import "Data.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;
@synthesize mapCaption;
@synthesize mapImage;
@synthesize titleView;
@synthesize myAppDelegate;
@synthesize context;
@synthesize userMapBookmarks;
@synthesize beenHereButton;
@synthesize wantToGoButton;
@synthesize subsetIndexes;

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
    [self loadMapData];
}

- (void) loadMapData
{
    // Core Data - get the user data
    myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = [myAppDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MapBookmark"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"mapId == %i", map.mapId];
    [fetchRequest setPredicate:predicate];
    userMapBookmarks = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];

    UIView * uiv = (UIView*)[[[self view] subviews] objectAtIndex:0];
    uiv.layer.shadowColor = [UIColor blackColor].CGColor;
    uiv.layer.shadowOffset = CGSizeMake (4, 4);
    uiv.layer.shadowOpacity = 1;
    uiv.layer.shadowRadius = 12.0;
    uiv.clipsToBounds = NO;
    
    titleView.title = [map title];
    
    NSString *imgPath =  [[NSBundle mainBundle] pathForResource:map.picture ofType:@"png"];
    UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
    [mapImage setImage:img];

    [mapCaption setText:map.subtitle];
    
    // Core Data - get the checkmark data if there is any
    
    if ([userMapBookmarks count] > 0) {
        // There may be more than one match. If so, the last one
        // seems to be the one that is most recent.
        // 
        UserMapBookmark *umbm = (UserMapBookmark *) [userMapBookmarks objectAtIndex:[userMapBookmarks count]-1];
        if ([umbm.beenHere intValue] == 1) {
            beenHereButton.selected = YES;
        }
        else {
            beenHereButton.selected = NO;
        }
        if ([umbm.wantToGo intValue] == 1) {
            wantToGoButton.selected = YES;
        }
        else {
            wantToGoButton.selected = NO;
        }
    }
    else {
        // if there is no Core Data for this map, then both checkmarks are OFF
        beenHereButton.selected = NO;
        wantToGoButton.selected = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    for (int i=4; i<=5; ++i) {
        UIButton *b = (UIButton*)[[[self view] subviews] objectAtIndex:i];
        // b.layer.cornerRadius = 8;
        // b.layer.borderColor = [UIColor whiteColor].CGColor;
        // b.layer.borderWidth = 1;
        // b.backgroundColor = [UIColor colorWithRed:166.0/256 green:82.0/256 blue:34.0/256 alpha:1.0];
        // b.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;

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
        [b.layer insertSublayer:grad atIndex:0];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    // Get the new view controller using [segue destinationViewController].
    MoreTableViewController *next = [segue destinationViewController];

    // Pass the selected object to the new view controller.
    next.map = map;
}

- (void) saveCoreData
{
    // Core data - save the state
    // See if we have a data entry for this map first
    UserMapBookmark *existingBookmark = nil;
    
    // The reason we have a problem here is because the variable
    // "userMapBookmarks" is fetched from the persistent store only
    // when this view is loaded.
    //
    // But a new entry could be saved to the store every time one
    // of the buttons is pressed, which could be two, if the user
    // changes both checkboxes, or even many more than two, if the
    // user clicks a checkbox or checkboxes many times for whatever
    // reason. (Confused? Goofing off? Letting child play?)
    //
    // So even though we delete all previously-exisitng data entries
    // this time, there may be a bunch more of them next time.
    //
    // The alternative is to do another fetch here. But then we would
    // be doing many fetches.
    //
    
    // OK, there are still lots of problems, so I will do the fetch here
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MapBookmark"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"mapId == %i", map.mapId];
    [fetchRequest setPredicate:predicate];
    userMapBookmarks = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];

    if ([userMapBookmarks count] > 0) {
        // delete all existing matching bookmarks
        int count = [userMapBookmarks count];
        for (int i=0; i<count; ++i) {
            existingBookmark = (UserMapBookmark *) [userMapBookmarks objectAtIndex:i];
            [context deleteObject:existingBookmark];
        }
    }
    
    // If not, then we save it
    // Create a new managed object
    UserMapBookmark *newUserMapBookmark = (UserMapBookmark *) [NSEntityDescription
                                                               insertNewObjectForEntityForName:@"MapBookmark"
                                                               inManagedObjectContext:context];
    newUserMapBookmark.mapId = [NSNumber numberWithInt:map.mapId];
    if (beenHereButton.selected)
        newUserMapBookmark.beenHere = [NSNumber numberWithInt:1];
    else
        newUserMapBookmark.beenHere = [NSNumber numberWithInt:0];
    if (wantToGoButton.selected)
        newUserMapBookmark.wantToGo = [NSNumber numberWithInt:1];
    else
        newUserMapBookmark.wantToGo = [NSNumber numberWithInt:0];
    newUserMapBookmark.comments = @"";
    /*
     [newUserMapBookmark setValue:[NSNumber numberWithInt:map.id] forKey:@"id"];
     [newUserMapBookmark setValue:[NSNumber numberWithBool:b.selected] forKey:@"beenHere"];
     */
    
    // Save the object to persistent store
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

- (IBAction)bookmarkBeenHere:(id)sender {
    static bool state = NO;
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Been Here" message:@"Been Here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    UIButton *b = (UIButton*) sender;
    b.selected = !b.selected;
    /*
    if (state == YES) {
        // [b setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    else {
        // [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
     */
    state = !state;
    
    [self saveCoreData];
}

- (IBAction)bookmarkWantToGo:(id)sender {
    static bool state = NO;
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Want To Go" message:@"Want To Go" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    UIButton *b = (UIButton*) sender;
    b.selected = !b.selected;
    
    /*
    if (state == YES)
        [b setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    else
        [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
     */
    state = !state;
    
    [self saveCoreData];
}

- (IBAction)btnNext:(id)sender {
    

    // find the next map in the list
    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    if (subsetIndexes != nil) {
        for (int i=0; i<subsetIndexes.count; ++i) {
            if (map.index == [[subsetIndexes objectAtIndex:i] intValue]) {
                int nextIndex = (i+1) % ([subsetIndexes count]);
                map = [maps objectAtIndex:[[subsetIndexes objectAtIndex:nextIndex] intValue]];
                break;
            }
        }
    }
    else {
        int nMaps = maps.count;
        if (map.index >= nMaps-1)
            map = [maps objectAtIndex:0];
        else
            map = [maps objectAtIndex:map.index+1];
    }
    [self loadMapData];
    [self reloadInputViews];
}

- (IBAction)btnPrevious:(id)sender {


    // find the previous map in the list
    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    if (subsetIndexes != nil) {
        for (int i=0; i<subsetIndexes.count; ++i) {
            if (map.index == [[subsetIndexes objectAtIndex:i] intValue]) {
                int prevIndex;
                if (i==0)
                    prevIndex = [subsetIndexes count] - 1; // mod % doesn't work for i<0
                else
                    prevIndex = (i-1);
                map = [maps objectAtIndex:[[subsetIndexes objectAtIndex:prevIndex] intValue]];
                break;
            }
        }
    }
    else {
        int nMaps = maps.count;
        if (map.index == 0)
            map = [maps objectAtIndex:nMaps-1];
        else
            map = [maps objectAtIndex:map.index-1];
    }
    [self loadMapData];
    [self reloadInputViews];
}
@end
