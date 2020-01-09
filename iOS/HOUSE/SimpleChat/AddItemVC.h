//
//  AddItemVC.h
//  House
//
//  Created by Charles Leclercq on 16/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tagLibrary.h"

@class  tagLibrary;


@interface AddItemVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property tagLibrary *sharedTagLibrary;

//@property(nonatomic, assign) id<UITableViewDataSource> dataSource;

@property UITableView* itemList;
@property CGFloat sizex;
@property CGFloat sizey;


@end
