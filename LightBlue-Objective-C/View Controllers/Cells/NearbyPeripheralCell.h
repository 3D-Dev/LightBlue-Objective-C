//
//  NearbyPeripheralCell.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 16/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NearbyPeripheralCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ySignalStrengthImg;
@property (weak, nonatomic) IBOutlet UILabel *ySignalStrengthLbl;
@property (weak, nonatomic) IBOutlet UILabel *yPeripheralNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *yServiceCountLbl;

@end

NS_ASSUME_NONNULL_END
