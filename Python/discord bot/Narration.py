import discord
import asyncio
import random
import urllib.parse, urllib.request, re
import datetime
import aiohttp
import warnings
import youtube_dl as YoutubeDL
import nacl.secret
import nacl.utils
import nacl
from inspect import ArgSpec
from turtle import pu
from discord import message
from discord.ext import commands, tasks
from discord.ext.commands import Bot
from itertools import cycle
from discord.ext import commands
from discord.utils import get
from discord import FFmpegPCMAudio
#from dotenv import load_dotenv
from discord import TextChannel
from youtube_dl import YoutubeDL



intents = discord.Intents.default()
intents.message_content = True
app = commands.Bot(command_prefix='&', intents=intents)
warnings.filterwarnings("ignore", category=DeprecationWarning)
intents = discord.Intents.all()
app.session = aiohttp.ClientSession()


@app.event
async def on_ready():
    print('다음으로 로그인합니다: ')
    print(app.user.name)
    print('연결됨.')
    status=cycle(["김두한 시체로 결정", "심영이 단죄", "백병원 폭파", "차 들어 커피야", "&명령어 입력"])
    @tasks.loop(seconds=3.5)
    async def change_status():
     await app.change_presence(status=discord.Status.online, activity=discord.Game(next(status)))
    change_status.start() #디스코드 상태 메시지 변경

@app.command(name='결정')
async def clear(ctx, amount = 5):
    if ctx.message.author.guild_permissions.administrator:
        await ctx.channel.purge(limit=amount)
        return await ctx.send(f'```메시지 {amount}개, 시체로 결정.```') #메시지 일괄삭제
    await ctx.send("```무, 무슨```")

@app.event
async def on_command_error(ctx, error):
    if isinstance(error, commands.CommandNotFound):
    	await ctx.send("```Aㅏ... 읎어요.```") #정의되지 않은 명령어에 대한 답변

@app.command()  
async def 김두한(ctx):
    await ctx.send('```1972년 11월 21일, 김두한은 쓰러졌다.```') #메시지 전달

@app.command()  
async def 영사기(ctx):
    await ctx.send('https://tenor.com/view/%ED%8F%AD%EB%B0%9C-%EC%8B%AC%EC%98%81-%EC%95%BC%EC%9D%B8%EC%8B%9C%EB%8C%80-gif-21868675')  

@app.command(name='ㄱ')
async def Google(ctx, *args):
  parameter = ' '.join(args).replace(' ', '+') #공백을 +로 전환
  await ctx.reply(f'https://www.google.com/search?q={parameter}') #구글에서 검색

@app.command(name='ㅇ')
async def yt(ctx, *, search):
        query_string = urllib.parse.urlencode({'search_query': search})
        htm_content = urllib.request.urlopen(
            'http://www.youtube.com/results?' + query_string)
        search_results = re.findall('/watch\?v=(.{11})',
                                    htm_content.read().decode())
        await ctx.reply('http://www.youtube.com/watch?v=' + search_results[0]) #유튜브에서 검색 + 재생 링크 제공

@app.command(name='ㄴ')
async def Namu(ctx, *args):
  parameter = ' '.join(args).replace(' ', '%20') #공백을 %20로 전환
  await ctx.reply(f'https://namu.wiki/w/{parameter}') #나무위키에서 검색

@app.command(name='명령어')
async def help(ctx):
    embed = discord.Embed(title='사용 가능 명령어 리스트', description='', color=0x008080)
    embed.add_field(name='&결정 [숫자]', value='지정한 숫자 만큼 메시지 삭제, 미지정시 5개 삭제.', inline=False)
    embed.add_field(name='&명령어', value='사용 가능 명령어 리스트 출력.', inline=False)
    embed.add_field(name='&diceroll', value='정이십면체 주사위를 굴림.', inline=False)
    embed.add_field(name='&numdice [숫자]', value='1부터 [숫자]만큼의 수를 가진 주사위를 굴림.', inline=False)
    embed.add_field(name='&rsp [가위 or 바위 or 보]', value='봇과 가위바위보를 실행.', inline=False)
    embed.add_field(name='&QR', value='QR코드 생성.', inline=False)
    embed.add_field(name='&Ytube', value='유튜브 링크 생성.', inline=False)
    embed.add_field(name='&단죄 [닉네임] [0~40320(분)]', value='멤버에게 타임아웃을 걺.', inline=False)
    embed.add_field(name='&해방 [닉네임]', value='멤버에게서 타임아웃을 해제.', inline=False)
    embed.add_field(name='&ㄱ [검색어]', value='구글에서 [검색어]를 검색함.', inline=False)
    embed.add_field(name='&ㅇ [검색어]', value='유튜브에서 [검색어]를 검색함.', inline=False)
    embed.add_field(name='&j', value='봇을 음성 채널에 입장시킴.', inline=False)
    embed.add_field(name='&p [유튜브 URL]', value='[유튜브 URL]의 음악을 재생함.', inline=False)
    embed.add_field(name='&s', value='재생 중인 음악을 정지함.', inline=False)
    embed.add_field(name='&pause ', value='재생 중인 음악을 일시 정지함.', inline=False)
    embed.add_field(name='&r ', value='일시 정지된 음악을 재개함', inline=False)
    await ctx.send(embed=embed) #임베드 메시지 출력

@app.command(name='QR')
async def code(ctx): 
    await ctx.send('https://dl.dropboxusercontent.com/s/atmxhf5b3kap8j7/roll.png?dl=0dl') #이미지 전달

@app.command(name='Ytube')
async def rick(ctx):
    await ctx.send('||https://www.youtube.com/watch?v=dQw4w9WgXcQ||') #링크

