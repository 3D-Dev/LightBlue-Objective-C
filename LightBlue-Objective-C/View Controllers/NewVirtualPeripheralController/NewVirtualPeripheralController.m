//
//  NewVirtualPeripheralController.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "NewVirtualPeripheralController.h"

@interface NewVirtualPeripheralController ()
@property (strong, nonatomic) NSArray *virtualPeripheralNames;
@end

@implementation NewVirtualPeripheralController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _virtualPeripheralNames = @[@"Alert Notification", @"Blood Pressure", @"Cycling Power", @"Cycling Speed and Cadence", @"Find Me", @"Glucose", @"HID OVER GATT", @"Hleath Thermometer", @"Heart Rate", @"Location and Navigation", @"Phone Alert Status", @"Polar HR Sensor", @"Proximity", @"Running Speed and Cadence", @"Scan Parameters", @"Temperature Alarm Service", @"Time"];

    // init prompt without animation and let the navigationBar do not overlap with uitableview
    [self.navigationController setNavigationBarHidden:true animated:false];
    [self.navigationController setNavigationBarHidden:false animated:false];
}

#pragma mark - Callback functions
/**
 Cancel add new virtual peripheral
 */
- (IBAction)actionClick:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _virtualPeripheralNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newVirtualPeripheralCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newVirtualPeripheralCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = _virtualPeripheralNames[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath, row: %@",_virtualPeripheralNames[indexPath.row]);
}
@end
