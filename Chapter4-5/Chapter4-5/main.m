//
//  main.m
//  Chapter4-5
//
//  Created by Yokoe on 10/19/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//
/* クラスオブジェクトメソッド（ファクトリーメソッド）の動作の確認を行う */

#import <Foundation/Foundation.h>

@interface AClass : NSObject
+ (void)initialize ;
@end

@implementation AClass
+ (void)initialize
{
    NSLog(@"I'm A!") ;
}
@end

@interface BClass : AClass
+ (void)initialize ;
+ (void)setMessage :(const NSString *)message ;
- (void)sayHello ;
@end

static const NSString *myMessage = @"Hello!!" ;

@implementation BClass
+ (void)initialize
{
    NSLog(@"I'm B!!") ;
}
+ (void)setMessage :(const NSString *)message
{
    myMessage = message ;
}
- (void)sayHello
{
    NSLog(@"%@\n", myMessage) ;
}
@end


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        BClass *object = [[BClass alloc] init] ; // 最初のメッセージを受け取る際（この場合は alloc）に、
        // クラスメソッド initialize のみが実行され、 I'm A, I'm B のログ出力を行う。
        [object sayHello] ;
        [BClass setMessage:@"Have a Good Day!\nHave a Kit Kat!"] ; // 局所的な変数 myMessage の変更ができる
        [object sayHello] ;
    }
    return 0;
}
