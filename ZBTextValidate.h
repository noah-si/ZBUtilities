//
//  CTTextFieldValidate.h
//  Clutter
//
//  Created by zhangbin on 7/12/13.
//  Copyright (c) 2013 ZoomBin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNTextField.h"

@interface LNTextValidate : NSObject

@property (nonatomic, assign) LNTextValidateType type;
@property (nonatomic, strong) NSPredicate *predicate;
@property (nonatomic, strong) NSString *messageTitle;
@property (nonatomic, strong) NSString *invalidMessage;

- (BOOL)isValid:(NSString *)text invalidMessage:(NSString **)invalidMessage;
- (BOOL)isValid:(NSString *)text messageTitle:(NSString **)messageTitle invalidMessage:(NSString **)invalidMessage;

+ (id)textValidateWithType:(LNTextValidateType)type;
+ (id)textValidateWithType:(LNTextValidateType)type invalidMessage:(NSString *)invalidMessage;

+ (NSPredicate *)defaultRequiredPredicate;
+ (NSPredicate *)defaultEmailPredicate;
+ (NSPredicate *)defaultPasswordPredicate;
+ (NSPredicate *)defaultUSZipPredicate;

@end

#pragma mark - TEST

@interface LNTextValidate(Test)

+ (void)test;

@end
