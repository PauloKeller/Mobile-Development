//
//  detalhesViewController.m
//  DemonstracaoStoryboards
//
//  Created by Zappts - Apple 1 on 12/19/16.
//
//

#import "detalhesViewController.h"

@interface detalhesViewController ()

@end

@implementation detalhesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _infoLabel.text = _descricaoDetalhes;
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

@end
