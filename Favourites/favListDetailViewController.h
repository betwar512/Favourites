//
//  favListDetailViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface favListDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameFav;
@property (weak, nonatomic) IBOutlet UITextField *webAddress;
@property (weak, nonatomic) IBOutlet UITextField *imageUrl;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end
