//
//  MenuViewController.h
//  JsonTutorial
//
//  Created by 鈴木 宏昌 on 2013/07/21.
//  Copyright (c) 2013年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
