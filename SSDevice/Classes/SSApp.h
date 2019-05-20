//
//  SSApp.h
//  SSDevice
//
//  Created by John TSai on 2019/5/20.
//

#import <Foundation/Foundation.h>

@interface SSApp : NSObject

+ (instancetype)currentApp;

- (NSString *)version;

- (NSString *)buildNumber;

- (NSString *)name;

@end
