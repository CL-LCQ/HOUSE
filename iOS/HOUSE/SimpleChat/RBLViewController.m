//
//  RBLViewController.m
//  SimpleChat
//
//  Created by redbear on 14-4-8.
//  Copyright (c) 2014年 redbear. All rights reserved.
//

#import "RBLViewController.h"
#import "tagLibrary.h"


#define TEXT_STR @"TEXT_STR"
#define FORM @"FORM"

@interface RBLViewController ()
{
    NSMutableArray *tableData;
}

@end



@implementation RBLViewController

@synthesize addItem,myItems,sharedTagLibrary,buttonBar1,colors;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    bleShield = [[BLE alloc] init];
    [bleShield controlSetup];
    bleShield.delegate = self;
    
    
    colors = [[Colors alloc]init];
    
    sharedTagLibrary = [tagLibrary sharedManager];
    


    
    CGFloat factor = 44/self.navigationController.navigationBar.frame.size.height;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 108*factor, 44*factor);
    [button addTarget:self action:@selector(goToOpt1) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"houseLogo"] forState:UIControlStateNormal];
    self.navigationItem.titleView = button;
    
    
    
    
    
    self.navigationItem.backBarButtonItem.tintColor = colors.teal;

    self.sizex = self.view.frame.size.width;
    self.sizey = self.view.frame.size.height;
    
    self.tagView= [[UIView alloc]init];
    self.houseView= [[UIView alloc]init];
    self.sumView= [[UIView alloc]init];

    
    
    self.textlabel = [[UILabel alloc]init];
    self.progresslabel = [[UILabel alloc]init];
    self.info1Label = [[UILabel alloc]init];
    self.info2Label = [[UILabel alloc]init];
    self.info3Label = [[UILabel alloc]init];
    self.warningLabel = [[UILabel alloc]init];

    self.descriptionLabel = [[UILabel alloc]init];
    self.progressButton = [[UIButton alloc ]init];
    [self.progressButton addTarget:self action:@selector(goToMyItems) forControlEvents:UIControlEventTouchUpInside];
    self.priceLabel = [[UILabel alloc]init];
    self.co2Label =[[UILabel alloc]init];
    self.savingsLabel =[[UILabel alloc]init];;
    

    [self viewWillLayoutSubviews];
    
    self.textlabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.savingsLabel.textAlignment  = NSTextAlignmentLeft;
    self.co2Label.textAlignment = NSTextAlignmentLeft;
    self.progresslabel.textAlignment = NSTextAlignmentCenter;
    self.progressButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.descriptionLabel.textAlignment = NSTextAlignmentLeft;
    self.info1Label.textAlignment = NSTextAlignmentLeft;
    self.info2Label.textAlignment = NSTextAlignmentLeft;
    self.info3Label.textAlignment = NSTextAlignmentLeft;

    
    
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
    

//    self.textlabel.text = [NSString stringWithFormat:@"unidentified tag of"];
//    [self.textlabel setHidden:NO];

   
    
    
    self.progresslabel.text = [NSString stringWithFormat:@"You have scanned 0 tags."];
    self.progressButton.titleLabel.text =[NSString stringWithFormat:@"You have added 0 interventions."];
    self.houseTag = [[HouseTag alloc]init];
    
   
    
    UIAlertView *caveat = [[UIAlertView alloc]initWithTitle:@"" message:@"Cost and energy savings may vary significantly by home and user. Please press connect to start" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [caveat show];
    
    addItem =  [UIButton buttonWithType:UIButtonTypeCustom];
    [addItem setTitle:@"+" forState:UIControlStateNormal];
    [addItem addTarget:self action:@selector(goToItems) forControlEvents:UIControlEventTouchUpInside];
    addItem.backgroundColor = colors.teal;
    addItem.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:40];
   
    addItem.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    myItems =  [UIButton buttonWithType:UIButtonTypeCustom];
    [myItems setTitle:@"i" forState:UIControlStateNormal];
    [myItems addTarget:self action:@selector(goToRTF) forControlEvents:UIControlEventTouchUpInside];
    myItems.backgroundColor = colors.teal;
    myItems.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
  
   // myItems.layer.cornerRadius = 20;
   // myItems.clipsToBounds = YES;
    
    [myItems setHidden:YES];

    
