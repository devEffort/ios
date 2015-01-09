//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Gaurav Gargate on 1/9/15.
//  Copyright (c) 2015 Gaurav Gargate. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTipPercentage;
- (IBAction)defaultTipValueChanged:(id)sender;
- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.defaultTipPercentage.text = @"10";
    
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

- (void)viewDidAppear:(BOOL)animated {
    [self readDefaultTipPercentage];
}


- (void)viewWillDisappear:(BOOL)animated {
    [self saveDefaultTipPercentage];
}


- (IBAction)defaultTipValueChanged:(id)sender {
    NSLog(@"value has changed: %@", self.defaultTipPercentage.text);
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self saveDefaultTipPercentage];
}

- (void)readDefaultTipPercentage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *defaultTipValue = [defaults stringForKey:@"defaultTipPercentage"];
    
    self.defaultTipPercentage.text = defaultTipValue;
}


- (void)saveDefaultTipPercentage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.defaultTipPercentage.text forKey:@"defaultTipPercentage"];
    [defaults synchronize];
    
}
@end
