//
//  NSPinCell.m
//  PinConfigurator
//
//  Created by Ben Baker on 8/8/18.
//  Copyright © 2018 Ben Baker. All rights reserved.
//

#import "NSPinCell.h"

@implementation NSPinCell

@synthesize item = _item;
@synthesize isSelected = _isSelected;

- (id)initWithCoder:(NSCoder *)decoder {
	self = [super initWithCoder:decoder];
	
	if (self) {
	}
	
	return self;
}

- (void)dealloc {
	[_item release];
	
	[super dealloc];
}

- (void)setItem:(AudioNode *)device isSelected:(BOOL)isSelected
{
	_item = device;
	_isSelected = isSelected;
}

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
	if (!_item)
		return;
	
	[[NSGraphicsContext currentContext] saveGraphicsState];
	
	_isSelected = [self isHighlighted];
	NSRect rect = NSMakeRect(cellFrame.origin.x + 3.0, cellFrame.origin.y + 3.0, 10, 10);
	NSColor *jackColor = [_item jackColor];
	[jackColor set];
	
	if ([_item hasJack])
	{
		NSBezierPath *bezierPath = [NSBezierPath bezierPathWithOvalInRect:rect];
		[bezierPath setLineWidth:3];
		
		if ([jackColor isEqual:[NSColor whiteColor]] && ![self isSelected])
			[[NSColor lightGrayColor] set];
		
		[bezierPath stroke];
	}
	else
	{
		NSRectFill(rect);
	}
	
	[[NSGraphicsContext currentContext] restoreGraphicsState];
}

@end
