//
//  ExCustomTableViewCell.m
//  Example
//
//  Created by 马权 on 3/31/16.
//  Copyright © 2016 马权. All rights reserved.
//

#import "ExCustomTableViewCell.h"
@import SDWebImage;
#import "UIImageView+msd_WebCache.h"

@interface ExCustomTableViewCell ()

{
    __weak IBOutlet UIImageView *_sdImageView;
    __weak IBOutlet UIImageView *_msdImageView;
    __weak IBOutlet UIProgressView *_sdImageLoadProgressView;
    __weak IBOutlet UIProgressView *_msdImageLoadProgressView;
    __strong NSArray<NSURL *> *_URLs;
}

@end

@implementation ExCustomTableViewCell

- (void)prepareForReuse
{
    _sdImageLoadProgressView.hidden = NO;
    _sdImageLoadProgressView.progress = 0;
    _msdImageLoadProgressView.hidden = NO;
    _msdImageLoadProgressView.progress = 0;
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

    NSString *msdCaptureURLStr = URLs[1].absoluteString;
    [_msdImageView msd_setImageWithURL:URLs[1] groupIdentifier:self.reuseIdentifier placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf && [msdCaptureURLStr isEqualToString:strongSelf->_URLs[1].absoluteString]) {
            strongSelf->_msdImageLoadProgressView.hidden = NO;
            strongSelf->_msdImageLoadProgressView.progress = (CGFloat)receivedSize * 1.0 / expectedSize;
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        __strong typeof (weakSelf) strongSelf = weakSelf;
        if (strongSelf && [msdCaptureURLStr isEqualToString:strongSelf->_URLs[1].absoluteString]) {
            strongSelf->_msdImageLoadProgressView.hidden = YES;
        }
    }];
}

@end
