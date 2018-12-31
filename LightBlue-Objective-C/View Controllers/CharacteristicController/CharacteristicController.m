//
//  CharacteristicController.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "CharacteristicController.h"

@interface CharacteristicController ()

@end

@implementation CharacteristicController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bluetoothManager = [IDBluetoothManager sharedInstance];
    _bluetoothManager.delegate = self;
    // Do any additional setup after loading the view from its nib.
    NSAssert(_characteristic != nil, @"The Characteristic CAN'T be nil");
    self.title = _characteristic.name;
    [_bluetoothManager discoverDescriptor:_characteristic];
    _peripheralNameLbl.text = _bluetoothManager.connectedPeripheral.name;
    _characteristicNameLbl.text = _characteristic.name;
    _characteristicUUIDLbl.text = _characteristic.UUID.UUIDString;
    _times    = [NSMutableArray array];
    _timeAndValues = [NSMutableDictionary dictionary];
    /// According to the properties create the header title array
    NSMutableString *headerTitle = [NSMutableString string];
    _properties = _characteristic.getProperties;
    if ([_properties containsObject:@"Read"] ){
        [headerTitle appendString:@"READ"];
        if ([_properties containsObject:@"Notify"]) {
            [headerTitle appendString:@"/NOTIFIED VALUES"];
        } else if ([_properties containsObject:@"Indicate"]) {
            [headerTitle appendString:@"/INDICATED VALUES"];
        }
    } else {
        if ([_properties containsObject:@"Notify"]) {
            [headerTitle appendString:@"NOTIFIED VALUES"];
        } else if ([_properties containsObject:@"Indicate"]) {
            [headerTitle appendString:@"INDICATED VALUES"];
        }
    }
    _headerTitles = [NSMutableArray array];
    [_headerTitles addObject:headerTitle];

    if ([_properties containsObject:@"Write"] || [_properties containsObject:@"Write Without Response"]) {
      [_headerTitles addObject:@"WRITTEN VALUES"];
    }
    /// But the Descriptiors and Properties always be there
    [_headerTitles addObject:@"DESCRIPTORS"];
    [_headerTitles addObject:@"PROPERTIES"];
}

/**
 Reload tableView
 */
