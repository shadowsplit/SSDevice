//
//  SSApp.m
//  SSDevice
//
//  Created by John TSai on 2019/5/20.
//

#import "SSApp.h"

@implementation SSApp

+ (instancetype)currentApp {
    static SSApp *_sharedApp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedApp = [[self alloc] init];
    });
    
    return _sharedApp;
}

- (NSString *)version {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)buildNumber {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

- (NSString *)name {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

@end
