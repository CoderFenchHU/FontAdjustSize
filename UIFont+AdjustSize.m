//
//  UIFont+AdjustSize.m
//  Buddy
//
//  Created by 胡烽 on 2018/4/10.
//  Copyright © 2018年 person. All rights reserved.
//

#import "UIFont+AdjustSize.h"
#import <objc/runtime.h>
#import <objc/message.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define DEFAULT_WIDTH 375.0f
#define SIZE_SCALE SCREEN_WIDTH / DEFAULT_WIDTH

#define IS_IPHONE_4 ([[UIScreen mainScreen] bounds].size.height == 480.0f)
#define IS_IPHONE_5 ([[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_IPHONE_6 ([[UIScreen mainScreen] bounds].size.height == 667.0f)
#define IS_IPHONE_6_PLUS ([[UIScreen mainScreen] bounds].size.height == 736.0f)

#define IPHONE5_INCREMENT 2.0f  // iphone 5的缩放比
#define IPHONE6P_INCREMENT 1.0f // iPhone 6p的缩放比

#pragma mark - UIFont
@implementation UIFont (AdjustSize)

+ (void)load {
    Method newMethod = class_getClassMethod([self class], @selector(swizz_systemFontOfSize:));
    Method method = class_getClassMethod([self class], @selector(systemFontOfSize:));
    method_exchangeImplementations(newMethod, method);
    
    Method nBoldMethod = class_getClassMethod([self class], @selector(swizz_boldSystemFontOfSize:));
    Method nMethod = class_getClassMethod([self class], @selector(boldSystemFontOfSize:));
    method_exchangeImplementations(nBoldMethod, nMethod);
    
    Method nameMethod = class_getClassMethod([self class], @selector(fontWithName:size:));
    Method myNameMethod = class_getClassMethod([self class], @selector(swizz_fontWithName:size:));
    method_exchangeImplementations(nameMethod, myNameMethod);
}

+ (UIFont *)swizz_systemFontOfSize:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont swizz_systemFontOfSize:fontSize * SIZE_SCALE];
    return newFont;
}

+ (UIFont *)swizz_boldSystemFontOfSize:(CGFloat) fontSize{
    UIFont *nBoldFont = nil;
    nBoldFont = [UIFont swizz_boldSystemFontOfSize:fontSize * SIZE_SCALE];
    return nBoldFont;
}

+ (UIFont *)swizz_fontWithName:(NSString *)fontName size: (CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont swizz_fontWithName:fontName size:fontSize * SIZE_SCALE];
    return newFont;
}
@end

#pragma mark - UIButton
@implementation UIButton (AdjustSize)

+ (void)load {
    Method method = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myMethod = class_getInstanceMethod([self class], @selector(swizz_initWithCoder:));
    method_exchangeImplementations(method, myMethod);
}

- (instancetype)swizz_initWithCoder:(NSCoder *)aDecode {
    [self swizz_initWithCoder:aDecode];
    
    if (self) {
        if (self.tag != -1) {
            CGFloat fontSize = self.titleLabel.font.pointSize;
            NSString *fontName = self.titleLabel.font.fontName;
            self.titleLabel.font = [UIFont fontWithName:fontName size:fontSize];
        }
    }
    return self;
}
@end

#pragma mark - UILabel
@implementation UILabel (AdjustSize)

+ (void)load {
    Method method = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myMethod = class_getInstanceMethod([self class], @selector(swizz_initWithCoder:));
    method_exchangeImplementations(method, myMethod);
}

- (instancetype)swizz_initWithCoder:(NSCoder *)aDecode {
    [self swizz_initWithCoder:aDecode];
    
    if (self) {
        if (self.tag != -1) {
            CGFloat fontSize = self.font.pointSize;
            NSString *fontName = self.font.fontName;
            self.font = [UIFont fontWithName:fontName size:fontSize];
        }
    }
    return self;
}
@end

#pragma mark - UITextField
@implementation UITextField (AdjustSize)

+ (void)load {
    Method method = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myMethod = class_getInstanceMethod([self class], @selector(swizz_initWithCoder:));
    method_exchangeImplementations(method, myMethod);
}

- (instancetype)swizz_initWithCoder:(NSCoder *)aDecode {
    [self swizz_initWithCoder:aDecode];
    
    if (self) {
        if (self.tag != -1) {
            CGFloat fontSize = self.font.pointSize;
            NSString *fontName = self.font.fontName;
            self.font = [UIFont fontWithName:fontName size:fontSize];
        }
    }
    return self;
}
@end

#pragma mark - TextView
@implementation UITextView (AdjustSize)

+ (void)load {
    Method method = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myMethod = class_getInstanceMethod([self class], @selector(swizz_initWithCoder:));
    method_exchangeImplementations(method, myMethod);
}

- (instancetype)swizz_initWithCoder:(NSCoder *)aDecode {
    [self swizz_initWithCoder:aDecode];
    
    if (self) {
        if (self.tag != -1) {
            CGFloat fontSize = self.font.pointSize;
            NSString *fontName = self.font.fontName;
            self.font = [UIFont fontWithName:fontName size:fontSize];
        }
    }
    return self;
}
@end
