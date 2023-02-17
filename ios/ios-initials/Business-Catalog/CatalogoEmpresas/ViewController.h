//
//  ViewController.h
//  CatalogoEmpresas
//
//  Created by Zappts - Apple 1 on 12/16/16.
//
//

//Arquivo .H serve para declaracoes conectando objetos da main aqui!
//Objective C nao existe packges igual Java ou C#



#import <UIKit/UIKit.h>
@interface ViewController : UIViewController {
    NSMutableArray *catalogo;
    
}


@property (strong, nonatomic) IBOutlet UITextField *nomeField;
@property (strong, nonatomic) IBOutlet UITextField *quantidadeField;
@property (strong, nonatomic) IBOutlet UILabel *avisoSucessoLabel;
- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;



@end

