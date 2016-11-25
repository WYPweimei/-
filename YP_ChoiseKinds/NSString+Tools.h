//
//  HomeViewController.h
//  DaBaiCai
//
//  Created by 王烨谱 on 16/5/10.
//  Copyright © 2016年 大白菜. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface NSString (Tools)

+ (BOOL) validateEmail:(NSString *)email;

+ (BOOL) validateMobile:(NSString *)mobile;
/**
 *  验证是不是纯数字
 *
 *  @param numberString 数字字符串
 *
 */
+(BOOL) validateNumber:(NSString *)numberString;
/**
 *  判断是否含有中文
 *
 *  @param str 传过来的字符
 *
 *  @return 返回是否是中文
 */
+(BOOL)IsChinese:(NSString *)str;

// 车牌号校验
+(BOOL)validateLicense:(NSString *)license;

+ (id)convertStringToJson:(NSString *)str;//字符串转为json对象

-(NSDate *)dateWithFormatter:(NSString *)format;

+(NSDate *)dateWithDateString:(NSString *)dateString format:(NSString *)format;

+(NSString *)dateStringWithDate:(NSDate *)date format:(NSString *)format;

///**
// *  获取详细日期信息 2016/05/31
// *
// *  @return 2016/05/31
// */
//-(NSString *)getDetailData;

/**
 *  获取明天或者明天的明天日期
 *
 *  @param tomorrowNum 第几个明天
 *  @param aDate       当前时间
 *
 *  @return 明天的日期
 */
+(NSString *)GetTomorrowWithInter:(NSInteger)tomorrowNum Day:(NSDate *)aDate;

/**
 *  获取label的高度
 */
- (CGRect)calculateHeightWithFont:(UIFont *)font labelWidth:(CGFloat)width;

/**
 *  获取label的宽度
 */
-(CGSize)calculateWidthFont:(UIFont *)font;

/**
 *  用系统时间和本地时间对比
 *
 *  @param str 本地时间格式@"2016-06-12 1:25
 *
 *  @return 返回今天  昨天  几小时前
 */
- (NSString *)compareCurrentTime;

@end

@interface NSObject (NotNull)

-(NSString *)notNullString:(NSString *)str;


@end
