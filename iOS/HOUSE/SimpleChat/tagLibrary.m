//
//  tagLibrary.m
//  House
//
//  Created by Charles Leclercq on 16/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import "tagLibrary.h"

@implementation tagLibrary

@synthesize ktagID,kDescription,kType,kPrice,kYear,propertyImage;

+ (id)sharedManager {
    static tagLibrary *sharedTagLibrary= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTagLibrary = [[self alloc] init];
    });
    return sharedTagLibrary;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
       self.scannedTags = [[NSMutableArray alloc]init];
        propertyImage = [[UIImage alloc]init];

    
    
    }
    
    return self;
}

-(void)tagLibType01{
    _tagLibrary = @[
                    
                    @{
                        @"keyID"  : @"438819",
                        @"description":@"Underfloor insulation",
                        @"type":@"underinsulation",
                        @"price":@"2500",
                        @"year":@"25",
                        @"annual_savings_on_bills":@"220",
                        @"annual_co2_savings":@"900",
                        @"information":@"underfloor",
                        @"image":@"tag_image_01.png"
                        },
                    
                    
                    @{
                        @"keyID"  : @"414758",
                        @"description":@"Passive stack ventilation with heat recovery",
                        @"type":@"PVHR",
                        @"price":@"3000",
                        @"year":@"20",
                        @"annual_savings_on_bills":@"160",
                        @"annual_co2_savings":@"600",
                        @"information":@"PVHR",
                        @"image":@"tag_image_01.png"
                        },
                    
                    
                    @{
                        @"keyID"  : @"424518",
                        @"description":@"Internal wall (solid) insulation",
                        @"type":@"IWI",
                        @"price":@"8000",
                        @"year":@"36",
                        @"annual_savings_on_bills":@"260",
                        @"annual_co2_savings":@"1100",
                        @"information":@"IWI",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  : @"416587",
                        @"description":@"Cavity wall insulation (hard to treat)",
                        @"type":@"CWIhard",
                        @"price":@"1875",
                        @"year":@"42",
                        @"annual_savings_on_bills":@"160",
                        @"annual_co2_savings":@"650",
                        @"information":@"CWIhard",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  : @"421319",
                        @"description":@"Cavity wall insulation (easy to treat)",
                        @"type": @"CWIeasy",
                        @"price":@"475",
                        @"year":@"42",
                        @"annual_savings_on_bills":@"160",
                        @"annual_co2_savings":@"650",
                        @"information":@"CWIeasy",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  : @"422923",
                        @"description":@"External (solid) wall insulation",
                        @"type":@"EWI",
                        @"price":@"12000",
                        @"year":@"36",
                        @"annual_savings_on_bills":@"260",
                        @"annual_co2_savings":@"1100",
                        @"information":@"EWI",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  : @"410113",
                        @"description":@"Loft insulation",
                        @"type":@"Loft",
                        @"price":@"250",
                        @"year":@"42",
                        @"annual_savings_on_bills":@"15",
                        @"annual_co2_savings":@"55",
                        @"information":@"Loft",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  : @"424550",
                        @"description":@"Double glazing",
                        @"type": @"doubleglazing",
                        @"price":@"4500",
                        @"year":@"20",
                        @"annual_savings_on_bills":@"85",
                        @"annual_co2_savings":@"355",
                        @"information":@"doubleGlazing",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  :@"422912",
                        @"description":@"Condensing boiler",
                        @"type":@"boiler",
                        @"price":@"2500",
                        @"year":@"12",
                        @"annual_savings_on_bills":@"45.48",
                        @"annual_co2_savings":@"117.3",
                        @"information":@"boiler",
                        @"image":@"tag_image_01.png"
                        },//complete
                    
                    @{
                        @"keyID"  : @"461802",
                        @"description":@"1 kW Solar Photovoltaic Panels",
                        @"type": @"1kWPV",
                        @"price":@"1000",
                        @"year":@"25",
                        @"annual_savings_on_bills":@"40",
                        @"annual_co2_savings":@"600",
                        @"information":@"1kWPV",
                        @"image":@"tag_image_01.png"
                        },
                    
                    @{
                        @"keyID"  : @"485230",
                        @"description":@"3 kW Solar Photovoltaic Panels",
                        @"type":@"3kWPV",
                        @"price":@"3000",
                        @"year": @"25",
                        @"annual_savings_on_bills":@"40",
                        @"annual_co2_savings":@"600",
                        @"information":@"3kWPV",
                        @"image":@"tag_image_01.png"
                        },
                    
                    
                    @{
                        @"keyID"  : @"437231",
                        @"description":@"Improved heating controls",
                        @"type":@"heatingcontrol",
                        @"price":@"250",
                        @"year": @"12",
                        @"annual_savings_on_bills":@"57.38",
                        @"annual_co2_savings":@"223.4",
                        @"information":@"heatingcontrol",
                        @"image":@"tag_image_01.png"
                        },
                    
                    @{
                        @"keyID"  : @"421322",
                        @"description":@"Energy efficient lighting",
                        @"type":@"light",
                        @"price":@"200",
                        @"year": @"6",
                        @"annual_savings_on_bills":@"21.16",
                        @"annual_co2_savings":@"27.8",
                        @"information":@"light",
                        @"image":@"tag_image_01.png"
                        },
                    
                    @{
                        @"keyID"  : @"421366",
                        @"description":@"Solar water heating",
                        @"type":@"solarwater",
                        @"price":@"2475",
                        @"year": @"20",
                        @"annual_savings_on_bills":@"29.93",
                        @"annual_co2_savings":@"114.8",
                        @"information":@"solarwater",
                        @"image":@"tag_image_01.png"
                        },
                    
                    ];

}
-(void)tagLibType02{
    //replace the content with a new library
    _tagLibrary = @[
                    
                    @{
                        @"keyID"  : @"438819",
                        @"description":@"Underfloor insulation",
                        @"type":@"underinsulation",
                        @"price":@"2500",
                        @"year":@"25",
                        @"annual_savings_on_bills":@"220",
                        @"annual_co2_savings":@"900",
                        @"information":@"underfloor",
                        @"image":@"tag_image_01.png"
                        },
                    
                    
                    @{
                        @"keyID"  : @"414758",
                        @"description":@"Passive stack ventilation with heat recovery",
                        @"type":@"PVHR",
                        @"price":@"3000",
                        @"year":@"20",
                        @"annual_savings_on_bills":@"160",
                        @"annual_co2_savings":@"600",
                        @"information":@"PVHR",
                        @"image":@"tag_image_01.png"
                        },
                    ];
    


}
-(void)tagLibType03{
//replace the content with a new library
    _tagLibrary = @[
                    
                    @{
                        @"keyID"  : @"438819",
                        @"description":@"Underfloor insulation",
                        @"type":@"underinsulation",
                        @"price":@"2500",
                        @"year":@"25",
                        @"annual_savings_on_bills":@"220",
                        @"annual_co2_savings":@"900",
                        @"information":@"underfloor",
                        @"image":@"tag_image_01.png"
                        },
                    
                    
                    @{
                        @"keyID"  : @"414758",
                        @"description":@"Passive stack ventilation with heat recovery",
                        @"type":@"PVHR",
                        @"price":@"3000",
                        @"year":@"20",
                        @"annual_savings_on_bills":@"160",
                        @"annual_co2_savings":@"600",
                        @"information":@"PVHR",
                        @"image":@"tag_image_01.png"
                        },
                    @{
                        @"keyID"  : @"414758",
                        @"description":@"Passive stack ventilation with heat recovery",
                        @"type":@"PVHR",
                        @"price":@"3000",
                        @"year":@"20",
                        @"annual_savings_on_bills":@"160",
                        @"annual_co2_savings":@"600",
                        @"information":@"PVHR",
                        @"image":@"tag_image_01.png"
                        },
                    ];


}

-(void)resetArrayOfTags{
    
    [_scannedTags removeAllObjects];

}

-(int)returnPrice{
    
    int totalPrice = 0;
    
    
    for (int i=0; i< [_scannedTags count]; i++) {
        NSDictionary *tag = [_scannedTags objectAtIndex:i];
        
        
        totalPrice += [[tag objectForKey:@"price"] intValue];
    }

    return totalPrice;
}

-(int)returnBillSaving{
    
    int billSaving = 0;
    
    
    for (int i=0; i< [_scannedTags count]; i++) {
        NSDictionary *tag = [_scannedTags objectAtIndex:i];
        
        
        billSaving += [[tag objectForKey:@"annual_savings_on_bills"] intValue];
    }
    
    return billSaving;
}

-(int)returnCO2saving{
    
    int co2Saving = 0;
    
    
    for (int i=0; i< [_scannedTags count]; i++) {
        NSDictionary *tag = [_scannedTags objectAtIndex:i];
        
        
        co2Saving += [[tag objectForKey:@"annual_co2_savings"] intValue];
    }
    
    return co2Saving;
}
@end
