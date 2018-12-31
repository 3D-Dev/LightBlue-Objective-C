//
//  CharacteristicController.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDBluetoothManager.h"
#import "Characteristic2BtnsCell.h"
#import "EditValueController.h"
#import "NSString+Extensions.h"
@import CoreBluetooth;
@interface CharacteristicController : UIViewController <UITableViewDelegate, UITableViewDataSource, IDBluetoothDelegate>
@property (weak, nonatomic) IDBluetoothManager *bluetoothManager;
@property (strong, nonatomic) CBCharacteristic *characteristic ;
@property (strong, nonatomic) NSArray *properties ;
@property (strong, nonatomic) NSMutableArray *headerTitles ;
@property (strong, nonatomic) NSMutableDictionary *timeAndValues;
@property (strong, nonatomic) NSMutableArray *times ;
@property (nonatomic) BOOL isListening;

@property (weak, nonatomic) IBOutlet UILabel *peripheralNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *characteristicNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *characteristicUUIDLbl;
@property (weak, nonatomic) IBOutlet UILabel *peripheralStatusLbl;
@property (weak, nonatomic) IBOutlet UITableView *characteristicInfosTb;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeight;
@end

