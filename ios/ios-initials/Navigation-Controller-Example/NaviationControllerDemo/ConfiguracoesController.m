//
//  ConfiguracoesController.m
//  NaviationControllerDemo
//
//  Created by Zappts - Apple 1 on 12/19/16.
//
//

#import "ConfiguracoesController.h"
#import "DadosAcessoController.h"

@interface ConfiguracoesController ()

@end

@implementation ConfiguracoesController

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

- (IBAction)abreDadosAcesso:(id)sender {
    DadosAcessoController *c = [[DadosAcessoController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
    

}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
}


@end
