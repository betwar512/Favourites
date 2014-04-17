//
//  favListViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class favListViewController;

@protocol favListViewControllerDelegate <NSObject>

@end
@interface favListViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *myWeb;

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property id <favListViewControllerDelegate> delegate;

@end
