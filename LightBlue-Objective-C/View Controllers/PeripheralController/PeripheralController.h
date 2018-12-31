//
//  PeripheralController.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDBluetoothManager.h"
#import "CBAdvertisementData.h"
#import "CharacteristicController.h"
NS_ASSUME_NONNULL_BEGIN

@interface PeripheralController : UIViewController <UITableViewDelegate,UITableViewDataSource,IDBluetoothDelegate>
@property (weak, nonatomic) IDBluetoothManager *bluetoothManager;
@property (nonatomic) BOOL showAdvertisementData ;
@property (weak, nonatomic) NSArray *services;
@property (strong, nonatomic) NSMutableDictionary *characteristicsDic;
@property (strong, nonatomic) NSDictionary *lastAdvertisementData;
@property (strong, nonatomic) NSArray *advertisementDataKeys;

@property (weak, nonatomic) IBOutlet UILabel *peripheralNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *peripheralUUIDLbl;
@property (weak, nonatomic) IBOutlet UILabel *connectFlagLbl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@end

NS_ASSUME_NONNULL_END
