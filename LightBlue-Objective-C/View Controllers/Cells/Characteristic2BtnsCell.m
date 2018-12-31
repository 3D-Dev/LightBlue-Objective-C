//
//  Characteristic2BtnsCell.m
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import "Characteristic2BtnsCell.h"

@implementation Characteristic2BtnsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)enableBtns{
    [_leftBtn setEnabled:true];
    [_rightBtn setEnabled:true];
}

-(void)disableBtns{
    [_leftBtn setEnabled:false];
    [_rightBtn setEnabled:false];
}
-(void)leftBtnClick:(UIButton *)sender {
    if (self.leftAction){
        self.leftAction();
    }
}

-(void)rightBtnClick:(UIButton *)sender  {
    if (self.rightAction){
        self.rightAction();
    }
}
@end
