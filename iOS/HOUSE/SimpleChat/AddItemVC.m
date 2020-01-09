//
//  AddItemVC.m
//  House
//
//  Created by Charles Leclercq on 16/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import "AddItemVC.h"

@interface AddItemVC ()

@end

@implementation AddItemVC
@synthesize  sharedTagLibrary,sizex,sizey;

- (void)viewDidLoad {
    [super viewDidLoad];
    sharedTagLibrary = [tagLibrary sharedManager];
    
    sizex = self.view.frame.size.width;
    sizey = self.view.frame.size.height;
    
    self.itemList = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.itemList.frame = CGRectMake(0,0, sizex, sizey );
    
    self.itemList.delegate = self;
    self.itemList.dataSource = self;
    

    
  //  self.navigationController.navigationBar.topItem.title = @"Done";
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Done";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    [self.view addSubview:self.itemList];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [sharedTagLibrary.tagLibrary count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    NSDictionary *tag = [sharedTagLibrary.tagLibrary objectAtIndex:indexPath.row];
    cell.textLabel.text = [tag valueForKeyPath:@"description"];
    

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.itemList deselectRowAtIndexPath:indexPath animated:NO];
    
       // UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
    
    
        UITableViewCell *cell = [self.itemList cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryNone) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            //add in array
           // [self.recipients addObject:user.objectId];
            [sharedTagLibrary.scannedTags addObject:[sharedTagLibrary.tagLibrary objectAtIndex:indexPath.row]];

    
        }
        else{
            //remove from array
            cell.accessoryType = UITableViewCellAccessoryNone;
           
            [sharedTagLibrary.scannedTags removeObject:[sharedTagLibrary.tagLibrary objectAtIndex:indexPath.row]];

        }
    
     //   NSLog(@"%@", self.recipients);
    
    
    
}


@end