//    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStylePlain target:self action:@selector(resetState)];
//    self.navigationItem.rightBarButtonItem = anotherButton;
   


    self.textlabel.font = font;
    self.progresslabel.font = font;
    self.progressButton.titleLabel.font = font;
    

    
    self.priceLabel.font = font;
    self.priceLabel.text = @"Total installation cost: £0 ";
    self.savingsLabel.font = font;
    self.savingsLabel.text = @"Annual saving on bills: £0";
    self.co2Label.font = font;
    self.co2Label.text = @"Annual CO2 saving: 0 kg" ;
    
    self.nTags = [[NSMutableArray alloc]init];
    
    
    
    self.navigationItem.hidesBackButton = NO;
    
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    

  }

-(void) viewWillAppear:(BOOL)animated{
   // self.navigationItem.title = @"HOUSE";

   // self.progresslabel.text = [NSString stringWithFormat:@"You have scanned %lu tags.",(unsigned long)[sharedTagLibrary.scannedTags count]];
    [self.progressButton setTitle:  [NSString stringWithFormat:@"You have added %lu interventions.",(unsigned long)[sharedTagLibrary.scannedTags count]] forState:UIControlStateNormal];

    [self updatePrice];
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
    [self viewWillLayoutSubviews];
    
}
//-(void)viewDidDisappear:(BOOL)animated{
//    self.navigationItem.titleView = nil;
//
//    
//}
-(void)viewWillLayoutSubviews{
   // NSLog(@"called");
    
    
    
    [self.textlabel removeFromSuperview];
    [self.progresslabel removeFromSuperview];
    //[self.background removeFromSuperview];
   
    
    
    CGFloat barHeight =self.navigationController.navigationBar.frame.size.height;
    CGFloat leftSpace = self.sizey - barHeight;
    CGFloat portion = leftSpace/12;
    //set the frames and give 12 portions
    

    
    //self.sumView.frame = CGRectMake(0, barHeight , _sizex, portion*2);
    self.tagView.frame= CGRectMake(0, barHeight , _sizex, portion*2);
    
    self.houseView.frame = CGRectMake(0,self.sumView.frame.size.height+barHeight , _sizex, portion*6.5);
    //self.tagView.frame = CGRectMake(0, barHeight+self.sumView.frame.size.height+self.houseView.frame.size.height , _sizex, portion*2);
    self.sumView.frame = CGRectMake(0, barHeight+self.sumView.frame.size.height+self.houseView.frame.size.height , _sizex, portion*2);

    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, _sizey - portion*1.5, self.sizex, portion*1.5)];
    UIView *separator = [[UIView alloc]initWithFrame:CGRectMake(0, _sizey - portion*1.5, self.sizex, 1)];
    [separator setBackgroundColor:colors.darkGrey];
    
    //debug
//    [self.houseView setBackgroundColor:[UIColor greenColor]];
//    [self.tagView setBackgroundColor:[UIColor redColor]];


    
    
    
//sumView
    CGFloat UIRowHeight = self.sumView.frame.size.height/6;
    
    self.progressButton.frame = CGRectMake(self.sizex/2 -self.sizex/3, UIRowHeight*4.5, self.sizex/1.5, UIRowHeight*1.5);
    self.priceLabel.frame = CGRectMake(20, UIRowHeight, self.sizex-10, UIRowHeight);
    self.savingsLabel.frame = CGRectMake(20,UIRowHeight*2,self.sizex-10, UIRowHeight);
    self.co2Label.frame = CGRectMake(20, UIRowHeight*3, self.sizex-10, UIRowHeight);
    
    self.progressButton.titleLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-3];
    self.priceLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-3];
    self.savingsLabel.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-3];
    self.co2Label.font=[UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-3];
    
    
    UIImageView *fakeGauge = [[UIImageView alloc]initWithFrame:CGRectMake(20, UIRowHeight, self.sizex-40, UIRowHeight*3)];
    UIImage *gauge = [UIImage imageNamed:@"gaugeSet"];
    fakeGauge.image = gauge;
    
    [self.sumView addSubview:fakeGauge];
    
    [self.progressButton setBackgroundColor:colors.teal];
    
    
    [self.sumView addSubview:self.progressButton];
    
    
