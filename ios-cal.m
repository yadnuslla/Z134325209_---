//
//  main.m
//  Hello OC
//
//  Created by 劲楷强 on 13-10-1.
//  Copyright (c) 2013年 劲楷强. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

//高斯公式计算 日历（格里历）
int Gaussformula(int d,int m,int y,int c)
{
    double t=2.6*m-0.2;
    int w=((d+(int)t+5*(y%4)+3*y+5*(c%4))%7+7)%7;
    return w;
}

//输出 year 年 日历
int printCal(int year)
{
    int y,c;
    int day1,day2,day3,day4;
    y=year%100;
    c=year/100;
//1~4月
    NSLog(@"                                                            %d",year);
    NSLog(@"\n");
    NSLog(@"January                         February                        March                           April");
    NSLog(@"Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat");
    int d1,d2,d3,d4;
    d1=Gaussformula(1,11,y-1,c);
    d2=Gaussformula(1,12,y-1,c);
    d3=Gaussformula(1,1,y,c);
    d4=Gaussformula(1,2,y,c);
    day1=day2=day3=day4=1;
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day1==32)
            {
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
            }
            if(d1%7>i)printf("    ");
            if(d1%7==i)printf("%3d ",day1),++d1,++day1;
            if(d1%7<i)break;
        }
        printf("    ");
        
        for(int i=0;i<=6;++i)
        {
            if((year%4==0&&year%100!=0)||year%400==0)
            {
                if(day2==30)
                {
                    int k=6-i;
                    for(;k>=0;--k)printf("    ");
                    break;
                }
            }
            else
            {
                if(day2==29)
                {
                    
                    int k=6-i;
                    for(;k>=0;--k)printf("    ");
                    break;
                }
            }
            if(d2%7>i)printf("    ");
            if(d2%7==i)printf("%3d ",day2),++d2,++day2;
            if(d2%7<i)break;
        }
        printf("    ");
        
        for(int i=0;i<=6;++i)
        {
            if(day3==32)
            {
                
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;

            }
            if(d3%7>i)printf("    ");
            if(d3%7==i)printf("%3d ",day3),++d3,++day3;
            if(d3%7<i)break;
        }
        printf("    ");
        
        
        for(int i=0;i<=6;++i)
        {
            if(day4==31)
            {
                
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;

            }
            if(d4%7>i)printf("    ");
            if(d4%7==i)printf("%3d ",d4),++d4,++day4;
            if(d4%7<i)break;
        }
        printf("\n");
    }
     printf("\n");
    
//5~8月
    NSLog(@"May                             June                            July                            August");
    NSLog(@"Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat");
    int d5,d6,d7,d8;
    d5=Gaussformula(1,3,y,c);
    d6=Gaussformula(1,4,y,c);
    d7=Gaussformula(1,5,y,c);
    d8=Gaussformula(1,6,y,c);
    day1=day2=day3=day4=1;
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day1==32)
            {
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
            }
            if(d5%7>i)printf("    ");
            if(d5%7==i)printf("%3d ",day1),++d5,++day1;
            if(d5%7<i)break;
        }
        printf("    ");
        
        for(int i=0;i<=6;++i)
        {
            if(day2==31)
            {
                    int k=6-i;
                    for(;k>=0;--k)printf("    ");
                    break;
            }
            if(d6%7>i)printf("    ");
            if(d6%7==i)printf("%3d ",day2),++d6,++day2;
            if(d6%7<i)break;
        }
        printf("    ");
        
        for(int i=0;i<=6;++i)
        {
            if(day3==32)
            {
                
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
                
            }
            if(d7%7>i)printf("    ");
            if(d7%7==i)printf("%3d ",day3),++d7,++day3;
            if(d7%7<i)break;
        }
        printf("    ");
        
        
        for(int i=0;i<=6;++i)
        {
            if(day4==32)
            {
                
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
                
            }
            if(d8%7>i)printf("    ");
            if(d8%7==i)printf("%3d ",day4),++d8,++day4;
            if(d8%7<i)break;
        }
        printf("\n");
        
    }
     printf("\n");
    
//9~12月
    NSLog(@"September                       October                         November                        December");
    NSLog(@"Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat     Sun Mon Tue Wed Thu Fri Sat");
    int d9,d10,d11,d12;
    d9=Gaussformula(1,7,y,c);
    d10=Gaussformula(1,8,y,c);
    d11=Gaussformula(1,9,y,c);
    d12=Gaussformula(1,10,y,c);
    day1=day2=day3=day4=1;
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day1==31)
            {
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
            }
            if(d9%7>i)printf("    ");
            if(d9%7==i)printf("%3d ",day1),++d9,++day1;
            if(d9%7<i)break;
        }
        printf("    ");
        
        for(int i=0;i<=6;++i)
        {
            if(day2==32)
            {
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
            }
            if(d10%7>i)printf("    ");
            if(d10%7==i)printf("%3d ",day2),++d10,++day2;
            if(d10%7<i)break;
        }
        printf("    ");
        
        for(int i=0;i<=6;++i)
        {
            if(day3==31)
            {
                
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
                
            }
            if(d11%7>i)printf("    ");
            if(d11%7==i)printf("%3d ",day3),++d11,++day3;
            if(d11%7<i)break;
        }
        printf("    ");
        
        
        for(int i=0;i<=6;++i)
        {
            if(day4==32)
            {
                
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
                
            }
            if(d12%7>i)printf("    ");
            if(d12%7==i)printf("%3d ",day4),++d12,++day4;
            if(d12%7<i)break;
        }
        printf("\n");
    }
    return 0;
}

