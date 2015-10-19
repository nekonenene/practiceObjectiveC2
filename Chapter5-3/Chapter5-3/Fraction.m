//
//  Fraction.m
//  Chapter5-3
//
//  Created by Yokoe on 10/19/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

/* 再帰的なユークリッド互除法により、最大公約数を求める */
static int commonDivisor(int a, int b)
{
    if(a > b)
    {
        return commonDivisor(b, a) ;
    }
    if(b == 0)
    {
        return a ;
    }
    return commonDivisor(b, a % b) ;
}

/* Local Method */
- (void)reduce
{
    int d ;
    
    if(numerator == 0)
    {
        operator = 1 ;
        denominatar = 1 ;
        return ;
    }
    if(denominatar == 0)  // infinity
    {
        numerator = 1 ;
        return ;
    }
    if(( d = commonDivisor(numerator, denominatar)) == 1 )
    {
        return ;
    }
    numerator   /= d ;
    denominatar /= d ;
}




@end
