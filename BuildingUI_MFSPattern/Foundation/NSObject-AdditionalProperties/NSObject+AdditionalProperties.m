//
//  NSObject+AdditionalProperties.m
//  vk-networkLayer
//
//  Created by Uber on 17/10/2020.
//  Copyright © 2020 Mobile. All rights reserved.
//

#import "NSObject+AdditionalProperties.h"
// Run-time
#import <objc/runtime.h>
// Consts
//#import "FoundationConsts.h"


@implementation NSObject (AdditionalProperties)

/*--------------------------------------------------------------------------------------------------------------
 Метод который вызывается макросом если 'isPrintLogInConsole' имеет значение 'YES'.
 Метод непосредственно печатает лог в консоль.
 --------------------------------------------------------------------------------------------------------------*/
- (void) printMethodName:(NSString*)method
{
    if (self.isPrintLogInConsole){
        NSLog(@"%@ | [Thread: %ld]",method,(long)[[[NSThread currentThread] valueForKeyPath:@"private.seqNum"] integerValue]);
    }
}


#pragma mark - Getters/Setters
/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, assign) BOOL isPrintLogInConsole
 --------------------------------------------------------------------------------------------------------------*/
- (void)setIsPrintLogInConsole:(BOOL)isPrint
{
    NSNumber *isPrintLogInConsole = [NSNumber numberWithBool:isPrint];
    objc_setAssociatedObject(self, @selector(isPrintLogInConsole), isPrintLogInConsole, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isPrintLogInConsole
{
    NSNumber *isPrintLogInConsole = objc_getAssociatedObject(self, @selector(isPrintLogInConsole));
    return isPrintLogInConsole.boolValue;
}


/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong) NSString* addressInMemory;
 --------------------------------------------------------------------------------------------------------------*/
- (NSString *)addressInMemory
{
    NSString *addressInMemory = objc_getAssociatedObject(self, @selector(addressInMemory));
    if (!addressInMemory){
        addressInMemory = [NSString stringWithFormat:@"%p",self];
        [self setAddressInMemory:addressInMemory];
    }
    return addressInMemory;
}

- (void)setAddressInMemory:(NSString *)addressInMemory
{
    objc_setAssociatedObject(self, @selector(addressInMemory), addressInMemory, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end


