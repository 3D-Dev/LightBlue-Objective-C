//
//  EditValueController.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 18/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreBluetooth;
#import "IDBluetoothManager.h"
#import "MRHexKeyboard.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditValueController : UIViewController<IDBluetoothDelegate>
@property (weak, nonatomic) IDBluetoothManager *bluetoothManager;
@property (weak, nonatomic)   CBCharacteristic* characteristic;
@property (nonatomic)  CBCharacteristicWriteType writeType;

@property (weak, nonatomic) IBOutlet UITextField *valueInputTf;
@end

NS_ASSUME_NONNULL_END
