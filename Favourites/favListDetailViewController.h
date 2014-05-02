//
//  favListDetailViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//
@class favListDetailViewController;

@protocol favListDetailViewControllerdelegate <NSObject>

-(void)favListDetailViewReturn:(favListDetailViewController*)favListDetailViewController;

-(void)favListDetailViewWillDi:(favListDetailViewController*)favListDetailViewController;

@end

#import <UIKit/UIKit.h>
#import "favListViewController.h"
#import "favListMasterViewController.h"
#import "favList.h"




@interface favListDetailViewController : UIViewController<UITextFieldDelegate>

//textFields and image properties

@property (weak, nonatomic) IBOutlet UITextField *nameFav;
@property (weak, nonatomic) IBOutlet UITextField *webAddress;
@property (weak, nonatomic) IBOutlet UITextField *imageUrl;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

///String for passing viewController textField.text to detailView
@property NSString*textFromF;

//geting from favLisMasterView

@property NSString*name;
@property NSString*url;
@property NSString*img;

@property id<favListDetailViewControllerdelegate> delegate;



@end
