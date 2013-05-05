//
//  ModelObject.m
//  KVOBindingTest
//
//  Created by Daniel Tull on 05.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ModelObject.h"

@implementation ModelObject

- (void)setValue:(float)value {
	_value = value;
	NSLog(@"%@:%@ %f", self, NSStringFromSelector(_cmd), value);
}

@end
