//
//  main.m
//  ns
//
//  Created by 劲楷强 on 13-10-10.
//  Copyright (c) 2013年 劲楷强. All rights reserved.
//


#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

char str[512][512];
//获得当前时间
int GetCurrentTime()
{
    // 获取系统当前时间
    NSDate *date=[NSDate date];
    //设置时间输出格式：
    NSDateFormatter * dateformat=[[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyyMM"];
    NSString *na=[dateformat stringFromDate:date];
    int intString=[na intValue];
    return intString;
}
//高斯-格里历
int GaussGregorian(int d,int m,int y,int c)
{
    double t=2.6*m-0.2;
    int w=((d+(int)t+5*(y%4)+3*y+5*(c%4))%7+7)%7;
    return w;

}
//高斯－儒略历
int GaussJulian(int d,int m,int y,int c)
{
    double t=2.6*m-2.2;
    int w=((d+(int)t+5*(y%4)+3*y+6*(c%7))%7+7)%7;
    return w;
}
//输出 y 年 年历
int printCal(int year)
{
    int y,c;
    int day[12][3];
    NSString *month[12]={@"Jan                   ",@"Feb                   ",@"Mar                   ",@"Apr                   ",@"May                   ",@"Jun                   ",@"Jul                   ",@"Aug                   ",@"Sep                   ",@"Oct                   ",@"Dec                   ",@"Nov                   "};
    day[0][2]=32,day[2][2]=32,day[3][2]=31,day[4][2]=32,day[5][2]=31,day[6][2]=32,day[7][2]=32,day[8][2]=31,day[9][2]=32,day[10][2]=31,day[11][2]=32;
    y=year%100;
    c=year/100;
    for(int i=0;i<12;++i)
    {
        if(i==1)
        {
        
            if(year<=1752)
            {
                if(year%4==0)
                    day[i][2]=30;
                else
                    day[i][2]=29;
            }
            else if(year>1752)
            {
                if((year%4==0&&year%100!=0)||(year%400==0))
                    day[i][2]=30;
                else
                    day[i][2]=29;
            }
        }
        
        day[i][1]=1;
        int yy=y;
        if(i==0||i==1)
        {
            yy=y-1;
        }
        
        if(year>1752)
        {
            day[i][0]=GaussGregorian(1, (i+10)%12+1,yy,c);
        }
        else if(year==1752)
        {
            if(i>8)
            {
                day[i][0]=GaussGregorian(1, (i+10)%12+1,yy,c);
            }
            else
            {
                day[i][0]=GaussJulian(1,(i+10)%12+1,yy,c);
            }
        }
        else if(year<1752)
        {
            day[i][0]=GaussJulian(1, (i+10)%12+1,yy,c);
        }
    }
    NSLog(@"                              %d",year);
    //1~3月
    NSLog(@"%@%@%@",month[0],month[1],month[2]);
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day[0][1]==day[0][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[0][0]%7>i)printf("   ");
            if(day[0][0]%7==i)printf("%2d ",day[0][1]),++day[0][0],++day[0][1];
            if(day[0][0]%7<i)break;
        }
        printf(" ");
        
        for(int i=0;i<=6;++i)
        {
            if(day[1][1]==day[1][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[1][0]%7>i)printf("   ");
            if(day[1][0]%7==i)printf("%2d ",day[1][1]),++day[1][0],++day[1][1];
            if(day[1][0]%7<i)break;
        }
        printf(" ");
        for(int i=0;i<=6;++i)
        {
            if(day[2][1]==day[2][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[2][0]%7>i)printf("   ");
            if(day[2][0]%7==i)printf("%2d ",day[2][1]),++day[2][0],++day[2][1];
            if(day[2][0]%7<i)break;
        }
        printf("\n");
    }
    //4~5月
    NSLog(@"%@%@%@",month[3],month[4],month[5]);
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day[3][1]==day[3][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[3][0]%7>i)printf("   ");
            if(day[3][0]%7==i)printf("%2d ",day[3][1]),++day[3][0],++day[3][1];
            if(day[3][0]%7<i)break;
        }
        printf(" ");
        
        for(int i=0;i<=6;++i)
        {
            if(day[4][1]==day[4][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[4][0]%7>i)printf("   ");
            if(day[4][0]%7==i)printf("%2d ",day[4][1]),++day[4][0],++day[4][1];
            if(day[4][0]%7<i)break;
        }
        printf(" ");
        for(int i=0;i<=6;++i)
        {
            if(day[5][1]==day[5][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[5][0]%7>i)printf("   ");
            if(day[5][0]%7==i)printf("%2d ",day[5][1]),++day[5][0],++day[5][1];
            if(day[5][0]%7<i)break;
        }
        printf("\n");
    }
    
    //7~9月
    NSLog(@"%@%@%@",month[6],month[7],month[8]);
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day[6][1]==day[6][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[6][0]%7>i)printf("   ");
            if(day[6][0]%7==i)printf("%2d ",day[6][1]),++day[6][0],++day[6][1];
            if(day[6][0]%7<i)break;
        }
        printf(" ");
        
        for(int i=0;i<=6;++i)
        {
            if(day[7][1]==day[7][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[7][0]%7>i)printf("   ");
            if(day[7][0]%7==i)printf("%2d ",day[7][1]),++day[7][0],++day[7][1];
            if(day[7][0]%7<i)break;
        }
        printf(" ");
        for(int i=0;i<=6;++i)
        {
            if(year!=1752)
            {
                if(day[8][1]==day[8][2])
                {
                    int k=6-i;
                    for(;k>=0;--k)printf("   ");
                    break;
                }
                if(day[8][0]%7>i)printf("   ");
                if(day[8][0]%7==i)printf("%2d ",day[8][1]),++day[8][0],++day[8][1];
                if(day[8][0]%7<i)break;
            }
            else
            {
                if(j==0)
                {
                    printf("       1  2 14 15 16");
                    break;
                }
                else if(j==1)
                {
                    printf("17 18 19 20 21 22 23");
                    break;
                }
                else if(j==2)
                {
                    printf("24 25 26 27 28 29 30");
                    break;
                }
                else;
            }
        }
        printf("\n");
    }
    
    //10～12月
    NSLog(@"%@%@%@",month[9],month[10],month[11]);
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day[9][1]==day[9][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[9][0]%7>i)printf("   ");
            if(day[9][0]%7==i)printf("%2d ",day[9][1]),++day[9][0],++day[9][1];
            if(day[9][0]%7<i)break;
        }
        printf(" ");
        
        for(int i=0;i<=6;++i)
        {
            if(day[10][1]==day[10][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[10][0]%7>i)printf("   ");
            if(day[10][0]%7==i)printf("%2d ",day[10][1]),++day[10][0],++day[10][1];
            if(day[10][0]%7<i)break;
        }
        printf(" ");
        for(int i=0;i<=6;++i)
        {
            if(day[11][1]==day[11][2])
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(day[11][0]%7>i)printf("   ");
            if(day[11][0]%7==i)printf("%2d ",day[11][1]),++day[11][0],++day[11][1];
            if(day[11][0]%7<i)break;
        }
        printf("\n");
    }
 return 0;

}
//输出 y 年 m 月 月历
int printCalmmyy(int m,int year)
{
    
    int y,c,cm;
    int day,d,maxd;
    y=year%100;
    c=year/100;
    day=1;
    char s[20];
    if(m==1)sprintf(s,"January  "),maxd=32,--y,cm=11;
    if(m==2)
    {
        sprintf(s,"February ");
        if(year>1752)
        {
            if((year%4==0&&year%100!=0)||year%400==0)
            {
                maxd=30;
            }
            else
            {
                maxd=29;
            }
            --y;
            cm=12;
        }
        else
        {
            if(year%4==0)
            {
                maxd=30;
            }
            else
            {
                maxd=29;
            }
            --y;
            cm=12;
        }
    }
    if(m==3)sprintf(s,"March    "),maxd=32,cm=1;
    if(m==4)sprintf(s,"April    "),maxd=31,cm=2;
    if(m==5)sprintf(s,"May      "),maxd=32,cm=3;
    if(m==6)sprintf(s,"June     "),maxd=31,cm=4;
    if(m==7)sprintf(s,"July     "),maxd=32,cm=5;
    if(m==8)sprintf(s,"August   "),maxd=32,cm=6;
    if(m==9)sprintf(s,"September"),maxd=31,cm=7;
    if(m==10)sprintf(s,"October  "),maxd=32,cm=8;
    if(m==11)sprintf(s,"November "),maxd=31,cm=9;
    if(m==12)sprintf(s,"December "),maxd=32,cm=10;
    
    if(year>1752||(year==1752&&m>9))
    {
        d=GaussGregorian(1, cm,y,c);
    }
    else if(year<1752||(year==1752&&m<9))
    {
        d=GaussJulian(1,cm, y,c);
    }
    else if(m==9&&year==1752)
    {
        NSLog(@"September 1752");
        NSLog(@"Su Mo Tu We Th Fr Sa");
        NSLog(@"       1  2 14 15 16");
        NSLog(@"17 18 19 20 21 22 23");
        NSLog(@"24 25 26 27 28 29 30\n");
        return 0;
    }
    NSLog(@"%s %d",s,year);
    NSLog(@"Su Mo Tu We Th Fr Sa");
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day==maxd)
            {
                int k=6-i;
                for(;k>=0;--k)printf("   ");
                break;
            }
            if(d%7>i)printf("   ");
            if(d%7==i)printf("%2d ",day),++d,++day;
            if(d%7<i)break;
        }
        printf("\n");
    }
    
    return 0;

}
//主函数///////////////////////
int main(int argc, const char * argv[])
{
label:while(true)
{
    @autoreleasepool
    {
        printf("userMacBook-Air:~ user$ ");
        memset(str,'\0',sizeof(str));
        int i=0,j=0,k=-1;
        char ret;
        while(true)
        {
            scanf("%c",&ret);
            if(ret=='\n')
                break;
            else if(ret==' ')
            {
                i=k+1;
                j=0;
            }
            else
            {
                str[i][j]=ret;
                ++j;
                k=i;
            }
        
        }
//输入完成。。。。。。。。。。。。。。。。。。。。。。。。。
        if(k==-1)continue;
        if(((str[0][0]=='c'||str[0][0]=='C')&&(str[0][1]=='a'||str[0][1]=='A')&&(str[0][2]=='l'||str[0][2]=='L')&&str[0][3]=='\0'))
        {
            if(k==0)
            {
                
                int date=GetCurrentTime();
                int year=date/100;
                int m=date%100;
                printCalmmyy(m, year);
                goto label;
            }
            else if(k==1)
            {
                if(str[1][0]=='-'&&str[1][1]=='m')
                {
                    NSString *a=[NSString stringWithUTF8String:str[1]];
                    NSString *b=[a substringFromIndex:2];
                    if(str[1][2]=='\0')
                    {
                        NSLog(@"cal: option requires an argument -- m");
                        NSLog(@"usage: cal [-jy] [[month] year]");
                        NSLog(@"       cal [-j] [-m month] [year]");
                        NSLog(@"       cal [-Jjpwy] [-s country_code] [[month] year]");
                        NSLog(@"       cal [-Jeo] [year]");
                        goto label;
                    
                    }
                    else
                    {
                        int m=[b intValue];
                        if(m>=1&&m<=12)
                        {
                            int date=GetCurrentTime();
                            int year=date/100;
                            printCalmmyy(m,year);
                            goto label;
                        }
                        else
                        {
                            NSLog(@"cal: %@ is neither a month number(1..12) nor a name",b);
                            goto label;
                        }
                    }
                }
                else
                {
                    
                    NSString *a=[NSString stringWithUTF8String:str[1]];
                    int year=[a intValue];
                    if(year>=1&&year<=9999)
                    {
                        printCal(year);
                        goto label;
                    }
                    else
                    {
                        NSLog(@"cal: year %d not in range 1..9999",year);
                        goto label;
                    }
                
                }
            }
            else if(k==2)
            {
                if(str[1][0]=='-'&&str[1][1]=='m')
                {
                    if(str[1][2]=='\0')
                    {
                        NSString *a=[NSString stringWithUTF8String:str[2]];
                        int m=[a intValue];
                        if(m>=1&&m<=12)
                        {
                            int date=GetCurrentTime();
                            int year=date/100;
                            printCalmmyy(m, year);
                            goto label;
                        }
                        else
                        {
                            
                            NSLog(@"cal: %@ is neither a month number(1..12) nor a name",a);
                            goto label;
                        }
                    
                    }
                    else if(str[1][2]-'0'>=0&&str[1][2]-'0'<=9)
                    {
                        NSString *a=[NSString stringWithUTF8String:str[1]];
                        NSString *b=[a substringFromIndex:2];
                        int m=[b intValue];
                        if(m>=1&&m<=12)
                        {
                            NSString *a=[NSString stringWithUTF8String:str[2]];
                            int year=[a intValue];
                            if(year>=1&&year<=9999)
                            {
                                printCal(year);
                                goto label;
                            }
                            
                            else
                            {
                                NSLog(@"cal: year %d not in range 1..9999",year);
                                goto label;
                            }
                        }
                        else
                        {
                            NSLog(@"cal: %@ is neither a month number(1..12) nor a name",b);
                            goto label;
                        }
                    }
                    else
                    {
                        NSString *a=[NSString stringWithUTF8String:str[1]];
                        NSString *b=[a substringFromIndex:2];
                        NSLog(@"cal: %@ is neither a month number(1..12) nor a name",b);
                        goto label;
                    }
                }
                else
                {
                    NSString *a=[NSString stringWithUTF8String:str[1]];
                    NSString *b=[NSString stringWithUTF8String:str[2]];
                    int m=[a intValue];
                    int year=[b intValue];
                    if(m>=1&&m<=12)
                    {
                        if(year>=1&&year<=9999)
                        {
                            printCalmmyy(m,year);
                            goto label;
                        }
                        else
                        {
                            NSLog(@"cal: year %d not in range 1..9999",year);
                            goto label;
                        }
                    }
                    else
                    {
                        NSLog(@"cal: %@ is neither a month number(1..12) nor a name",a);
                        goto label;
                    }
                }
            
            
            }
            else if(k==3)
            {
                if(str[1][0]=='-'&&str[1][1]=='m')
                {
                    if(str[1][2]=='\0')
                    {
                        NSString *a=[NSString stringWithUTF8String:str[2]];
                        int m=[a intValue];
                        if(m>=1&&m<=12)
                        {
                            NSString *a=[NSString stringWithUTF8String:str[2]];
                            int year=[a intValue];
                            if(year>=1&&year<=9999)
                            {
                                printCalmmyy(m,year);
                                goto label;
                            }
                            else
                            {
                                NSLog(@"cal: year %d not in range 1..9999",year);
                                goto label;
                            }
                        }
                        else
                        {
                            NSLog(@"cal: %@ is neither a month number(1..12) nor a name",a);
                            goto label;
                        }
                        
                    }
                    else
                    {
                        NSString *a=[NSString stringWithUTF8String:str[1]];
                        NSString *b=[a substringFromIndex:2];
                        int m=[b intValue];
                        if(m>=1&&m<=12)
                        {
                            NSString *a=[NSString stringWithUTF8String:str[2]];
                            NSString *b=[NSString stringWithUTF8String:str[3]];
                            int m=[a intValue];
                            int year=[b intValue];
                            if(m>=1&&m<=12)
                            {
                                if(year>=1&&year<=9999)
                                {
                                    printCalmmyy(m,year);
                                    goto label;
                                }
                                else
                                {
                                    NSLog(@"cal: year %d not in range 1..9999",year);
                                    goto label;
                                }
                            }
                            else
                            {
                                NSLog(@"cal: %@ is neither a month number(1..12) nor a name",a);
                                goto label;
                            }
                        }
                        else
                        {
                            NSLog(@"cal: %@ is neither a month number(1..12) nor a name",b);
                            goto label;
                        }
                    }
                }
                else
                {
                    NSLog(@"cal: option requires an argument -- m");
                    NSLog(@"usage: cal [-jy] [[month] year]");
                    NSLog(@"       cal [-j] [-m month] [year]");
                    NSLog(@"       cal [-Jjpwy] [-s country_code] [[month] year]");
                    NSLog(@"       cal [-Jeo] [year]");
                    goto label;
                }
            }
            else if(k==4)
            {
                if(str[1][0]=='-'&&str[1][1]=='m'&&str[1][2]=='\0')
                {
                    NSString *a=[NSString stringWithUTF8String:str[2]];
                    int m=[a intValue];
                    if(m>=1&&m<=12)
                    {
                        NSString *a=[NSString stringWithUTF8String:str[3]];
                        NSString *b=[NSString stringWithUTF8String:str[4]];
                        int m=[a intValue];
                        int year=[b intValue];
                        if(m>=1&&m<=12)
                        {
                            if(year>=1&&year<=9999)
                            {
                                printCalmmyy(m,year);
                                goto label;
                            }
                            else
                            {
                                NSLog(@"cal: year %d not in range 1..9999",year);
                            }
                        }
                        else
                        {
                            NSLog(@"cal: %@ is neither a month number(1..12) nor a name",a);
                            goto label;
                        }

                    }
                    else
                    {
                        NSLog(@"cal: %@ is neither a month number(1..12) nor a name",a);
                        goto label;
                    }
                }
                else
                {
                    NSLog(@"cal: option requires an argument -- m");
                    NSLog(@"usage: cal [-jy] [[month] year]");
                    NSLog(@"       cal [-j] [-m month] [year]");
                    NSLog(@"       cal [-Jjpwy] [-s country_code] [[month] year]");
                    NSLog(@"       cal [-Jeo] [year]");
                    goto label;
                }
                
            }
            else if(k==5)
            {
                NSLog(@"cal: option requires an argument -- m");
                NSLog(@"usage: cal [-jy] [[month] year]");
                NSLog(@"       cal [-j] [-m month] [year]");
                NSLog(@"       cal [-Jjpwy] [-s country_code] [[month] year]");
                NSLog(@"       cal [-Jeo] [year]");
                goto label;
            }
        }
        else
        {
            NSLog(@"-bash: %s: command not found",str[0]);
            goto label;

        }
    
    
    
    
    }
    
}
    return 0;
}

