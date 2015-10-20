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
        NSMutableString *logString = [[NSMutableString alloc] initWithString:@""] ;
        
        for(i = 0; i < 10; ++i)
        {
            randomNumber = (int)random() % 100 + 1 ; // 1 ~ 100 を出す, 実行ごとに同じ
            [logString setString :[logString stringByAppendingFormat:@"%-3d, ", randomNumber] ] ;
        }
        NSLog(@"%@\n", logString) ;
        
        [logString setString:@""] ;
        for(i = 0; i < 10; ++i)
        {
            randomNumber = (int)arc4random_uniform(100) + 1 ; // 1 ~ 100 を出す, 実行ごとに異なる
            [logString setString :[logString stringByAppendingFormat:@"%-3d, ", randomNumber] ] ;
        }
        NSLog(@"%@\n", logString) ;

    }
    return 0;
}
