//
//  LogController.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "LogController.h"

@interface LogController ()

@end

@implementation LogController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionClose:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
