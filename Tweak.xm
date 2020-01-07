#import "important.h"
#import <spawn.h>

@interface _UIStatusBarStringView : UIView
@property (copy) NSString *text;
@end

%hook _UIStatusBarStringView

NSString *stringTest = @"%";

- (void)setText:(NSString *)text {
	if(GetPrefBool(@"Enable") && ![text containsString:@":"] && ![text containsString:@"‎◀︎"] && ![text containsString:stringTest] && ![text isEqual:@""] && ![text isEqual:@"LTE"] && ![text isEqual:@"4G"] && ![text isEqual:@"3G"]) {
		NSString *lineOne = GetPrefString(@"lineOne");
		NSLog(@"UnderTime '%@'", text);
		%orig(lineOne);
	}
	else {
		%orig(text);
	}
}
%end
