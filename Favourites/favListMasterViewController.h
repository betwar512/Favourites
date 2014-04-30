//
//  favListMasterViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "favList.h"

#import "favListDetailViewController.h"
#import "favListViewController.h"


@interface favListMasterViewController : UITableViewController



@property NSString* name;
@property NSString* url;
@property NSString*img;


@property (strong,retain)NSMutableArray*myArray;

-(void) doItforme;

-(void)loadTableForeview;





@end
