//
//  favListViewController.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "favListDetailViewController.h"

@interface favListViewController : UIViewController<UITextFieldDelegate>

//webView property
@property (weak, nonatomic) IBOutlet UIWebView *myWeb;

@property (weak, nonatomic) IBOutlet UITextField *urlTextField;

@property NSString*url;

@end
