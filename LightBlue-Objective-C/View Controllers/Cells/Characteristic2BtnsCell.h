//
//  Characteristic2BtnsCell.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Characteristic2BtnsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
- (void)enableBtns;
- (void)disableBtns;
@property (nonatomic, copy) void (^leftAction)(void);
@property (nonatomic, copy) void (^rightAction)(void);
    
@end

NS_ASSUME_NONNULL_END
