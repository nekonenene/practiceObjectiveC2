//
//  main.m
//  Chapter9-6
//
//  Created by Yokoe on 10/20/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"%s", @encode(NSPoint) ) ; // {CGPoint=dd}
        NSLog(@"%s", @encode(NSInteger) ) ; // q
        NSLog(@"%s", @encode(int) ) ; // i
        NSLog(@"%s", @encode(unsigned int) ) ; // r
        NSLog(@"%s", @encode(unsigned long long int) ) ; // Q
        NSLog(@"%s", @encode(float) ) ; // f
        NSLog(@"%s", @encode(double) ) ; // d
        NSLog(@"%s", @encode(double_t) ) ; // d
        
        NSLog(@"%s", @encode(char *) ) ; // *
        NSLog(@"%s", @encode(int *) ) ; // ^i
        NSLog(@"%s", @encode(const char *) ) ; // r*
        // NSLog(@"%s", @encode(static char *) ) ; // これはコンパイルエラー
        // NSLog(@"%s", @encode(extern char *) ) ; // これもコンパイルエラー
        NSLog(@"%s", @encode(NSArray)) ; // {NSArray=#}
        
        NSLog(@"%@\n", [ [NSString alloc] initWithUTF8String:
                        [@"http://www.ハナウタ.com" fileSystemRepresentation] ]  ) ;
        NSLog(@"%@\n", [@"http://www.hana uta.co.jp/~nyannyan" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ) ;
        NSLog(@"%@\n", [@"http://www.ハナウタ.com/ﾌｫﾙﾀﾞｰ/画像ファイルだ.png?width=auto#pict" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ) ;
        // http://www.%E3%83%8F%E3%83%8A%E3%82%A6%E3%82%BF.com/%EF%BE%8C%EF%BD%AB%EF%BE%99%EF%BE%80%EF%BE%9E%EF%BD%B0/%E7%94%BB%E5%83%8F%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%A0.png?width=auto%23pict と出力される
        
    }
    return 0;
}
