//
//  FavouritesTests.m
//  FavouritesTests
//
//  Created by Abbi H Safaie on 16/04/2014.
//  Copyright (c) 2014 Abbas H Safaie. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "favList.h"

@interface FavouritesTests : XCTestCase
@property NSMutableArray*myArray;



@end

@implementation FavouritesTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.myArray=[[NSMutableArray alloc]init];
    
    

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    favList *myItem=[[favList alloc]init];
    myItem.name=@"google";
    myItem.urlAddress=@"google.com";
    myItem.imageUrl=@"1image";
    XCTAssertEqualObjects(myItem.name,@"google", @"what?");
    
    
    [super tearDown];
}
-(NSString*)fileName
{
 NSString * documentDirectory=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask,YES).firstObject;
   
    NSString * fileName=[documentDirectory stringByAppendingPathComponent:@"myItems.plist"];
   
    return fileName;

}


- (void)testSave
{
    NSString*fileName=[self fileName];
    
    favList*myItem=[[favList alloc]init];
    myItem.name=@"google";
    myItem.urlAddress=@"www.google.com";
    myItem.imageUrl=@" 1image";
    
        [self.myArray addObject:myItem];
    
    
    myItem=[[favList alloc]init];
    myItem.name=@"yahoo";
    myItem.urlAddress=@"yahoo.com";
    myItem.imageUrl=@"2image";

        [self.myArray addObject:myItem];
    
    myItem=[[favList alloc]init];
    myItem.name=@"ign";
    myItem.urlAddress=@"ign.com.au";
    myItem.imageUrl=@"3image";
    
    [self.myArray addObject:myItem];
    
    BOOL success=[NSKeyedArchiver archiveRootObject:self.myArray toFile:fileName];
    
    XCTAssertTrue(success, @"could not save to file '%@' ",fileName);
    
}

-(void) testLoad
{
    NSString* fileName=[self fileName];
    [self testSave];
    
    NSMutableArray *loadMyArray=[[NSKeyedUnarchiver unarchiveObjectWithFile:fileName] mutableCopy];
    XCTAssertTrue([loadMyArray isKindOfClass:[NSMutableArray class]], @"expected Array");
                   
    XCTAssertTrue(loadMyArray.count== 3, @"expected 3");

    
}


@end
