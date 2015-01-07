//
//  ZBBottomIndexScrollView.m
//  MoLi
//
//  Created by zhangbin on 12/27/14.
//  Copyright (c) 2014 zoombin. All rights reserved.
//

#import "ZBBottomIndexView.h"

static CGFloat const heightForIndex = 2;

@interface ZBBottomIndexView ()

@property (readwrite) UIView *indexView;
@property (readwrite) NSArray *buttons;

@end

@implementation ZBBottomIndexView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_indexView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - heightForIndex, frame.size.width, heightForIndex)];
		[self addSubview:_indexView];
		_titleColor = [UIColor blackColor];
		_titleColorSelected = [UIColor blueColor];
		_font = [UIFont systemFontOfSize:13];
	}
	return self;
}

- (void)setIndexColor:(UIColor *)indexColor {
	_indexColor = indexColor;
	_indexView.backgroundColor = _indexColor;
}

- (void)setItems:(NSArray *)items {
	_items = items;
	if (_items.count) {
		CGFloat width = self.bounds.size.width / _items.count;
		CGRect frame = _indexView.frame;
		frame.size.width = width;
		_indexView.frame = frame;
		CGFloat height = self.bounds.size.height - heightForIndex;
		
		frame.origin.x = 0;
		frame.origin.y = 0;
		frame.size.width = width;
		frame.size.height = height;
		NSMutableArray *array = [NSMutableArray array];
		for (int i = 0; i < _items.count; i++) {
			frame.origin.x = width * i;
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			button.tag = i;
			button.frame = frame;
			NSString *title = _items[i];
			[button setTitle:title forState:UIControlStateNormal];
			[button setTitleColor:_titleColor forState:UIControlStateNormal];
			[button setTitleColor:_titleColorSelected forState:UIControlStateSelected];
			button.titleLabel.font = _font;
			[button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
			[self addSubview:button];
			[array addObject:button];
		}
		_buttons = [NSArray arrayWithArray:array];
		[self setSelectedIndex:0];
	}
}

- (void)selected:(UIButton *)sender {
	for (UIButton *button in _buttons) {
		button.selected = NO;
	}
	[self setSelectedIndex:sender.tag];
}

- (void)setTitleColor:(UIColor *)titleColor {
	_titleColor = titleColor;
	if (_titleColor) {
		for (UIButton *button in _buttons) {
			[button setTitleColor:_titleColor forState:UIControlStateNormal];
		}
	}
}

- (void)setTitleColorSelected:(UIColor *)titleColorSelected {
	_titleColorSelected = titleColorSelected;
	if (_titleColor) {
		for (UIButton *button in _buttons) {
			[button setTitleColor:_titleColorSelected forState:UIControlStateSelected];
		}
	}
}

- (void)setFont:(UIFont *)font {
	_font = font;
	if (_font) {
		for (UIButton *button in _buttons) {
			button.titleLabel.font = font;
		}
	}
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
	if (_buttons.count < selectedIndex) {
		return;
	}
	_selectedIndex = selectedIndex;
	CGRect frame = _indexView.frame;
	UIButton *button = _buttons[selectedIndex];
	button.selected = YES;
	CGFloat endX = button.frame.origin.x;
	frame.origin.x = endX;
	[UIView animateWithDuration:0.2 animations:^{
		_indexView.frame = frame;
	}];
	if (_delegate) {
		[_delegate bottomIndexViewSelected:_selectedIndex];
	}
}

@end