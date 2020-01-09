//
//  MyItemsVC.m
//  House
//
//  Created by Charles Leclercq on 16/07/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import "MyItemsVC.h"

@interface MyItemsVC ()

@end

@implementation MyItemsVC
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
    
    self.selectedTag = [[NSDictionary alloc]init];
    
    
    [self.view addSubview:self.itemList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [sharedTagLibrary.scannedTags count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"newCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *tag = [sharedTagLibrary.scannedTags objectAtIndex:indexPath.row];
    cell.textLabel.text = [tag valueForKeyPath:@"description"];

    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.itemList deselectRowAtIndexPath:indexPath animated:NO];
    
    self.selectedTag = [sharedTagLibrary.scannedTags objectAtIndex:indexPath.row];
    [self goToViewer];
    
}
-(void)goToViewer{
    
    [self performSegueWithIdentifier:@"goToViewer" sender:self];
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"goToViewer"]){
        tagViewerVC *ViewController = (tagViewerVC *)segue.destinationViewController;
        ViewController.tag = self.selectedTag;
        //  NSLog(@"%@", currentSealObject.when);
        
    }
    
    
    
    
    
}

@end
