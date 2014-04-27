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



@interface favListMasterViewController : UITableViewController








@property NSString* name;
@property NSString* url;
@property NSString*img;

-(void) doItforme;
@property (strong,retain)NSMutableArray*myArray;



@end
