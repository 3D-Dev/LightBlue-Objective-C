//
//  UnavailableView.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 31/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "UnavailableView.h"

@implementation UnavailableView
static UnavailableView *unavailableView = nil;
- (id)init{
    self = [super initWithFrame:UIScreen.mainScreen.bounds ];
    if (self) {
        [self initAll];

    }
    return self;
}
/**
 Init the view components
 */
-(void)initAll{
    [self setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.8]];
    // Create the top ImageView
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluetooth_unavailable"]];
    imgView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:imgView];


    /// Create and add the constraints for the ImageView
    NSLayoutConstraint *imgCenterX = [imgView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *imgCenterY = [imgView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-60];
    NSLayoutConstraint *imgWidth = [imgView.widthAnchor constraintEqualToConstant:160];
    NSLayoutConstraint *imgHeight = [imgView.heightAnchor constraintEqualToAnchor:imgView.widthAnchor multiplier:1.0];
    [NSLayoutConstraint activateConstraints:@[imgCenterX, imgCenterY, imgWidth, imgHeight]];

    /// Create the title tips Label
    UILabel *tip1Lbl = [UILabel new];
    tip1Lbl.translatesAutoresizingMaskIntoConstraints = false;
    tip1Lbl.text = @"LightBlue requires Bluetooth";
    tip1Lbl.font = [UIFont systemFontOfSize:18 weight:UIFontWeightThin];
    tip1Lbl.textColor = [UIColor blackColor];
    [self addSubview:tip1Lbl];

    /// Create and add the constraints for the title tips
    NSLayoutConstraint *lblTop = [tip1Lbl.topAnchor constraintEqualToAnchor:imgView.bottomAnchor constant:10];
    NSLayoutConstraint *lblCenterX = [tip1Lbl.centerXAnchor constraintEqualToAnchor:imgView.centerXAnchor];
    NSLayoutConstraint *lblWidth = [tip1Lbl.widthAnchor constraintGreaterThanOrEqualToConstant:20];
    [NSLayoutConstraint activateConstraints:@[lblTop, lblCenterX, lblWidth]];

    /// Create the detail tips Label
    UILabel *tip2Lbl = [UILabel new];
    tip2Lbl.translatesAutoresizingMaskIntoConstraints = false;
    tip2Lbl.text = @"Please enable Bluetooth to continue using this app";
    tip2Lbl.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
    tip2Lbl.textColor = [UIColor blackColor];
    [self addSubview:tip2Lbl];

    /// Create and add constraints for the detail tips
    NSLayoutConstraint *lbl2Top = [tip2Lbl.topAnchor constraintEqualToAnchor:tip1Lbl.bottomAnchor constant:10];
    NSLayoutConstraint *lbl2CenterX = [tip2Lbl.centerXAnchor constraintEqualToAnchor:tip1Lbl.centerXAnchor];
    NSLayoutConstraint *lbl2Width = [tip2Lbl.widthAnchor constraintGreaterThanOrEqualToConstant:20];
    [NSLayoutConstraint activateConstraints:@[lbl2Top, lbl2CenterX, lbl2Width]];
}

/**
 Show the UnavailableView
 */
+(void)showUnavailableView{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window) {
        unavailableView = [[UnavailableView alloc] init];
        [window addSubview:unavailableView];
    }
}

/**
 Hide the UnavailableView
*/
+(void)hideUnavailableView{
    [unavailableView removeFromSuperview];
}
@end
