//
//  ListarViewController.m
//  DemonstracaoStoryboards
//
//  Created by Zappts - Apple 1 on 12/19/16.
//
//

#import "ListarViewController.h"
#import "detalhesViewController.h"

@interface ListarViewController ()

@end

@implementation ListarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)abrirEditarScene:(id)sender {
    [self performSegueWithIdentifier:@"listarParaEditarSegue" sender:sender];
    
    
}

- (IBAction)abrirDetalhesScene:(id)sender {
    [self performSegueWithIdentifier:@"listarParaDetalhesSegue" sender:sender];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"listarParaDetalhesSegue"]){
        detalhesViewController *dc = segue.destinationViewController;
        dc.descricaoDetalhes = @"Conteúdo vindo da tela de listagem";
    }
    
    
}




@end
