#include "Hero.h"

@implementation Hero: NSObject

-(id)initByHero{
    return self;
}

-(id)initByRand{
    int rand = arc4random_uniform(10)+1;
    [self setName: [NSString stringWithFormat:@"%@%d",@"hero",rand]];
    [self setHitPoint: (arc4random_uniform(100)+1)];
    [self setMagicPoint: (arc4random_uniform(100)+1)];
    [self setPower: (arc4random_uniform(10)+1)];
    [self generateSkill];
    return self;
}

-(void) generateSkill{
    //normal attack
    skill[0] = [[Skill alloc] initSkill:0 :0 :1];
    //special attack
    for(int i = 1; i <= self.skCnt; i++){
        skill[i] = [[Skill alloc] initSkillByPower: [self power]];
    }
}

-(Skill*) getAction{
    int choose = arc4random_uniform(self.skCnt)+1;
    if([self magicPoint]+[skill[choose] dMp]<0) choose = 0;
    [self setHitPoint: ([self hitPoint]+[skill[choose] dHp])];
    [self setMagicPoint: ([self magicPoint]+[skill[choose] dMp])];
    return skill[choose];
}

-(void) recieveAction: (Skill*)skill{
    [self setHitPoint: ([self hitPoint]-[skill damage])];
}

-(void) printState{
    NSLog(@"%@: hp = %d, mp = %d\n",[self name],[self hitPoint],[self magicPoint]);
}

-(void) printInform{
    NSLog(@"name = %@, country = %@, hp = %d, mp = %d, power = %d\n",self.name,self.country,self.hitPoint,self.magicPoint,self.power);
}

-(NSString*) getState{
    NSString* result = [NSString stringWithFormat: @"%@: hp = %d, mp = %d\n",[self name],[self hitPoint],[self magicPoint]];
    return result;
}

-(NSString*) getInform{
    NSString* result = [NSString stringWithFormat: @"name = %@, country = %@, hp = %d, mp = %d, power = %d\n",self.name,self.country,self.hitPoint,self.magicPoint,self.power];
    return result;
}

-(void) recover{
    self.hitPoint = 100;
    self.magicPoint = 100;
}

@end

@implementation LvBu: Hero
-(id)initByHero{
    self.name = @"Lvbu";
    self.country = @"unkown";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 10;
    self.skCnt = 5;
    [self generateSkill];
    return self;
}
@end

@implementation ZhaoYun: Hero
-(id)initByHero{
    self.name = @"ZhaoYun";
    self.country = @"Shu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 9;
    self.skCnt = 4;
    [self generateSkill];
    return self;
}
@end

@implementation DianWei: Hero
-(id)initByHero{
    self.name = @"DianWei";
    self.country = @"Wei";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 9;
    self.skCnt = 4;
    [self generateSkill];
    return self;
}
@end

@implementation GuanYu: Hero
-(id)initByHero{
    self.name = @"GuanYu";
    self.country = @"Shu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 8;
    self.skCnt = 3;
    [self generateSkill];
    return self;
}
@end

@implementation MaChao: Hero
-(id)initByHero{
    self.name = @"MaChao";
    self.country = @"Shu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 8;
    self.skCnt = 5;
    [self generateSkill];
    return self;
}
@end

@implementation ZhangFei: Hero
-(id)initByHero{
    self.name = @"ZhangFei";
    self.country = @"Shu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 7;
    self.skCnt = 5;
    [self generateSkill];
    return self;
}
@end

@implementation HuangZhong: Hero
-(id)initByHero{
    self.name = @"HuangZhong";
    self.country = @"Shu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 6;
    self.skCnt = 3;
    [self generateSkill];
    return self;
}
@end

@implementation XuChu: Hero
-(id)initByHero{
    self.name = @"XuChu";
    self.country = @"Wei";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 6;
    self.skCnt = 3;
    [self generateSkill];
    return self;
}
@end

@implementation SunCe: Hero
-(id)initByHero{
    self.name = @"SunCe";
    self.country = @"Wu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 5;
    self.skCnt = 3;
    [self generateSkill];
    return self;
}
@end

@implementation TaiShici: Hero
-(id)initByHero{
    self.name = @"TaiShici";
    self.country = @"Wu";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 5;
    self.skCnt = 5;
    [self generateSkill];
    return self;
}
@end

@implementation XiaHoudun: Hero
-(id)initByHero{
    self.name = @"XiaHoudun";
    self.country = @"Wei";
    self.hitPoint = 100;
    self.magicPoint = 100;
    self.power = 4;
    self.skCnt = 3;
    [self generateSkill];
    return self;
}
@end
