import math
import random
import re
import urllib
import urllib.parse
import urllib.request
import warnings
from itertools import cycle

import aiohttp
import discord
import googletrans
import numpy
from aiohanspell import spell_checker
from discord.ext import commands, tasks

intents = discord.Intents.default()
intents.message_content = True
app = commands.Bot(command_prefix='&', intents=intents)
warnings.filterwarnings("ignore", category=DeprecationWarning)
intents = discord.Intents.all()
app.session = aiohttp.ClientSession()

@app.event
async def on_ready():
    print("Login...")
    print(app.user.name)
    print("Connected")
    status=cycle(["디스코드 봇 테스트 "])
    @tasks.loop(seconds=3.5)
    async def change_status():
     await app.change_presence(status=discord.Status.online, activity=discord.Game(next(status)))
    change_status.start() #디스코드 상태 메시지 변경

@app.command(name='명령어')
async def help(ctx):
    embed = discord.Embed(title='사용 가능 명령어 리스트', description='', color=0x008080)
    embed.add_field(name='&명령어', value='사용 가능 명령어 리스트 출력함.', inline=False)
    embed.add_field(name='&핑', value='퐁', inline=False)
    embed.add_field(name='&주사위', value='정이십면체 주사위를 굴림.', inline=False)
    embed.add_field(name='&numdice [숫자]', value='1부터 [숫자]만큼의 수를 가진 주사위를 굴림.', inline=False)
    embed.add_field(name='&rsp [가위/바위/보]', value='봇과 가위바위보를 실행함.', inline=False)
    embed.add_field(name='&검색 [검색어]', value='각 사이트에서 [검색어]를 검색함.', inline=False)
    embed.add_field(name='&유튜브 [검색어]', value='유튜브에서 [검색어]를 검색함.', inline=False)
    embed.add_field(name='&계산기 [식]', value='간단한 식을 계산함.', inline=False)
    embed.add_field(name='&평균 [숫자(공백으로 구분)]', value='입력된 수의 평균을 계산함.', inline=False)
    embed.add_field(name='&팩토리얼 [숫자]', value='입력된 수의 팩토리얼값을 출력함.', inline=False)
    embed.add_field(name='&삼각함수 [각도]', value='입력된 각도의 Sin, Cos, Tan값을 출력함.', inline=False)
    embed.add_field(name='&글자수 [문장/텍스트]', value='입력된 글의 공백 포함/미포함 글자 수, 총 byte 수를 출력함.', inline=False)
    embed.add_field(name='&한영번역 [한글 텍스트]', value='입력된 한글 텍스트를 영어로 번역함.', inline=False)
    embed.add_field(name='&영한번역 [영어 텍스트]', value='입력된 영어 텍스트를 한글로 번역함.', inline=False)
    embed.add_field(name='&맞춤법 [한글 텍스트]', value='입력된 한글 텍스트의 맞춤법을 수정함.', inline=False)
    await ctx.send(embed=embed)

@app.command(name = '핑')
async def ping(ctx): 
    await ctx.send(f"```퐁```")

@app.command(name = '주사위')
async def diceroll(ctx):
    randnum = random.randint(1, 20)  
    await ctx.send(f"```주사위 결과는 {randnum}.```") #주사위

@app.command(name = '')
async def numdice(ctx, number):
    await ctx.send(f"```주사위 결과는 {random.randint(1,int(number))} ({number} 중)```") #숫자 지정 주사위

@app.command()
async def rsp(ctx, user: str):  
    rps_table = ['가위', '바위', '보']
    bot = random.choice(rps_table)
    result = rps_table.index(user) - rps_table.index(bot)  
    if result == 0:
        await ctx.send(f"```{user} vs {bot}  Draw```")
    elif result == 1 or result == -2:
        await ctx.send(f"```{user} vs {bot}  You Win```")
    else:
        await ctx.send(f"```{user} vs {bot}  You Lose```") #가위바위보 명령어

