//
//  favListMasterViewController.m
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import "favListMasterViewController.h"
#import "favListDetailViewController.h"

@interface favListMasterViewController ()<favListDetailViewControllerdelegate>

@end

@implementation favListMasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)loadTableForeview{

  NSString*fileName=[self fileName];

 self.myArray=[[NSKeyedUnarchiver unarchiveObjectWithFile:fileName] mutableCopy];
    

}


-(void)favListDetailViewWillDi:(favListDetailViewController*)favListDetailViewController{
    
        [self dismissViewControllerAnimated:YES completion:nil];

}


-(void) favListDetailViewReturn:(favListDetailViewController *)favListDetailViewController{
    
    // create object from favList class
    
    favList *myItems=[[favList alloc]init];
    myItems.name=favListDetailViewController.nameFav.text;
    myItems.urlAddress=favListDetailViewController.webAddress.text;
    myItems.imageUrl=favListDetailViewController.imageUrl.text;
    
    //replace onject at the index it got selected
    
    [self.myArray replaceObjectAtIndex:[[self.tableView indexPathForSelectedRow]row] withObject:myItems];
    
    NSString*fileName=self.fileName;
    
    [NSKeyedArchiver archiveRootObject:self.myArray toFile:fileName];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{

        [super viewDidLoad];

        self.navigationItem.rightBarButtonItem=self.editButtonItem;
    // Uncomment the following line to preserve selection between presentations.
    //     self.clearsSelectionOnViewWillAppear = NO;
    
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
    
    NSString* imageUrl=[[self.myArray objectAtIndex:indexPath.row]imageUrl];
    NSURL * imageURL = [NSURL URLWithString:imageUrl];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * myImage = [UIImage imageWithData:imageData];

//    [cell.imageView setImage:myImage];
    cell.imageView.image=myImage;
    
    // Configure the cell...
    cell.textLabel.text=[[self.myArray objectAtIndex:indexPath.row]name];
    cell.detailTextLabel.text=[[self.myArray objectAtIndex:indexPath.row]urlAddress];
    
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

        //edit table cell and write it the file
        
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
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"detail" sender:self];



}


-(NSString*)fileName
{
    NSString * documentDirectory=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask,YES).firstObject;
    
    NSString * fileName=[documentDirectory stringByAppendingPathComponent:@"myItems.plist"];
    
    return fileName;
    
}

-(void)doItforme{
   
    
            NSString*fileName=[self fileName];
    
    if(fileName){
        
        self.myArray=[[NSKeyedUnarchiver unarchiveObjectWithFile:fileName] mutableCopy];
    }else{
        self.myArray=[[NSMutableArray alloc]init];
    }
    

    //for not add mepty cell
    if((self.name.length!=0)&& (self.url.length!=0)&&(self.img.length!=0)){
        
        
    favList * myItem=[[favList alloc]init];
    myItem.name=self.name;
    myItem.urlAddress=self.url;
    myItem.imageUrl=self.img;
            [self.myArray addObject:myItem];
   
    }


   

 [NSKeyedArchiver archiveRootObject:self.myArray toFile:fileName];



}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //segue for cell to move the object to our detailViewController
    
        if([[segue identifier] isEqualToString:@"cellPush"]){
            
    favListDetailViewController * dvc=[segue destinationViewController];
               //get file path
            NSString*fileName=[self fileName];

            //create array from my file
           
            self.myArray=[[NSKeyedUnarchiver unarchiveObjectWithFile:fileName] mutableCopy];
            
            //get targeted object from table
            
            favList* myObject=[self.myArray objectAtIndex:[[self.tableView indexPathForSelectedRow]row]];
            
            //move strings to detailViewController
            
            dvc.name=myObject.name;
            dvc.url=myObject.urlAddress;
            dvc.img=myObject.imageUrl;
            
            dvc.delegate=self;
            

  }
    
    if([[segue identifier] isEqualToString:@"detail"]){
        
        favListViewController* fvc=[segue destinationViewController];
        
     fvc.url=[[self.myArray objectAtIndex:[[self.tableView indexPathForSelectedRow ]row]]urlAddress];

        /*
      //getting rid if navController but no backbutton yet
        [self.navigationController setNavigationBarHidden:YES animated:YES];
*/
    }
}



@end