//tagview
    
    //ADD BUTTON WITH IMAGE OF TAG
    myItems.frame = CGRectMake(20, UIRowHeight*1.75, UIRowHeight*3.5, UIRowHeight*3.5);
    [[myItems layer] setBorderWidth:2.0f];
    [[myItems layer] setBorderColor:colors.teal.CGColor];
    [myItems setImage:self.lastTagImage forState:UIControlStateNormal];
    
    //label frames
    self.descriptionLabel.frame = CGRectMake(20, UIRowHeight*0.5, self.sizex-40, UIRowHeight);
    self.info1Label.frame = CGRectMake(UIRowHeight*3.5+30, UIRowHeight*2, 500, UIRowHeight);
    self.info2Label.frame = CGRectMake(UIRowHeight*3.5+30, UIRowHeight*3, 500, UIRowHeight);
    self.info3Label.frame = CGRectMake(UIRowHeight*3.5+30, UIRowHeight*4, 500, UIRowHeight);
    
    //add 3 labels
    self.descriptionLabel.font= [UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-2];
    self.info1Label.font= [UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-5];
    self.info2Label.font= [UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-5];
    self.info3Label.font= [UIFont fontWithName:@"HelveticaNeue-Light" size:UIRowHeight-5];
    


    
    
//house view
    UIRowHeight = self.houseView.frame.size.height/8;
    
    
    self.background = [[UIImageView alloc]initWithFrame:CGRectMake((self.sizex-(UIRowHeight*7))/2, 0, UIRowHeight*7, UIRowHeight*7)];

    self.background.image= sharedTagLibrary.propertyImage;
    
    self.warningLabel.frame = CGRectMake(0, self.houseView.frame.size.height - UIRowHeight, self.sizex, UIRowHeight);
    self.warningLabel.textAlignment = NSTextAlignmentCenter;
    
 
    [self.houseView addSubview:self.background];
    [self.houseView addSubview:_warningLabel];

    [self.view addSubview:self.tagView];
    [self.view addSubview:self.sumView];
    [self.view addSubview:self.houseView];
    
    
