//
//  TTGameViewController.m
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import "TTGameViewController.h"
#import "TTProblem.h"
#import "TTProblemList.h"

@interface TTGameViewController ()

@property (nonatomic, strong) TTProblemList *problemList;
@property (nonatomic, strong) TTProblem *currentProblem;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TTGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.answerTextView.keyboardType = UIKeyboardTypeNumberPad;
    CGRect origRect = self.answerTextView.frame;
    self.answerTextView.frame = CGRectMake(origRect.origin.x, origRect.origin.y, 300, 300);
    self.answerTextView.delegate = self;
    [self.answerTextView becomeFirstResponder];
    
    self.problemList = [[TTProblemList alloc] init];
    
    self.currentProblem = [self.problemList randomProblem];
    self.topNumber.text = [self.currentProblem.topNumber stringValue];
    self.bottomNumber.text = [self.currentProblem.bottomNumber stringValue];
    
    [self updateCompletedLabel];
}

- (void)updateCompletedLabel
{
    self.remainingLabel.text = [NSString stringWithFormat:@"remaining: %d", [self.problemList count]];
    self.completedLabel.text = [NSString stringWithFormat:@"completed: %d", [self.problemList successfullyAnsweredCount] ];
    if (self.problemList.repeatCount != 0) {
        self.repeatLabel.text = [NSString stringWithFormat:@"review count: %d", [self.problemList repeatCount] ];
    } else {
        self.repeatLabel.text = @"";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (IBAction)doneClicked:(id)sender {
    NSNumber *enteredAnswer = [NSNumber numberWithInt:[self.answerTextView.text intValue]];
    
    if ([self.problemList isAnswerCorrectForCurrentProblem:enteredAnswer]) {
        [self.answerTextView setTextColor:[UIColor greenColor]];
        [self.problemList answeredSuccessfully:self.currentProblem];
        self.timer = [NSTimer timerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(changeProblem)
                                           userInfo:nil
                                            repeats:NO];
    } else {
        [self.answerTextView setTextColor:[UIColor redColor]];
        self.answerTextView.text = [self.currentProblem.answer stringValue];
        
        self.timer = [NSTimer timerWithTimeInterval:2
                                             target:self
                                           selector:@selector(changeProblem)
                                           userInfo:nil
                                            repeats:NO];
    }
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)changeProblem
{
    if ([self.problemList count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congrats Bug!" message:@"You got through it.  Now go faster." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    
    [self.timer invalidate];
    self.timer = nil;
    
    [self updateCompletedLabel];
    
    self.currentProblem = [self.problemList randomProblem];
    
    self.topNumber.text = [self.currentProblem.topNumber stringValue];
    self.bottomNumber.text = [self.currentProblem.bottomNumber stringValue];
    [self.answerTextView setTextColor:[UIColor blackColor]];
    self.answerTextView.text = @"";
}

- (void)updateRepeatLabel
{
    
}

@end
