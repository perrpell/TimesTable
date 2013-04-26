//
//  TTProblem.h
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTProblem : NSObject

@property (nonatomic, strong) NSNumber *topNumber;
@property (nonatomic, strong) NSNumber *bottomNumber;
@property (nonatomic, readonly) NSNumber *answer;

- (id)initTopNumber:(NSNumber *)topNumber bottomNumber:(NSNumber *)bottomNumber;

- (BOOL)answerIsCorrect:(NSNumber *)answer;

- (int)failedCount;
@end
