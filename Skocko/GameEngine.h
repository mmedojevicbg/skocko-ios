//
//  GameEngine.h
//  Skocko
//
//  Created by Marko Digital on 4/16/14.
//  Copyright (c) 2014 BeoApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameEngine : NSObject
-(NSArray*)play:(NSNumber*)choice;
-(NSArray*)getHiddenCombination;
@end
