//
//  EditValueController.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 18/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "EditValueController.h"

@interface EditValueController ()

@end

@implementation EditValueController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSAssert(_characteristic != nil , @"The EditValueController didn't initilize correct!");
    _bluetoothManager = [IDBluetoothManager sharedInstance];
    _bluetoothManager.delegate = self;
    self.title = @"Edit Value";
    MRHexKeyboard *hexKeyBoard = [[MRHexKeyboard alloc] initWithTextField:_valueInputTf];
    [hexKeyBoard setDoneAction:^{
        NSString *textContent = self.valueInputTf.text;
        if (textContent.length  == 0) {
            return ;
        }
        NSString *hexString = [textContent substringFromIndex:2];
        NSData *data = [self dataFromHexString:hexString];
        [self->_bluetoothManager writeValue:data forCharacteristic:self.characteristic Type:self.writeType];
        [self.navigationController popViewControllerAnimated:true];
    }];
    _valueInputTf.inputView = hexKeyBoard;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSData *)dataFromHexString:(NSString *)string{
        string = [string lowercaseString];
        NSMutableData *data= [NSMutableData new];
        unsigned char whole_byte;
        char byte_chars[3] = {'\0','\0','\0'};
        int i = 0;
        NSUInteger length = string.length;
        while (i < length-1) {
            char c = [string characterAtIndex:i++];
            if (c < '0' || (c > '9' && c < 'a') || c > 'f')
            continue;
            byte_chars[0] = c;
            byte_chars[1] = [string characterAtIndex:i++];
            whole_byte = strtol(byte_chars, NULL, 16);
            [data appendBytes:&whole_byte length:1];
        }
        return data;
    }
@end
