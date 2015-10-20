//
//  main.m
//  NullAndNil
//
//  Created by Yokoe on 10/20/15.
//  Copyright © 2015 HANAUTA. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSLog(@"nil もしくは NULL であるかのチェックをおこなう\n\n") ;
        NSArray *array = [[NSArray alloc] init] ;
        NSString *string = [[NSString alloc] init] ;
        // NSString *string = @"0" ;
        // なお、初期化を行わない NSArray *array = [NSArray alloc] ; も試したが、結果は同じ
        NSArray *undefinedArray ; 
        NSLog(@"array ----->") ;
        NSLog(@"%d", array == nil  ) ; // NO
        NSLog(@"%d", array == NULL ) ; // NO
        NSLog(@"array[0] ----->") ;
        @try
        {
        NSLog(@"%d", array[0] == nil  ) ; // 参照するものがなく、実行時エラー
        NSLog(@"%d", array[0] == NULL ) ; // 参照するものがなく、実行時エラー
        }
        @catch(NSException *e)
        {
        NSLog(@"!!Error!! : 参照できません") ;
        }
        NSLog(@"string ----->") ;
        NSLog( @"%d", (string == nil ) ) ; // NO
        NSLog( @"%d", (string == NULL) ) ; // NO
        NSLog(@"undefinedArray ----->") ;
        NSLog(@"%d", undefinedArray == nil )  ; // YES
        NSLog(@"%d\n\n", undefinedArray == NULL ) ; // YES
        
        NSLog(@"int 0 -----> ") ;
        NSLog(@"%d", ((int)0) == nil ) ; // YES
        NSLog(@"%d", ((int)0) == NULL) ; // YES
        NSLog(@"int 5 -----> ") ;
        // int 型と pointer を比べているため以下２行は Warning
        NSLog(@"%d", ((int)5) == nil)  ; // NO
        NSLog(@"%d\n\n", ((int)5) == NULL) ; // NO

        NSLog(@"[[NSNumber alloc] initWithInteger:0] ----->") ;
        NSLog(@"%d", [[NSNumber alloc] initWithInteger:0] == nil  ) ; // NO
        NSLog(@"%d", [[NSNumber alloc] initWithInteger:0] == NULL ) ; // NO
        NSLog(@"NSInteger 0 -----> ") ;
        NSLog(@"%d", ((NSInteger)0) == nil)  ; // YES
        NSLog(@"%d\n\n", ((NSInteger)0) == NULL) ; // YES

        NSLog(@"BOOL NO -----> ") ;
        NSLog(@"%d", ((BOOL)NO) == nil ) ; // YES
        NSLog(@"%d", ((BOOL)NO) == NULL) ; // YES
        NSLog(@"[[NSNumber alloc] initWithBool:NO] -----> ") ;
        NSLog( @"%d", ([[NSNumber alloc] initWithBool:NO] == nil) )  ; // NO
        NSLog( @"%d\n\n", ([[NSNumber alloc] initWithBool:NO] == NULL) ) ; // NO
        
        NSLog(@"BOOL YES -----> ") ;
        // int 型と pointer を比べているため以下２行は Warning
        NSLog(@"%d", ((BOOL)YES) == nil ) ; // NO
        NSLog(@"%d", ((BOOL)YES) == NULL) ; // NO
        NSLog(@"[[NSNumber alloc] initWithBool:YES] -----> ") ;
        NSLog( @"%d", ([[NSNumber alloc] initWithBool:YES] == nil) )  ; // NO
        NSLog( @"%d\n\n", ([[NSNumber alloc] initWithBool:YES] == NULL) ) ; // NO

        NSLog(@"*pointer is undefined ----->") ;
        float *pointer ;
        NSLog( @"%d", (pointer == nil ) ) ; // YES
        NSLog( @"%d", (pointer == NULL) ) ; // YES
        NSLog(@"pointer = 0 ----->") ;
        float x = 0 ;
        pointer = &x ;
        pointer = (NSInteger)0 ;
        NSLog( @"%d", (pointer == nil ) ) ; // YES
        NSLog( @"%d", ((void *)pointer == nil ) ) ; // YES
        NSLog( @"%d", (pointer == NULL) ) ; // YES
        NSLog(@"pointer = 5 ----->") ;
        pointer = 5 ;  // pointer に int 型を代入しているため警告
        NSLog( @"%d", (pointer == nil ) ) ; // NO
        NSLog( @"%d", (pointer == NULL) ) ; // NO
        NSLog(@"pointer = NO ----->") ;
        pointer = NO ;
        NSLog( @"%d", (pointer == nil ) ) ; // YES
        NSLog( @"%d", (pointer == NULL) ) ; // YES
        
        NSString *strPointer ;
        NSMutableString *str = [[NSMutableString alloc] initWithString:@"nnn"] ;
        // 以下２行で使っているのは、うまく実行できない時に nil を返すメソッド
        NSLog(@"%d", ([str initWithContentsOfFile:strPointer] == nil )) ;
        NSLog(@"%d", ([str initWithContentsOfFile:strPointer] == NULL)) ;
        
        /* ----- まとめ ------
         * nil も NULL も null pointer であることに変わりがなかった
         * 数字の 0 は、コンパイラに NULL と認識される
         * 領域が確保された段階で、中身が無く、空文字だったりしてもそのオブジェクトは NULL ではない
         * NO は 自動で 0 に置き換えられ、その後自動的に NULL に置き換えられている
         * nil にはメッセージを渡す（メソッドを実行する）ことができるらしい
         * ----- */
        
        array = [array arrayByAddingObject :@"nyao"] ;
        array = [array arrayByAddingObject :@"nyao~n"] ;
        
        NSLog(@"%@", array[0]) ;
    }
    return 0;
}
