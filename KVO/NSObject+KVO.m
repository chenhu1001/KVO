//
//  NSObject+KVO.m
//  KVO
//
//  Created by 陈虎 on 16/5/27.
//  Copyright © 2016年 chenhu. All rights reserved.
//

#import "NSObject+KVO.h"
#import "CLKVONotifying_Person.h"
#import <objc/runtime.h>

@implementation NSObject (KVO)

- (void)cl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    // 1.动态创建NSKVONotifying_Person,NSKVONotifying_Person是Person子类,做KVO
    // 2.修改当前对象的isa指针->NSKVONotifying_Person
    // 3.只要调用对象的set,就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法,1.[super set:] 2.通知观察者,告诉你属性改变
    
    // 修改isa,本质就是改变当前对象的类名
    /* isa：是一个Class 类型的指针. 每个实例对象有个isa的指针,他指向对象的类，而Class里也有个isa的指针, 指向meteClass(元类)。元类保存了类方法的列表。当类方法被调用时，先会从本身查找类方法的实现，如果没有，元类会向他父类查找该方法。同时注意的是：元类（meteClass）也是类，它也是对象。元类也有isa指针,它的isa指针最终指向的是一个根元类(root meteClass).根元类的isa指针指向本身，这样形成了一个封闭的内循环。 */
    object_setClass(self, [CLKVONotifying_Person class]);
    
    // 把观察者保存到当前对象里
    
    
    // 添加关联
    // id object:给哪个对象添加关联属性
    // key:属性名
    // value:关联值
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

@end
