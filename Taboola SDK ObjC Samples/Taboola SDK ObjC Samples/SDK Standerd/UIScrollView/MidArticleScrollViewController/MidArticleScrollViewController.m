//
//  MidArticleScrollViewController.m
//  Taboola SDK ObjC Samples
//
//  Created by Roman Slyepko on 1/24/19.
//  Copyright © 2019 Taboola. All rights reserved.
//

#import "MidArticleScrollViewController.h"
#import <TaboolaSDK/TaboolaSDK.h>

@interface MidArticleScrollViewController () <TaboolaViewDelegate>
@property (weak, nonatomic) IBOutlet TaboolaView *midTaboolaView;
@property (weak, nonatomic) IBOutlet TaboolaView *feedTaboolaView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *midLabel;
@end

@implementation MidArticleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int timestamp = [[NSDate date] timeIntervalSince1970];
    NSString *viewID = [NSString stringWithFormat:@"%d",timestamp];
    self.midTaboolaView.viewID = viewID;
    self.feedTaboolaView.viewID = viewID;
    
    //load mid tabolaView
    self.midTaboolaView.delegate = self;
    self.midTaboolaView.ownerViewController = self;
    self.midTaboolaView.publisher = @"sdk-tester";
    self.midTaboolaView.mode = @"alternating-widget-without-video-1-on-1";
    self.midTaboolaView.pageType = @"article";
    self.midTaboolaView.pageUrl = @"http://www.example.com";
    self.midTaboolaView.placement = @"Mid Article";
    self.midTaboolaView.targetType = @"mix";
    self.midTaboolaView.logLevel = LogLevelDebug;
    
    //load feed tabolaView
    self.feedTaboolaView.delegate = self;
    self.feedTaboolaView.ownerViewController = self;
    self.feedTaboolaView.publisher = @"sdk-tester";
    self.feedTaboolaView.mode = @"thumbs-feed-01";
    self.feedTaboolaView.pageType = @"article";
    self.feedTaboolaView.pageUrl = @"http://www.example.com";
    self.feedTaboolaView.placement = @"Feed without video";
    self.feedTaboolaView.targetType = @"mix";
    [self.feedTaboolaView setInterceptScroll:YES];
    self.feedTaboolaView.logLevel = LogLevelDebug;
    
    [self.midTaboolaView fetchContent];
    [self.feedTaboolaView fetchContent];
}

-(void)dealloc {
    [_midTaboolaView reset];
    [_feedTaboolaView reset];
}

#pragma mark - TaboolaViewDelegate

- (void)taboolaView:(UIView *)taboolaView didLoadPlacementNamed:(NSString *)placementName withHeight:(CGFloat)height {
    NSLog(@"%@", placementName);
}

- (void)taboolaView:(UIView *)taboolaView didFailToLoadPlacementNamed:(NSString *)placementName withErrorMessage:(NSString *)error {
    NSLog(@"%@", error);
}

-(BOOL)onItemClick:(NSString *)placementName withItemId:(NSString *)itemId withClickUrl:(NSString *)clickUrl isOrganic:(BOOL)organic {
    return YES;
}



@end