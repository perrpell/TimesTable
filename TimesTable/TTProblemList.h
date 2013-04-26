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

- (NSUInteger)count;
- (TTProblem *)randomProblem;

- (void)answeredSuccessfully:(TTProblem *)problem;
- (NSUInteger)successfullyAnsweredCount;

@end
