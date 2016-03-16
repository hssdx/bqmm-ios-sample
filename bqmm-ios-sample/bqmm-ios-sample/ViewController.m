//
//  ViewController.m
//  StampMeSDK
//
//  Created by ceo on 8/14/15.
//  Copyright (c) 2015 siyanhui. All rights reserved.
//

#import "ViewController.h"
#import "DemoModelData.h"
#import <BQMM/BQMM.h>
#import "MMTextParser+ExtData.h"

static NSString * const kPackageId = @"packageId";
static NSString * const kEmojiCode = @"emo_code";

@interface ViewController () <MMEmotionCentreDelegate>

@property (nonatomic, strong) DemoModelData *demoData;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *appId = @"3c0427f40a4e45d4948d8b727b46132b";
//    NSString *secret = @"381f18282c9942b18c5d29dfc0b40cd8";
    NSString *appId = @"15e0710942ec49a29d2224a6af4460ee";
    NSString *secret = @"b11e0936a9d04be19300b1d6eec0ccd5";
    
    UIImage *bgImg = [UIImage imageNamed:@"bg"];
    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage:bgImg];
    
    [[MMEmotionCentre defaultCentre] setAppId:appId
                                       secret:secret];
    [MMEmotionCentre defaultCentre].delegate = self;
//    [[MMEmotionCentre defaultCentre] setSupportedMixedTextImage:YES];
    
    UIButton *leftBtn = self.inputToolbar.contentView.leftBarButtonItem;
    UITextView *textView = self.inputToolbar.contentView.textView;
    [[MMEmotionCentre defaultCentre] shouldShowShotcutPopoverAboveView:leftBtn
                                                             withInput:textView];
    
    UIImage *emojiImg = [UIImage imageNamed:@"emoji"];
    [leftBtn setImage:emojiImg forState:UIControlStateNormal];
    [leftBtn setImage:nil forState:UIControlStateHighlighted];
    self.inputToolbar.contentView.textView.layer.cornerRadius = 0;
    self.inputToolbar.barTintColor = [UIColor whiteColor];

    self.inputToolbar.contentView.leftBarButtonItemWidth = self.inputToolbar.contentView.rightBarButtonItemWidth;
    
    UIImage *sendImg = [UIImage imageNamed:@"send"];
    UIButton *rightBtn = self.inputToolbar.contentView.rightBarButtonItem;
    [rightBtn setImage:sendImg
              forState:UIControlStateNormal];
    [rightBtn setTitle:nil
              forState:UIControlStateNormal];
    
    _demoData = [[DemoModelData alloc] init];
    self.senderId = kDemoMyAvatarId;
    self.senderDisplayName = kDemoMyAvatarDisplayName;
    
    NSLog(@"screen size: %@", NSStringFromCGRect([[UIScreen mainScreen] bounds]));
    NSLog(@"screen frame: %@", NSStringFromCGRect([[UIScreen mainScreen] applicationFrame]));
    
    
//    [[MMEmotionCentre defaultCentre] fetchEmojiByCode:@"bltf" completionHandler:^(MMEmoji *emoji, NSError *error) {
//        NSLog(@"");
//    }];
    
//    [[MMEmotionCentre defaultCentre] fetchEmojisByType:MMFetchTypeBig codes:@[@"bltf"] completionHandler:^(NSArray *emojis, NSError *error) {
//        NSLog(@"");
//    }];
    
//    [[MMEmotionCentre defaultCentre] fetchEmojisByCodes:@[@"bltf", @"bltf", @"bltf"] completionHandler:^(NSArray *emojis, NSError *error) {
//        NSLog(@"");
//    }];
    
//    [MMTextParser parseMMText:@"[[[[[[[[[[[[jcbgwx]]"
//            completionHandler:^(NSArray *textImgArray, NSError *error) {
//                NSLog(@"textimage array: %@",textImgArray);
//            }];
    
//    [MMTextParser parseMMText:@"[jcbgwx][jcbgs][jcbgbb]"
//            completionHandler:^(NSArray *textImgArray, NSError *error) {
//                NSLog(@"textimage array: %@",textImgArray);
//            }];
//    [MMTextParser parseMMText:@"[jcbgt][jcbggd][jcbgp]"
//            completionHandler:^(NSArray *textImgArray, NSError *error) {
//                NSLog(@"textimage array: %@",textImgArray);
//            }];
//    [MMTextParser parseMMText:@"[jcbgss][jcbgsq][jcbgng]"
//            completionHandler:^(NSArray *textImgArray, NSError *error) {
//                NSLog(@"textimage array: %@",textImgArray);
//            }];
//    [MMTextParser parseMMText:@"[jcbgt][jcbggd][jcbgp]"
//            completionHandler:^(NSArray *textImgArray, NSError *error) {
//                NSLog(@"textimage array: %@",textImgArray);
//            }];
    
//    [MMTextParser localParseMMText:@"[jcbgwx][jcbgt][jcbgss][jcbgk]" completionHandler:^(NSArray *textImgArray) {
//        NSLog(@"");
//    }];
    
