#include "Skill.h"
#include <stdlib.h>

@implementation Skill
-(id) initSkill: (int)dHp :(int)dMp :(int)damage{
    [self setDHp: dHp];
    [self setDMp: dMp];
    [self setDamage: damage];
    return self;
}

-(id) initSkillByPower: (int)power{
    int rand = arc4random_uniform(10)+1;
    //attack
    if(rand<=power){
        int cMp = arc4random_uniform(30)+1;
        int cDamage = cMp*3+arc4random_uniform(5);
        [self setDHp: 0];
        [self setDMp: -cMp];
        [self setDamage: cDamage];
    }
    //recover
    else{
        int cMp = arc4random_uniform(10)+1;
        int cHp = cMp*2+arc4random_uniform(5);
        [self setDHp: cHp];
        [self setDMp: -cMp];
        [self setDamage: 0];
    }
    return self;
}

-(NSString*) skillToString{
    NSString* result;
    if(self.damage!=0) result = [NSString stringWithFormat: @"Attack, minus %d mp, damage = %d",-(self.dMp),self.damage];
    else result = [NSString stringWithFormat: @"Recover, minus %d mp, plus %d hp",-(self.dMp),self.dHp];
    return result;
}
@end
