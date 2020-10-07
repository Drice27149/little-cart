#import <Foundation/Foundation.h>
#include "Skill.h"

@interface Hero:  NSObject{
    //[1,skCnt]: specail attack
    //[0]: normal attack
    Skill* skill[10];
}

@property NSString* name;
@property NSString* country;
@property int hitPoint;
@property int magicPoint;
@property int power; //[1,10]
@property int skCnt;

-(id) initByRand;
-(id) initByHero;
-(void) generateSkill;
-(Skill*) getAction;
-(void) recieveAction: (Skill*)skill;
-(void) recover;
-(void) printInform;
-(void) printState;
-(NSString*) getState;
-(NSString*) getInform;
@end

@interface LvBu: Hero
@end

@interface ZhaoYun: Hero
@end

@interface DianWei: Hero
@end

@interface GuanYu: Hero
@end

@interface MaChao: Hero
@end

@interface ZhangFei: Hero
@end

@interface HuangZhong: Hero
@end

@interface XuChu: Hero
@end

@interface SunCe: Hero
@end

@interface TaiShici: Hero
@end

@interface XiaHoudun: Hero
@end

