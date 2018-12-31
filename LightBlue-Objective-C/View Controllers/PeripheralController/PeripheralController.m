//
//  PeripheralController.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "PeripheralController.h"

@interface PeripheralController ()

@end

@implementation PeripheralController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _bluetoothManager = [IDBluetoothManager sharedInstance];
    if (_characteristicsDic == nil) {
        _characteristicsDic = [NSMutableDictionary dictionary];
    }
 }
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     _bluetoothManager.delegate = self;
     self.title = @"Peripheral";
     _advertisementDataKeys = [[_lastAdvertisementData allKeys] sortedArrayUsingSelector:@selector(compare:)] ;

    [_bluetoothManager discoverCharacteristics];
    _services = _bluetoothManager.connectedPeripheral.services;
    _peripheralNameLbl.text = _bluetoothManager.connectedPeripheral.name;
    _peripheralUUIDLbl.text = _bluetoothManager.connectedPeripheral.identifier.UUIDString;
    [self reloadTableView];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
/**
 The callback function of the Show Advertisement Data button click
 */
-(void)showAdvertisementDataBtnClick {
    NSLog(@"PeripheralController --> showAdvertisementDataBtnClick");
    _showAdvertisementData = !_showAdvertisementData;
    [self reloadTableView];
}
/**
 Reload tableView
 */
-(void)reloadTableView{
    [_dataTableView reloadData];
    // Fix the contentSize.height is greater than frame.size.height bug(Approximately 20 unit)
    _tableViewHeight.constant = _dataTableView.contentSize.height;
}
/**
 According the characteristic property array get the properties string

 - parameter array: characteristic property array

 - returns: properties string
 */
-(NSString *)getPropertiesFromArray:(NSArray *)array{
    NSString *propertiesString = @"Properties:";
    BOOL containWrite = [array containsObject:@"Write"];
    for (NSString *property in array){
        if (containWrite && [property  isEqualToString:@"Write Without Response"]) {
            continue;
        }
        propertiesString = [NSString stringWithFormat:@"%@ %@",propertiesString,property];
    }
    return propertiesString;
}
#pragma mark- Delegate
#pragma mark UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        if (_showAdvertisementData) {
            return _advertisementDataKeys.count;
        } else {
            return 0;
        }
    }
    CBUUID *UUID = [_services[section - 1] UUID];
    NSArray *characteristics = _characteristicsDic[UUID];
    return characteristics == nil ? 0 : characteristics.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView: %lu",_bluetoothManager.connectedPeripheral.services.count + 1);
    return _bluetoothManager.connectedPeripheral.services.count + 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"serviceCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"serviceCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [CBAdvertisementData getAdvertisementDataStringValue:_lastAdvertisementData Key:_advertisementDataKeys[indexPath.row]];
        cell.textLabel.adjustsFontSizeToFitWidth = true;
        cell.detailTextLabel.text = [CBAdvertisementData getAdvertisementDataName:_advertisementDataKeys[indexPath.row]];

    }
    else {
        CBUUID *UUID = [_services[indexPath.section - 1] UUID];
        NSArray *characteristicsArray = _characteristicsDic[UUID];
        CBCharacteristic *characteristic = characteristicsArray[indexPath.row];
        cell.textLabel.text = characteristic.name;
        cell.detailTextLabel.text = [self getPropertiesFromArray:characteristic.getProperties];

    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
   // NSLog(@"section: %ld",(long)section);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];

    UILabel *serviceNameLbl = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, UIScreen.mainScreen.bounds.size.width - 100, 20)];
    serviceNameLbl.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    [view addSubview:serviceNameLbl];

    if (section == 0) {
        serviceNameLbl.text = @"ADVERTISEMENT DATA";
        UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        showBtn.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width - 80, 20, 60, 20);
        if (_showAdvertisementData) {
            [showBtn setTitle:@"Hide" forState:UIControlStateNormal];
        } else {
            [showBtn setTitle:@"Show" forState:UIControlStateNormal];
        }
        [showBtn addTarget:self action:@selector(showAdvertisementDataBtnClick) forControlEvents:UIControlEventTouchUpInside];

        [view addSubview:showBtn];
    } else {
        CBService *service = _bluetoothManager.connectedPeripheral.services[section - 1];
        //NSLog(@"ServiceName: %@",service.name);
        serviceNameLbl.text = service.name;
    }
    return view;
}

// Need overide this method for fix start section from 1(not 0) in the method 'tableView:viewForHeaderInSection:' after iOS 7
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {

    } else {
        NSLog(@"Click at section: %ld, row: %ld,",(long)indexPath.section,(long)indexPath.row);
        CharacteristicController * controller = [[CharacteristicController alloc] init];
        CBUUID *UUID = [_services[indexPath.section - 1] UUID];
        NSArray *characteristics = _characteristicsDic[UUID];
        controller.characteristic = characteristics[indexPath.row];
        [self.navigationController pushViewController:controller animated:true];

    }
}
#pragma mark -BluetoothDelegate
-(void)didDisconnectPeripheral:(CBPeripheral *)peripheral{
    NSLog(@"PeripheralController --> didDisconnectPeripheral");
    _connectFlagLbl.text = @"Disconnected. Data is Stale.";
    _connectFlagLbl.textColor = [UIColor redColor];
}
-(void)didDiscoverCharacteritics:(CBService *)service {
    NSLog(@"Service.characteristics: %@-%@",service.UUID,service.characteristics);
    if (_characteristicsDic == nil) {
        _characteristicsDic = [NSMutableDictionary dictionary];
    }
    [_characteristicsDic setObject:service.characteristics forKey:service.UUID];
    [self reloadTableView];
}

@end
