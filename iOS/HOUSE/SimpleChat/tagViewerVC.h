//
//  tagViewerVC.h
//  House
//
//  Created by Charles Leclercq on 17/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tagViewerVC : UIViewController

@property NSDictionary *tag;
@property CGFloat sizex;
@property CGFloat sizey;
@property UIScrollView *scrollView;


@property UILabel *priceLabel ;
@property UILabel *typeLabel ;
@property UILabel *yearLabel ;
@property UILabel *Co2Label ;
@property UILabel *billLabel;
@property UILabel *descriptionLabel;
@property UITextView *infoView;


@end
