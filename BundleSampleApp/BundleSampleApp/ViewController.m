//
//  ViewController.m
//  BundleSampleApp
//
//  Created by Ashish Awasthi on 4/15/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *allBundles = [NSBundle allBundles];
    NSURL *url;
    for (NSBundle *bundle in allBundles) {
        url = [bundle URLForResource:@"LibResouces" withExtension:@"bundle"];
        if (url) {
            break;
        }
    }
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    NSURL *modelURL = [bundle URLForResource:@"TestData" withExtension:@"momd"];
    NSLog(@"Model URL: %@", modelURL);
    
    // Do any additional setup after loading the view.
}


@end
