//
//  ProcessDataViewer.m
//  House
//
//  Created by Charles Leclercq on 28/06/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import "ProcessDataViewer.h"



@interface ProcessDataViewer ()

@end

@implementation ProcessDataViewer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sizex = self.view.frame.size.width;
    self.sizey = self.view.frame.size.height;
    
    
    self.textlabel = [[UILabel alloc]initWithFrame:CGRectMake(self.sizex/2 -150, 100, 300, 100)];
    self.textlabel.textAlignment = NSTextAlignmentCenter;
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
    self.textlabel.font = font;


    NSInteger averagePrice = 0;
    
    
    for (int i=0; i<[self.nTags count]; i++) {
        HouseTag *currTag= [self.nTags objectAtIndex:i];
        
        averagePrice += [currTag.price intValue];
        
    }
    NSInteger nItems=(int)[self.nTags count] ;
    NSInteger average;
    
    if(averagePrice !=0){
      average = averagePrice/nItems;
    }

  //  self.textlabel.text = [NSString stringWithFormat:@"the average price is %lu £.", average];

    
    
    
    [self.view addSubview:self.textlabel];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
