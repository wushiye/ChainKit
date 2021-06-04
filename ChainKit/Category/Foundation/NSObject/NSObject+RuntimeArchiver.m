//
//  NSObject+RuntimeArchiver.m
//  wushiye
//
//  Created by wushiye on 2019/12/19.
//  Copyright © 2019 Seven trees. All rights reserved.
//

#import "NSObject+RuntimeArchiver.h"
#import <objc/runtime.h>

@implementation NSObject (RuntimeArchiver)

+ (NSString *)m_filePath {
    NSLog(@"NSStringFromClass = %@", NSStringFromClass([self class]));
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.archiver", NSStringFromClass([self class])]];
    // NSCachesDirectory    NSTemporaryDirectory();
}

- (void)m_archiveObject {
    NSLog(@"m_archiveObject: filePath = %@", [NSObject m_filePath]);
    [NSKeyedArchiver archiveRootObject:self toFile:[NSObject m_filePath]];
}

+ (instancetype)m_unarchiveObject {
    NSLog(@"m_unarchiveObject: filePath = %@", [self m_filePath]);
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self m_filePath]];
}

- (void)m_encoder:(NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

- (void)m_decoder:(NSCoder *)aDecoder {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString * key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [aDecoder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(ivars);
}

@end
