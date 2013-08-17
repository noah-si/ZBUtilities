//
//  UIDevice+ZBUtilites.m
//  BookReader
//
//  Created by zhangbin on 8/17/13.
//  Copyright (c) 2013 ZoomBin. All rights reserved.
//

#import "UIDevice+ZBUtilites.h"

@implementation UIDevice (ZBUtilites)

+ (BOOL)is4Inch
{
	return ( [UIScreen mainScreen].bounds.size.height == 568 );
}

@end
