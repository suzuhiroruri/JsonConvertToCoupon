#import "Restaurant.h"

//Statusの実装
@implementation Restaurant

//プロパティ

@synthesize restaurant_id   =_restaurant_id;

//初期化
- (id)init {
    if (self=[super init]) {
        _restaurant_id   =nil;
    }
    return self;
}

//メモリ解放
- (void)dealloc {

}
@end
