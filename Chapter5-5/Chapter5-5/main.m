//
//  main.m
//  Chapter5-5
//
//  Created by Yokoe on 10/19/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property const NSString *name ;
@property (weak) People *friend ;

- (id)initWithName :(const NSString *)p ;
- (void)setFriend :(id)obj ;
- (const NSString *)nameOfFriend ;

@end


@implementation People

@synthesize name, friend ;

- (id)initWithName:(const NSString *)p
{
    self = [super init] ;
    name = p ;
    friend = nil ;
    
    return self ;
}
/*
- (void)setFriend:(id)obj
{
    friend = obj ;
}
*/
- (const NSString *)nameOfFriend
{
    if(friend == nil){
        return @"none" ;
    }
    return friend.name ;
}

@end



int main(int argc, const char * argv[])
{
    People *alice = [[People alloc] initWithName:@"Alive"] ;
    NSLog(@"Friend : %@\n", [alice nameOfFriend]) ;
    @autoreleasepool
    {
        People *bob = [[People alloc] initWithName:@"Bob"] ;
        [alice setFriend:bob] ;
        NSLog(@"Friend : %@", [alice nameOfFriend]) ;
        bob = nil ; // 変数 b のオブジェクトはここで解放される
    }
    NSLog(@"Friend : %@\n", [alice nameOfFriend]) ;
    return 1 ;
}
