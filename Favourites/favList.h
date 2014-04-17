//
//  favList.h
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface favList : NSObject

  //abs class to create object with it latter

//class properties ass name urlAddress and imageURL

@property NSString * name;

@property NSString * urlAddress;

@property NSString* imageUrl;

-(void) encodeWithCoder:(NSCoder*)encoder;
-initWithCoder:(NSCoder*)decoder;


@end
