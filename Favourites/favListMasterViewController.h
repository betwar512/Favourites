//
//  favListMasterViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "favList.h"
#import "favListViewController.h"
#import "favListDetailViewController.h"



@interface favListMasterViewController : UITableViewController<favListDetailViewControllerdelegate>



// all properties to sign fro passing into table
@property NSString* name;
@property NSString* url;
@property NSString*img;

//myArray property 

@property (strong,retain)NSMutableArray*myArray;

//method for getting our peoperty from Detailview

-(void) doItforme;


//load table and create Array
-(void)loadTableForeview;





@end
