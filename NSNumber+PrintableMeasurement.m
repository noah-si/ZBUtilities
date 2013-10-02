//
//  NSNumber+ReadableDistance.m
//  find
//
//  Created by zhangbin on 9/10/13.
//  Copyright (c) 2013 ZoomBin. All rights reserved.
//

#import "NSNumber+PrintableMeasurement.h"

@implementation NSNumber (PrintableMeasurement)

- (NSString *)printableDistance
{
//	if (self.integerValue < 10) {
//		return @"<10m";
//	} else if (self.integerValue < 100) {
//		return @"<100m";
//	} else
	if (self.integerValue < 1000) {
		return [NSString stringWithFormat:@"%dm", self.integerValue];
	} else if (self.integerValue < 10000) {
		return [NSString stringWithFormat:@"%.1fkm", self.floatValue / 1000];
	} else if (self.integerValue < 1000000) {
		return [NSString stringWithFormat:@"%.0fkm", self.floatValue / 1000];
	} else {
		return @"千里之外";
	}
}

- (NSString *)printableBytes
{
	if (self.integerValue < 1024) {
		return [NSString stringWithFormat:@"%dB", self.integerValue];
	} else if (self.integerValue < 1024 * 1024) {
		return [NSString stringWithFormat:@"%.1fKB", self.floatValue / 1024];
	} else if (self.integerValue < 1024 * 1024 * 1024) {
		return [NSString stringWithFormat:@"%.1fMB", self.floatValue / 1024 / 1024];
	} else
		return [NSString stringWithFormat:@"%.1fGB", self.floatValue / 1024 / 1024 / 1024];
}

- (NSString *)printableTimestamp
{
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];
	NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:date];
	if (timeInterval < 60 * 60) {
		return [NSString stringWithFormat:@"%d分钟前", (NSInteger)(timeInterval / 60) + 1];
	} else if (timeInterval < 60 * 60 * 24) {
		return [NSString stringWithFormat:@"%d小时前", (NSInteger)(timeInterval / 60 / 60) + 1];
	} else if (timeInterval < 60 * 60 * 24 * 31) {
		return [NSString stringWithFormat:@"%d天前", (NSInteger)(timeInterval / 60 / 60 / 24) + 1];
	} else {
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		NSLocale *currentLocale = [NSLocale currentLocale];
		[dateFormatter setLocale:currentLocale];
		return [dateFormatter stringFromDate:date];
	}
}

@end
