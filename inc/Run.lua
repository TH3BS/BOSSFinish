--[[
#    ▀█████████▄   ▄██████▄     ▄████████    ▄████████
#      ███    ███ ███    ███   ███    ███   ███    ███
#      ███    ███ ███    ███   ███    █▀    ███    █▀
#     ▄███▄▄▄██▀  ███    ███   ███          ███
#    ▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BOSS
#      ███    ██▄ ███    ███          ███          ███ ¦ Dev : @BLCON
#      ███    ███ ███    ███    ▄█    ███    ▄█    ███
#    ▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ Source TH3BOSS BY @TH3BS
#---------------------------------------------------------------------
]] 
Er_ssl   , https = pcall(require, "ssl.https")
Er_http  , http  = pcall(require, "socket.http")
http.TIMEOUT = 5
JSON   = (loadfile "./libs/json.lua")()
redis  = (loadfile "./libs/redis.lua")()
URL    = (loadfile "./libs/url.lua")()
Er_utf8  , utf8  = pcall(require, "lua-utf8")
redis = redis.connect('127.0.0.1',6379)


if not Er_ssl then
print("('\n\27[1;31m￤Pkg _ luaSec - ssl  is Not installed.'\n\27[0m￤")
os.exit()
end

if not Er_utf8 then
print("('\n\27[1;31m￤Pkg >> UTF_8 is Not installed.'\n\27[0m￤")
os.execute("sudo luarocks install luautf8")
os.exit()
end



