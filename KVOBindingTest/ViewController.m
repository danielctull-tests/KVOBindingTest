//
//  ViewController.m
//  KVOBindingTest
//
//  Created by Daniel Tull on 05.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "ModelObject.h"

void* ViewControllerSliderContext = &ViewControllerSliderContext;
void* ViewControllerObjectContext = &ViewControllerObjectContext;

@interface ViewController ()
@property (nonatomic, strong) ModelObject *modelObject;
@property (nonatomic, weak) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.modelObject = [ModelObject new];
	
	[self.slider addObserver:self
				  forKeyPath:@"value"
					 options:NSKeyValueObservingOptionNew
					 context:ViewControllerSliderContext];
	
	[self.modelObject addObserver:self
					   forKeyPath:@"value"
						  options:NSKeyValueObservingOptionNew
						  context:ViewControllerObjectContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context {
	
	NSLog(@"%@:%@ %@", self, NSStringFromSelector(_cmd), change);
	
	if (context == ViewControllerObjectContext) {
		self.slider.value = self.modelObject.value;
		return;
	}
	
	if (context == ViewControllerSliderContext) {
		self.modelObject.value = self.slider.value;
		return;
	}
	
	[super observeValueForKeyPath:keyPath
						 ofObject:object
						   change:change
						  context:context];
}

@end
