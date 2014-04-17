//
//  favListMasterViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "favListDetailViewController.h"
#import "favList.h"

@interface favListMasterViewController : UITableViewController<favListDetailViewControllerDelegate>

@property NSMutableArray *myArray;

@end
