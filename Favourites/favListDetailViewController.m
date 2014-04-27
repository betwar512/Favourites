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
    
    if(self.textFromF){
    self.webAddress.text=self.textFromF;
    
    }else{
    
    self.nameFav.text=self.name;
    self.webAddress.text=self.url;
    self.imageUrl.text=self.img;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)viewWillDisappear:(BOOL)animated{
    
    [self.delegate favListDetailViewControllerDisspears:self];
  
}

*/
- (IBAction)doneButton:(id)sender {
    
  //  need it in your button action
    
    [self performSegueWithIdentifier:@"doneEdite" sender:sender];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    return YES;
}


//method use for hide keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:(YES)];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"doneEdite"]){
        favListMasterViewController *fmv=[segue destinationViewController];
        // perform segue for tableViewController
        fmv.name=self.nameFav.text;
        fmv.url=self.webAddress.text;
        fmv.img=self.imageUrl.text;
        [fmv doItforme];

        

        
    
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller
}

-(void)loadItForme{

}


@end
