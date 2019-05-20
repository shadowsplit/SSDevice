//
//  SSDevice.h
//  SSDevice
//
//  Created by John TSai on 2019/5/20.
//

#import <UIKit/UIKit.h>
#import "SSApp.h"

@interface SSDevice : UIDevice

@property (nonatomic, assign) BOOL isJailbreak;
@property (nonatomic, copy) NSString *uuid;

+ (SSDevice *)currentDevice;

@end
