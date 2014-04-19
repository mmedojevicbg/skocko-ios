//
//  GameEngine.m
//  Skocko
//
//  Created by Marko Digital on 4/16/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import "GameEngine.h"

@interface GameEngine () {
    NSMutableArray *choices;
    NSMutableArray *results;
    NSMutableArray *hidden;
    int numberOfColumns;
    int numberOfRows;
}
@end

@implementation GameEngine
-(id)init
{
    if (self = [super init])
    {
        choices = [[NSMutableArray alloc] init];
        results = [[NSMutableArray alloc] init];
        hidden = [[NSMutableArray alloc] init];
        numberOfColumns = 4;
        numberOfRows = 6;
        [self generateRandomCombination];
    }
    return self;
}

-(NSArray*)play:(NSNumber*)choice {
    [choices addObject:choice];
    
    if([self isEndRow]) {
        NSDictionary* result = [self rowResult];
        
        for (int i = 0 ; i < [[result objectForKey:@"numberOfMatches"] integerValue]; i++) {
            [results addObject:[NSNumber numberWithInt:1]];
        }
        
        for (int i = 0 ; i < [[result objectForKey:@"numberOfMatchesIncorrectPosition"] integerValue]; i++) {
            [results addObject:[NSNumber numberWithInt:2]];
        }
        
        for (int i = 0 ; i < numberOfColumns - [[result objectForKey:@"numberOfMatchesIncorrectPosition"] integerValue] - [[result objectForKey:@"numberOfMatches"] integerValue]; i++) {
            [results addObject:[NSNumber numberWithInt:3]];
        }
        

        NSMutableDictionary* userInfo = [NSMutableDictionary dictionary];
        [userInfo setObject:results forKey:@"results"];
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"endRow"
         object:self
         userInfo:userInfo];
        
        if([result objectForKey:@"numberOfMatches"] == [NSNumber numberWithInt:4]) {
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"win"
             object:self];
        }
    }
    if([self isEndGame]) {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:@"endGame"
         object:self];
    }

    return choices;
}

-(NSArray*)getHiddenCombination {
    return hidden;
}

-(BOOL)isEndRow {
    return [choices count] % numberOfColumns == 0;
}

-(BOOL)isEndGame {
    return [choices count] == numberOfColumns * numberOfRows;
}

-(NSDictionary*)rowResult {
    int numberOfMatches = 0;
    int numberOfMatchesIncorrectPosition = 0;
    NSMutableArray* currentChoicesRowCopy = [[NSMutableArray alloc] init];
    NSMutableArray* hiddenCopy = [[NSMutableArray alloc] init];
    for (int i = [choices count] - numberOfColumns; i < [choices count]; i++) {
        [currentChoicesRowCopy addObject:[choices objectAtIndex:i]];
    }
    for (int i = 0; i < numberOfColumns; i++) {
        [hiddenCopy addObject:[hidden objectAtIndex:i]];
    }
    for (int i = 0; i < numberOfColumns; i++) {
        if ([currentChoicesRowCopy objectAtIndex:i] == [hiddenCopy objectAtIndex:i % numberOfColumns]) {
            numberOfMatches++;
            [currentChoicesRowCopy replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:0]];
            [hiddenCopy replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:0]];
        }
    }
    for (int i = 0; i < numberOfColumns; i++) {
        for (int j = 0; j < numberOfColumns; j++) {
            if ([currentChoicesRowCopy objectAtIndex:i] == [hiddenCopy objectAtIndex:j]
                && [currentChoicesRowCopy objectAtIndex:i] != [NSNumber numberWithInt:0]
                && [hiddenCopy objectAtIndex:j] != [NSNumber numberWithInt:0]) {
                numberOfMatchesIncorrectPosition++;
                [currentChoicesRowCopy replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:0]];
                [hiddenCopy replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:0]];
                break;
            }
        }
    }
    NSMutableDictionary* result = [[NSMutableDictionary alloc] init];
    [result setValue:[NSNumber numberWithInt:numberOfMatches] forKey:@"numberOfMatches"];
    [result setValue:[NSNumber numberWithInt:numberOfMatchesIncorrectPosition] forKey:@"numberOfMatchesIncorrectPosition"];
    return result;
}

-(void)generateRandomCombination {
    for (int i = 1; i <= numberOfColumns; i++) {
        [hidden addObject:[self generateRandomItem]];
    }
}

-(NSNumber*)generateRandomItem {
    return [NSNumber numberWithInt:arc4random() % numberOfRows + 1];
}
@end
