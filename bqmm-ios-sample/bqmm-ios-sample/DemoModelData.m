//
//  DemoModelData.m
//  StampMeSDK
//
//  Created by ceo on 11/2/15.
//  Copyright © 2015 siyanhui. All rights reserved.
//

#import "DemoModelData.h"

@implementation DemoModelData

- (instancetype)init {
    self = [super init];
    if (self) {
        _myAvatar = [JSQMessagesAvatarImageFactory avatarImageWithUserInitials:@"HD"
                                                               backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f]
                                                                     textColor:[UIColor colorWithWhite:0.60f alpha:1.0f] font:[UIFont systemFontOfSize:14]
                                                                      diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        _otherAvatar = [JSQMessagesAvatarImageFactory avatarImageWithUserInitials:@"TC"
                                                                  backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f]
                                                                        textColor:[UIColor colorWithWhite:0.60f alpha:1.0f] font:[UIFont systemFontOfSize:14]
                                                                         diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
        _outgoingBubbbleImage = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
        _incomingbubbleImage = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
        _messages = [[NSMutableArray alloc] initWithCapacity:100];
    }
    return self;
}

- (void)addPhotoMediaMessage:(UIImage *)image withInfo:(NSDictionary *)dic {
    JSQPhotoMediaItem *mediaItem = [[JSQPhotoMediaItem alloc] initWithImage:image];
    mediaItem.appliesMediaViewMaskAsOutgoing = NO;
    MMMessage *phoneMessage = [MMMessage messageWithSenderId:kDemoMyAvatarId
                                                   displayName:kDemoMyAvatarDisplayName
                                                         media:mediaItem];
    phoneMessage.extra = dic;
    [_messages addObject:phoneMessage];
}

@end
