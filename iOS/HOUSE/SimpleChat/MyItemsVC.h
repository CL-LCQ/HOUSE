//
//  MyItemsVC.h
//  House
//
//  Created by Charles Leclercq on 16/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tagLibrary.h"
#import "tagViewerVC.h"

@class  tagLibrary;

@interface MyItemsVC : UIViewController

@property tagLibrary *sharedTagLibrary;

@property NSDictionary *selectedTag;

@property UITableView* itemList;
@property CGFloat sizex;
@property CGFloat sizey;


@end
