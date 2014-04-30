//
//  favListViewController.m
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import "favListViewController.h"


@interface favListViewController ()

@end

@implementation favListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSString*urlInCom=[NSString stringWithFormat:@"https://%@",self.url];
    
    NSString*urlAdress=urlInCom;
    
    NSURL *url=[NSURL URLWithString:urlAdress];
    
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    //load to web view
    
    [self.myWeb loadRequest:request];

    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//plus button for going to detailViewController



//plus button for going to masterViewController

- (IBAction)favButton:(id)sender {
}

//method for return textField entry

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    self.url=self.urlTextField.text;

//set url entry
    
    NSString*urlInCom=[NSString stringWithFormat:@"https://%@",self.url];
    
    NSString*urlAdress=urlInCom;
    
    NSURL *url=[NSURL URLWithString:urlAdress];

    NSURLRequest*request=[NSURLRequest requestWithURL:url];
//load to web view
    
    [self.myWeb loadRequest:request];
    return YES;
}

//method use for hide keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:(YES)];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    

   //first segue for add button add identifier later
    if([[segue identifier] isEqualToString:@"urlGetter"]){
    
    // Get the new view controller using [segue destinationViewController].
    favListDetailViewController* flvc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    flvc.textFromF=self.urlTextField.text;
    }
    
    /* segue for bookmark bar button from webView page to our table
     excute the methood loadTableview to open file write to Array and load table with file */
        if([[segue identifier] isEqualToString:@"favTable"]){
    
        favListMasterViewController*fmv=[segue destinationViewController];
        [fmv loadTableForeview];
            
            
    }
    
}



@end
