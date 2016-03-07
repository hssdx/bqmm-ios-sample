//
//  DemoModelData.h
//  StampMeSDK
//
//  Created by ceo on 11/2/15.
//  Copyright © 2015 siyanhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSQMessages.h"
#import "MMMessage.h"

static NSString * const kDemoMyAvatarDisplayName = @"Harvey";
static NSString * const kDemoOtherDisplayName = @"Tim Cook";

static NSString * const kDemoMyAvatarId = @"834-3434-343";
static NSString * const kDemoOtherAvatarId = @"6778-897-0765";

@interface DemoModelData : NSObject

@property (nonatomic, strong) NSMutableArray *messages;
@property (nonatomic, strong) JSQMessagesAvatarImage *myAvatar;
@property (nonatomic, strong) JSQMessagesAvatarImage *otherAvatar;

@property (nonatomic, strong) JSQMessagesBubbleImage *outgoingBubbbleImage;
@property (nonatomic, strong) JSQMessagesBubbleImage *incomingbubbleImage;

- (void)addPhotoMediaMessage:(UIImage *)image withInfo:(NSDictionary *)dic;

@end
