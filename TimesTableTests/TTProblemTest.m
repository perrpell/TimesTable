//
//  TTProblemTest.m
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import "TTProblemTest.h"
#import "TTProblem.h"

@implementation TTProblemTest

- (void)testProblem
{
    TTProblem *problem = [[TTProblem alloc] initTopNumber:@10 bottomNumber:@10];
    
    STAssertFalse([problem answerIsCorrect:@10], @"wrong");
    STAssertTrue([problem answerIsCorrect:@100], @"wrong");
    
    STAssertEquals(1, [problem failedCount], @"wrong");
}

@end
