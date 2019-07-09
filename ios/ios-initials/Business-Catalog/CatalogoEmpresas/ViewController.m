//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by Zappts - Apple 1 on 12/16/16.
//
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Esconde a menssagem de sucesso
    self.avisoSucessoLabel.hidden = YES;
    
}


- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) incrementadorAlterado:(id)sender {
    //Define a quantidade de funcionarios da empresa
    UIStepper *incrementador = (UIStepper *)sender;
    self.quantidadeField.text = [NSString stringWithFormat:@"%d", (int)incrementador.value];
    
}


- (void) salvaEmpresa:(Empresa *) novaEmpresa {
    //Salva a empresa
    if (!catalogo) {
        catalogo = [[NSMutableArray alloc] init];
    }
    [catalogo addObject:novaEmpresa];
    
    self.avisoSucessoLabel.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.avisoSucessoLabel.hidden = NO;
        self.avisoSucessoLabel.alpha = 1;
    } completion:^(BOOL finalizado) {
        [UIView animateWithDuration:1 animations:^{
            self.avisoSucessoLabel.hidden = YES;
        }];
    }];
}


- (IBAction) salvar:(id)sender {
    //Libera o teclado
    [self.nomeField resignFirstResponder];
    
    //Cria a empresa (Constructor)
    Empresa *e = [[Empresa alloc] init];
    e.nome = self.nomeField.text;
    e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
    
    [self salvaEmpresa:e];
    [self mostracatalogo];
    
}


-(void) mostracatalogo {
    //Mostra no log as empresas criadas
    NSLog(@"******* Listando todas empresas *******");
    
    for (Empresa *empresa in catalogo) {
        NSLog(@"A empresa %@ tem %d funcionários", empresa.nome, empresa.quantidadeFuncionarios);
    }
    
}


@end
