//
//  NSObject+KVO.h
//  KVO
//
//  Created by 陈虎 on 16/5/27.
//  Copyright © 2016年 chenhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)cl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
