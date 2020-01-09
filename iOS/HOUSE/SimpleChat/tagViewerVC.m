//
//  tagViewerVC.m
//  House
//
//  Created by Charles Leclercq on 17/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import "tagViewerVC.h"

@interface tagViewerVC ()

@end

@implementation tagViewerVC

@synthesize scrollView, priceLabel,typeLabel,yearLabel,Co2Label,billLabel,descriptionLabel,infoView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sizex = self.view.frame.size.width;
    self.sizey = self.view.frame.size.height;
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

-(void)viewWillAppear:(BOOL)animated{
    
    infoView = [[UITextView alloc]init];
    
    
    [self LayoutSubviews];
    
 
    
    NSURL *rtfPath = [[NSBundle mainBundle] URLForResource: [self.tag valueForKeyPath:@"information"] withExtension:@"rtf"];
    
    NSAttributedString *attributedStringWithRtf = [[NSAttributedString alloc]   initWithFileURL:rtfPath options:@{NSDocumentTypeDocumentAttribute:NSRTFTextDocumentType} documentAttributes:nil error:nil];
    
    infoView.attributedText=attributedStringWithRtf;
    
    
    
    
    

    infoView.editable = NO;
    infoView.selectable = NO;
    
    

    
    
}


- (void) orientationChanged:(NSNotification *)note
{
    
    
    //detects orientation
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            self.sizex = self.view.frame.size.width;
            self.sizey = self.view.frame.size.height;
            
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            self.sizex = self.view.frame.size.width;
            self.sizey = self.view.frame.size.height;
            break;
        case UIDeviceOrientationLandscapeRight:
            self.sizex = self.view.frame.size.width;
            self.sizey = self.view.frame.size.height;
            
            break;
            
        default:
            break;
    };
    
    //depending on orientation rearanges the layout
    [self LayoutSubviews];
    
}

-(void)LayoutSubviews{

    [infoView removeFromSuperview];
    infoView.frame = CGRectMake(5, 0, self.sizex-10, self.sizey);
    [self.view addSubview:infoView];
    

    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
