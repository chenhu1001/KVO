//
//  Person.h
//  KVO
//
//  Created by 陈虎 on 16/5/27.
//  Copyright © 2016年 chenhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
@public
    int _age;
}

@property (nonatomic, assign) int age;

@end