-(void)reloadTableView{
    [_characteristicInfosTb reloadData];
    // Fix the contentSize.height is greater than frame.size.height bug(Approximately 20 unit)
    _tableViewHeight.constant = _characteristicInfosTb.contentSize.height;
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *strTitle = _headerTitles[section];
    if (section == _headerTitles.count - 1) { // Last group is the properies
        return _properties.count;
    } else if (section == _headerTitles.count - 2) { //Last group but one is the descriptors
        NSArray *descriptor = _characteristic.descriptors;
        return descriptor.count;
    } else if ([strTitle hasPrefix:@"READ"] || [strTitle hasSuffix:@"VALUES"]){
        return _timeAndValues.allKeys.count + 1;
    } else if ([_headerTitles[section] hasSuffix:@"WRITTEN VALUES"]){
        return 1;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _headerTitles.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *strTile = _headerTitles[indexPath.section];

    if ([_headerTitles[indexPath.section] isEqualToString:@"WRITTEN VALUES"]){
        Characteristic2BtnsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characteristic2Btn"];
        if (cell == nil) {
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"Characteristic2BtnsCell" owner:self options:nil];
            cell = (Characteristic2BtnsCell *) [array firstObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell.leftBtn setHidden:false];
        [cell.rightBtn setHidden:true];
        if (_bluetoothManager.connected) {
            [cell enableBtns];
        } else {
            [cell disableBtns];
        }
        [cell.leftBtn setTitle:@"Write new value" forState:UIControlStateNormal];
        cell.leftAction = ^{
            NSLog(@"Write new value");
            EditValueController * controller = [[EditValueController alloc] init];
            controller.characteristic = self.characteristic;
            if ([self.characteristic.getProperties containsObject:@"Write Without Response"]) {
                controller.writeType = CBCharacteristicWriteWithoutResponse;
                }
            else {
                 controller.writeType = CBCharacteristicWriteWithResponse;
            }
            [self.navigationController pushViewController:controller animated:true];

        };
        return cell;
    }else if ([strTile rangeOfString:@"READ"].location != NSNotFound || [strTile rangeOfString:@"VALUES"].location != NSNotFound){
        if (indexPath.row == 0) {
            Characteristic2BtnsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characteristic2Btn"];
            if (cell == nil) {
                NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"Characteristic2BtnsCell" owner:self options:nil];
                cell = (Characteristic2BtnsCell *) [array firstObject];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            if (_bluetoothManager.connected) {
                [cell enableBtns];
            } else {
                [cell disableBtns];
            }
            if ([strTile rangeOfString:@"READ"].location != NSNotFound) {
                [cell.leftBtn setHidden:false];
                [cell.leftBtn setTitle:@"Read again" forState:UIControlStateNormal];
                cell.leftAction = ^{
                    NSLog(@"Read again");
                    [self->_bluetoothManager readValueForCharacteristic:self->_characteristic];
                };

            } else {
                [cell.leftBtn setHidden:true];
            }
            if ([strTile rangeOfString:@"VALUES"].location != NSNotFound) {
                [cell.rightBtn setHidden:false];
                if (!_isListening) {
                    [cell.rightBtn setTitle:@"Listen for notifications" forState:UIControlStateNormal];
                } else {
                    [cell.rightBtn setTitle:@"Stop listening" forState:UIControlStateNormal];
                }
                __weak Characteristic2BtnsCell *self_ = cell;
                cell.rightAction = ^{
                    NSLog(@"Listen for notifications");
                    self.isListening = !self.isListening;
                    if (!self.isListening) {
                        [self_.rightBtn setTitle:@"Listen for notifications" forState:UIControlStateNormal];
                       } else {
                           [self_.rightBtn setTitle:@"Stop listening" forState:UIControlStateNormal];
                       }
                    [self->_bluetoothManager setNotification:self.isListening forCharacteristic:self.characteristic];
                };
            } else {
                [cell.rightBtn setHidden:true];
            }
            return cell;
        } else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characteristicCell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"characteristicCell"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            NSString *strValue = _timeAndValues[_times[indexPath.row - 1]];
            cell.textLabel.text = strValue;
                if (![strValue isEqualToString:@"No value"]) {
                    cell.detailTextLabel.text = _times[indexPath.row - 1];
            }
            return cell;
        }
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"characteristicCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"characteristicCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (indexPath.section == _headerTitles.count - 1 ){
            cell.textLabel.text = _properties[indexPath.row];
        } else if (indexPath.section == _headerTitles.count - 2) {
            NSArray *descriptor = _characteristic.descriptors;
            if (descriptor) {
                CBDescriptor *desc = descriptor[indexPath.row];
                cell.textLabel.text = [desc.UUID description];
            }
        }
        return cell;
    }
    return [[UITableViewCell alloc] init];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    UILabel *lbl = [UILabel new];
    lbl.frame = CGRectMake(10, 0, UIScreen.mainScreen.bounds.size.width - 20, 30);
    lbl.text = _headerTitles[section];
    [view addSubview:lbl];
    return view;
}
#pragma mark - BluetoothDelegate
-(void)didDisconnectPeripheral:(CBPeripheral *)peripheral{
    NSLog(@"CharacteristicController --> didDisconnectPeripheral");
    _peripheralStatusLbl.text = @"Disconnected. Data is Stale.";
    _peripheralStatusLbl.textColor = [UIColor redColor];
}
-(void)didDiscoverDescriptors:(CBCharacteristic *)characteristic {
    NSLog(@"CharacteristicController --> didDiscoverDescriptors");
    self.characteristic = characteristic;
    [self reloadTableView];
}
-(void)didReadValueForCharacteristic:(CBCharacteristic *)characteristic {
    NSLog(@"CharacteristicController --> didReadValueForCharacteristic");
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"HH:mm:ss.SSS";
    NSString *timeStr = [formatter stringFromDate:[NSDate date]];
    if (characteristic.value != nil && characteristic.value.length != 0) {
        NSData *data = characteristic.value;
        NSString *hexStr   = [self hexString:data];
        [_timeAndValues setObject:[NSString stringWithFormat:@"0x%@",hexStr] forKey:timeStr];
    } else {
        [_timeAndValues setObject:@"No value" forKey:timeStr];
    }
    [_times addObject:timeStr];
    [self reloadTableView];
}
- (NSString*)hexString:(NSData *)data{
    NSUInteger length = data.length;
    unichar* hexChars = (unichar*)malloc(sizeof(unichar) * (length*2));
    unsigned char* bytes = (unsigned char*)data.bytes;
    for (NSUInteger i = 0; i < length; i++) {
        unichar c = bytes[i] / 16;
        if (c < 10) {
            c += '0';
        } else {
            c += 'A' - 10;
        }
        hexChars[i*2] = c;

        c = bytes[i] % 16;
        if (c < 10) {
            c += '0';
        } else {
            c += 'A' - 10;
        }
        hexChars[i*2+1] = c;
    }
    NSString* retVal = [[NSString alloc] initWithCharactersNoCopy:hexChars length:length*2 freeWhenDone:YES];
    return retVal;
}
@end
