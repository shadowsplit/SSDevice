//
//  SSDevice.m
//  SSDevice
//
//  Created by John TSai on 2019/5/20.
//

#import "SSDevice.h"
#import <SAMKeychain/SAMKeychain.h>

@implementation SSDevice

+ (SSDevice *)currentDevice {
    UIDevice *device = [UIDevice currentDevice];
    return (SSDevice *)device;
}

- (BOOL)isJailbreak {
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"]) {
        return YES;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"]) {
        return YES;
    }
    
    return NO;
}

- (NSString *)uuid {
    static NSString *accountName = @"com.johntsaii.ssdevice";
    static NSString *serviceName = @"unique_key";
    static dispatch_once_t onceToken;
    static NSString * uniqueId = nil;
    uniqueId = [SAMKeychain passwordForService:serviceName account:accountName];
    if (uniqueId.length > 0) {
        return uniqueId;
    }
    
    dispatch_once(&onceToken, ^{
        uniqueId = [[NSUUID UUID] UUIDString];
        [SAMKeychain setPassword:uniqueId forService:serviceName account:accountName];
    });
    return uniqueId;
}

@end
