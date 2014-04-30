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




@property NSString* name;
@property NSString* url;
@property NSString*img;

//@property NSString* mine;

@property (strong,retain)NSMutableArray*myArray;

-(void) doItforme;

-(void)loadTableForeview;





@end
