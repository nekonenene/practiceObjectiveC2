//
//  main.m
//  Chapter4-1
//
//  Created by Yokoe on 10/19/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AClass : NSObject
- (void)whoAreYou ;
@end

@implementation AClass
- (void)whoAreYou
{
    NSLog(@"I'm Class A") ;
}
@end

@interface BClass : NSObject
- (void)whoAreYou ;
@end

@implementation BClass
- (void)whoAreYou
{
    NSLog(@"I'm Class B") ;
}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        id object ;
        int flagNumber ;
        NSLog(@"Please input number(0 ~ 2) : ") ;
        scanf("%d", &flagNumber) ;
        
        switch (flagNumber) {
            case 0:
                object = [[AClass alloc] init] ;
                break;
            case 1:
                object = [[BClass alloc] init] ;
                break ;
            case 2:
                object = [[NSObject alloc] init] ;
                break ;
                
            default:
                NSLog(@"その値はダメです") ;
                return -1 ;
                break;
        }
        
        @try {
            [object whoAreYou] ;
        }
        @catch (NSException *exception) {
            NSLog(@"!!Error!! : name = %@, reason = %@", exception.name, exception.reason) ;
        }
    }
    return 0;
}
