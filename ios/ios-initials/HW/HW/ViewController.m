//
//  ViewController.m
//  HW
//
//  Created by Zappts - Apple 1 on 12/16/16.
//  Copyright © 2016 Zappts Soluções. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showView:(id)sender {
    [UIView beginAnimations:nil context:nil];
    self.workingView.alpha = 1;
    [UIView commitAnimations];
}

- (IBAction)hideView:(id)sender {
    [UIView beginAnimations:nil context:nil];
    self.workingView.alpha = 0;
    [UIView commitAnimations];
}

@end
