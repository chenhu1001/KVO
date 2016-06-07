//
//  CLKVONotifying_Person.m
//  KVO
//
//  Created by 陈虎 on 16/5/27.
//  Copyright © 2016年 chenhu. All rights reserved.
//

#import "CLKVONotifying_Person.h"
#import <objc/runtime.h>

@implementation CLKVONotifying_Person

- (void)setAge:(int)age {
    [super setAge:age];
    
    // 通知观察者,属性改变
    id observer = objc_getAssociatedObject(self, @"observer");
    
    [observer observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
}

@end
