#import <Foundation/Foundation.h>

@interface Skill: NSObject
@property int dHp;
@property int dMp;
@property int damage;
-(id)initSkill: (int)dHp :(int)dMp :(int)damage;
-(id)initSkillByPower: (int)power;
-(NSString*)skillToString;
@end
