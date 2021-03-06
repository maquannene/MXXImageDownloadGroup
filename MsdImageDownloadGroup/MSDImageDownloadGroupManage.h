//
//  MSDImageDownloadGroupManage.h
//  vb
//
//  Created by 马权 on 3/17/16.
//  Copyright © 2016 maquan. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const MSDImageDownloadDefaultGroupIdentifier;

@protocol SDWebImageOperation;

@interface MSDImageDownloadGroup : NSObject

@property (nonatomic, assign) NSInteger maxConcurrentDownloads;

- (instancetype)initWithGroupIdentifier:(NSString *)identifier NS_DESIGNATED_INITIALIZER;

@end

@interface MSDImageDownloadGroupManage : NSObject

+ (instancetype)shareInstance;

- (void)addGroup:(MSDImageDownloadGroup *)group;

- (void)removeGroupWithIdentifier:(NSString *)identifier;

- (void)addImageDownLoadOperation:(id<SDWebImageOperation>)operation toGroup:(NSString *)identifier forKey:(NSString *)key;

- (void)removeImageDownLoadOperation:(NSString *)key fromGroup:(NSString *)identifier;

- (void)debug:(BOOL)debug;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

@end
