//
//  ExCustomTableViewCell.m
//  Example
//
//  Created by 马权 on 3/31/16.
//  Copyright © 2016 马权. All rights reserved.
//

#import "ExCustomTableViewCell.h"
#import "SDWebImage.h"
#import "UIImageView+mq_WebCache.h"

@interface ExCustomTableViewCell ()

{
    __weak IBOutlet UIImageView *_sdImageView;
    __weak IBOutlet UIImageView *_mqImageView;
    __weak IBOutlet UIProgressView *_sdImageLoadProgressView;
    __weak IBOutlet UIProgressView *_mqImageLoadProgressView;
    __strong NSArray<NSURL *> *_URLs;
}

@end

@implementation ExCustomTableViewCell

- (void)prepareForReuse
{
    _sdImageLoadProgressView.hidden = NO;
    _sdImageLoadProgressView.progress = 0;
    _mqImageLoadProgressView.hidden = NO;
    _mqImageLoadProgressView.progress = 0;
}

- (void)setImageWithURLs:(NSArray<NSURL *> *)URLs
{
    _URLs = URLs;
    __weak typeof(self) weakSelf = self;
    
    NSString *sdCaptureURLStr = URLs[0].absoluteString;
    [_sdImageView sd_setImageWithURL:URLs[0] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf && [sdCaptureURLStr isEqualToString:strongSelf->_URLs[0].absoluteString]) {
            strongSelf->_sdImageLoadProgressView.hidden = NO;
            strongSelf->_sdImageLoadProgressView.progress = (CGFloat)receivedSize / expectedSize;
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf && [sdCaptureURLStr isEqualToString:strongSelf->_URLs[0].absoluteString]) {
           strongSelf->_sdImageLoadProgressView.hidden = YES;
        }
    }];
    
    NSString *mqCaptureURLStr = URLs[1].absoluteString;
    [_mqImageView mq_setImageWithURL:URLs[1] groupIdentifier:self.reuseIdentifier placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf && [mqCaptureURLStr isEqualToString:strongSelf->_URLs[1].absoluteString]) {
            strongSelf->_mqImageLoadProgressView.hidden = NO;
            strongSelf->_mqImageLoadProgressView.progress = (CGFloat)receivedSize * 1.0 / expectedSize;
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf && [mqCaptureURLStr isEqualToString:strongSelf->_URLs[1].absoluteString]) {
            strongSelf->_mqImageLoadProgressView.hidden = YES;
        }
    }];
}

@end
