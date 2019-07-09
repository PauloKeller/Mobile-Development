//
//  AdicionarController.m
//  NaviationControllerDemo
//
//  Created by Zappts - Apple 1 on 12/19/16.
//
//

#import "AdicionarController.h"

@interface AdicionarController ()

@end

@implementation AdicionarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
}

@end
