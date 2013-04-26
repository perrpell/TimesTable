//
//  TTProblem.m
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import "TTProblem.h"

@interface TTProblem ()

@property (nonatomic, assign) int incorrectCount;

@end

@implementation TTProblem

- (id)initTopNumber:(NSNumber *)topNumber bottomNumber:(NSNumber *)bottomNumber
{
    self = [super init];
    
    if (self) {
        self.topNumber = topNumber;
        self.bottomNumber = bottomNumber;
        self.incorrectCount = 0;
    }
    
    return self;
}

- (BOOL)answerIsCorrect:(NSNumber *)answer
{
    int problemAnswer = [self.topNumber intValue] * [self.bottomNumber intValue];
    
    BOOL isCorrect = problemAnswer == [answer intValue] ? YES : NO;
    
    if (isCorrect == NO) {
        self.incorrectCount++;
        
    }
    
    return isCorrect;
}

- (int)failedCount
{
    return self.incorrectCount;
}

- (NSNumber *)answer
{
    return [NSNumber numberWithInt:[self.topNumber intValue] * [self.bottomNumber intValue]];
}

@end