function create_config(Token)
if not Token then
io.write('\n\27[1;33m￤آلآن آدخل توكــن آلبوت  ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
Token = io.read():gsub(' ','')
if Token == '' then
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤ عذرآ لم تقوم بآدخآل آي شـيء , آدخل توگن آلبوت آلآن ')
create_config()
end
Api_Token = 'https://api.telegram.org/bot'..Token
local url , res = https.request(Api_Token..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ آلتوگن آلذي آدخلتهہ‏‏ غير صـحيح , تآگد مـنهہ‏‏ ثم حآول مـجددآ!')
create_config()
end
local GetToken = JSON.decode(url)
BOT_NAME = GetToken.result.first_name
BOT_User = "@"..GetToken.result.username
io.write('\n\27[1;36m￤تم آدخآل آلتوگن بنجآح   \n￤Success Enter Your Token: \27[1;34m@'..GetToken.result.username..'\n\27[0;39;49m') 
end

io.write('\n\27[1;33m￤آدخل مـعرف آلمـطـور آلآسـآسـي ↓  \n￤Enter your USERNAME SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter USERNAME !\n￤ لم تقوم بآدخآل شـي , يرجى آلآنتبآهہ‏‏ وآدخل آلآن مـعرف آلمـطـور آلآسـآسـي')
create_config(Token)
end 
if not SUDO_USER:match('@[%a%d_]') then
print('\n\27[1;31m￤ This is Not USERNAME !\n￤هہ‏‏ذآ ليس مـعرف حسـآب تلگرآم , عذرآ آدخل آلمـعرف آلصـحيح آلآن . ')
create_config(Token)
end 

local url , res = http.request('http://80.211.144.240/api.th3bs.com/GetUser/?User='..SUDO_USER)
if res ~= 200 then
print(res)
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطـآ في آلآتصـآل بآلسـيرفر , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
os.exit()
end
success, GetUser = pcall(JSON.decode, url)
if not success then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث مشـگلهہ‌‏ في سـگربت آلآسـتخرآج , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
os.exit()
end
if not GetUser.result then
if GetUser.cause then
print('\n\27[1;31m￤ '..GetUser.cause)
os.exit()
end
print('\n\27[1;31m￤ {USERNAME_NOT_OCCUPIED} => Please Check it!\n￤ لآ يوجد حسـآب بهہ‏‏ذآ آلمـعرف , تآگد مـنهہ‏‏ جيدآ  !')
create_config(Token)
end 
if GetUser.information.typeuser ~= "UserTypeGeneral" then
print('\n\27[1;31m￤ This UserName is not personal account !\n￤عذرا يرجى ادخال معرف حساب شخصي ليكون مطور البوت وليس معرف قناة او بوت او مجموعة !')
create_config(Token)
end
print('\n\27[1;36m￤تم آدخآل مـعرف آلمـطـور بنجآح , سـوف يتم تشـغيل آلسـورس آلآن .\n￤Success Save USERNAME IS_ID: \27[0;32m['..GetUser.information.id..']\n\27[0;39;49m')
boss = Token:match("(%d+)")
redis:mset(
boss..":VERSION",GetUser.information.Source_version,
boss..":SUDO_ID:",GetUser.information.id,
boss..":DataCenter:",GetUser.information.DataCenter,
boss..":UserNameBot:",BOT_User,
boss..":NameBot:",BOT_NAME,
"TH3BOSS_INSTALL","Yes"
)
redis:hset(boss..'username:'..GetUser.information.id,'username','@'..GetUser.information.username:gsub('_',[[\_]]))
info = {}
info.username = '@'..GetUser.information.username
info.userbot  = BOT_User
info.userjoin  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
https.request(GetUser.information.WebSite..'/request/?insert='..JSON.encode(info))
Cr_file = io.open("./inc/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close()
print('\27[1;36m￤Token.txt is created.\27[m')
local Text = "🙋🏼‍♂️¦ اهلا عزيزي [المطور الاساسي](tg://user?id="..GetUser.information.id..") \n🔖¦ شكرا لاستخدامك سورس الزعيم \n📡¦ أرســل  الان /start\n📛¦ لاضهار الاوامر للمطور  المجهزه بالكيبورد\n\n⚡️"
https.request(Api_Token..'/sendMessage?chat_id='..GetUser.information.id..'&text='..URL.escape(Text)..'&parse_mode=Markdown')
os.execute([[
rm -f ./README.md
rm -rf ./.git
chmod +x ./run
./run
]])
end




function Start_Bot() 
local TokenBot = io.open('./inc/Token.txt', "r")
if not TokenBot then
print('\27[0;33m>>'..[[





▀█████████▄   ▄██████▄     ▄████████    ▄████████
  ███    ███ ███    ███   ███    ███   ███    ███
  ███    ███ ███    ███   ███    █▀    ███    █▀
 ▄███▄▄▄██▀  ███    ███   ███          ███
▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BS
  ███    ██▄ ███    ███          ███          ███ ¦ Dev : @BLCON
  ███    ███ ███    ███    ▄█    ███    ▄█    ███
▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ Source The3Boss
---------------------------------------------------------------------
]]..'\027[0;32m')
create_config()
else
Token = TokenBot:read('*a')
File = {}
local login = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
boss = Token:match("(%d+)")
our_id = tonumber(boss)
ApiToken = "https://api.telegram.org/bot"..Token
Bot_User = redis:get(boss..":UserNameBot:")
SUDO_ID = tonumber(redis:get(boss..":SUDO_ID:"))
if not SUDO_ID then io.popen("rm -fr ./inc/Token.txt") end
SUDO_ID =  tonumber(redis:get(boss..":SUDO_ID:"))
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
version = redis:get(boss..":VERSION")
DataCenter = redis:get(boss..":DataCenter:")

local ok, ERROR =  pcall(function() loadfile("./inc/functions.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/functions.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/functions.lua"):read('*all')))
end

local ok, ERROR =  pcall(function() loadfile("./inc/locks.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/locks.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/locks.lua"):read('*all')))
end

print('\27[0;33m>>'..[[






▀█████████▄   ▄██████▄     ▄████████    ▄████████ 
  ███    ███ ███    ███   ███    ███   ███    ███ 
  ███    ███ ███    ███   ███    █▀    ███    █▀  
 ▄███▄▄▄██▀  ███    ███   ███          ███        
▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BS
  ███    ██▄ ███    ███          ███          ███ ¦ Dev : @BLCON
  ███    ███ ███    ███    ▄█    ███    ▄█    ███ 
▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ VERSION » v]]..version..[[

-------------------------------------------------------------------
                                                  
]]..'\027[0;32m'
..'¦ TOKEN_BOT: \27[1;34m'..Token..'\027[0;32m\n'
..'¦ BOT__INFO: \27[1;34m'.. Bot_User..'\27[0;36m » ('..boss..')\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..SUDO_USER:gsub([[\_]],'_')..'\27[0;36m » ('..SUDO_ID..')\27[m\027[0;32m\n'
..'¦ Run_Scrpt: \27[1;34m./inc/Script.lua\027[0;32m \n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ VERSION->: \27[1;34mv'..version..'\027[0;32m\n'
..'======================================\27[0;33m\27[0;31m'
)
local Twer = io.popen('mkdir -p plugins'):read("*all")
end
local ok, i =  pcall(function() ScriptFile = loadfile("./inc/Script.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/Script.lua" !\n\27[39m')
local Error = tostring(io.popen("lua inc/Script.lua"):read('*all'))
print(Error)
sendMsg(SUDO_ID,nil,Error)
end
print("\027[0;32m=======[ ↓↓ List For Files ↓↓ ]=======\n\27[0;33m")
local Num = 0
for Files in io.popen('ls plugins'):lines() do
if Files:match(".lua$") then
Num = Num + 1
local ok, i =  pcall(function() File[Files] = loadfile("plugins/"..Files)() end)
if not ok then
print('\27[31mError loading plugins '..Files..'\27[39m')
print(tostring(io.popen("lua plugins/"..Files):read('*all')))
else
print("\27[0;36m "..Num.."- "..Files..'\27[m')
end 
end 

end

print('\n\27[0;32m¦ All Files is : '..Num..' Are Active.\n--------------------------------------\27[m\n')
end

Start_Bot()


function input_inFo(msg)
	
if not msg.forward_info_ and msg.is_channel_post_ then
StatusLeft(msg.chat_id_,our_id)
return false
end

if msg.date_ and msg.date_ < os.time() - 10 and not msg.edited then --[[ فحص تاريخ الرساله ]]
print('\27[36m¦¦¦¦  !! [THIS__OLD__MSG]  !! ¦¦¦¦\27[39m')
return false  
end

if msg.text and msg.sender_user_id_ == our_id then
return false
end
	
if msg.reply_to_message_id_ ~= 0 then msg.reply_id = msg.reply_to_message_id_ end
msg.type = GetType(msg.chat_id_)

if msg.type == "pv" and redis:get(boss..':mute_pv:'..msg.chat_id_) then
print('\27[1;31m is_MUTE_BY_FLOOD\27[0m')
return false 
end

if msg.type ~= "pv" and redis:get(boss..'sender:'..msg.sender_user_id_..':'..msg.chat_id_..'flood') then
print("\27[1;31mThis Flood Sender ...\27[0")
Del_msg(msg.chat_id_,msg.id_)
return false
end


if redis:get(boss..'group:add'..msg.chat_id_) then 
msg.GroupActive = true
else
msg.GroupActive = false
end

if msg.content_.ID == "MessageChatDeleteMember" then 
if msg.GroupActive and redis:get(boss..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
end
return false 
end

if msg.sender_user_id_ == SUDO_ID then 
msg.TheRankCmd = 'المطور 👨🏻‍✈️' 
msg.TheRank = 'مطور اساسي 👨🏻‍✈️' 
msg.Rank = 1
elseif redis:sismember(boss..':SUDO_BOT:',msg.sender_user_id_) then 
msg.TheRankCmd = 'المطور 👨🏽‍💻'
msg.TheRank = 'مطور البوت 👨🏽‍💻'
msg.Rank = 2
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المنشىء 👷🏽'
msg.TheRank = 'المنشىء 👷🏽'
msg.Rank = 3
elseif msg.GroupActive and redis:sismember(boss..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'المدير 👨🏼‍⚕️' 
msg.TheRank = 'مدير البوت 👨🏼‍⚕️' 
msg.Rank = 4
elseif msg.GroupActive and redis:sismember(boss..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = 'الادمن 👨🏼‍🎓'
msg.TheRank = 'ادمن في البوت 👨🏼‍🎓'
msg.Rank = 5
elseif msg.GroupActive and redis:sismember(boss..'whitelist:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRank = 'عضو مميز ⭐️'
msg.Rank = 6
elseif msg.sender_user_id_ == our_id then
msg.Rank = 7
else
msg.TheRank = 'فقط عضو 🙍🏼‍♂️'
msg.Rank = 10 
end
 
if msg.Rank == 1 then
msg.SudoBase = true
end
 
if msg.Rank == 1 or msg.Rank == 2 then
msg.SudoUser = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 then
msg.Creator = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 then
msg.Director = true
end

if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 then
msg.Admin = true
end

if msg.Rank == 6 then
msg.Special = true
end

if msg.Rank == 7 then
msg.OurBot = true
end

ISONEBOT = false

if msg.content_.ID == "MessageChatAddMembers" then
local lock_bots = redis:get(boss..'lock_bots'..msg.chat_id_)
ZISBOT = false
for i=0,#msg.content_.members_ do
if msg.content_.members_[i].type_.ID == "UserTypeBot" then
ISONEBOT = true
if msg.GroupActive and not msg.Admin and lock_bots then 
ZISBOT = true
kick_user(msg.content_.members_[i].id_, msg.chat_id_)
end
end
end
if msg.GroupActive and ZISBOT and redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) then
kick_user(msg.sender_user_id_, msg.chat_id_)
end
if msg.content_.members_[0].id_ == our_id and redis:get(boss..':WELCOME_BOT') then
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
sendPhoto(msg.chat_id_,msg.id_,redis:get(boss..':WELCOME_BOT'),[[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(boss..':NameBot:')..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
👨🏽‍🔧]])
return false
end
if not ISONEBOT then
msg.adduser = msg.content_.members_[0].id_
msg.addusername = msg.content_.members_[0].username_
msg.addname = msg.content_.members_[0].first_name_
msg.adduserType = msg.content_.members_[0].type_.ID
end
end

if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink" then 
if msg.GroupActive and redis:get(boss..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
return false 
end
if ISONEBOT then return false end
end


-- [[ المحظورين عام ]]
if GeneralBanned((msg.adduser or msg.sender_user_id_)) then
print('\27[1;31m is_G_BAN_USER\27[0m')
Del_msg(msg.chat_id_,msg.id_)
kick_user((msg.adduser or msg.sender_user_id_),msg.chat_id_)
return false 
end

--[[ المكتومين ]]
if msg.GroupActive and MuteUser(msg.chat_id_,msg.sender_user_id_) then 
if msg.Admin then redis:srem(boss..'is_silent_users:'..msg.chat_id_,msg.sender_user_id_) return end
print("\27[1;31m User is Silent\27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end

--[[ المحظورين ]]
if msg.GroupActive and Check_Banned(msg.chat_id_,(msg.adduser or msg.sender_user_id_)) then
if msg.Admin then redis:srem(boss..'banned:'..msg.chat_id_,msg.sender_user_id_) return end
print('\27[1;31m is_BANED_USER\27[0m')
Del_msg(msg.chat_id_, msg.id_)
kick_user((msg.adduser or msg.sender_user_id_), msg.chat_id_)
return false 
end

if msg.GroupActive and not msg.Admin then
if redis:get(boss..'mute_text'..msg.chat_id_) then --قفل الدردشه
print("\27[1;31m Chat is Mute \27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end
if msg.text and FilterX(msg) then --[[ الكلمات الممنوعه ]]
return false
end 
end 

if ScriptFile and ScriptFile.Boss then 
if msg.text and ScriptFile.iBoss then
for k, Boss in pairs(ScriptFile.Boss) do
Text = msg.text
Text = Text:gsub("ی","ي")
Text = Text:gsub("ک","ك")
Text = Text:gsub("ه‍","ه")

if Text:match(Boss) then -- Check Commands To admin
if not CheckFlood(msg.sender_user_id_,msg.chat_id_) and not msg.SudoBase then
print("user is flood")
redis:setex(boss..'sender:'..msg.sender_user_id_..':'..msg.chat_id_..'flood',10,true)
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Error" then
rem_data_group(arg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
sendMsg(arg.chat_id_,nil,'📛*¦* تم مغادره وتعطيل البوت \n🎟*¦* بسبب التكرار وليس لدي صلاحيه لطرد الشخص المخالف\n ❕')    
end
end,{chat_id_=msg.chat_id_,sender_user_id_=msg.sender_user_id_})
return false 
end

local GetMsg = ScriptFile.iBoss(msg,{Text:match(Boss)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",Boss.." | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
end  --- End iBoss
if ScriptFile.dBoss then
if ScriptFile.dBoss(msg) == false then
return false
end
print("\27[1;35m¦Msg_IN_Process : Proc _ Script.lua\27[0m")
end

for name,Plug in pairs(File) do
if Plug.Boss then 
if msg.text and Plug.iBoss then
for k, Boss in pairs(Plug.Boss) do
local SearchText = msg.text:match(Boss)
if SearchText then
local GetMsg = Plug.iBoss(msg,{msg.text:match(Boss)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",Boss.." | Plugin is: \27[1;32m"..name.."\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
end 
return false
end
end
end
if Plug.dBoss then
Plug.dBoss(msg)
print("\27[1;35m¦Msg_IN_Process : \27[1;32"..name.."\27[0m")
end
else
print("The File "..name.." Not Runing in The Source Boss")
end 

end
else
print("The File Script.lua Not Runing in The Source Boss")
end
end

function tdcli_update_callback(data)
	local msg = data.message_
	if data.ID == "UpdateMessageSendFailed" then 
	if msg and msg.sender_user_id_ then
	redis:srem(boss..'users',msg.sender_user_id_)
	end
	elseif data.ID == "UpdateMessageSendSucceeded" then
	if Refresh_Start then
	Refresh_Start = false
	Start_Bot()
	return false
	end
	if UpdateSourceStart then
	UpdateSourceStart = false
	EditMsg(data.message_.chat_id_,data.message_.id_,'10% - |█          |')
	EditMsg(data.message_.chat_id_,data.message_.id_,'20% - |███         |')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/Run.lua','./inc/Run.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'40% - |█████       |')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/locks.lua','./inc/locks.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'60% - |███████     |')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/Script.lua','./inc/Script.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'80% - |█████████   |')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/functions.lua','./inc/functions.lua')
	EditMsg(data.message_.chat_id_,data.message_.id_,'100% - |█████████████|\n\n🔝*¦* تم تحديث السورس الى اصدار *v'..redis:get(boss..":VERSION")..'*\n📟*¦* تم اعاده تشغيل السورس بنجاح')
	dofile("./inc/Run.lua")
	print("Update Source And Reload ~ ./inc/Run.lua")
	end
	elseif data.ID == "UpdateNewMessage" then
 
	if msg.content_.ID == "MessageText" then
	if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID then
	if msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
	msg.textEntityTypeTextUrl = true
	print("MessageEntityTextUrl")
	elseif msg.content_.entities_[0].ID == "MessageEntityBold" then 
	msg.textEntityTypeBold = true
	elseif msg.content_.entities_[0].ID == "MessageEntityItalic" then
	msg.textEntityTypeItalic = true
	print("MessageEntityItalic")
	elseif msg.content_.entities_[0].ID == "MessageEntityCode" then
	msg.textEntityTypeCode = true
	print("MessageEntityCode")
	end
	end
	msg.text = msg.content_.text_
	if (msg.text=="تحديث" or msg.text=="we" or msg.text=="تحديث ♻️") and msg.sender_user_id_ == SUDO_ID then
	return sendMsg(msg.chat_id_,msg.id_," 🗂¦ تہ‏‏م تحديث آلمـلفآت \n✓",function(arg,data)
	Refresh_Start = true
	end)
	end 
	if msg.text == 'Update Source' and msg.sender_user_id_ == SUDO_ID then
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/Run.lua','./inc/Run.lua')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/Script.lua','./inc/Script.lua')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/functions.lua','./inc/functions.lua')
	download_file('https://raw.githubusercontent.com/TH3BS/BOSS/master/inc/locks.lua','./inc/locks.lua')
	sendMsg(msg.chat_id_,msg.id_,'👷🏽| {* تــم تحديث وتثبيت السورس  *} 📡.\n\n👨🏼‍💼| { Bot is Update » }👍🏿',function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end) 
	end
	if msg.text == 'reload' and msg.sender_user_id_ == SUDO_ID then
	sendMsg(msg.chat_id_,msg.id_,'👷🏽| {* تــم أعـاده تشغيل البوت  *} 📡.\n\n👨🏼‍💼| { Bot is Reloaded » }👍🏿',function(arg,data)
	dofile("./inc/Run.lua")
	print("Reload ~ ./inc/Run.lua")
	end)
	return false
	end
	end 
	input_inFo(msg)
	
	elseif data.ID == "UpdateNewChat" then  
	if redis:get(boss..'group:add'..data.chat_.id_) then
	redis:set(boss..'group:name'..data.chat_.id_,data.chat_.title_)
	end
	elseif data.ID == "UpdateChannel" then  
	if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
	if redis:get(boss..'group:add-100'..data.channel_.id_) then
	local linkGroup = (redis:get(boss..'linkGroup-100'..data.channel_.id_) or "")
	local NameGroup = (redis:get(boss..'group:name-100'..data.channel_.id_) or "")
	send_msg(SUDO_ID,"📛| قام شخص بطرد البوت من المجموعه الاتيه : \n🏷| ألايدي : `-100"..data.channel_.id_.."`\n🗯| الـمجموعه : "..Flter_Markdown(NameGroup).."\n\n📮| تـم مسح كل بيانات المجموعه بنـجاح ")
	rem_data_group('-100'..data.channel_.id_)
	end
	end
	elseif data.ID == "UpdateFile" then 
	if Uploaded_Groups_Ok then
	Uploaded_Groups_Ok = false
	local GetInfo = io.open(data.file_.path_, "r"):read('*a')
	local All_Groups = JSON.decode(GetInfo)
	for k,IDS in pairs(All_Groups.Groups) do
	redis:mset(
	boss..'group:name'..k,IDS.Title,
	boss..'num_msg_max'..k,5,
	boss..'group:add'..k,true,
	boss..'lock_link'..k,true,
	boss..'lock_spam'..k,true,
	boss..'lock_webpage'..k,true,
	boss..'lock_markdown'..k,true,
	boss..'lock_flood'..k,true,
	boss..'lock_bots'..k,true,
	boss..'mute_forward'..k,true,
	boss..'mute_contact'..k,true,
	boss..'mute_document'..k,true,
	boss..'mute_inline'..k,true,
	boss..'lock_username'..k,true,
	boss..'replay'..k,true
	)
	redis:sadd(boss..'group:ids',k) 

	if IDS.Admins then
	for user,ID in pairs(IDS.Admins) do
	redis:hset(boss..'username:'..ID,'username',user)
	redis:sadd(boss..'admins:'..k,ID)
	end
	end
	if IDS.Creator then
	for user,ID in pairs(IDS.Creator) do
	redis:hset(boss..'username:'..ID,'username',user)
	redis:sadd(boss..':MONSHA_BOT:'..k,ID)
	end
	end
	if IDS.Owner then
	for user,ID in pairs(IDS.Owner) do
	redis:hset(boss..'username:'..ID,'username',user)
	redis:sadd(boss..'owners:'..k,ID)
	end
	end
	end
	io.popen("rm -fr ../.telegram-cli/data/document/*")
	sendMsg(Uploaded_Groups_CH,Uploaded_Groups_MS,'📦*¦* تم رفع آلنسـخهہ‏‏ آلآحتيآطـيهہ\n⚖️*¦* حآليآ عدد مـجمـوعآتگ هہ‏‏يهہ‏‏ *'..redis:scard(boss..'group:ids')..'* 🌿\n✓')
	end
	elseif data.ID == "UpdateUser" then  
	if data.user_.type_.ID == "UserTypeDeleted" then
	print("¦ userTypeDeleted")
	redis:srem(boss..'users',data.user_.id_)
	elseif data.user_.type_.ID == "UserTypeGeneral" then
	local CheckUser = redis:hgetall(boss..'username:'..data.user_.id_).username
	if data.user_.username_  then 
	USERNAME = '@'..data.user_.username_:gsub('_',[[\_]])
	else
	USERNAME = data.user_.first_name_..' '..(data.user_.last_name_ or "" )
	end	
	if CheckUser and CheckUser ~= USERNAME  then
	print("¦ Enter Update User ")
	redis:hset(boss..'username:'..data.user_.id_,'username',USERNAME)
	end 
	end
	elseif data.ID == "UpdateMessageEdited" then
	GetMsgInfo(data.chat_id_,data.message_id_,function(arg,data)
	msg = data
	msg.edited = true
	msg.text = data.content_.text_
	input_inFo(msg)  
	end,nil)
	elseif data.ID == "UpdateOption" and data.value_.value_ == "Ready" then
	tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)end,nil)
	end
	
	
end
