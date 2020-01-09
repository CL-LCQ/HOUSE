//
//  tagLibrary.h
//  House
//
//  Created by Charles Leclercq on 16/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface tagLibrary : NSObject

//@property (strong, nonatomic) NSDictionary *tagLibrary;
@property (strong, nonatomic) NSArray *tagLibrary;
@property (strong, nonatomic) NSArray *tagLib01;
@property (strong, nonatomic) NSArray *tagLib02;
@property (strong, nonatomic) NSArray *tagLib03;

@property (strong, nonatomic) NSMutableArray *scannedTags;

@property NSString *const ktagID;
@property NSString *const kDescription;
@property NSString *const kType;
@property NSString *const kPrice;
@property NSString *const kYear;

@property UIImage *propertyImage;


+ (id)sharedManager;
-(void)resetArrayOfTags;
-(int)returnPrice;
-(int)returnCO2saving;
-(int)returnBillSaving;
-(void)tagLibType01;
-(void)tagLibType02;
-(void)tagLibType03;




@end
