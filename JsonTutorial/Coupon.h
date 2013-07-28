#import <Foundation/Foundation.h>

//ステータス
@interface Coupon : NSObject {
    /*
    NSString* _name;   //名前
    NSString* _text;   //テキスト
    NSString* _iconURL;//アイコンURL
    UIImage*  _icon;   //アイコン
    */
    //割引率
    NSString* _discount_rate;
}

//プロパティ
/*
@property (nonatomic,retain)NSString *name;
@property (nonatomic,retain)NSString *text;
@property (nonatomic,retain)NSString *iconURL;
@property (nonatomic,retain)UIImage  *icon;
 */
@property (nonatomic,retain)NSString *discount_rate;
@end
