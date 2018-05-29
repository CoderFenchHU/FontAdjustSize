//
//  UIFont+AdjustSize.h
//  Buddy
//
//  Created by 胡烽 on 2018/4/10.
//  Copyright © 2018年 person. All rights reserved.
//

/**
    0代码适配APP里的字体 适配规则：字体大小 * 屏幕缩放比
    如果想要让字体不自动适配  将控件的tag 设置为 -1 即可
 */

#import <UIKit/UIKit.h>

@interface UIFont (AdjustSize)

@end

@interface UIButton (AdjustSize)

@end

@interface UILabel (AdjustSize)

@end

@interface UITextField (AdjustSize)

@end

@interface UITextView (AdjustSize)

@end 
