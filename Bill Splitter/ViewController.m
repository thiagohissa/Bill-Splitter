//
//  ViewController.m
//  Bill Splitter
//
//  Created by Thiago Hissa on 2017-07-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UIStepper *incrementPeople;
@property (weak, nonatomic) IBOutlet UITextField *numberOfPeople;
@property (weak, nonatomic) IBOutlet UIStepper *incrementBill;

@property (weak, nonatomic) IBOutlet UITextField *tipInput;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.incrementPeople setMaximumValue:8.0];
    [self.incrementPeople setMinimumValue:2.0];
    [self.incrementBill setMinimumValue:1.0];
}
- (IBAction)incrementBill:(id)sender {
    UIStepper *stepper = sender;
    NSString *string = [NSString stringWithFormat:@"%d",(int)stepper.value];
    self.input.text = string;
    [self calculate];
}


- (IBAction)incrementPeople:(id)sender {
    UIStepper *stepper = sender;
    NSString *string = [NSString stringWithFormat:@"%d",(int)stepper.value];
    self.numberOfPeople.text = string;
    [self calculate];
}

-(void)calculate{
    float tip = (([self.input.text floatValue]/[self.numberOfPeople.text floatValue])/100)*[self.tipInput.text floatValue];
    float value = [self.input.text floatValue]/[self.numberOfPeople.text floatValue]+tip;
    NSString *stringLabel = [NSString stringWithFormat:@"Total: %.2f", value];
    self.label.text = stringLabel;
}


- (IBAction)calculateSplitAmount:(id)sender {
    [self calculate];
}






@end







