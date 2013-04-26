//
//  TTGameViewController.h
//  TimesTable
//
//  Created by Adam Perry-Pelletier on 4/25/13.
//  Copyright (c) 2013 Adam Perry-Pelletier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTGameViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *topNumber;

@property (weak, nonatomic) IBOutlet UILabel *bottomNumber;

@property (weak, nonatomic) IBOutlet UILabel *answer;

@property (weak, nonatomic) IBOutlet UITextField *answerTextView;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)doneClicked:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *completedLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingLabel;

@end
