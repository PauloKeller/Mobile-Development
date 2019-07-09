//
//  ViewController.h
//  HW
//
//  Created by Zappts - Apple 1 on 12/16/16.
//  Copyright © 2016 Zappts Soluções. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)showView:(id)sender;
- (IBAction)hideView:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *workingView;


@end

