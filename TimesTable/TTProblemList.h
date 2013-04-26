//
//  TTProblemList.h
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTProblem;

@interface TTProblemList : NSObject

@property (nonatomic, readonly, assign) int repeatCount;

- (NSUInteger)count;
- (TTProblem *)randomProblem;

- (void)answeredSuccessfully:(TTProblem *)problem;
- (NSUInteger)successfullyAnsweredCount;
- (BOOL)isAnswerCorrectForCurrentProblem:(NSNumber *)enteredAnswer;

@end
