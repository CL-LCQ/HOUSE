//
//  HouseTag.h
//  House
//
//  Created by Charles Leclercq on 28/06/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HouseTag : NSData



@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *year;

@property (strong, nonatomic) NSString *descriptions;
@property (strong, nonatomic) NSString *informations;


@property (strong, nonatomic) NSString *installationcost;
@property (strong, nonatomic) NSString *annualCO2saving;

@end
