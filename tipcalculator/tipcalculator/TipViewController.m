//
//  TipViewController.m
//  tipcalculator
//
//  Created by Gaurav Gargate on 1/2/15.
//  Copyright (c) 2015 Gaurav Gargate. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;


- (IBAction)onTap:(id)sender;
- (IBAction)tipSliderValuechanged:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Tip Calculator";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    [self setDefaultTipPercentage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)tipSliderValuechanged:(id)sender {
    [self updateValues];
}

- (void)updateValues {
    // Get the values
    float billAmount = [self.billTextField.text floatValue];
    float sliderValue = [self.tipSlider value];
   
    float newTipAmount = billAmount * (sliderValue / 100);
    float totalValue = billAmount + newTipAmount;
    
    // Populate the labels
    self.tipPercentageLabel.text = [NSString stringWithFormat:@"%0.0f", sliderValue];
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", newTipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalValue];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    [self setDefaultTipPercentage];
}

- (void) onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)setDefaultTipPercentage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultTipValue = [defaults stringForKey:@"defaultTipPercentage"];
    float defaultTipPercentage = [defaultTipValue floatValue];
    self.tipSlider.value = defaultTipPercentage > 0 ? defaultTipPercentage : 10;
    
    [self updateValues];
}

@end
