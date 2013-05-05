//
//  KVOSlider.m
//  KVOBindingTest
//
//  Created by Daniel Tull on 05.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "KVOSlider.h"

@implementation KVOSlider

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (!self) return nil;
	[self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (!self) return nil;
	[self addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
	return self;
}

- (void)valueChanged:(id)sender {
	[self willChangeValueForKey:@"value"];
	[self didChangeValueForKey:@"value"];
}


@end