//    [MMTextParser localParseMMText:@"[jcbgt][jcbgt][jcbgt][jcbgt][jcbgt][jcbgt][jcbgt]"
//                 completionHandler:^(NSArray *textImgArray) {
//                     NSLog(@"textimage array: %@",textImgArray);
//                 }];
    
//    self.inputToolbar.contentView.textView.mmText = @"aaa[kkkk]bbb[jcbgt]ccc[ssss]ddd";
//    NSLog(@"%@", self.inputToolbar.contentView.textView.mmText);
    
//    NSLog([[MMEmotionCentre defaultCentre] version]);

//    [[MMEmotionCentre defaultCentre] fetchEmojisByType:MMFetchTypeSmall codes:@[@"jcbgt", @"jcbgwy", @"jcbgk", @"jcbgll", @"jcbghx"] completionHandler:^(NSArray *emojis, NSError *error) {
//        NSLog(@"");
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - centre delegate

- (void)didSelectEmoji:(MMEmoji *)emoji{
    NSLog(@"image scale: %@, size: %@",@(emoji.emojiImage.scale),NSStringFromCGSize(emoji.emojiImage.size));
    [_demoData addPhotoMediaMessage:emoji.emojiImage
                           withInfo:@{kEmojiCode : emoji.emojiCode}];
    [self finishSendingMessageAnimated:YES];
    [self robotSendMessage];
}

- (void)didSelectTipEmoji:(MMEmoji *)emoji
{
    NSLog(@"image scale: %@, size: %@",@(emoji.emojiImage.scale),NSStringFromCGSize(emoji.emojiImage.size));
    [_demoData addPhotoMediaMessage:emoji.emojiImage
                           withInfo:@{kEmojiCode : emoji.emojiCode}];
    self.inputToolbar.contentView.textView.text = @"";
    [self finishSendingMessageAnimated:YES];
    [self robotSendMessage];
}

- (void)didSendWithInput:(UIResponder<UITextInput> *)input {
    NSString *message = [self jsq_currentlyComposedMessageText];
    if ([message length] == 0) {
        return;
    }
    
    [self didPressSendButton:nil
             withMessageText:message
                    senderId:self.senderId
           senderDisplayName:self.senderDisplayName
                        date:[NSDate date]];
}

- (void)tapOverlay
{
    self.inputToolbar.contentView.leftBarButtonItem.selected = NO;
}

#pragma mark - robot response

- (void)robotSendMessage {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(),^{
        [JSQSystemSoundPlayer jsq_playMessageReceivedSound];
        MMMessage *message = [[MMMessage alloc] initWithSenderId:kDemoOtherAvatarId
                                               senderDisplayName:kDemoOtherDisplayName
                                                            date:[NSDate date]
                                                            text:@"robot message!"];
        [self.demoData.messages addObject:message];
        [self finishReceivingMessageAnimated:YES];

    });
}

#pragma mark - JSQMessagesViewController method overrides
- (NSString *)jsq_currentlyComposedMessageText
{
    JSQMessagesComposerTextView *textView = self.inputToolbar.contentView.textView;
    
    [textView.inputDelegate selectionWillChange:textView];
    [textView.inputDelegate selectionDidChange:textView];
    
    return [textView.mmText jsq_stringByTrimingWhitespace];
}

- (void)didPressSendButton:(UIButton *)button
           withMessageText:(NSString *)text
                  senderId:(NSString *)senderId
         senderDisplayName:(NSString *)senderDisplayName
                      date:(NSDate *)date
{
    [JSQSystemSoundPlayer jsq_playMessageSentSound];
    
    [MMTextParser localParseMMText:text completionHandler:^(NSArray *textImgArray) {
        NSDictionary *ext = nil;
        NSString *sendStr = @"";
        for (id obj in textImgArray) {
            if ([obj isKindOfClass:[MMEmoji class]]) {
                MMEmoji *emoji = (MMEmoji*)obj;
                if (!ext) {
                    ext = @{@"txt_msgType":@"emojitype",
                            @"msg_data":[MMTextParser extDataWithTextImageArray:textImgArray]};
                }
                sendStr = [sendStr stringByAppendingString:[NSString stringWithFormat:@"[%@]", emoji.emojiName]];
            }
            else if ([obj isKindOfClass:[NSString class]]) {
                sendStr = [sendStr stringByAppendingString:obj];
            }
        }
        
        MMMessage *message = [[MMMessage alloc] initWithSenderId:senderId
                                               senderDisplayName:senderDisplayName
                                                            date:date
                                                            text:text];
        message.extra = ext;
        [self.demoData.messages addObject:message];
        
        [self finishSendingMessageAnimated:YES];
        [self robotSendMessage];
    }];
}

- (void)didPressAccessoryButton:(UIButton *)sender
{
    if (![self.inputToolbar.contentView.textView isFirstResponder]) {
        [self.inputToolbar.contentView.textView becomeFirstResponder];
    }
    
    if (self.inputToolbar.contentView.textView.inputView == nil) {
        [[MMEmotionCentre defaultCentre] attachEmotionKeyboardToInput:self.inputToolbar.contentView.textView];
    }else {
        [[MMEmotionCentre defaultCentre] switchToDefaultKeyboard];
    }
}