//bottom view
   
    
    
    CGFloat bottomBarBtnW = self.bottomView.frame.size.width/5;
    CGFloat topgap = 5;
    CGFloat btnHeight = self.bottomView.frame.size.height-topgap*2;
    CGFloat gap = (bottomBarBtnW - btnHeight)/2;
    
    buttonBar1 = [[UIButton alloc]initWithFrame:CGRectMake(0+gap , topgap, btnHeight, btnHeight)];
    buttonBar1.titleLabel.text = @"";
    [buttonBar1 setTitle:@"Connect" forState:UIControlStateNormal];
    [buttonBar1 addTarget:self action:@selector(BLEShieldScan:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonBar2 = [[UIButton alloc]initWithFrame:CGRectMake(bottomBarBtnW+gap , topgap, btnHeight,btnHeight)];
    buttonBar2.titleLabel.text = @"";
    [buttonBar2 setTitle:@"Analysis" forState:UIControlStateNormal];
    [buttonBar2 addTarget:self action:@selector(goToOpt2) forControlEvents:UIControlEventTouchUpInside];
    // [buttonBar2 setBackgroundColor:[UIColor redColor]];
    
    UIButton *buttonBar3 = [[UIButton alloc]initWithFrame:CGRectMake(bottomBarBtnW*3+gap , topgap, btnHeight, btnHeight)];
    //buttonBar3.frame = CGRectMake(bottomBarBtnW*3+gap , topgap, btnHeight, btnHeight)   ;
    buttonBar3.titleLabel.text = @"Reset";
    [buttonBar3 setTitle:@"Reset" forState:UIControlStateNormal];
    [buttonBar3 addTarget:self action:@selector(resetState) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonBar4 = [[UIButton alloc]initWithFrame:CGRectMake(bottomBarBtnW*4+gap , topgap, btnHeight, btnHeight)];
    buttonBar4.titleLabel.text = @"More";
    [buttonBar4 setTitle:@"More" forState:UIControlStateNormal];
    [buttonBar4 addTarget:self action:@selector(goToOpt3) forControlEvents:UIControlEventTouchUpInside];
   
    
        [buttonBar1 setImage:[UIImage imageNamed:@"connectButton.png"] forState:UIControlStateNormal] ;
        [buttonBar2 setImage:[UIImage imageNamed:@"analysisButton.png"] forState:UIControlStateNormal] ;
        [buttonBar3 setImage:[UIImage imageNamed:@"resetButton"] forState:UIControlStateNormal] ;
        [buttonBar4 setImage:[UIImage imageNamed:@"moreButton.png"] forState:UIControlStateNormal] ;
    
    [addItem setImage:[UIImage imageNamed:@"addButton.png"] forState:UIControlStateNormal] ;
    
    CGFloat fontsize = self.bottomView.frame.size.height/6;
//    buttonBar1.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:fontsize];
//    buttonBar2.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:fontsize];
//    buttonBar3.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:fontsize];
//    buttonBar4.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:fontsize];
    

    
    activityIndicator =  [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.bottomView addSubview:activityIndicator];
    activityIndicator.center = buttonBar1.center;
    
    addItem.frame = CGRectMake(bottomBarBtnW*2 +gap, topgap, btnHeight, btnHeight);
    addItem.layer.cornerRadius = btnHeight/2;
    addItem.clipsToBounds = YES;
    [self.view addSubview:self.bottomView];
    [self.bottomView setBackgroundColor:colors.lightGrey];

    [self.bottomView addSubview:addItem];
    [self.bottomView addSubview:buttonBar1];
    [self.bottomView addSubview:buttonBar2];
    [self.bottomView addSubview:buttonBar3];
    [self.bottomView addSubview:buttonBar4];
    
    
    


    
    
    
    self.textlabel.textAlignment = NSTextAlignmentCenter;
    self.progresslabel.textAlignment = NSTextAlignmentCenter;
    

  
    [self.tagView addSubview:myItems];
    [self.tagView addSubview:self.descriptionLabel];
    [self.tagView addSubview:self.info1Label];
    [self.tagView addSubview:self.info2Label];
    [self.tagView addSubview:self.info3Label];
    
   
    [self.sumView addSubview:self.priceLabel];
    [self.sumView addSubview:self.co2Label];
    [self.sumView addSubview:self.savingsLabel];
    
    [self.view addSubview:separator];
    
 

}

-(void)goToOpt1{
    [self performSegueWithIdentifier:@"goToOpt1" sender:self];

}

-(void)goToOpt2{
    [self performSegueWithIdentifier:@"goToOpt2" sender:self];

}
-(void)goToOpt3{
    [self performSegueWithIdentifier:@"goToOpt3" sender:self];

}

-(void)goToItems{
    [self performSegueWithIdentifier:@"goToProcess" sender:self];

}

-(void)goToRTF{
    [self performSegueWithIdentifier:@"goToRTF" sender:self];

}
-(void)goToMyItems{
    [self performSegueWithIdentifier:@"goToMyItems" sender:self];
    
}
-(void) connectionTimer:(NSTimer *)timer
{
    if(bleShield.peripherals.count > 0)
    {
        [bleShield connectPeripheral:[bleShield.peripherals objectAtIndex:0]];
    }
    else
    {
        [activityIndicator stopAnimating];
        //self.navigationItem.leftBarButtonItem.enabled = YES;
        buttonBar1.enabled = YES;
    }
}

- (IBAction)BLEShieldScan:(id)sender
{
    if (bleShield.activePeripheral)
        if(bleShield.activePeripheral.state == CBPeripheralStateConnected)
        {
            [[bleShield CM] cancelPeripheralConnection:[bleShield activePeripheral]];
            return;
        }
    
    if (bleShield.peripherals)
        bleShield.peripherals = nil;
    
    [bleShield findBLEPeripherals:3];
    
    [NSTimer scheduledTimerWithTimeInterval:(float)3.0 target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
    
    //should do that in the button
    [activityIndicator startAnimating];
    buttonBar1.enabled = NO;
    
   // self.navigationItem.leftBarButtonItem.enabled = NO;
}

-(void) bleDidReceiveData:(unsigned char *)data length:(int)length
{
    NSData *d = [NSData dataWithBytes:data length:length];
    NSString *key = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    
    NSLog(@"reading is %@", key);
    
    for (NSUInteger i=0; i< [sharedTagLibrary.tagLibrary count]; i++) {
        
        NSDictionary *tag = [sharedTagLibrary.tagLibrary objectAtIndex:i];
        NSString *tagID =[tag objectForKey:@"keyID"];
        // NSLog(@"%@", tagID);
        
        
        if ([key isEqualToString: tagID]) {
            
            self.textlabel.text = [tag objectForKey:@"description"];
            self.houseTag.type = [tag objectForKey:@"type"];
            self.houseTag.price = [tag objectForKey:@"price"];
            self.houseTag.year = [tag objectForKey:@"year"];
            //self.houseTag.descriptions = [tag objectForKey:@"description"];
            //self.houseTag.informations =  [tag objectForKey:@"information"];
            
            [sharedTagLibrary.scannedTags addObject:tag];
            
            //stop the for loop
            i=[sharedTagLibrary.tagLibrary count];
        }
        
            else {
                
                self.textlabel.text = [NSString stringWithFormat:@"unidentified tag of ID: %@",key];
            }
    }
    
    self.currentTag = self.houseTag;
   // self.progresslabel.text = [NSString stringWithFormat:@"You have scanned %lu tags.",(unsigned long)[sharedTagLibrary.scannedTags count]];
    [self.progressButton setTitle:  [NSString stringWithFormat:@"You have added %lu interventions.",(unsigned long)[sharedTagLibrary.scannedTags count]] forState:UIControlStateNormal];
    
    [self updatePrice];

 
    
}

NSTimer *rssiTimer;

-(void) readRSSITimer:(NSTimer *)timer
{
    [bleShield readRSSI];
}

- (void) bleDidDisconnect
{
    NSLog(@"bleDidDisconnect");
    
    [self.navigationItem.leftBarButtonItem setTitle:@"Connect"];
    [buttonBar1 setTitle:@"Connect" forState:UIControlStateNormal];
    [activityIndicator stopAnimating];
    //self.navigationItem.leftBarButtonItem.enabled = YES;
    buttonBar1.enabled = YES;
    [buttonBar1 setImage:[UIImage imageNamed:@"connectButton.png"] forState:UIControlStateNormal] ;

    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

-(void) bleDidConnect
{
    [activityIndicator stopAnimating];
//    self.navigationItem.leftBarButtonItem.enabled = YES;
//    [self.navigationItem.leftBarButtonItem setTitle:@"Disconnect"];
   // [buttonBar1 setTitle:@"Disconnect" forState:UIControlStateNormal];
    [buttonBar1 setImage:[UIImage imageNamed:@"disconnectButton.png"] forState:UIControlStateNormal] ;


    
    
    NSLog(@"bleDidConnect");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)resetState{
  

    [_nTags removeAllObjects];
    _totalPrice = 0;
    [sharedTagLibrary resetArrayOfTags];
    self.progresslabel.text = [NSString stringWithFormat:@"You have scanned %lu tags.",(unsigned long)[sharedTagLibrary.scannedTags count]];
    [self.progressButton setTitle:  [NSString stringWithFormat:@"You have added %lu interventions.",(unsigned long)[sharedTagLibrary.scannedTags count]] forState:UIControlStateNormal];
    
    [self updatePrice];
    
   // [self.navigationController popToRootViewControllerAnimated:YES];
    
    self.descriptionLabel.text=@"";
    self.info1Label.text=@"";
    self.info2Label.text=@"";
    self.info3Label.text=@"";
    [self.myItems setHidden:YES];

    NSLog(@"reset done");
    
    
}
-(void)updatePrice{

    _totalPrice = [sharedTagLibrary returnPrice];
    _totalCO2 = [sharedTagLibrary returnCO2saving];
    
    if([sharedTagLibrary.scannedTags count]){
    _totalSavings = [sharedTagLibrary returnBillSaving];
    }
    
    else{
        _totalSavings =0;
    }
    
  
    self.priceLabel.text = [NSString stringWithFormat: @"Total installation cost: £%d", _totalPrice];
    self.co2Label.text = [NSString stringWithFormat: @"Annual CO2 saving: %d kg", _totalCO2];
    self.savingsLabel.text = [NSString stringWithFormat: @"Annual saving on bills: £%d", _totalSavings];
    
    if([sharedTagLibrary.scannedTags count]>0){
        
        [myItems setHidden:NO];
        
        NSDictionary *tag = [sharedTagLibrary.scannedTags lastObject];
        self.descriptionLabel.text = [NSString stringWithFormat:@"Last added intervention:%@",[tag objectForKey:@"description"] ];
        self.lastTagImage =[UIImage imageNamed:[tag objectForKey:@"image"]];
        self.info1Label.text = [NSString stringWithFormat: @"Installation cost: £%@",[tag objectForKey:@"price"]];
        self.info2Label.text = [NSString stringWithFormat: @"Annual saving on bills: £%@",[tag objectForKey:@"annual_savings_on_bills"]];
        self.info3Label.text = [NSString stringWithFormat: @"Annual CO2 saving: %@ kg",[tag objectForKey:@"annual_co2_savings"]];
        self.warningLabel.text = @"Placeholder text for warnings";
           [myItems setImage:self.lastTagImage forState:UIControlStateNormal];


    }


}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
//    if([segue.identifier isEqualToString:@"goToProcess"]){
//      AddItemVC *ViewController = (AddItemVC *)segue.destinationViewController;
//    }
    
    if([segue.identifier isEqualToString:@"goToRTF"]){
        tagViewerVC *ViewController = (tagViewerVC *)segue.destinationViewController;
        ViewController.tag = [sharedTagLibrary.scannedTags lastObject];
        //  NSLog(@"%@", currentSealObject.when);
        
    }
    

    
    
    
}
@end
