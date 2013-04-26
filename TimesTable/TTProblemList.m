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

@end

@implementation TTProblemList

- (id)init
{
    self = [super init];
    
    if (self) {
        self.problemList = [[NSMutableArray alloc] init];
        self.successfullyAnsweredProblems = [[NSMutableArray alloc] init];
    
        for (int i = 0; i < 13; i++) {
            for (int j = 0; j < 13; j++) {
                [self.problemList addObject:[[TTProblem alloc] initTopNumber:[NSNumber numberWithInt:i]     bottomNumber:[NSNumber numberWithInt:j]]];
            }
        }
    }
    
    return self;
}

- (NSUInteger)count
{
    return [self.problemList count];
}

- (TTProblem *)randomProblem
{
    NSUInteger size = [self count];
    
    int random = arc4random() % size;
    return [self.problemList objectAtIndex:random];
}

- (void)answeredSuccessfully:(TTProblem *)problem
{
    [self.problemList removeObject:problem];
    [self.successfullyAnsweredProblems addObject:problem];
}

- (NSUInteger)successfullyAnsweredCount
{
    return [self.successfullyAnsweredProblems count];
}


@end
