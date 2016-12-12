//
//  UIControl+ClickCompletion.m
//  ButtonClickCompletion
//
//  Created by feiyang.tang on 2016/12/12.
//  Copyright © 2016年 feiyang. All rights reserved.
//

#import "UIControl+ClickCompletion.h"
#import <objc/runtime.h>

static char AssociatedKey;

@implementation UIControl (ClickCompletion)

- (void)clickWithEvent:(UIControlEvents)event completion:(void(^)(id sender))completion{
    NSString *methodName = [UIControl eventName:event];
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &AssociatedKey);
    if(opreations == nil){
        opreations = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &AssociatedKey, opreations, OBJC_ASSOCIATION_RETAIN);
    }
    [opreations setObject:completion forKey:methodName];
    [self addTarget:self action:NSSelectorFromString(methodName) forControlEvents:event];
}

#pragma mark - privite
- (void)UIControlEventTouchUpInside{
    [self callActionCompletion:UIControlEventTouchUpInside];
}

- (void)callActionCompletion:(UIControlEvents)event {
    NSMutableDictionary *opreations = (NSMutableDictionary*)objc_getAssociatedObject(self, &AssociatedKey);
    if (opreations == nil){
        return;
    }
    void(^comletion)(id sender) = [opreations objectForKey:[UIControl eventName:event]];
    if (comletion) comletion(self);
}

+ (NSString *)eventName:(UIControlEvents)event{
    switch (event) {
        case UIControlEventTouchUpInside:
            return @"UIControlEventTouchUpInside";
        default:
            return @"description";
    }
    return @"description";
}





@end