#pragma mark - JSQMessages CollectionView DataSource

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView
       messageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.demoData.messages objectAtIndex:indexPath.item];
}

- (void)collectionView:(JSQMessagesCollectionView *)collectionView
        didDeleteMessageAtIndexPath:(NSIndexPath *)indexPath
{
    [self.demoData.messages removeObjectAtIndex:indexPath.item];
}

- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId]) {
        return self.demoData.outgoingBubbbleImage;
    }
    
    return self.demoData.incomingbubbleImage;
}

- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId]) {
        return self.demoData.myAvatar;
    }
    else {
        return self.demoData.otherAvatar;
    }
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item % 3 == 0) {
        JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
        return [[JSQMessagesTimestampFormatter sharedFormatter] attributedTimestampForDate:message.date];
    }
    
    return nil;
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    /**
     *  iOS7-style sender name labels
     */
    if ([message.senderId isEqualToString:self.senderId]) {
        return nil;
    }
    
    if (indexPath.item - 1 > 0) {
        JSQMessage *previousMessage = [self.demoData.messages objectAtIndex:indexPath.item - 1];
        if ([[previousMessage senderId] isEqualToString:message.senderId]) {
            return nil;
        }
    }
    
    /**
     *  Don't specify attributes to use the defaults.
     */
    return [[NSAttributedString alloc] initWithString:message.senderDisplayName];
}

- (NSAttributedString *)collectionView:(JSQMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.demoData.messages count];
}

- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  Override point for customizing cells
     */
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    /**
     *  Configure almost *anything* on the cell
     *
     *  Text colors, label text, label colors, etc.
     *
     *
     *  DO NOT set `cell.textView.font` !
     *  Instead, you need to set `self.collectionView.collectionViewLayout.messageBubbleFont` to the font you want in `viewDidLoad`
     *
     *
     *  DO NOT manipulate cell layout information!
     *  Instead, override the properties you want on `self.collectionView.collectionViewLayout` from `viewDidLoad`
     */
    
    JSQMessage *msg = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if (!msg.isMediaMessage) {
        
        if ([msg.senderId isEqualToString:self.senderId]) {
            cell.textView.textColor = [UIColor blackColor];
        }
        else {
            cell.textView.textColor = [UIColor whiteColor];
        }
        
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : cell.textView.textColor,
                                              NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    }else {
        [cell.messageBubbleImageView setContentMode:UIViewContentModeScaleAspectFit];
    }
    
    return cell;
}

#pragma mark - JSQMessages collection view flow layout delegate

#pragma mark - Adjusting cell label heights

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  Each label in a cell has a `height` delegate method that corresponds to its text dataSource method
     */
    
    /**
     *  This logic should be consistent with what you return from `attributedTextForCellTopLabelAtIndexPath:`
     *  The other label height delegate methods should follow similarly
     *
     *  Show a timestamp for every 3rd message
     */
    if (indexPath.item % 3 == 0) {
        return kJSQMessagesCollectionViewCellLabelHeightDefault;
    }
    
    return 0.0f;
}

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  iOS7-style sender name labels
     */
    JSQMessage *currentMessage = [self.demoData.messages objectAtIndex:indexPath.item];
    if ([[currentMessage senderId] isEqualToString:self.senderId]) {
        return 0.0f;
    }
    
    if (indexPath.item - 1 > 0) {
        JSQMessage *previousMessage = [self.demoData.messages objectAtIndex:indexPath.item - 1];
        if ([[previousMessage senderId] isEqualToString:[currentMessage senderId]]) {
            return 0.0f;
        }
    }
    
    return kJSQMessagesCollectionViewCellLabelHeightDefault;
}

- (CGFloat)collectionView:(JSQMessagesCollectionView *)collectionView
                   layout:(JSQMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.0f;
}

#pragma mark - Responding to collection view tap events

- (void)collectionView:(JSQMessagesCollectionView *)collectionView
                header:(JSQMessagesLoadEarlierHeaderView *)headerView didTapLoadEarlierMessagesButton:(UIButton *)sender
{
    NSLog(@"Load earlier messages!");
}

- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapAvatarImageView:(UIImageView *)avatarImageView atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Tapped avatar!");
}

- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapMessageBubbleAtIndexPath:(NSIndexPath *)indexPath
{
    MMMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    if(message.extra[kEmojiCode]){
        [self.inputToolbar endEditing:YES];
        UIViewController *emojiController = [[MMEmotionCentre defaultCentre] controllerForEmotionCode:message.extra[kEmojiCode]];
        [self.navigationController pushViewController:emojiController animated:YES];
    }
}

- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapCellAtIndexPath:(NSIndexPath *)indexPath touchLocation:(CGPoint)touchLocation
{
    NSLog(@"Tapped cell at %@!", NSStringFromCGPoint(touchLocation));
}





@end
