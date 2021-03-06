//
//  Copyright (c) SRG SSR. All rights reserved.
//
//  License information is available from the LICENSE file.
//

#import "SRGMediaPlayerSharedController.h"

#import "SRGMediaPlayerViewController.h"

@implementation SRGMediaPlayerSharedController

#pragma mark Object lifecycle

- (instancetype)init
{
    if (self = [super init]) {
        self.playerConfigurationBlock = ^(AVPlayer *player) {
            player.allowsExternalPlayback = YES;
            player.usesExternalPlaybackWhileExternalScreenIsActive = YES;
        };
        
        __weak __typeof(self) weakSelf = self;
        self.pictureInPictureControllerCreationBlock = ^(AVPictureInPictureController *pictureInPictureController) {
            pictureInPictureController.delegate = weakSelf;
        };
    }
    return self;
}

#pragma mark AVPictureInPictureControllerDelegate protocol

- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    // SRGMediaPlayerViewController is always displayed modally, the following therefore always works
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL))completionHandler
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    // If no SRGMediaPlayerViewController instance is currently displayed (always modally)
    if (! [rootViewController.presentedViewController isKindOfClass:[SRGMediaPlayerViewController class]]) {
        // FIXME: Init with controller
        SRGMediaPlayerViewController *mediaPlayerViewController = [[SRGMediaPlayerViewController alloc] init];
        
        // Dismiss any modal currently displayed if needed
        if (rootViewController.presentedViewController) {
            [rootViewController dismissViewControllerAnimated:YES completion:^{
                [rootViewController presentViewController:mediaPlayerViewController animated:YES completion:^{
                    // It is very important that this block is called at the very end of the process, otherwise silly
                    // things might happen during the transition (e.g. player rate set to 0)
                    completionHandler(YES);
                }];
            }];
        }
        else {
            [rootViewController presentViewController:mediaPlayerViewController animated:YES completion:^{
                // See comment above
                completionHandler(YES);
            }];
        }
    }
}

- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController
{
    // Reset the status of the player when picture in picture is exited anywhere except from the SRGMediaPlayerViewController
    // itself
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    if (! [rootViewController.presentedViewController isKindOfClass:[SRGMediaPlayerViewController class]]) {
        [self reset];
    }
}

@end
