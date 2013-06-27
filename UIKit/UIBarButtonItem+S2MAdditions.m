//
//  UIBarButtonItem+S2MAdditions.m
//
//
//  Created by François Benaiteau on 6/10/13.
//  Copyright (c) 2013 SinnerSchrader Mobile. All rights reserved.
//

#import "UIBarButtonItem+S2MAdditions.h"

@implementation UIBarButtonItem (S2MAdditions)

-(id)initWithImageName:(NSString*)imageName target:(id)target action:(SEL)action
{
    UIImage* image = [UIImage imageNamed:imageName];
    
    UIButton* button = [[UIButton alloc] init];
    [button setImage:image forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0,
                                0,
                                image.size.width,
                                image.size.height)];
    
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

-(id)initWithTitle:(NSString*)title backgroundImage:(UIImage*)image target:(id)target action:(SEL)action
{
    
    UIButton* button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    
    if (image) {
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0,
                                    0,
                                    image.size.width,
                                    image.size.height)];

    }else{
        // in case there is no image, avoid having a CGRectZero frame
        [button sizeToFit];
    }
    
    [button addTarget:target
                   action:action
         forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
