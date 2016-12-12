//
//  UIControl+ClickCompletion.h
//  ButtonClickCompletion
//
//  Created by feiyang.tang on 2016/12/12.
//  Copyright © 2016年 feiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ClickCompletion)

- (void)clickWithEvent:(UIControlEvents)event completion:(void(^)(id sender))completion;

@end
