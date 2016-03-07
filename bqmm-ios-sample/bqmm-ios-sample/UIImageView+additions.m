//
//  UIImageView+additions.m
//  bqmm-ios-sample
//
//  Created by ceo on 3/7/16.
//  Copyright © 2016 siyanhui. All rights reserved.
//

#import "UIImageView+additions.h"

@implementation UIImageView (additions)

- (void)adjustContentModeAutomatically {
    if (self.image == nil) {
        return;
    }
    
    CGFloat maxDim = MAX(self.frame.size.width, self.frame.size.height);
    CGFloat maxImgDim = MAX(self.image.size.width, self.image.size.height);
    if (maxImgDim <= maxDim) {
        self.contentMode = UIViewContentModeCenter;
    }else {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
}

@end