@app.command(name = "유튜브")
async def yt(ctx, *, search):
        query_string = urllib.parse.urlencode({'search_query': search})
        htm_content = urllib.request.urlopen(
            'http://www.youtube.com/results?' + query_string)
        search_results = re.findall('/watch\?v=(.{11})',
                                    htm_content.read().decode())
        await ctx.reply('http://www.youtube.com/watch?v=' + search_results[0]) #유튜브에서 검색 + 재생 링크 제공

@app.command(name = '검색')
async def Google(ctx, *args):
    keyw = ' '.join(args).replace(' ', ' ')
    parameter = ' '.join(args).replace(' ', '+')
    wikimeter = ' '.join(args).replace(' ', '_')
    namumeter = ' '.join(args).replace(' ', '%20') #공백 전환
    embed = discord.Embed(title= "검색 결과 표시 중..", color = 0x008080)
    embed.add_field(name="구글 검색 결과", value = f"[{keyw}](<https://www.google.com/search?q={parameter}>)", inline=False)
    embed.add_field(name="네이버 검색 결과", value = f"[{keyw}](<https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query={parameter}>)", inline=True)
    embed.add_field(name="다음 검색 결과", value = f"[{keyw}](<https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&sq=&o=&q={parameter}>)", inline=False)
    embed.add_field(name="위키백과 검색 결과", value = f"[{keyw}](<https://ko.wikipedia.org/wiki/{wikimeter}>)", inline=True)
    embed.add_field(name="나무위키 검색 결과", value = f"[{keyw}](<https://namu.wiki/w/{namumeter}>)", inline=False)
    embed.add_field(name="네이버 어학사전 검색 결과", value = f"[{keyw}](<https://dict.naver.com/search.dict?dicQuery={parameter}&query={parameter}&target=dic&ie=utf8&query_utf=&isOnlyViewEE=>)", inline=True)
    embed.add_field(name="유튜브 검색 결과", value = f"[{keyw}](<https://www.youtube.com/results?search_query={parameter}>)", inline=False) #검색 사이트
    await ctx.send(embed = embed)

@app.command(name = '계산기')   
async def cal(ctx, *, expression:str):
    calculation = eval(expression)
    await ctx.reply(f"```결과 : {calculation}```")

@app.command(name = '평균')   
async def aver(ctx, *, average:str):
    parameter = list(map(int, (f"{average}").split()))
    aver = numpy.mean(parameter)
    await ctx.reply(f"```평균 : {aver}```")

@app.command(name = '팩토리얼')
async def factorial(ctx, expression:int):
    facto = math.factorial(expression)
    await ctx.reply(f"```{expression}! = {facto}```")

@app.command(name = '삼각함수')
async def tri(ctx, expression:int):
    sin = math.sin(math.pi * (expression / 180))
    cos = math.cos(math.pi * (expression / 180))
    tan = math.tan(math.pi * (expression / 180))
    await ctx.reply(f"```sin {expression} = {sin:.5f} \ncos {expression} = {cos:.5f}\ntan {expression} = {tan:.5f}```") 

@app.command(name = '글자수')
async def lett(ctx, *, txt:str):
    count = len(txt)
    blan = ' '.join(txt).replace(' ', '')
    bcount = len(blan)
    byte = len(txt.encode())
    await ctx.reply(f"```글자 수(공백포함) : 총 {count}자\n글자 수(공백 미포함) : 총 {bcount}자\n총 바이트 수 : {byte}byte```")

@app.command(name = '한영번역')
async def lett(ctx, *, txt:str):
    tr = googletrans.Translator()
    result = tr.translate(txt,dest = 'en', src = 'auto')
    await ctx.reply(f"```번역 결과(한 -> 영) : {result.text}```")

@app.command(name = '영한번역')
async def lett(ctx, *, txt:str):
    tr = googletrans.Translator()
    result = tr.translate(txt,dest = 'ko', src = 'auto')
    await ctx.reply(f"```번역 결과(영 -> 한) : {result.text}```")

@app.command(name = '맞춤법')
async def gramm(ctx, *, txt:str):
    result = await spell_checker.check(f"{txt}")
    reresult = result.as_dict()
    await ctx.reply(f"```원본 문장 : {reresult.get('original')}\n수정된 문장 : {reresult.get('checked')}```")

def new_func(app):
    app.run("tq")

new_func(app)
