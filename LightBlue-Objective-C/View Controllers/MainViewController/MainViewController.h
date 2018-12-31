//
//  MainViewController.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 15/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDBluetoothManager.h"
#import "NearbyPeripheralCell.h"
#import "AlertUtil.h"
#import "PeripheralController.h"
#import "UnavailableView.h"
#import "ConnectingView.h"

@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,IDBluetoothDelegate>
@property (weak, nonatomic) IDBluetoothManager *bluetoothManager;
@property (weak, nonatomic) ConnectingView *connectingView;
@property (strong, nonatomic) NSMutableArray <CBPeripheral*> *nearbyPeripherals;
@property (strong, nonatomic) NSMutableDictionary  *nearbyPeripheralInfos;
@property (weak, nonatomic) IBOutlet UITableView *peripheralTblView;


- (IBAction)actionInfo:(UIBarButtonItem *)sender;

@end

