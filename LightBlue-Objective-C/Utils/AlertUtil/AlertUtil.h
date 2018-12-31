//
//  AlertUtil.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 16/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertUtil : NSObject
+(void)showCancelAlert:(NSString *)title Message:(NSString *)message CancelTitle:(NSString *)cancelTitle ViewController:(UIViewController *)viewController;
@end

