#include "Hero.h"

//0 for a win, 1 for b win
int pickTwoAndFight(Hero* a, Hero* b){
    [a recover];
    [b recover];
    NSString* log = [NSString stringWithFormat: @"\n%@%@",[a getInform],[b getInform]];
    NSString* addLog = @"";
    int round = 0;
    while([a hitPoint]>0 && [b hitPoint]>0){
        round++;
        addLog = [NSString stringWithFormat: @"\nround #%d\n",round];
        log = [NSString stringWithFormat: @"%@%@",log,addLog];
        Skill* skA = [a getAction];
        Skill* skB = [b getAction];
        addLog = [NSString stringWithFormat: @"%@: %@\n",[a name],[skA skillToString]];
        log = [NSString stringWithFormat: @"%@%@",log,addLog];
        [b recieveAction: skA];
        if([b hitPoint]>0){
            addLog = [NSString stringWithFormat: @"%@: %@\n",[b name],[skB skillToString]];
            log = [NSString stringWithFormat: @"%@%@",log,addLog];
            [a recieveAction: skB];
        }
        else{
            addLog = [NSString stringWithFormat: @"%@: %@\n",[b name],@"Dead"];
            log = [NSString stringWithFormat: @"%@%@",log,addLog];
            [a recieveAction: skB];
        }
        addLog = [a getState];
        log = [NSString stringWithFormat: @"%@%@",log,addLog];
        addLog = [b getState];
        log = [NSString stringWithFormat: @"%@%@",log,addLog];
    }
    if([a hitPoint]>0){
        addLog = [NSString stringWithFormat: @"\n%@ won, %@ lost.\n",[a name],[b name]];
        log = [NSString stringWithFormat: @"%@%@",log,addLog];
        NSLog(@"%@",log);
        return 0;
    }
    else{
        addLog = [NSString stringWithFormat: @"\n%@ won, %@ lost.\n",[b name],[a name]];
        log = [NSString stringWithFormat: @"%@%@",log,addLog];
        NSLog(@"%@",log);
        return 1;
    }
}

void generateHero(__strong Hero* heros[]){
    heros[1] = [[LvBu alloc]initByHero];
    heros[2] = [[ZhaoYun alloc]initByHero];
    heros[3] = [[DianWei alloc]initByHero];
    heros[4] = [[GuanYu alloc]initByHero];
    heros[5] = [[MaChao alloc]initByHero];
    heros[6] = [[ZhangFei alloc]initByHero];
    heros[7] = [[HuangZhong alloc]initByHero];
    heros[8] = [[XuChu alloc]initByHero];
    heros[9] = [[SunCe alloc]initByHero];
    heros[10] = [[TaiShici alloc]initByHero];
    heros[11] = [[XiaHoudun alloc]initByHero];
}
