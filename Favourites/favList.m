//
//  favList.m
//  Favourites
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import "favList.h"

@implementation favList

//archiver method

-(void) encodeWithCoder:(NSCoder*)encoder{


    [encoder encodeObject:self.name forKey:@"name"];
        [encoder encodeObject:self.urlAddress forKey:@"urlAddress"];
        [encoder encodeObject:self.imageUrl forKey:@"imageUrl"];
}

//UnArchiver method

-initWithCoder:(NSCoder*)decoder{
    
    if (!(self=[super init]))return nil;
    
    self.name=[decoder decodeObjectForKey:@"name"];
        self.urlAddress=[decoder decodeObjectForKey:@"urlAddress"];
        self.imageUrl=[decoder decodeObjectForKey:@"imageUrl"];
    return self;
    
}



@end
