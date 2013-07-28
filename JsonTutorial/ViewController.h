//
//  ViewController.h
//  JsonTutorial
//
//  Created by MAC on 11/18/12.
//  Copyright (c) 2012 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Coupon.h"
#import "Restaurant.h"
#import "customCell.h"
#import "MenuViewController.h"

@class MenuViewController;

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>{
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)getTop10AlbumButton:(id)sender;


@property (strong, nonatomic) MenuViewController *menuViewController;

@end
