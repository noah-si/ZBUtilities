//
//  NSString+ZBUtilites.m
//  BookReader
//
//  Created by zhangbin on 8/4/13.
//  Copyright (c) 2013 ZoomBin. All rights reserved.
//

#import "NSString+ZBUtilites.h"

@implementation NSString (ZBUtilites)

+ (NSString *)ChineseSpace
{
	return @"　";
}

+ (NSString *)dashLineWithLength:(NSUInteger)length
{
	NSMutableString *line = [NSMutableString string];
	for (int i = 0; i < length; i++) {
		[line appendString:@"-"];
	}
	return line;
}

+ (NSString *)dottedLineWithLength:(NSUInteger)length
{
	NSMutableString *line = [NSMutableString string];
	for (int i = 0; i < length; i++) {
		[line appendString:@"."];
	}
	return line;
}

@end
