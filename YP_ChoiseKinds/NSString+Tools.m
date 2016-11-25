//
//  HomeViewController.h
//  DaBaiCai
//
//  Created by 王烨谱 on 16/5/10.
//  Copyright © 2016年 大白菜. All rights reserved.
//
#import "NSString+Tools.h"

@implementation NSString (Tools)

//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((17[0-9])|(13[0-9])|(15[0-9])|(14[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+(id)convertStringToJson:(NSString *)str
{
    NSData *tempData=[str dataUsingEncoding:NSUTF8StringEncoding];
    if (tempData == nil) {
        return nil;
    }
    id tempJson=[NSJSONSerialization JSONObjectWithData:tempData options:NSJSONReadingMutableContainers error:nil];
    return tempJson;
}

-(NSDate *)dateWithFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    
    return [formatter dateFromString:self];
}

- (CGRect)calculateHeightWithFont:(UIFont *)font labelWidth:(CGFloat)width{
    CGSize size = CGSizeMake(width, 100000);
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect;
}

-(CGSize)calculateWidthFont:(UIFont *)font
{
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}


+(NSString *)GetTomorrowWithInter:(NSInteger)tomorrowNum Day:(NSDate *)aDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit| NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+tomorrowNum)];
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy/MM/dd"];
    return [dateday stringFromDate:beginningOfWeek];
}


+(NSDate *)dateWithDateString:(NSString *)dateString format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

+(NSString *)dateStringWithDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

- (NSString *)compareCurrentTime
{
    NSString *str = self;
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    if (timeDate == nil) {
        return nil;
    }
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    //标准时间和北京时间差8个小时
    //    timeInterval = timeInterval - 8*60*60;
    //    timeInterval = timeInterval;
    long temp = 0;
    NSString *result;
    
    if (timeInterval < (60 * 60 * 24 * 2)) {
        temp = timeInterval/(60*60);
        if(temp == 0){
            result = @"刚刚";
        }else{
            result = [NSString stringWithFormat:@"%ld小时前",temp];
        }
    } else{
        temp = timeInterval/(60*60*24);
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    return  result;
}

//
//
//+(BOOL)validateNumber:(NSString *)numberString{
//    if( ![self :numberString] || ![self isPureFloat:numberString])
//    {
//        resultLabel.textColor = [UIColor redColor];
//        resultLabel.text = @"警告:含非法字符，请输入纯数字！";
//        return;
//    }
//
//}
+(BOOL)validateNumber:(NSString *)numberString{
    //是否是纯数字
    NSString * regex  = @"(^[0-9]*$)";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch  = [pred evaluateWithObject:numberString];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
    
}

+(BOOL)validateLicense:(NSString *)license{
    //是否车牌号
    NSString * regex  = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch  = [pred evaluateWithObject:license];
    if (isMatch) {
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)IsChinese:(NSString *)str{
    for(int i = 0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
            return YES;
    }
    return NO;
}



@end

@implementation NSObject (NotNull)

-(NSString *)notNullString:(NSString *)str{
    if ([str isKindOfClass:[NSString class]]) {
        if ([str isEqualToString:@"<null>"]) {
            return @"";
        }
        if (str.length == 0) {
            return @"";
        }
        return str;
    }
    return @"";
}


@end
