//
//  favListMasterViewController.m
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import "favListMasterViewController.h"
#import "favListDetailViewController.h"

@interface favListMasterViewController ()

@end

@implementation favListMasterViewController

/*
-(void)favListDetailViewReturn:(favListDetailViewController*)favListDetailViewController{


    [self dismissViewControllerAnimated:YES completion:nil];

}




-(void) favListDetailViewControllerDisspears:(favListDetailViewController *)favListDetailViewController{

    favList *myItems=[[favList alloc]init];
    myItems.name=favListDetailViewController.nameFav.text;
    myItems.urlAddress=favListDetailViewController.webAddress.text;
    myItems.imageUrl=favListDetailViewController.imageUrl.text;
    [self.myArray addObject:myItems];

         [self.tableView reloadData];
}


*/


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

        [super viewDidLoad];

        self.navigationItem.rightBarButtonItem=self.editButtonItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    


    return self.myArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[[self.myArray objectAtIndex:indexPath.row]name];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
                [self.myArray removeObjectAtIndex:indexPath.row];
                    NSString*fileName=[self fileName];
        [NSKeyedArchiver archiveRootObject:self.myArray toFile:fileName];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:
         UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
-(NSString*)fileName
{
    NSString * documentDirectory=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask,YES).firstObject;
    
    NSString * fileName=[documentDirectory stringByAppendingPathComponent:@"myItems.plist"];
    
    return fileName;
    
}

-(void)doItforme{

    favList * myItem=[[favList alloc]init];
    myItem.name=self.name;
    myItem.urlAddress=self.url;
    myItem.imageUrl=self.img;
    
        NSString*fileName=[self fileName];

    if(fileName){
        
        self.myArray=[[NSKeyedUnarchiver unarchiveObjectWithFile:fileName] mutableCopy];
    }else{
        self.myArray=[[NSMutableArray alloc]init];
    }


    [self.myArray addObject:myItem];
 [NSKeyedArchiver archiveRootObject:self.myArray toFile:fileName];



}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if([[segue identifier] isEqualToString:@"cellPush"]){
    favListDetailViewController * dvc=[segue destinationViewController];
            NSString*fileName=[self fileName];
           self.myArray=[[NSKeyedUnarchiver unarchiveObjectWithFile:fileName] mutableCopy];
                  favList* myObject=[self.myArray objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
            dvc.name=myObject.name;
            dvc.url=myObject.urlAddress;
            dvc.img=myObject.imageUrl;

    // Pass the selected object to the new view controller.
  }
}



@end
