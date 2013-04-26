//
//  TTProblemListTest.m
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import "TTProblemListTest.h"
#import "TTProblemList.h"
#import "TTProblem.h"

@implementation TTProblemListTest


- (void)testLoad
{
    TTProblemList *list = [[TTProblemList alloc] init];
    
    STAssertEquals((NSUInteger)169, [list count], @"wrong");
}

- (void)testCanGetRandomProblem
{
    TTProblemList *list = [[TTProblemList alloc] init];

    for (int i = 0; i < 10000; i++) {
        TTProblem *problem = [list randomProblem];
        STAssertNotNil(problem, @"wrong");
    }
}

- (void)testCanRemoveSuccessfullySolved
{
    TTProblemList *list = [[TTProblemList alloc] init];
    
    STAssertEquals((NSUInteger)169, [list count], @"wrong");
    
    TTProblem *problem = [list randomProblem];
    
    [list answeredSuccessfully:problem];
    STAssertEquals((NSUInteger)168, [list count], @"wrong");
    STAssertEquals((NSUInteger)1, [list successfullyAnsweredCount], @"wrong");
}

- (void)testIncorrectAnswerPutsListInRepeatMode
{
    TTProblemList *list = [[TTProblemList alloc] init];
    TTProblem *problem = [list randomProblem];
    
    int wrongAnswer = [problem.answer intValue] + 3;
    
    STAssertFalse([list isAnswerCorrectForCurrentProblem:[NSNumber numberWithInt:wrongAnswer]], @"wrong");
    
    TTProblem *shouldBeSameProblem = [list randomProblem];
    STAssertEqualObjects(problem, shouldBeSameProblem, @"wrong");
    
    shouldBeSameProblem = [list randomProblem];
    STAssertEqualObjects(problem, shouldBeSameProblem, @"wrong");
    
    shouldBeSameProblem = [list randomProblem];
    STAssertEqualObjects(problem, shouldBeSameProblem, @"wrong");
    
    shouldBeSameProblem = [list randomProblem];
    STAssertEqualObjects(problem, shouldBeSameProblem, @"wrong");
    
    shouldBeSameProblem = [list randomProblem];
    STAssertEqualObjects(problem, shouldBeSameProblem, @"wrong");
    
    TTProblem *shouldBeDifferentProblem = [list randomProblem];
    STAssertFalse(problem == shouldBeDifferentProblem, @"wrong");
}

@end
