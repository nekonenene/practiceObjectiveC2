//
//  main.m
//  makeRandom
//
//  Created by Yokoe on 10/20/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        int randomNumber ;
        int i ;
        // NSMutableString *logString = [[NSMutableString alloc] initWithString:@""] ;
        NSMutableString *logString = [[NSMutableString alloc] init] ;
        
        for(i = 0; i < 10; ++i)
        {
            randomNumber = (int)random() % 100 + 1 ; // 1 ~ 100 を出す, 実行ごとに同じ
            [logString setString :[logString stringByAppendingFormat:@"%-3d, ", randomNumber] ] ;
        }
        NSLog(@"%@\n", logString) ;
        
        [logString setString:@""] ;
        NSMutableArray *randomNumbersArray = [[NSMutableArray alloc] init] ;
        for(i = 0; i < 10; ++i)
        {
            randomNumber = (int)arc4random_uniform(100) + 1 ; // 1 ~ 100 を出す, 実行ごとに異なる
            [logString setString :[logString stringByAppendingFormat:@"%-3d, ", randomNumber] ] ;
            [randomNumbersArray addObject:[[NSNumber alloc] initWithInt:randomNumber] ] ;
        }
        NSLog(@"%@\n", logString) ;
        // NSLog(@"%@\n", [logString description]) ;  // 上の一文と同じ出力結果になる
        // NSLog(@"%@\n", [logString propertyList]) ; // アカンやつ
        
        // for in 文を試してみるぜ！！！
        [logString setString:@""] ;
        for(id content in randomNumbersArray)
        {
            [logString appendFormat:@"%@/ ", [content description] ] ;
        }
        NSLog(@"%@", logString) ;
    }
    return 0;
}
