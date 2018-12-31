//
//  CBAdvertisementData.h
//  LightBlue-Objective-C
//
//  Created by Deepak Sharma on 17/12/18.
//  Copyright © 2018 Insanelydeepak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
NS_ASSUME_NONNULL_BEGIN

@interface CBAdvertisementData : NSObject
+(NSString *)getAdvertisementDataName:(NSString *)key;
+(NSString *)getAdvertisementDataStringValue:(NSDictionary *)datas  Key:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
