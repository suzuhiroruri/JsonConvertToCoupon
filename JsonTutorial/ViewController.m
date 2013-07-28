//
//  ViewController.m
//  JsonTutorial
//
//  Created by MAC on 11/18/12.
//  Copyright (c) 2012 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSMutableArray *couponArray;
    NSMutableArray *restaurantArray;

}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[self myTableView]setDelegate:self];
    [[self myTableView]setDataSource:self];
    
    
    couponArray = [[NSMutableArray alloc]init];
    restaurantArray = [[NSMutableArray alloc]init];
    
    [self initGetTop10Album];
}

-(void)dealloc{
}

//インジケーターの指定
- (void)setIndicator:(BOOL)indicator {
    [UIApplication sharedApplication].
    networkActivityIndicatorVisible=indicator;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Fail with error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:webData options:0 error:nil];
    
    for (id key in [allDataDictionary  keyEnumerator]) {
        //NSLog(@"Key:%@ Value:%@", key, [allDataDictionary  valueForKey:key]);
    }
    
    NSDictionary *feed = [allDataDictionary objectForKey:@"coupons"];
    //NSLog(@"feed:取得データ%@",feed);
    
    for(NSDictionary *dictionary in feed){
        
        NSDictionary *couponDic = [dictionary objectForKey:@"Coupon"];
        Coupon* item = [[Coupon alloc] init];
        item.discount_rate =[couponDic objectForKey:@"discount_rate"];
        [couponArray addObject:item];
        
        
        NSDictionary *restaurantDic = [dictionary objectForKey:@"Restaurant"];
        Restaurant* item2 = [[Restaurant alloc] init];
        item2.restaurant_id =[restaurantDic objectForKey:@"id"];
        [restaurantArray addObject:item2];
        
        NSLog(@"%@", item2.restaurant_id);
    }
    
    
    [[self myTableView]reloadData];
}


- (IBAction)getTop10AlbumButton:(id)sender {
    [couponArray removeAllObjects];
    [restaurantArray removeAllObjects];
    
    //NSURL *url = [NSURL URLWithString:@"http://fakelook.info/cakephp/coupons/view/1.json"];
    NSURL *url = [NSURL URLWithString:@"http://fakelook.info/cakephp/coupons/index.json"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if(connection){
        webData = [[NSMutableData alloc]init];
    }
}


- (void)initGetTop10Album {
    [couponArray removeAllObjects];
    [restaurantArray removeAllObjects];
    
    //NSURL *url = [NSURL URLWithString:@"http://fakelook.info/cakephp/coupons/view/1.json"];
    NSURL *url = [NSURL URLWithString:@"http://fakelook.info/cakephp/coupons/index.json"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if(connection){
        webData = [[NSMutableData alloc]init];
    }
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [couponArray count];
    //return [restaurantArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    customCell *custom = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(custom==nil){
        custom = [[customCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Coupon* coupon = [couponArray objectAtIndex:indexPath.row];
    NSLog(@"ポン%@",coupon);
    
    Restaurant* restaurant = [restaurantArray objectAtIndex:indexPath.row];
    NSLog(@"レス%@",restaurant);
    
    
    UIImage *useButtonOff;
    UIImage *useButtonOn;

    UIImage *saleButtonOff;
    UIImage *saleButtonOn;
    
    useButtonOn = [UIImage imageNamed:@"CouponListUseButtonOn.png"];
    saleButtonOn = [UIImage imageNamed:@"CouponListSaleButtonOn.png"];
    
    if([coupon.discount_rate isEqual:@"40"]){
        custom.backGround.image = [UIImage imageNamed:@"Coupon40%Base.png"];
        useButtonOff = [UIImage imageNamed:@"CouponList40%UseButtonOff.png"];
        saleButtonOff = [UIImage imageNamed:@"CouponList40%SaleButtonOff.png"];
    }else if([coupon.discount_rate isEqual:@"30"]){
        custom.backGround.image = [UIImage imageNamed:@"Coupon30%Base.png"];
        useButtonOff = [UIImage imageNamed:@"CouponList30%UseButtonOff.png"];
        saleButtonOff = [UIImage imageNamed:@"CouponList30%SaleButtonOff.png"];
    }else if([coupon.discount_rate isEqual:@"20"]){
        custom.backGround.image = [UIImage imageNamed:@"Coupon20%Base.png"];
        useButtonOff = [UIImage imageNamed:@"CouponList20%UseButtonOff.png"];
        saleButtonOff = [UIImage imageNamed:@"CouponList20%SaleButtonOff.png"];
    }else if([coupon.discount_rate isEqual:@"10"]){
        custom.backGround.image = [UIImage imageNamed:@"Coupon10%Base.png"];
        useButtonOff = [UIImage imageNamed:@"CouponList10%UseButtonOff.png"];
        saleButtonOff = [UIImage imageNamed:@"CouponList10%SaleButtonOff.png"];
    }
    
    [custom.useButton setImage:useButtonOn forState:UIControlStateHighlighted];
    [custom.useButton setImage:useButtonOff forState:UIControlStateNormal];
    
    [custom.saleButton setImage:saleButtonOn forState:UIControlStateHighlighted];
    [custom.saleButton setImage:saleButtonOff forState:UIControlStateNormal];
    
    custom.lblName.text = restaurant.restaurant_id;
    NSLog(@"取得できているのか%@",custom.lblName.text);
    
    [custom.saleButton addTarget:self action:@selector(customActionSalePressed:) forControlEvents:UIControlEventTouchUpInside];
    [custom.useButton addTarget:self action:@selector(customActionUsePressed:) forControlEvents:UIControlEventTouchUpInside];
    [custom.interiorButton addTarget:self action:@selector(customActionInteriorPressed:) forControlEvents:UIControlEventTouchUpInside];
    [custom.menuButton addTarget:self action:@selector(customActionMenuPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return custom;
}

-(void)customActionUsePressed :(id)sender
{
    NSLog(@"useButtonPressed");
}
-(void)customActionSalePressed :(id)sender
{
    NSLog(@"saleButtonPressed");
}

-(void)customActionInteriorPressed :(id)sender
{
    NSLog(@"interiorButtonPressed");
    if (!self.menuViewController) {
        self.menuViewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    }
    //NSDate *object = _objects[indexPath.row];
    //self.detailViewController.detailItem = object;
    [self.navigationController pushViewController:self.menuViewController animated:YES];
}
-(void)customActionMenuPressed :(id)sender
{
    NSLog(@"menuButtonPressed");
}

@end
