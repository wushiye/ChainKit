//
//  NSObject+RuntimeArchiver.h
//  wushiye
//
//  Created by wushiye on 2019/12/19.
//  Copyright © 2019 Seven trees. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RuntimeArchiver)

- (void)m_archiveObject;

+ (instancetype)m_unarchiveObject;


- (void)m_encoder:(NSCoder *)aCoder;

- (void)m_decoder:(NSCoder *)aDecoder;

@end
