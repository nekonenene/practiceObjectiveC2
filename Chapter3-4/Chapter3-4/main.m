//
//  main.m
//  Chapter3-4
//
//  Created by Yokoe on 10/19/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AClass : NSObject
- (void)method1 ;
- (void)method2 ;
@end

@implementation AClass
- (void)method1
{
    NSLog(@"method1 of Class A\n") ;
}

- (void)method2
{
    NSLog(@"method2 of Class A\n") ;
}
@end

@interface BClass : AClass
- (void)method2 ;
@end

@implementation BClass
- (void)method2
{
    NSLog(@"method2 of Class B\n") ;
    NSLog(@"self----->") ;
    [self method1] ;
    NSLog(@"super----->") ;
    [super method2] ;
}
@end

@interface CClass : BClass
- (void)method1 ;
@end

@implementation CClass
- (void)method1
{
    NSLog(@"method1 of Class C\n") ;
}
@end

/* メイン部 */
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        BClass *bInstance = [[BClass alloc] init] ;
        CClass *cInstance = [[CClass alloc] init] ;
        NSLog(@"----- instance of B -----\n") ;
        [bInstance method1] ;
        [bInstance method2] ;
        NSLog(@"----- instance of C -----\n") ;
        [cInstance method1] ;
        [cInstance method2] ;
    }
    return 0 ;
}
