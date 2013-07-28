#import "Coupon.h"

//Statusの実装
@implementation Coupon

//プロパティ
/*
@synthesize name   =_name;
@synthesize text   =_text;
@synthesize iconURL=_iconURL;
@synthesize icon   =_icon;
*/
@synthesize discount_rate   =_discount_rate;

//初期化
- (id)init {
    if (self=[super init]) {
        /*
        _name   =nil;
        _text   =nil;
        _iconURL=nil;
        _icon   =nil;
         */
        _discount_rate   =nil;
    }
    return self;
}

//メモリ解放
- (void)dealloc {
    /*
    [_name release];
    [_text release];
    [_icon release];
    [_iconURL release];
    [super dealloc];
     */
    //[_discount_rate release];
    //[super dealloc];
}
@end
