//
//  customCell.h
//  CustomTBCell
//
//  Created by 鈴木 宏昌 on 2013/07/20.
//  Copyright (c) 2013年 鈴木 宏昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell

@property (strong,nonatomic)IBOutlet UIImageView *backGround;
@property (strong,nonatomic)IBOutlet UIButton *useButton;
@property (strong,nonatomic)IBOutlet UIButton *saleButton;
@property (strong,nonatomic)IBOutlet UIButton *interiorButton;
@property (strong,nonatomic)IBOutlet UIButton *menuButton;
@property (strong,nonatomic)IBOutlet UILabel *lblName;
@property (strong,nonatomic)IBOutlet UILabel *lblText;



@end
