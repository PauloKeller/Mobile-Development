//
//  ViewController.m
//  NaviationControllerDemo
//
//  Created by Zappts - Apple 1 on 12/19/16.
//
//

#import "RootController.h"
#import "AdicionarController.h"
#import "ConfiguracoesController.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)abrirAdicionar:(id)sender {
    AdicionarController *c = [[AdicionarController alloc]init];
    [self.navigationController pushViewController:c animated:YES];
    
    
}

- (IBAction)abrirConfiguracoes:(id)sender {
    ConfiguracoesController *c = [[ConfiguracoesController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
    
    
}


- (void) viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    
}



@end
