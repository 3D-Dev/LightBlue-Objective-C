//
//  ConnectingView.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 31/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "ConnectingView.h"
static ConnectingView *connectingView = nil;
@implementation ConnectingView{
 
}
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
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]];

    UIView *contentView = [UIView new];
    contentView.translatesAutoresizingMaskIntoConstraints = false;
    contentView.backgroundColor = [UIColor whiteColor];

    _tipLbl = [UILabel new];
    _tipLbl.translatesAutoresizingMaskIntoConstraints = false;
    _tipLbl.text = @"Connecting...";
    _tipLbl.font = [UIFont systemFontOfSize:18];
    [contentView addSubview:_tipLbl];

    _tipNameLbl = [UILabel new];
    _tipNameLbl.translatesAutoresizingMaskIntoConstraints = false;
    _tipNameLbl.text = @"InsanelyDeepak -BLE";
    _tipNameLbl.font = [UIFont systemFontOfSize:16];
    [contentView addSubview:_tipNameLbl];

    UIActivityIndicatorView *activityIndicatorView =  [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false;
    [activityIndicatorView startAnimating];
    [contentView addSubview:activityIndicatorView];
    [self addSubview:contentView];

    NSLayoutConstraint *contentViewLeading = [contentView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:50];
    NSLayoutConstraint *contentViewTrailing = [contentView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-50];
    NSLayoutConstraint *contentViewHeight = [contentView.heightAnchor constraintEqualToConstant:120];
    NSLayoutConstraint *contentViewCenterY = [contentView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-90];
    [NSLayoutConstraint activateConstraints:@[contentViewLeading, contentViewTrailing, contentViewHeight, contentViewCenterY]];


    NSLayoutConstraint *tipLblTop = [_tipLbl.topAnchor constraintEqualToAnchor:contentView.topAnchor constant:20];
    NSLayoutConstraint *tipLblCenterX = [_tipLbl.centerXAnchor constraintEqualToAnchor:contentView.centerXAnchor];
    NSLayoutConstraint *tipLblWidth = [_tipLbl.widthAnchor constraintGreaterThanOrEqualToConstant:20];
    [NSLayoutConstraint activateConstraints:@[tipLblTop, tipLblCenterX, tipLblWidth]];

    NSLayoutConstraint *tipNameLblTop = [_tipNameLbl.topAnchor constraintEqualToAnchor:_tipLbl.bottomAnchor constant:10];
    NSLayoutConstraint *tipNameLblCenterX = [_tipNameLbl.centerXAnchor constraintEqualToAnchor:_tipLbl.centerXAnchor];
    NSLayoutConstraint *tipNameLblWidth = [_tipNameLbl.widthAnchor constraintGreaterThanOrEqualToConstant:20];
    [NSLayoutConstraint activateConstraints:@[tipNameLblTop, tipNameLblCenterX, tipNameLblWidth]];

    NSLayoutConstraint *activityViewTop = [activityIndicatorView.centerXAnchor constraintEqualToAnchor:_tipNameLbl.centerXAnchor];
    NSLayoutConstraint *activityViewCenterX =[activityIndicatorView.topAnchor constraintEqualToAnchor:_tipNameLbl.bottomAnchor constant:10];
    NSLayoutConstraint *activityViewWidth =
    [activityIndicatorView.widthAnchor constraintEqualToConstant:10];
    [NSLayoutConstraint activateConstraints:@[activityViewTop, activityViewWidth, activityViewCenterX]];

}

/**
 Show the UnavailableView
 */
+(ConnectingView *)showConnectingView{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window) {
        connectingView = [[ConnectingView alloc] init];
        [window addSubview:connectingView];
    }
    return connectingView;
}

/**
 Hide the UnavailableView
 */
+(void)hideConnectingView{
    [connectingView removeFromSuperview];
}

@end
