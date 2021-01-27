//
//  UIView+AdditionalProperties.m
//  vk-networkLayer
//
//  Created by Uber on 17/10/2020.
//  Copyright © 2020 Mobile. All rights reserved.
//

#import "UIView+AdditionalProperties.h"
// Run-time
#import <objc/runtime.h>

@implementation UIView (AdditionalProperties)


/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, assign) BOOL isStylized;
 --------------------------------------------------------------------------------------------------------------*/
- (void)setIsStylized:(BOOL)isStylized
{
    NSNumber *isStylizedNumber = [NSNumber numberWithBool:isStylized];
    objc_setAssociatedObject(self, @selector(isStylized), isStylizedNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isStylized
{
    NSNumber *isStylized = objc_getAssociatedObject(self, @selector(isStylized));
    return isStylized.boolValue;
}


/*--------------------------------------------------------------------------------------------------------------
 Возвращает текущею ориентацию экрана. Данный метод безопасен, его можно вызывать с background-thread
 --------------------------------------------------------------------------------------------------------------*/
+ (UIInterfaceOrientation) threadSafeStatusBarOrientation
{
    if ([NSThread isMainThread])
    {
        return [UIApplication sharedApplication].statusBarOrientation;
    }
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    __block UIInterfaceOrientation orientation;
    dispatch_async(dispatch_get_main_queue(), ^{
        orientation = (UIInterfaceOrientation)[UIApplication sharedApplication].statusBarOrientation;
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return orientation;
}

@end