@app.command()
async def diceroll(ctx):
    randnum = random.randint(1, 20)  
    await ctx.send(f'```주사위 결과는 {randnum}.```') #주사위

@app.command()
async def numdice(ctx, number):
    await ctx.send(f'```주사위 결과는 {random.randint(1,int(number))} ({number} 중)```') #숫자 지정 주사위

@app.command()
async def rsp(ctx, user: str):  
    rps_table = ['가위', '바위', '보']
    bot = random.choice(rps_table)
    result = rps_table.index(user) - rps_table.index(bot)  
    if result == 0:
        await ctx.send(f'```{user} vs {bot}  Draw```')
    elif result == 1 or result == -2:
        await ctx.send(f'```{user} vs {bot}  You Win```')
    else:
        await ctx.send(f'```{user} vs {bot}  You Lose```') #가위바위보 명령어

@app.command()
async def RSP(ctx, user: str):  
    rps_table = ['가위', '바위', '보']
    bot = random.choice(rps_table)
    result = rps_table.index(user) - rps_table.index(bot)  
    if result == 0:
        await ctx.send(f'```{user} vs {bot}  Draw```')
    elif result == 1 or result == -2:
        await ctx.send(f'```{user} vs {bot}  You Win```')
    else:
        await ctx.send(f'```{user} vs {bot}  You Lose```')

@app.command()
async def 수정(ctx):
    msg = await ctx.send('```0.5초 뒤에 수정```')
    await asyncio.sleep(0.5)
    await msg.edit(content='```아무 일도 없었다.```') #봇 메시지 수정 명령어

@app.command()
async def 삭제(ctx):
    msg = await ctx.send("```1초 뒤 삭제```")
    await asyncio.sleep(1.0)
    await msg.delete() #봇 메시지 삭제 명령어

@app.command()
async def timeout_user(*, user_id: int, guild_id: int, until):
    headers = {"Authorization": f"Bot {app.http.token}"}
    url = f"https://discord.com/api/v9/guilds/{guild_id}/members/{user_id}"
    timeout = (datetime.datetime.utcnow() + datetime.timedelta(minutes=until)).isoformat()
    json = {'communication_disabled_until': timeout}
    async with app.session.patch(url, json=json, headers=headers) as session:
        if session.status in range(200, 299):
           return True
        return False #타임아웃 베이스

@app.command(name='단죄')
async def timeout(ctx: commands.Context, member: discord.Member, until: int):
    if ctx.message.author.guild_permissions.administrator:
        punish = await timeout_user(user_id=member.id, guild_id=ctx.guild.id, until=until)
        if punish:
            return await ctx.send(f'```{member}, 그는 당시 {until}분간 자리에 누워있어야 했다고 전해진다. ```')

    await ctx.send("```무, 무슨```") #타임아웃 본 명령어

@app.command(name='해방')
async def falling(ctx: commands.Context, member: discord.Member, int = 0):
    if ctx.message.author.guild_permissions.administrator:
        fall = await timeout_user(user_id=member.id, guild_id=ctx.guild.id, until=int)
        if fall:
            return await ctx.send(f'```{member}, 해방정국, 그랬다. 해방은 곧 사회의 혼란으로 이어졌다. ```')

@app.command(name='관리자')
async def mangerCheck(ctx):
    if ctx.guild:
        if ctx.message.author.guild_permissions.administrator:
            await ctx.send('```그는 관리자로 밝혀졌다.```')
        else:
            await ctx.send('```그는 일반 멤버로 밝혀졌다.```') #관리자 확인


@app.command(name = 'p')
async def play(ctx, url,):
    YDL_OPTIONS = {'format': 'bestaudio', 'noplaylist': 'True'}
    FFMPEG_OPTIONS = {
        'before_options': '-reconnect 1 -reconnect_streamed 1 -reconnect_delay_max 5', 'options': '-vn'}
    voice = get(app.voice_clients, guild=ctx.guild)
    if not voice.is_playing():
        with YoutubeDL(YDL_OPTIONS) as ydl:
            info = ydl.extract_info(url, download=False)
        URL = info['formats'][0]['url']
        voice.play(discord.FFmpegPCMAudio(URL, **FFMPEG_OPTIONS))
        voice.is_playing()
        await ctx.reply('```음악 재생```')
    else:
        await ctx.send("Bot is already playing")
          #유튜브 링크 음악 재생

@app.command(name='j')
async def join(ctx):
    channel = ctx.author.voice.channel
    if ctx.author.voice:
        await channel.connect()
    else:
        await ctx.send("```접속 중인 음성 채널이 없다.```")

@app.command(name='d')
async def leave(ctx): 
    await ctx.voice_client.disconnect()


@app.command(name='r')
async def resume(ctx):
    voice = get(app.voice_clients, guild=ctx.guild)

    if not voice.is_playing():
        voice.resume()
        await ctx.send('```재생 재개```')
    else:
        await ctx.send('X')

@app.command()
async def pause(ctx):
    voice = get(app.voice_clients, guild=ctx.guild)

    if voice.is_playing():
        voice.pause()
        await ctx.send('```재생 중지```')
    else:
        await ctx.send('X')

@app.command(name='s')
async def stop(ctx):
    voice = get(app.voice_clients, guild=ctx.guild)

    if voice.is_playing():
        voice.stop()
        await ctx.send('```음악 종료```')
    else:
        await ctx.send('X')

def new_func(app):
    app.run('NzA0OTE2NTk5NzQ3OTAzNTU5.GP8caw.4m6T532rAwauhErPvL1ZwCiQTdOexBWEmWmOM4') #봇 토큰

new_func(app)