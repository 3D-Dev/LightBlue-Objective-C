//
//  MainViewController.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 15/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _bluetoothManager      = [IDBluetoothManager sharedInstance];
    _nearbyPeripherals     = [NSMutableArray array];
    _nearbyPeripheralInfos = [NSMutableDictionary dictionary];
    self.title = @"LightBlue";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // If is return from NewVirtualPeripheralController, it should reload the navigationBar
    // It's used to avoid occuring some wrong when return back.
    [self.navigationController setNavigationBarHidden:true animated:false];
    [self.navigationController setNavigationBarHidden:false animated:false];
    _bluetoothManager.delegate  = self;
    if (_bluetoothManager.connectedPeripheral != nil) {
        [_bluetoothManager disconnectPeripheral];
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return _nearbyPeripherals.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];


    UILabel *lblTitle =[[UILabel alloc] initWithFrame:CGRectMake(20, 2, 120, 21)];
    lblTitle.font = [UIFont boldSystemFontOfSize:12];

    if (section == 0) {
        lblTitle.text = @"Peripherals Nearby";
        headerView.backgroundColor = [UIColor whiteColor];
    } else {
        lblTitle.text = @"Virtual Peripherals";
        headerView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
    }
    [headerView addSubview:lblTitle];
    return headerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        NearbyPeripheralCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NearbyPeripheralCell"];
        CBPeripheral *peripheral = _nearbyPeripherals[indexPath.row];
        NSDictionary *peripheralInfo = [_nearbyPeripheralInfos objectForKey:peripheral];

        cell.yPeripheralNameLbl.text = peripheral.name == nil || [peripheral.name  isEqual: @""]  ? @"Unnamed" : peripheral.name;

        NSArray *serviceUUIDs = peripheralInfo[@"advertisementData"][@"kCBAdvDataServiceUUIDs"];
        if (serviceUUIDs != nil && serviceUUIDs.count != 0) {
            cell.yServiceCountLbl.text = [NSString stringWithFormat:@" %lu service %@",(unsigned long)serviceUUIDs.count , (serviceUUIDs.count > 1 ? @"s" : @"")];
        } else {
            cell.yServiceCountLbl.text = @"No service";
        }
       // The signal strength img icon and the number of signal strength
        NSNumber *RSSI = peripheralInfo[@"RSSI"];
        cell.ySignalStrengthLbl.text = [NSString stringWithFormat:@"%@",RSSI];
        switch (labs(RSSI.longValue)) {
            case 0 ... 40:
                cell.ySignalStrengthImg.image = [UIImage imageNamed:@"signal_strength_5"];
                break;
            case 41 ... 53:
                cell.ySignalStrengthImg.image = [UIImage imageNamed:@"signal_strength_4"];
                break;
            case 54 ... 65:
                cell.ySignalStrengthImg.image = [UIImage imageNamed:@"signal_strength_3"];
                break;
            case 66 ... 77:
                cell.ySignalStrengthImg.image = [UIImage imageNamed:@"signal_strength_2"];
                break;
            case 78 ... 89:
                cell.ySignalStrengthImg.image = [UIImage imageNamed:@"signal_strength_1"];
                break;
            default:
                cell.ySignalStrengthImg.image = [UIImage imageNamed:@"signal_strength_0"];
                break;
        }

        return cell;
    }

   return [[UITableViewCell alloc] init];
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CBPeripheral *peripheral = _nearbyPeripherals[indexPath.row];
    _connectingView = [ConnectingView showConnectingView];
    _connectingView.tipNameLbl.text = peripheral.name;
    [_bluetoothManager connectPeripheral:peripheral];
    [_bluetoothManager stopScanPeripheral];
}
#pragma mark - BluetoothDelegate
-(void)didDiscoverPeripheral:(CBPeripheral *)peripheral AdvertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)rssi{
    if (![_nearbyPeripherals containsObject:peripheral]) {
        [_nearbyPeripherals addObject:peripheral];
        NSDictionary *data = @{@"RSSI": rssi, @"advertisementData": advertisementData};
        [_nearbyPeripheralInfos setObject:data forKey:peripheral];
    } else {
        NSDictionary *data = @{@"RSSI": rssi, @"advertisementData": advertisementData};
       [_nearbyPeripheralInfos setObject:data forKey:peripheral];
    }
    [_peripheralTblView reloadData];
}

/**
 The bluetooth state monitor

 - parameter state: The bluetooth state
 */
-(void)didUpdateState:(CBCentralManager *)central{
    NSLog(@"MainController --> didUpdateState: %ld",(long)[central state]);
    switch ([central state]) {
        case CBCentralManagerStatePoweredOff:
            NSLog(@"MainController --> State : Powered Off");
            [_bluetoothManager stopScanPeripheral];
            [_bluetoothManager disconnectPeripheral];
            [ConnectingView hideConnectingView];
            [UnavailableView showUnavailableView];
            break;
        case CBCentralManagerStatePoweredOn:
            NSLog(@"MainController --> State : Powered On");
            [_bluetoothManager startScanPeripheral];
            [UnavailableView hideUnavailableView];
            break;
        case CBCentralManagerStateResetting:
            NSLog(@"MainController --> State : Resetting");
            break;
        case CBCentralManagerStateUnauthorized:
            NSLog(@"MainController --> State : Unauthorized");
            [_bluetoothManager stopScanPeripheral];
            [_bluetoothManager disconnectPeripheral];
            [ConnectingView hideConnectingView];
            [UnavailableView showUnavailableView];
            break;
        case CBCentralManagerStateUnknown:
            NSLog(@"MainController --> State : Unknown");
            [_bluetoothManager stopScanPeripheral];
            [_bluetoothManager disconnectPeripheral];
            [ConnectingView hideConnectingView];
            [UnavailableView showUnavailableView];
            break;
        case CBCentralManagerStateUnsupported:
            NSLog(@"MainController --> State : Unsupported");
            [_bluetoothManager stopScanPeripheral];
            [_bluetoothManager disconnectPeripheral];
            [ConnectingView hideConnectingView];
            [UnavailableView showUnavailableView];
            break;
    }
}
/**
 The callback function when central manager connected the peripheral successfully.

 - parameter connectedPeripheral: The peripheral which connected successfully.
 */
-(void)didConnectedPeripheral:(CBPeripheral *)connectedPeripheral {
    NSLog(@"MainController --> didConnectedPeripheral");
    _connectingView.tipLbl.text = @"Interrogating...";
}
/**
 The peripheral services monitor

 - parameter services: The service instances which discovered by CoreBluetooth
 */
-(void)didDiscoverServices:(CBPeripheral *)peripheral{
    NSLog(@"MainController --> didDiscoverService:%@",peripheral.services);
    [ConnectingView hideConnectingView];
    PeripheralController * peripheralController = [[PeripheralController alloc] init];
    NSDictionary *peripheralInfo = _nearbyPeripheralInfos[peripheral];
    peripheralController.lastAdvertisementData = peripheralInfo[@"advertisementData"];
    [self.navigationController pushViewController:peripheralController animated:true];
}
/**
 The method invoked when interrogated fail.

 - parameter peripheral: The peripheral which interrogation failed.
 */
- (void)didFailedToInterrogate:(CBPeripheral *)peripheral {
    [ConnectingView hideConnectingView];
     [AlertUtil showCancelAlert:@"Connection Alert" Message:@"The perapheral disconnected while being interrogated." CancelTitle:@"Dismiss" ViewController:self];
}
- (IBAction)actionInfo:(UIBarButtonItem *)sender {
}





@end
