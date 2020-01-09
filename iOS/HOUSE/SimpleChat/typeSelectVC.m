//
//  typeSelectVC.m
//  HOUSE
//
//  Created by Charles Leclercq on 04/09/2016.
//  Copyright © 2016 redbear. All rights reserved.
//

#import "typeSelectVC.h"

@interface typeSelectVC ()

@end

@implementation typeSelectVC

@synthesize button1,button2,button3, sharedTagLibrary,colors;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sizex = self.view.frame.size.width;
    self.sizey = self.view.frame.size.height;
    CGFloat height =self.sizey/3;
    
    colors = [[Colors alloc]init];
    
    sharedTagLibrary = [tagLibrary sharedManager];

    button1 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"S" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(goToHome:) forControlEvents:UIControlEventTouchUpInside];
      button1.tag = 1;
    
    button2 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"type 2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(goToHome:)  forControlEvents:UIControlEventTouchUpInside];
        button2.tag = 2;
    
    button3.titleLabel.textAlignment = NSTextAlignmentCenter;
    button3 =  [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"type 3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(goToHome:)  forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 3;
    
    button1.frame = CGRectMake(self.sizex/2 - self.sizex/6, 0 + height/6, self.sizex/3, self.sizex/3);
    button2.frame = CGRectMake(self.sizex/2 - self.sizex/6 , height+ height/6, self.sizex/3, self.sizex/3);
    button3.frame = CGRectMake(self.sizex/2 - self.sizex/6 , height*2+ height/6, self.sizex/3, self.sizex/3);
    
    UILabel *btnLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(20, height/6+button1.frame.size.height, self.sizex-40, 20)];
    btnLabel1.text = @"A semi-detached house built in the 1930s";
    btnLabel1.textColor = [UIColor blackColor];
    btnLabel1.font =[UIFont fontWithName:@"HelveticaNeue-Light" size:self.sizey/50];
    btnLabel1.textAlignment = NSTextAlignmentCenter;

    
    UILabel *btnLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(20,  height+ height/6+button1.frame.size.height, self.sizex-40, 20)];
    btnLabel2.text = @"A detached house built in the 1930s";
    btnLabel2.textColor = [UIColor blackColor];
    btnLabel2.font =[UIFont fontWithName:@"HelveticaNeue-Light" size:self.sizey/50];
    btnLabel2.textAlignment = NSTextAlignmentCenter;

    
    UILabel *btnLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(20, height*2+ height/6+button1.frame.size.height, self.sizex-40, 20)];
    btnLabel3.text = @"A terraced house built in the 1930s";
    btnLabel3.textColor = [UIColor blackColor];
    btnLabel3.font =[UIFont fontWithName:@"HelveticaNeue-Light" size:self.sizey/50];
    btnLabel3.textAlignment = NSTextAlignmentCenter;

    
    
    UIImage *house01 = [UIImage imageNamed:@"HOUSE_CAPTURE_V01.jpg"];
    UIImage *house02 = [UIImage imageNamed:@"HOUSE_CAPTURE_TYPE_02_V01.jpg"];
    UIImage *house03 = [UIImage imageNamed:@"HOUSE_CAPTURE_TYPE_03_V01.jpg"];
    
 
    
    [button1 setImage:house01 forState:UIControlStateNormal];
  [button2 setImage:house02 forState:UIControlStateNormal];
 [button3 setImage:house03 forState:UIControlStateNormal];
    
    [[button1 layer] setBorderWidth:2.0f];
    [[button1 layer] setBorderColor:colors.teal.CGColor];
    [[button2 layer] setBorderWidth:2.0f];
    [[button2 layer] setBorderColor:colors.teal.CGColor];
    [[button3 layer] setBorderWidth:2.0f];
    [[button3 layer] setBorderColor:colors.teal.CGColor];
    
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:btnLabel1];
    [self.view addSubview:btnLabel2];
    [self.view addSubview:btnLabel3];

    
}

-(void)goToHome:(id)sender{
   UIButton *button = (UIButton*)sender;
    int type = button.tag;
    
    if (type == 1) {
        [sharedTagLibrary tagLibType01];
    }
    else if(type == 2){
        [sharedTagLibrary tagLibType02];

    }
    else if (type == 3){
        [sharedTagLibrary tagLibType03];

    }
    
    sharedTagLibrary.propertyImage = button.imageView.image;
    
    [self performSegueWithIdentifier:@"goToHome" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    
    
    
    
        if([segue.identifier isEqualToString:@"goToHome"]){
            
            
        }



}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
