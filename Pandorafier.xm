#import <UIKit/UIKit.h>

/***************************** Forward-Declarations ****************************/

// Allows for unlimited skips in all stations
@interface SkipLimitState
- (BOOL)unlimitedStationSkips;
- (BOOL)unlimitedDailySkips;
- (BOOL)unlimitedSkipsWithStation:(id)arg1;
@end

// Removes the "pending" animation when skipping
@interface NowPlayingController
- (void)updateUIForSkipDelayAfterTrackStartWithAnimation:(id)arg1;
@end

/****************************** Static Properties ******************************/

static BOOL kPFUnlimitedSkips = YES;

/************************************ Hooks ************************************/

%hook SkipLimitState

- (BOOL)unlimitedStationSkips {
	return kPFUnlimitedSkips;
}

- (BOOL)unlimitedDailySkips {
	return kPFUnlimitedSkips;
}

- (BOOL)unlimitedSkipsWithStation:(id)arg1 {
	return kPFUnlimitedSkips;
}

%end

%hook NowPlayingController

- (void)updateUIForSkipDelayAfterTrackStartWithAnimation:(id)arg1 {
	if (!kPFUnlimitedSkips) {
		%orig();
	}
}

%end