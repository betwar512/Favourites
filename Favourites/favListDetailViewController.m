//
//  favListDetailViewController.m
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import "favListDetailViewController.h"


@interface favListDetailViewController ()

@end

@implementation favListDetailViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.webAddress.text=self.textFromF;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
/*
    favList*myItems=[[favList alloc]init];
    myItems.name=self.nameFav.text;
    myItems.urlAddress=self.webAddress.text;
    myItems.imageUrl=self.imageUrl.text;
 
  */
    [self.delegate favListDetailViewControllerDisspears:self];
        [self dismissViewControllerAnimated:YES completion:nil];
    
    
    return YES;

}
- (IBAction)doneButton:(id)sender {
    
  //  need it in your button action
    
    [self performSegueWithIdentifier:@"doneEdite" sender:sender];
    
}



// In a storyboard-based application, you will often want to do a little preparation before navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"doneEdite"]){

        // perform segue for tableViewController
    
    
    }

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.



 
}


@end
