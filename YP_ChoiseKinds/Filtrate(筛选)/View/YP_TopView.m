//
//  YP_TopView.m
//  YP_ChoiseKinds
//
//  Created by 王烨谱 on 2016/11/24.
//  Copyright © 2016年 王烨谱. All rights reserved.
//


#import "YP_TopView.h"

@interface YP_TopView()
{
    NSInteger oldTapTag;
}
@end
@implementation YP_TopView

- (instancetype)initWithFrame:(CGRect)frame
                     titleArr:(NSArray *)titleArr
                    backColor:(UIColor *)backColor
                    titleFont:(UIFont *)titleFont
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = backColor;
        self.titleFont = titleFont;
        self.titleArr = titleArr;
        self.viewTag = 0;
        oldTapTag = 1000;
    }
    return self;
}

-(void)setTitleArr:(NSArray *)titleArr{
    if (_titleArr != titleArr) {
        _titleArr = titleArr;
    }
}

-(void)setTitleFont:(UIFont *)titleFont{
    if (_titleFont != titleFont) {
        _titleFont = titleFont;
    }
}

-(void)setBackColor:(UIColor *)backColor{
    if (_backColor != backColor) {
        _backColor = backColor;
    }
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self addTap];//添加手势
    oldTapTag = 1000;
}

#pragma mark -----------------------重写drawRect-----------------------
-(void)drawRect:(CGRect)rect
{
    CGFloat smallW;
    CGFloat smallH;
    UIColor *textColor;
    CGFloat width = self.frame.size.width/_titleArr.count;
    CGFloat height = self.frame.size.height;
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (int i = 0 ; i < _titleArr.count; i ++) {
        CGContextSetLineWidth(context, 1.0);
        if (i == self.viewTag) {
            textColor = [UIColor colorWithString:@"#4caf50"];//选中的颜色
        }else{
            textColor = [UIColor colorWithString:@"#222222"];//没有选中的颜色
        }
        UIFont  *font = _titleFont;
        NSString *text = _titleArr[i];
        smallW = [text calculateWidthFont:_titleFont].width;
        smallH = [text calculateHeightWithFont:_titleFont labelWidth:smallW].size.height;
        [text drawInRect:CGRectMake(width * i + (width - smallW)/2, (height - smallH)/2, width, height) withAttributes:@{NSFontAttributeName : font,NSForegroundColorAttributeName:textColor}];
#warning 画左侧的线条
        if (i <_titleArr.count -1) {
            CGRect beginRect = CGRectMake(width*(i+1),5 , 1, height - 10);
            CGRect endRect = CGRectMake(width*(i+1),height-10 , 1, height - 10);
            CGContextSetLineCap(context,
                                kCGLineCapSquare);
            CGContextSetLineWidth(context,
                                  2.0);
            CGContextSetRGBStrokeColor(context,
                                       1, 0, 0, 1.0);//线条的颜色
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, beginRect.origin.x, beginRect.origin.y);
            CGContextAddLineToPoint(context,
                                    endRect.origin.x, endRect.origin.y);
            CGContextStrokePath(context);
        }
#warning 画底部线条
        
        CGContextSetLineCap(context,
                            kCGLineCapSquare);
        CGContextSetLineWidth(context,
                              2.0);
        CGContextSetRGBStrokeColor(context,
                                   0.92, 0.93, 0.93, 1.0);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, 0, height-1);
        CGContextAddLineToPoint(context,
                                self.frame.size.width, height-1);
        CGContextStrokePath(context);
        
        CGRect beginRect = CGRectMake(width*self.viewTag,height-1 , width, 1);
        CGRect endRect = CGRectMake(width*(self.viewTag + 1),height-1, width, 1);
        CGContextSetLineCap(context,
                            kCGLineCapSquare);
        CGContextSetLineWidth(context,
                              2.0);
        CGContextSetRGBStrokeColor(context,
                                   0.00, 0.73, 0.31, 1.0);
        CGContextBeginPath(context);
        CGContextMoveToPoint(context, beginRect.origin.x, beginRect.origin.y);
        CGContextAddLineToPoint(context,
                                endRect.origin.x, endRect.origin.y);
        CGContextStrokePath(context);
    }
}

#pragma mark -----------------------UITapGestureRecognizer-----------------------
/**
 添加手势
 */
-(void)addTap
{
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
    //点击的次数
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    //给self.view添加一个手势监测；
    [self addGestureRecognizer:singleRecognizer];
}


/**
 手势点击执行方法
 */
-(void)SingleTap:(UITapGestureRecognizer *)tap
{
    CGFloat width = self.frame.size.width/_titleArr.count;
    CGPoint P = [tap locationInView:self];
    tap.view.tag = P.x/width;
    if (oldTapTag == tap.view.tag) {
        return;
    }
    oldTapTag = tap.view.tag;
    self.viewTag = tap.view.tag;
    [self setNeedsDisplay];
    self.tapBlock(tap);
}



#pragma mark ------------------------block-----------------------------
/**
 点击回调
 */
-(void)TapBlcokAction:(TapBlcok)block
{
    
    self.tapBlock = block;
}

@end
