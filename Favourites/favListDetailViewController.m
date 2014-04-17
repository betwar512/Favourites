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



-(void) getMyUrlTextFormePlz{
   
    [self dismissViewControllerAnimated:YES completion:nil];
    self.webAddress.text=self.textFromF;

}

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    // Get the new view controller using [segue destinationViewController].
    favListViewController* flvc = segue.destinationViewController;
    // Pass the selected object to the new view controller.
     flvc.delegate = self;
    
 
}
*/
@end
