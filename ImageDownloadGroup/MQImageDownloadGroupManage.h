//
//  MQImageDownloadGroupManage.h
//  vb
//
//  Created by 马权 on 3/17/16.
//  Copyright © 2016 maquan. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const MQImageDownloadDefaultGroupIdentifier;

@protocol SDWebImageOperation;

@interface MQImageDownloadGroup : NSObject

@property (nonatomic, assign) NSInteger maxConcurrentDownloads;

- (instancetype)initWithGroupIdentifier:(NSString *)identifier NS_DESIGNATED_INITIALIZER;

@end

@interface MQImageDownloadGroupManage : NSObject

+ (instancetype)shareInstance;

- (void)addGroup:(MQImageDownloadGroup *)group;

- (void)removeGroupWithIdentifier:(NSString *)identifier;

- (void)setImageDownLoadOperation:(id<SDWebImageOperation>)operation toGroup:(NSString *)identifier forKey:(NSString *)key;

- (void)removeImageDownLoadOperation:(id<SDWebImageOperation>)operation fromGroup:(NSString *)identifier forKey:(NSString *)key;

@end
