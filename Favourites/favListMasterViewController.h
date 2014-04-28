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

@class favListMasterViewController;
@protocol favlistMasterViewControllerDelegate <NSObject>

-(void)dissmissMasterview:(favListMasterViewController*)favListMasterViewController;

@end

@interface favListMasterViewController : UITableViewController






@property id <favlistMasterViewControllerDelegate> delegate;

@property NSString* name;
@property NSString* url;
@property NSString*img;

-(void) doItforme;
-(void)loadTableForeview;
@property (strong,retain)NSMutableArray*myArray;



@end
