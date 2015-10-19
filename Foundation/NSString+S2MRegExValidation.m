//
//  NSString+S2MRegExValidation.m
//  S2MToolbox
//
//  Created by MetaJSONParser.
//  Copyright (c) 2013 SinnerSchrader Mobile. All rights reserved.
//

#import "NSString+S2MRegExValidation.h"

static NSString *s2mEmailFormat = @"^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$";

@implementation NSString (S2MRegExValidation)

+ (void)s2m_setEmailFormat:(NSString *)emailFormat {
    s2mEmailFormat = emailFormat;
}

- (NSUInteger)s2m_numberOfMatchesWithRegExString:(NSString *)regExString
{
    if (regExString == nil || [regExString isKindOfClass:[NSString class]] == NO || regExString.length == 0) {
        return 0;
    }
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regExString options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        NSLog(@"Regular expression match error : %@", error);
        return 0;
    }
    return [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
}

- (BOOL)s2m_matchesRegExString:(NSString *)regExString
{
    return ([self s2m_numberOfMatchesWithRegExString:regExString] > 0);
}

- (BOOL)s2m_isValidEmailFormatString 
{
    return [self s2m_matchesRegExString:s2mEmailFormat];
}

@end
