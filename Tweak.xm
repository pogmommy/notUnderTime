#import "important.h"
#import <spawn.h>


@interface _UIStatusBarStringView : UIView
@property (copy) NSString *text;
@end

%hook _UIStatusBarStringView

- (void)setText:(NSString *)text {
	if(GetPrefBool(@"Enable") && ![text containsString:@":"]) {
		NSString *lineOne = GetPrefString(@"lineOne");
		%orig(lineOne);
	}
	else {
		%orig(text);
	}
}
%end
