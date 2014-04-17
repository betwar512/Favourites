//
//  favListViewController.m
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import "favListViewController.h"

@interface favListViewController ()
@property NSString*url;
@end

@implementation favListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//plus button for going to detailViewController

- (IBAction)addButton:(id)sender {
}

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



@end
