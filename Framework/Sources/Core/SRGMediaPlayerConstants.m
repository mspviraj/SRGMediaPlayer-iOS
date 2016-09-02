//
//  Copyright (c) SRG. All rights reserved.
//
//  License information is available from the LICENSE file.
//

#import "SRGMediaPlayerConstants.h"

NSTimeInterval const SRGMediaPlayerLiveDefaultTolerance = 30.;                // same tolerance as built-in iOS player

NSString * const SRGMediaPlayerPlaybackStateDidChangeNotification = @"SRGMediaPlayerPlaybackStateDidChangeNotification";
NSString * const SRGMediaPlayerPreviousPlaybackStateKey = @"SRGMediaPlayerPreviousPlaybackStateKey";

NSString * const SRGMediaPlayerPlaybackDidFailNotification = @"SRGMediaPlayerPlaybackDidFailNotification";
NSString * const SRGMediaPlayerErrorKey = @"SRGMediaPlayerErrorKey";

NSString * const SRGMediaPlayerPictureInPictureStateDidChangeNotification = @"SRGMediaPlayerPictureInPictureStateDidChangeNotification";

NSString * const SRGMediaPlayerSegmentDidStartNotification = @"SRGMediaPlayerSegmentDidStartNotification";
NSString * const SRGMediaPlayerSegmentDidEndNotification = @"SRGMediaPlayerSegmentDidEndNotification";

NSString * const SRGMediaPlayerWillSkipBlockedSegmentNotification = @"SRGMediaPlayerWillSkipBlockedSegmentNotification";
NSString * const SRGMediaPlayerDidSkipBlockedSegmentNotification = @"SRGMediaPlayerDidSkipBlockedSegmentNotification";

NSString * const SRGMediaPlayerSegmentKey = @"SRGMediaPlayerSegmentKey";
NSString * const SRGMediaPlayerProgrammaticKey = @"SRGMediaPlayerProgrammaticKey";