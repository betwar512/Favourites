//
//  favListDetailViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "favListViewController.h"
#import "favListMasterViewController.h"
#import "favList.h"


@class favListDetailViewController;

@protocol FavListDetailViewControllerDelegate <NSObject>

-(void)favListDetailViewReturn:(favListDetailViewController*)favListDetailViewController;


-(void)favListDetailViewControllerDisspears:(favListDetailViewController*)favListDetailViewController;
@end

@interface favListDetailViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameFav;
@property (weak, nonatomic) IBOutlet UITextField *webAddress;
@property (weak, nonatomic) IBOutlet UITextField *imageUrl;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property NSString*textFromF;


@property NSString*name;
@property NSString*url;
@property NSString*img;

@property id<FavListDetailViewControllerDelegate> delegate;

-(void) loadItForme;

@end
