//
//  TTProblemList.m
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import "TTProblemList.h"
#import "TTProblem.h"
#include <stdlib.h>

@interface TTProblemList ()

@property (nonatomic, strong) NSMutableArray *problemList;
@property (nonatomic, strong) NSMutableArray *successfullyAnsweredProblems;
@property (nonatomic, strong) TTProblem *currentProblem;
@property (nonatomic, assign) int repeatCount;

@end

@implementation TTProblemList

- (id)init
{
    self = [super init];
    
    if (self) {
        self.problemList = [[NSMutableArray alloc] init];
        self.successfullyAnsweredProblems = [[NSMutableArray alloc] init];
        self.repeatCount = 0;
    
        for (int i = 0; i < 1; i++) {
            for (int j = 0; j < 2; j++) {
                [self.problemList addObject:[[TTProblem alloc] initTopNumber:[NSNumber numberWithInt:i]     bottomNumber:[NSNumber numberWithInt:j]]];
            }
        }
    }
    
    return self;
}

- (BOOL)isAnswerCorrectForCurrentProblem:(NSNumber *)enteredAnswer
{
    BOOL isCorrect = [self.currentProblem answerIsCorrect:enteredAnswer];
    
    if (isCorrect) {
        return isCorrect;
    } else {
        self.repeatCount = 2;
        return isCorrect;
    }

}

- (NSUInteger)count
{
    return [self.problemList count];
}

- (TTProblem *)randomProblem
{
    if (self.repeatCount > 0) {
        return self.currentProblem;
    } else {
        NSUInteger size = [self count];
        
        int random = arc4random() % size;
        NSLog(@"random: %d", random);
        self.currentProblem = [self.problemList objectAtIndex:random];
        return self.currentProblem;
    }
}

- (void)answeredSuccessfully:(TTProblem *)problem
{
    if (problem != self.currentProblem) {
        [NSException raise:@"Illegal state exception" format:@"Incoming problem different than current problem."];
    }
    
    if (self.repeatCount > 0) {
        self.repeatCount--;
        return;
    }
    
    [self.problemList removeObject:self.currentProblem];
    [self.successfullyAnsweredProblems addObject:self.currentProblem];
}

- (NSUInteger)successfullyAnsweredCount
{
    return [self.successfullyAnsweredProblems count];
}


@end