//输出 year 年 m 月
int printCalmmyy(int m,int year)
{
    
    int y,c,cm;
    int day,d,maxd;
    y=year%100;
    c=year/100;
    day=1;
    char s[20];
    if(m==1)sprintf(s,"Jan."),maxd=32,--y,cm=11;
    if(m==2)
    {
        sprintf(s,"Feb.");
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
    if(m==3)sprintf(s,"Mar."),maxd=32,cm=1;
    if(m==4)sprintf(s,"Apr."),maxd=31,cm=2;
    if(m==5)sprintf(s,"May."),maxd=32,cm=3;
    if(m==6)sprintf(s,"Jun."),maxd=31,cm=4;
    if(m==7)sprintf(s,"Jul."),maxd=32,cm=5;
    if(m==8)sprintf(s,"Aug."),maxd=32,cm=6;
    if(m==9)sprintf(s,"Sep."),maxd=31,cm=7;
    if(m==10)sprintf(s,"Oct."),maxd=32,cm=8;
    if(m==11)sprintf(s,"Nov."),maxd=31,cm=9;
    if(m==12)sprintf(s,"Dec."),maxd=32,cm=10;
    d=Gaussformula(1, cm,y,c);
    NSLog(@"          %s  %d          ",s,year);
    NSLog(@"Sun Mon Tue Wed Thu Fri Sat");
    for(int j=0;j<=5;++j)
    {
        for(int i=0;i<=6;++i)
        {
            if(day==maxd)
            {
                int k=6-i;
                for(;k>=0;--k)printf("    ");
                break;
            }
            if(d%7>i)printf("    ");
            if(d%7==i)printf("%3d ",day),++d,++day;
            if(d%7<i)break;
        }
        printf("\n");
    }
    
    return 0;
}

//主函数///////////////////////
int main()
{
lable: while(true)
{
    printf("Cal mm yy or Cal yy : ");
    char str[100];
    gets(str);
    int k=0;
    while(str[k]==' ')++k;
    if(((str[k]=='c'||str[k]=='C')&&(str[k+1]=='a'||str[k+1]=='A')&&(str[k+2]=='l'||str[k+2]=='L'))&&(str[k+3]==' '||str[k+3]=='\0'));
    else
    {
        NSLog(@"-bash: %s: command not found",str);
        goto lable;
    }
    
    int i=k+3;
    while(str[i]==' ')
    {
        ++i;
    }
    if(str[i]=='\0')
    {
        time_t QJKtime;
        char *t;
        time(&QJKtime);
        t=ctime(&QJKtime);
        char s[4];
        int year=0;
        
        s[0]=t[4];
        s[1]=t[5];
        s[2]=t[6];
        s[3]='.';
        
        year=t[23]-'0';
        year+=(t[22]-'0')*10;
        year+=(t[21]-'0')*100;
        year+=(t[20]-'0')*1000;
        
        int m=0;
        if(s[0]=='J'&&s[1]=='a'&&s[2]=='n')m=1;
        if(s[0]=='F'&&s[1]=='e'&&s[2]=='b')m=2;
        if(s[0]=='M'&&s[1]=='a'&&s[2]=='r')m=3;
        if(s[0]=='A'&&s[1]=='p'&&s[2]=='r')m=4;
        if(s[0]=='M'&&s[1]=='a'&&s[2]=='y')m=5;
        if(s[0]=='J'&&s[1]=='u'&&s[2]=='n')m=6;
        if(s[0]=='J'&&s[1]=='u'&&s[2]=='l')m=7;
        if(s[0]=='A'&&s[1]=='u'&&s[2]=='g')m=8;
        if(s[0]=='S'&&s[1]=='e'&&s[2]=='p')m=9;
        if(s[0]=='O'&&s[1]=='c'&&s[2]=='t')m=10;
        if(s[0]=='N'&&s[1]=='o'&&s[2]=='v')m=11;
        if(s[0]=='D'&&s[1]=='e'&&s[2]=='c')m=12;
        
        printCalmmyy(m,year);
        
    }
    else if(str[i]-'0'<0||str[i]-'9'>0)
    {
        NSLog(@"cal: year 0 not in range 1..9999");
        goto lable;
    }
    else if(str[i]-'0'<10&&str[i]-'0'>=0)
    {
        
        int j=i;
        int firstnum=0;
        int firstnum1=j;
        while(str[j]-'0'<10&&str[j]-'0'>=0)
        {
            ++j;
        }
        int firstnum2=j-1;
        int r=1;
        while(firstnum2>=firstnum1)
        {
            firstnum+=(str[firstnum2]-'0')*r;
            r*=10;
            --firstnum2;
        }
        
        
        while(str[j]==' ')
        {
            ++j;
        }
        if(str[j]-'0'<0||str[j]-'9'>0)
        {
            if(firstnum>9999||firstnum<1)
            {
                NSLog(@"cal: year %d not in range 1..9999",firstnum);
                goto lable;
            }
            else
            {
                printCal(firstnum);
                goto lable;
            }
        }
        if(str[j]-'0'>=0&&str[j]-'9'<=0)
        {
            int secondnum=0;
            int secondnum1=j;
            while(str[j]-'0'>=0&&str[j]-'9'<=0)
            {
                ++j;
            }
            int secondnum2=j-1;
            r=1;
            while(secondnum2>=secondnum1)
            {
                secondnum+=(str[secondnum2]-'0')*r;
                r*=10;
                --secondnum2;
            }
            int m=firstnum;
            int year=secondnum;
            if(year<1||year>9999)
            {
                NSLog(@"cal: year %d not in range 1..9999",year);
                goto lable;
            }
            else if(m<1||m>12)
            {
                NSLog(@"cal: %d is neither a month number(1..12) nor a name",m);
                goto lable;
            }
            else if(m>=1&&m<=12&&year>=1&&year<=9999)
            {
                printCalmmyy(m, year);
                goto lable;
            }
        }
    }
}
}

