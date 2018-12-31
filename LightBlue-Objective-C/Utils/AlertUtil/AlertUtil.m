//
//  AlertUtil.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 16/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "AlertUtil.h"

@implementation AlertUtil

+(void)showCancelAlert:(NSString *)title Message:(NSString *)message CancelTitle:(NSString *)cancelTitle ViewController:(UIViewController *)viewController;{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:okAction];

    [viewController presentViewController:alertController animated:YES completion:nil];
}
@end
