#import "YouTubeContactPhotoProvider.h"

@implementation YouTubeContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
	NSString *videoThumbnail = [notification.applicationUserInfo valueForKeyPath:@"attachment-url-static"];
    if (!videoThumbnail) return nil;
    NSURL *videoThumbnailURL = [NSURL URLWithString:videoThumbnail];
    if (!videoThumbnailURL) return nil;
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:videoThumbnail fromURL:videoThumbnailURL];
}

@end