--[[
#    ▀█████████▄   ▄██████▄     ▄████████    ▄████████
#      ███    ███ ███    ███   ███    ███   ███    ███
#      ███    ███ ███    ███   ███    █▀    ███    █▀
#     ▄███▄▄▄██▀  ███    ███   ███          ███
#    ▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @TH3BOSS
#      ███    ██▄ ███    ███          ███          ███ ¦ Dev : @OMMMM
#      ███    ███ ███    ███    ▄█    ███    ▄█    ███
#    ▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ Source TH3BOSS BY @TH3BS
#---------------------------------------------------------------------
]]
local function iBoss(msg,MsgText)


if msg.forward_info_ then return false end


if msg.Director 
and (redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)) and MsgText[1] ~= "الغاء" then 
return false end 

if msg.type ~= 'pv' then if MsgText[1] == "تفعيل" and not MsgText[2] then
return modadd(msg)  
end
 

if MsgText[1] == "تعطيل" and not MsgText[2] then
if not msg.SudoUser then return '🛠*¦* أنـت لـسـت الـمـطـور ⚙️'end
if not redis:get(boss..'group:add'..msg.chat_id_) then return '🛠*¦* المجموعه بالتأكيد ✓️ تم تعطيلها' end  
rem_data_group(msg.chat_id_)
return '📛*¦* تـم تـعـطـيـل الـمـجـمـوعـه ⚠️'
end
end
 

if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then
if redis:get(boss..'lock_id'..msg.chat_id_) then

GetUserID(msg.sender_user_id_,function(arg,data)

local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if data.username_ then UserNameID = "🎫¦ مـعرفك •⊱ @"..data.username_.." ⊰•\n" else UserNameID = "" end
if data.username_ then UserNameID1 = "@"..data.username_ else UserNameID1 = "لا يوجد" end
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
local Namei = FlterName(data,20)
if data.status_.ID == "UserStatusEmpty" then
sendMsg(arg.chat_id_,data.id_,'📛¦ لا يمكنني عرض صورة بروفايلك لانك قمت بحظر البوت ... !\n\n')
else

  GetPhotoUser(data.id_,function(arg,data)
    local edited = (redis:get(boss..':edited:'..arg.chat_id_..':'..arg.sender_user_id_) or 0)

    local KleshaID = '👤¦ أســمـك •⊱ { '..arg.Namei..' } ⊰•\n'
    ..'🎟¦ ايديــك •⊱ {'..arg.sender_user_id_..'} ⊰•\n'
    ..arg.UserNameID
    ..'📡¦ رتبتـــك •⊱ '..arg.TheRank..' ⊰•\n'
    ..'⭐️¦ تفاعـلك •⊱ '..Get_Ttl(arg.msgs)..'⊰•\n'
    ..'💬¦ رسائلك •⊱ {'..arg.msgs..'} ⊰•\n➖'
local Kleshaidinfo = redis:get(boss..":infoiduser_public:"..arg.chat_id_) or redis:get(boss..":infoiduser")  

if Kleshaidinfo then 
  local points = redis:get(boss..':User_Points:'..arg.chat_id_..arg.sender_user_id_) or 0
  KleshaID = Kleshaidinfo:gsub("{الاسم}",arg.Namei)
  KleshaID = KleshaID:gsub("{الايدي}",arg.sender_user_id_)
  KleshaID = KleshaID:gsub("{المعرف}",arg.UserNameID1)
  KleshaID = KleshaID:gsub("{الرتبه}",arg.TheRank)
  KleshaID = KleshaID:gsub("{التفاعل}",Get_Ttl(arg.msgs))
  KleshaID = KleshaID:gsub("{الرسائل}",arg.msgs)
  KleshaID = KleshaID:gsub("{التعديل}",edited)
  KleshaID = KleshaID:gsub("{النقاط}",points)
  KleshaID = KleshaID:gsub("{البوت}",redis:get(boss..':NameBot:'))
  KleshaID = KleshaID:gsub("{المطور}",SUDO_USER)
end
  if redis:get(boss.."idphoto"..msg.chat_id_) then
    if data.photos_ and data.photos_[0] then 
    sendPhoto(arg.chat_id_,arg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,KleshaID,dl_cb,nil)
    else
    sendMsg(arg.chat_id_,arg.id_,'🚸¦ لا يوجد صوره في بروفايلك ... !\n\n'..Flter_Markdown(KleshaID))
    end
    else
    sendMsg(arg.chat_id_,arg.id_,Flter_Markdown(KleshaID))
    end

  end,{chat_id_=arg.chat_id_,id_=arg.id_,TheRank=arg.TheRank,sender_user_id_=data.id_,msgs=msgs,Namei=Namei,UserNameID=UserNameID,UserNameID1=UserNameID1})


end

end,{chat_id_=msg.chat_id_,id_=msg.id_,TheRank=msg.TheRank})

end
end




if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERNAME = USERNAME:gsub([[\_]],"_")
USERCAR = utf8.len(USERNAME) 
SendMention(arg.ChatID,arg.UserID,arg.MsgID,"🧟‍♂¦ آضـغط على آلآيدي ليتم آلنسـخ\n\n "..USERNAME.." ~⪼ { "..arg.UserID.." }",37,USERCAR)
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
sendMsg(arg.ChatID,arg.MsgID,"🧟‍♂*¦* آضـغط على آلآيدي ليتم آلنسـخ\n\n "..UserName.." ~⪼ ( `"..UserID.."` )")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
return false
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(boss..'group:name'..arg.ChatID) or '')
redis:set(boss..'linkGroup'..arg.ChatID,(data.invite_link_ or ""))
sendMsg(arg.ChatID,arg.MsgID,
"ـ  •⊱ { مـعـلومـات الـمـجـموعـه } ⊰•\n\n"
.."*👥¦* عدد الاعـضـاء •⊱ { *"..data.member_count_.."* } ⊰•"
.."\n*📛¦* عدد المحظـوريـن •⊱ { *"..data.kicked_count_.."* } ⊰•"
.."\n*🗣¦* عدد الادمـنـيـه •⊱ { *"..data.administrator_count_.."* } ⊰•"
.."\n*🔚¦* الايــدي •⊱ { `"..arg.ChatID.."` } ⊰•"
.."\n\nـ •⊱ {  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  } ⊰•\n"
)
end,{ChatID=msg.chat_id_,MsgID=msg.id_}) 
return false
end



if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(boss..":MsgIDPin:"..arg.ChatID,arg.reply_id)
sendMsg(arg.ChatID,arg.MsgID,"🙋🏼‍♂️*¦* أهلا عزيزي "..arg.TheRankCmd.." \n📌*¦* تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
sendMsg(arg.ChatID,arg.MsgID,'📛*¦* عذرا لا يمكنني التثبيت .\n🎟*¦* لست مشرف او لا املك صلاحيه التثبيت \n ❕')    
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,reply_id=msg.reply_id,TheRankCmd=msg.TheRankCmd})
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره" end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
sendMsg(arg.ChatID,arg.MsgID,"🙋🏼‍♂️*¦* أهلا عزيزي "..arg.TheRankCmd.."  \n💬*¦* تم الغاء تثبيت الرساله \n✓")    
elseif data.ID == "Error" and data.code_ == 6 then
sendMsg(arg.ChatID,arg.MsgID,'📛*¦* عذرا لا يمكنني الغاء التثبيت .\n🎟*¦* لست مشرف او لا املك صلاحيه التثبيت \n ❕')    
elseif data.ID == "Error" and data.code_ == 400 then
sendMsg(arg.ChatID,arg.MsgID,'📛*¦* عذرا عزيزي '..arg.TheRankCmd..' .\n🎟*¦* لا توجد رساله مثبته لاقوم بازالتها \n ❕')    
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,TheRankCmd=msg.TheRankCmd})
return false
end

if MsgText[1] == "تقييد" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then  -- By Replay 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then  return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكن تقييد البوت  \n📛") end
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المميز\n🛠") 
end
GetChatMember(arg.ChatID,UserID,function(arg,data)
if data.status_.ID == "ChatMemberStatusMember" then
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم تقييد العضو\n✓")
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
Restrict(arg.ChatID,arg.UserID,1)
elseif data.status_.ID == "ChatMemberStatusLeft" then
sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنني تقيد العضو لانه مغادر المجموعة \n🛠") 
else
sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنني تقييد المشرف\n🛠") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  -- By Username 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تقييد المميز\n🛠") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID == "ChatMemberStatusEditor" then 
GetChatMember(arg.ChatID,arg.UserID,function(arg,data)
if data.status_.ID == "ChatMemberStatusMember" then 
Restrict(arg.ChatID,arg.UserID,1)  
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم تقييد العضو\n✓")
else
sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني تقييد العضو .\n🎟* لانه مشرف في المجموعه \n ❕')    
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=arg.UserID})
else
sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني تقييد العضو .\n🎟* لانني لست مشرف في المجموعه \n ❕')    
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=UserID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]}) 
elseif MsgText[2] and MsgText[2]:match('^%d+$') then  -- By UserID
UserID =  MsgText[2] 
if UserID == our_id then  return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكن تقييد البوت  \n📛") end
if UserID == our_id then   
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك تقييد البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك تقييد المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك تقييد المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك تقييد المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك نقييد المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك تقييد المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"👤*¦* لا يمكنك تقييد الادمن\n🛠") 
end
GetUserID(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد حساب بهذا الايدي  \n❕") end 
if data.username_ then 
UserName = '@'..data.username_
else 
UserName = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
NameUser = Hyper_Link_Name(data)

if data.id_ == our_id then  
return sendMsg(ChatID,MsgID,"📛*¦* لا يمكنك تقييد البوت \n❗️ ") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني تقييد العضو .\n🎟* لانني لست مشرف في المجموعه \n ❕')    
end
Restrict(arg.ChatID,arg.UserID,1)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم تقييد العضو\n✓")
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=data.id_})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
Restrict(arg.ChatID,UserID,2)
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم فك تقييد العضو\n✓")
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_}) 


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  -- BY Username
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني تقييد العضو .\n🎟* لانني لست مشرف في المجموعه \n ❕')    
end
Restrict(arg.ChatID,arg.UserID,2)  
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..arg.NameUser.." ❳  تم فك تقييد العضو\n✓")
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد حساب بهذا الايدي  \n❕") end 
NameUser = Hyper_Link_Name(data)
if data.id_ == our_id then  
return sendMsg(ChatID,MsgID,"📛*¦* البوت ليس مقييد \n❗️ ") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني قك تقييد العضو .\n🎟* لانني لست مشرف في المجموعه \n ❕')    
end
Restrict(arg.ChatID,arg.UserID,2)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..arg.NameUser.." ❳  تم فك تقييد العضو\n✓")
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserID=data.id_,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end 
return false
end

if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  مميز في المجموعة. \n✓") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'whitelist:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع  ❲ "..NameUser.." ❳  مميز في المجموعة. \n✓") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لا يمكنني رفع حساب بوت \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا لا يمكنني رفع البوت \n📛") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") 
end
UserName = arg.UserName
if redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  مميز في المجموعة. \n✓") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'whitelist:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع  ❲ "..NameUser.." ❳  مميز في المجموعة. \n✓") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end 
return false
end

if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ مميز في المجموعة \n✓️") 
else
redis:srem(boss..'whitelist:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ مميز في المجموعة \n✓️") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ مميز في المجموعة \n✓️") 
else
redis:srem(boss..'whitelist:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ مميز في المجموعة \n✓️") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end 
return false
end

if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  مدير في المجموعة. \n✓") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'owners:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع  ❲ "..NameUser.." ❳  مدير في المجموعة. \n✓") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لا يمكنني رفع حساب بوت \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا لا يمكنني رفع البوت \n📛") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") 
end
UserName = arg.UserName
if redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  مدير في المجموعة. \n✓") 
else
redis:hset(boss..'username:'..UserID, 'username',UserName)
redis:sadd(boss..'owners:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع  ❲ "..NameUser.." ❳  مدير في المجموعة. \n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end 
return false
end

if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ مدير في المجموعة \n✓️") 
else
redis:srem(boss..'owners:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ مدير في المجموعة \n✓️") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ مدير في المجموعة \n✓️") 
else
redis:srem(boss..'owners:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ مدير في المجموعة \n✓️") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end 
return false
end

if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.SuperCreator then return "📛*¦* هذا الامر يخص {المطور,المطور الاساسي} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then 
  return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لا يمكنني رفع حساب بوت \n❕") end 
NameUser = Hyper_Link_Name(data)
local UserID = data.id_
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا لا يمكنني رفع البوت \n📛") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") 
end
UserName = arg.UserName
if redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
  return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end  
return false
end

if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.SuperCreator then return "📛*¦* هذا الامر يخص {المطور,المطور الاساسي} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
local MsgID = arg.MsgID
local ChatID = arg.ChatID
if not data.sender_user_id_ then return sendMsg(ChatID,MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
else
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
end
end,{ChatID=ChatID,UserID=UserID,MsgID=MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
  return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
else
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل  ❲ "..NameUser.." ❳  منشئ في المجموعة \n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end 
return false
end

if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser   = Hyper_Link_Name(data)
if redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'admins:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لا يمكنني رفع حساب بوت \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا لا يمكنني رفع البوت \n📛") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") 
end
UserName = arg.UserName
if redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'admins:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end 
return false
end

if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n📛") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
else
redis:srem(boss..'admins:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
  NameUser = Hyper_Link_Name(data)
  if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
else
redis:srem(boss..'admins:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ ادمن في المجموعة \n✓️") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
local USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "لا يوجد" end  
local maseegs = redis:get(boss..'msgs:'..arg.UserID..':'..arg.ChatID) or 1
local edited = redis:get(boss..':edited:'..arg.ChatID..':'..arg.UserID) or 0
local content = redis:get(boss..':adduser:'..arg.ChatID..':'..arg.UserID) or 0
sendMsg(arg.ChatID,arg.MsgID,"🎫┇ايديه » `"..arg.UserID.."`\n📨┇رسائله » "..maseegs.."\n🎟┇معرفه » ["..UserNameID.."]\n📈┇تفاعله » "..Get_Ttl(maseegs).."\n📮┇رتبته » "..Getrtba(arg.UserID,arg.ChatID).."\n⚡️┇تعديلاته » "..edited.."\n☎️┇جهاته » "..content.."") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
local USERNAME = arg.user
NameUser = Hyper_Link_Name(data)
local maseegs = redis:get(boss..'msgs:'..UserID..':'..arg.ChatID) or 1
local edited = redis:get(boss..':edited:'..arg.ChatID..':'..UserID) or 0
local content = redis:get(boss..':adduser:'..arg.ChatID..':'..UserID) or 0
sendMsg(arg.ChatID,arg.MsgID,"🎫┇ايديه » `"..UserID.."`\n📨┇رسائله » "..maseegs.."\n🎟┇معرفه » ["..USERNAME.."]\n📈┇تفاعله » "..Get_Ttl(maseegs).."\n📮┇رتبته » "..Getrtba(UserID,arg.ChatID).."\n⚡️┇تعديلاته » "..edited.."\n☎️┇جهاته » "..content.."") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,user=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tfa3l"}) 
end
return false
end

if MsgText[1] == "كشف" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERCAR = utf8.len(USERNAME)
local namei = data.first_name_..' '..(data.last_name_ or "")
if data.username_ then useri = '@'..data.username_ else useri = " لا يوجد " end
SendMention(arg.ChatID,arg.UserID,arg.MsgID,'🤵🏼¦ الاسم » '..namei..'\n'
..'🎫¦ الايدي » {'..arg.UserID..'} \n'
..'🎟¦ المعرف » '..useri..'\n'
..'📮¦ الرتبه » '..Getrtba(arg.UserID,arg.ChatID)..'\n'
..'🕵🏻️‍♀️¦ نوع الكشف » بالرد\n➖',13,utf8.len(namei))
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
sendMsg(arg.ChatID,arg.MsgID,'ـ🤵🏼*¦* الاسم » '..FlterName(data.title_,30)..'\n'..'🎫*¦* الايدي » {`'..UserID..'`} \n'..'🎟*¦* المعرف » '..UserName..'\n📮¦ الرتبه » '..Getrtba(UserID,arg.ChatID)..'\n🕵🏻️‍♀️*¦* نوع الكشف » بالمعرف\n'..'➖')
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
end
return false
end


if MsgText[1] == "رفع القيود" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
  GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
  if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
  local UserID = data.sender_user_id_
  GetUserID(UserID,function(arg,data)
    if msg.SudoUser then redis:srem(boss..'gban_users',arg.UserID)  end 
    Restrict(arg.ChatID,arg.UserID,2)
    redis:srem(boss..'banned:'..arg.ChatID,arg.UserID)
    StatusLeft(arg.ChatID,arg.UserID)
    redis:srem(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
    NameUser = Hyper_Link_Name(data)
    sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم رفع القيود ان وجد\n✓") 
  end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
  end,{ChatID=msg.chat_id_,MsgID=msg.id_})
  
  elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
  GetUserName(MsgText[2],function(arg,data)
  if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
  local UserID = data.id_
  if msg.SudoUser then redis:srem(boss..'gban_users',UserID)  end 
  Restrict(arg.ChatID,UserID,2)
  redis:srem(boss..'banned:'..arg.ChatID,UserID)
  StatusLeft(arg.ChatID,UserID)
  redis:srem(boss..'is_silent_users:'..arg.ChatID,UserID)
  NameUser = Hyper_Link_Name(data)
  sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم رفع القيود ان وجد\n✓") 
  end,{ChatID=msg.chat_id_,MsgID=msg.id_})
  elseif MsgText[2] and MsgText[2]:match('^%d+$') then
  GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="rfaqud"}) 
  end 
return false
end

if MsgText[1] == "طرد" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not msg.Creator and not redis:get(boss.."lock_KickBan"..msg.chat_id_) then return "📛*¦* الامر معطل من قبل اداره المجموعة  \n🚶" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المميز\n🛠") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني حظر العضو .\n🎟*¦* لانه مشرف في المجموعه \n ❕')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني حظر العضو .\n🎟*¦* ليس لدي صلاحيه الحظر او لست مشرف\n ❕')    
end
GetUserID(arg.UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم طرده من المجموعة\n✓") 
StatusLeft(arg.ChatID,arg.UserID)
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك طرد المميز\n🛠") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني طرد العضو .\n🎟*¦* لانه مشرف في المجموعه \n ❕')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني طرد العضو .\n🎟*¦* ليس لدي صلاحيه الحظر او لست مشرف\n ❕')    
end
StatusLeft(arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..arg.NameUser.." ❳  تم طرده من المجموعة\n✓") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
end 
return false
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not msg.Creator and not redis:get(boss.."lock_KickBan"..msg.chat_id_) then return "📛*¦* الامر معطل من قبل اداره المجموعة  \n🚶" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
  return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المميز\n🛠") 
end

kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني حظر العضو .\n🎟*¦* لانه مشرف في المجموعه \n ❕')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني حظر العضو .\n🎟*¦* ليس لدي صلاحيه الحظر او لست مشرف\n ❕')    
else
GetUserID(arg.UserID,function(arg,data)
  NameUser = Hyper_Link_Name(data)
  USERNAME = ResolveUserName(data)
if redis:sismember(boss..'banned:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد حظره من المجموعة\n✓") 
end

redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'banned:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم حظره من المجموعة\n✓") 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك حظر الادمن\n🛠") 
end
if data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") 
end
if redis:sismember(boss..'banned:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد حظره من المجموعة\n✓") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني حظر العضو .\n🎟*¦* لانه مشرف في المجموعه \n ❕')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'📛*¦* لا يمكنني حظر العضو .\n🎟*¦* ليس لدي صلاحيه الحظر او لست مشرف\n ❕')    
end
redis:hset(boss..'username:'..arg.UserID, 'username',arg.UserName)
redis:sadd(boss..'banned:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم حظره من المجموعة\n✓") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=UserID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
end 
return false
end

--==============================================================================================================================
--==============================================================================================================================
--==============================================================================================================================


if MsgText[1] == "رفع مشرف" then
if not msg.SuperCreator then return "📛*¦* هذا الامر يخص {منشئ اساسي,المطور} فقط  \n🚶" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_

GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") end
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:setex(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_,500,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📇|  » حسننا الان ارسل صلاحيات المشرف :\n\n|1- صلاحيه تغيير المعلومات\n|2- صلاحيه حذف الرسائل\n|3- صلاحيه دعوه مستخدمين\n|4- صلاحيه حظر وتقيد المستخدمين \n|5- صلاحيه تثبيت الرسائل \n|6- صلاحيه رفع مشرفين اخرين\n\n|[*]- لرفع كل الصلاحيات ما عدا رفع المشرفين \n|[**] - لرفع كل الصلاحيات مع رفع المشرفين \n\n🚸| يمكنك اختيار الارقام معا وتعيين الكنيه للمشرف في ان واحد مثلا : \n\n| 136 الزعيم\n📬") 

end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") end
redis:hset(boss..'username:'..UserID,'username',arg.USERNAME)
redis:setex(boss..":uploadingsomeon:"..arg.ChatID..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..arg.ChatID..msg.sender_user_id_,500,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📇|  » حسننا الان ارسل صلاحيات المشرف :\n\n|1- صلاحيه تغيير المعلومات\n|2- صلاحيه حذف الرسائل\n|3- صلاحيه دعوه مستخدمين\n|4- صلاحيه حظر وتقيد المستخدمين \n|5- صلاحيه تثبيت الرسائل \n|6- صلاحيه رفع مشرفين اخرين\n\n|[*]- لرفع كل الصلاحيات ما عدا رفع المشرفين \n|[**] - لرفع كل الصلاحيات مع رفع المشرفين \n\n🚸| يمكنك اختيار الارقام معا وتعيين الكنيه للمشرف في ان واحد مثلا : \n\n| 136 الزعيم\n📬") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,USERNAME=MsgText[2]})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="upMshrf"}) 
end 
return false
end

if MsgText[1] == "تنزيل مشرف" then
if not msg.SuperCreator then return "📛*¦* هذا الامر يخص {منشئ اساسي,المطور} فقط  \n🚶" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكن تنفيذ الامر للبوت\n📛") end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") end
ResAdmin = UploadAdmin(arg.ChatID,arg.UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦*لا يمكنني تنزيله لانه مرفوع من قبل منشئ اخر \n📛")  end
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
redis:srem(boss..'owners:'..arg.ChatID,arg.UserID)
redis:srem(boss..'admins:'..arg.ChatID,arg.UserID)
redis:srem(boss..'whitelist:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳ تم تنزيله من المشرفين من المجموعه\n✓") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكن تنفيذ الامر للبوت\n📛") end
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* عذرا هذا معرف قناة وليس حساب \n📛") end
local ResAdmin = UploadAdmin(arg.ChatID,UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(arg.ChatID,arg.MsgID,"👤*¦*لا يمكنني تنزيله لانه مرفوع من قبل منشئ اخر \n📛")  end
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
redis:srem(boss..'owners:'..arg.ChatID,UserID)
redis:srem(boss..'admins:'..arg.ChatID,UserID)
redis:srem(boss..'whitelist:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳ تم تنزيله من المشرفين من المجموعه\n✓") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwonMshrf"}) 
end 
return false
end
--==============================================================================================================================
--==============================================================================================================================
--==============================================================================================================================

if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لا يمكنك استخدام الامر بالرد على البوت \n❕") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

GetChatMember(arg.ChatID,arg.UserID,function(arg,data)
if (data.status_.ID == "ChatMemberStatusKicked" or redis:sismember(boss..'banned:'..arg.ChatID,arg.UserID)) then
StatusLeft(arg.ChatID,arg.UserID,function(arg,data) 
if data.message_ and data.message_ == "CHAT_ADMIN_REQUIRED" then 
sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا البوت ليس لديه صلاحيات الحظر \n❕")
else
return sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم الغاء حظره من المجموعة\n✓") 
end
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID,USERNAME=arg.USERNAME})
redis:srem(boss..'banned:'..arg.ChatID,arg.UserID)
else
return sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد الغاء حظره من المجموعة\n✓") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID,USERNAME=USERNAME})
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
if data.id_ == our_id then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لا يمكنك تنفيذ الامر مع البوت \n❕") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'banned:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم الغاء حظره من المجموعة\n✓") 
else
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد الغاء حظره من المجموعة\n✓") 
end
redis:srem(boss..'banned:'..arg.ChatID,UserID)
StatusLeft(arg.ChatID,UserID)
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
end 
return false
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المميز\n🛠") 
end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'is_silent_users:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد كتمه من المجموعة\n✓") 
else
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم كتمه من المجموعة\n✓") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم البوت\n🛠") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المطور الاساسي\n🛠") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المطور\n🛠") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المنشئ\n🛠") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المنشئ الاساسي\n🛠") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المدير\n🛠") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم الادمن\n🛠") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"👤*¦* لا يمكنك كتم المميز\n🛠") 
end
if redis:sismember(boss..'is_silent_users:'..arg.ChatID,UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد كتمه من المجموعة\n✓") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'is_silent_users:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم كتمه من المجموعة\n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
end
return false
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'is_silent_users:'..arg.ChatID,arg.UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد الغاء كتمه من المجموعة\n✓") 
else
  sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم الغاء كتمه من المجموعة\n✓") 
redis:srem(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'is_silent_users:'..arg.ChatID,UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم بالتأكيد الغاء كتمه من المجموعة\n✓") 
else
redis:srem(boss..'is_silent_users:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"📌 » العضو ❲ "..NameUser.." ❳  تم الغاء كتمه من المجموعة\n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
end 
return false
end


--{ Commands For locks }

if MsgText[1] == "قفل الكل"		 then return lock_All(msg) end
if MsgText[1] == "قفل الوسائط" 	 then return lock_Media(msg) end
if MsgText[1] == "قفل الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[1] == "قفل الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[1] == "قفل المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[1] == "قفل التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[1] == "قفل الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[1] == "قفل الدردشه"    	     then return mute_text(msg) end
if MsgText[1] == "قفل المتحركه" 		 then return mute_gif(msg) end
if MsgText[1] == "قفل الصور" 			 then return mute_photo(msg) end
if MsgText[1] == "قفل الفيديو"			 then return mute_video(msg) end
if MsgText[1] == "قفل البصمات" 		then return mute_voice(msg) 	end
if MsgText[1] == "قفل الصوت" 		then return mute_audio(msg) 	end
if MsgText[1] == "قفل الملصقات" 	then return mute_sticker(msg) end
if MsgText[1] == "قفل الجهات" 		then return mute_contact(msg) end
if MsgText[1] == "قفل التوجيه" 		then return mute_forward(msg) end
if MsgText[1] == "قفل الموقع"	 	then return mute_location(msg) end
if MsgText[1] == "قفل الملفات" 		then return mute_document(msg) end
if MsgText[1] == "قفل الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[1] == "قفل الانلاين" 		then return mute_inline(msg) end
if MsgText[1] == "قفل الالعاب" 		then return mute_game(msg) end
if MsgText[1] == "قفل الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[1] == "قفل الروابط" 		then return lock_link(msg) end
if MsgText[1] == "قفل التاك" 		then return lock_tag(msg) end
if MsgText[1] == "قفل المعرفات" 	then return lock_username(msg) end
if MsgText[1] == "قفل التعديل" 		then return lock_edit(msg) end
if MsgText[1] == "قفل الكلايش" 		then return lock_spam(msg) end
if MsgText[1] == "قفل التكرار" 		then return lock_flood(msg) end
if MsgText[1] == "قفل البوتات" 		then return lock_bots(msg) end
if MsgText[1] == "قفل البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[1] == "قفل الماركدوان" 	then return lock_markdown(msg) end
if MsgText[1] == "قفل الويب" 		then return lock_webpage(msg) end 
if MsgText[1] == "قفل التثبيت" 		then return lock_pin(msg) end 
if MsgText[1] == "قفل الاضافه" 		then return lock_Add(msg) end 
if MsgText[1] == "قفل الانكليزيه" 		then return lock_lang(msg) end 
if MsgText[1] == "قفل الفارسيه" 		then return lock_pharsi(msg) end 
if MsgText[1] == "قفل الفشار" 		then return lock_mmno3(msg) end 


--{ Commands For Unlocks }
if MsgText[1] == "فتح الكل" then return Unlock_All(msg) end
if MsgText[1] == "فتح الوسائط" then return Unlock_Media(msg) end
if MsgText[1] == "فتح الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[1] == "فتح الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[1] == "فتح المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[1] == "فتح التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[1] == "فتح الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[1] == "فتح المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[1] == "فتح الدردشه" 		then return unmute_text(msg) 	end
if MsgText[1] == "فتح الصور" 		then return unmute_photo(msg) 	end
if MsgText[1] == "فتح الفيديو" 		then return unmute_video(msg) 	end
if MsgText[1] == "فتح البصمات" 		then return unmute_voice(msg) 	end
if MsgText[1] == "فتح الصوت" 		then return unmute_audio(msg) 	end
if MsgText[1] == "فتح الملصقات" 	then return unmute_sticker(msg) end
if MsgText[1] == "فتح الجهات" 		then return unmute_contact(msg) end
if MsgText[1] == "فتح التوجيه" 		then return unmute_forward(msg) end
if MsgText[1] == "فتح الموقع" 		then return unmute_location(msg) end
if MsgText[1] == "فتح الملفات" 		then return unmute_document(msg) end
if MsgText[1] == "فتح الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[1] == "فتح الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[1] == "فتح الالعاب" 		then return unmute_game(msg) 	end
if MsgText[1] == "فتح الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[1] == "فتح الروابط" 		then return unlock_link(msg) 	end
if MsgText[1] == "فتح التاك" 		then return unlock_tag(msg) 	end
if MsgText[1] == "فتح المعرفات" 	then return unlock_username(msg) end
if MsgText[1] == "فتح التعديل" 		then return unlock_edit(msg) 	end
if MsgText[1] == "فتح الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[1] == "فتح التكرار" 		then return unlock_flood(msg) 	end
if MsgText[1] == "فتح البوتات" 		then return unlock_bots(msg) 	end
if MsgText[1] == "فتح البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[1] == "فتح الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[1] == "فتح الويب" 		then return unlock_webpage(msg) 	end
if MsgText[1] == "فتح التثبيت" 		then return unlock_pin(msg) end 
if MsgText[1] == "فتح الاضافه" 		then return unlock_Add(msg) end 
if MsgText[1] == "فتح الانكليزيه" 		then return unlock_lang(msg) end 
if MsgText[1] == "فتح الفارسيه" 		then  return unlock_pharsi(msg) end 
if MsgText[1] == "فتح الفشار" 		then return unlock_mmno3(msg) end 

 
if MsgText[1] == "ضع رابط" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end 
redis:setex(boss..'WiCmdLink'..msg.chat_id_..msg.sender_user_id_,500,true)
return '📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل  رابط مجموعتك 🍃'
end

if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(boss..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(boss..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* تم انشاء رابط جديد \n🔖¦ ["..LinkGp.."]\n🔖¦ لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"📛¦ لا يمكنني انشاء رابط للمجموعه .\n🎟¦ لانني لست مشرف في المجموعه \n ❕")
end
else
return sendMsg(msg.chat_id_,msg.id_,"📛¦ لقد قمت بانشاء الرابط سابقا .\n🎟¦ ارسل { الرابط } لرؤيه الرابط  \n ❕")
end
return false
end 

if MsgText[1] == "الرابط" then
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then return "📡*¦* الامر معطل من قبل الادارة \n^"  end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then return "📡*¦* اوه 🙀 لا يوجد رابط ☹️\n🔖*¦*لانشاء رابط ارسل { انشاء رابط } \n📡" end
local GroupName = redis:get(boss..'group:name'..msg.chat_id_)
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
return "🔖¦رابـط الـمـجـمـوعه 💯\n🌿¦ "..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end

if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:setex(boss..'rulse:witting'..msg.sender_user_id_,300,true)
return '📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل القوانين  للمجموعه 🍃'
end

if MsgText[1] == "القوانين" then
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "📡*¦* مرحبأ عزيري 👋🏻 القوانين كلاتي 👇🏻\n🔖¦ ممنوع نشر الروابط \n🔖¦ ممنوع التكلم او نشر صور اباحيه \n🔖¦ ممنوع  اعاده توجيه\n🔖¦ ممنوع التكلم بلطائفه \n🔖¦ الرجاء احترام المدراء والادمنيه 😅\n"
else 
return "*🔖¦القوانين :*\n"..redis:get(boss..'rulse:msg'..msg.chat_id_) 
end 
end

if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "📡*¦* حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(boss..'flood'..msg.chat_id_,MsgText[2]) 
return "📡*¦* تم وضع التكرار » { *"..MsgText[2].."* }"
end

if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if 100 < tonumber(MsgText[2]) then return "📛*¦* حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
tdcli_function({ID="DeleteMessages",chat_id_ = msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑¦* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil)
else
tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑¦* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil)
end
end)
return false
end

if MsgText[2] == "المنشئيين الاساسيين" or MsgText[2] == "المنشئين الاساسيين" or MsgText[2] == "المنشئيين الاساسين" or MsgText[2] == "المنشئين الاساسين" then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end

local Admins = redis:scard(boss..':MONSHA_Group:'..msg.chat_id_)
if Admins == 0 then  
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد منشئيين اساسييين ليتم مسحهم ✓" 
end
redis:del(boss..':MONSHA_Group:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح {"..Admins.."} من الادمنيه في البوت \n✓"
end


if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end

local Admins = redis:scard(boss..'admins:'..msg.chat_id_)
if Admins == 0 then  
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد ادمنيه ليتم مسحهم ✓" 
end
redis:del(boss..'admins:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح {"..Admins.."} من الادمنيه في البوت \n✓"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local Mn3Word = redis:scard(boss..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "📡*¦* عذرا لا توجد كلمات ممنوعه ليتم حذفها ✓" 
end
redis:del(boss..':Filter_Word:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n🔖¦ تم مسح {*"..Mn3Word.."*} كلمات من المنع ✓"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "📛¦ عذرا لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(boss..'rulse:msg'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم حذف القوانين بنجاح ✓"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'welcome:msg'..msg.chat_id_) then 
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد ترحيب ليتم مسحه ✓" 
end
redis:del(boss..'welcome:msg'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم حذف الترحيب بنجاح \n✓"
end


if MsgText[2] == "المنشئيين" or MsgText[2] == "المنشئين" then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
local NumMnsha = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "📛¦ عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..NumMnsha.." *} من المنشئيين\n✓"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local NumMDER = redis:scard(boss..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "📛¦ عذرا لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(boss..'owners:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..NumMDER.." *} من المدراء  \n✓"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end

local list = redis:smembers(boss..'banned:'..msg.chat_id_)
if #list == 0 then return "*📌¦ لا يوجد مستخدمين محظورين  *" end
message = '📋*¦* قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(boss..'banned:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..#list.." *} من المحظورين  \n✓"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local MKTOMEN = redis:scard(boss..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "📡*¦* لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(boss..'is_silent_users:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..MKTOMEN.." *} من المكتومين  \n✓"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local MMEZEN = redis:scard(boss..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*⚙️*¦ لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(boss..'whitelist:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..MMEZEN.." *} من المميزين  \n✓"
end

if MsgText[2] == 'الرابط' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then 
return "*⚙️*¦ لا يوجد رابط مضاف اصلا " 
end
redis:del(boss..'linkGroup'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح رابط المجموعه \n✓"
end


end 
--End del 

if MsgText[1] == "ضع اسم" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:setex(boss..'name:witting'..msg.sender_user_id_,300,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الاسم  للمجموعه \n🛠"
end

if MsgText[1] == "حذف صوره" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
tdcli_function({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = {ID = "InputFileId", id_ = 0}},function(arg,data)
if data.message_ and data.message_ == "CHAT_NOT_MODIFIED" then
sendMsg(arg.ChatID,arg.MsgID,'🚸¦ عذرا , لا توجد صوره في المجموعة\n✖️')
elseif data.message_ and data.message_ == "CHAT_ADMIN_REQUIRED" then
sendMsg(arg.ChatID,arg.MsgID,'🚸¦ عذرا , البوت ليس لدية صلاحيه التعديل في المجموعة \n✖️')
else
sendMsg(arg.ChatID,arg.MsgID,'🚸¦ تم حذف صوره آلمـجمـوعهہ 🌿\n✖️')
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "ضع صوره" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({
ID="ChangeChatPhoto",
chat_id_=arg.ChatID,
photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.code_ and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'🚸 ¦ ليس لدي صلاحيه تغيير الصوره \n🤖 ¦ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.reply_id})
return false
else 
redis:setex(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '📭¦ حسننا عزيزي 🍁\n🌄 ¦ الان قم بارسال الصوره\n🛠' 
end 
end

if MsgText[1] == "ضع وصف" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:setex(boss..'about:witting'..msg.sender_user_id_,300,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الوصف  للمجموعه\n🛠" 
end

if MsgText[1] == "تاك للكل" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss.."lock_takkl"..msg.chat_id_) then  return "📛*¦* الامر معطل من قبل الادراة" end 
return TagAll(msg) 
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if MsgText[2] then
return AddFilter(msg, MsgText[2]) 
elseif msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == "MessageText" then
  Type_id = data.content_.text_
elseif data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then Type_id = data.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = data.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif data.content_.ID == "MessageSticker" then
  Type_id = data.content_.sticker_.sticker_.persistent_id_
elseif data.content_.ID == "MessageVoice" then
  Type_id = data.content_.voice_.voice_.persistent_id_
elseif data.content_.ID == "MessageAnimation" then
  Type_id = data.content_.animation_.animation_.persistent_id_
elseif data.content_.ID == "MessageVideo" then
  Type_id = data.content_.video_.video_.persistent_id_
elseif data.content_.ID == "MessageAudio" then
  Type_id = data.content_.audio_.audio_.persistent_id_
elseif data.content_.ID == "MessageUnsupported" then
  return sendMsg(arg.ChatID,arg.MsgID,"📝*¦* عذرا الرساله غير مدعومه ✓️")
else
  Type_id = 0
end

if redis:sismember(boss..':Filter_Word:'..arg.ChatID,Type_id) then 
return sendMsg(arg.ChatID,arg.MsgID,"📝*¦* هي بالتأكيد في قائمه المنع✓️")
else
redis:sadd(boss..':Filter_Word:'..arg.ChatID,Type_id) 
return sendMsg(arg.ChatID,arg.MsgID,"📝*¦* تمت اضافتها الى قائمه المنع ✓️")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
return false 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if MsgText[2] then
  return RemFilter(msg,MsgText[2]) 
elseif msg.reply_id then
  GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
  if msg.content_.ID == "MessageText" then
    Type_id = data.content_.text_
  elseif data.content_.ID == 'MessagePhoto' then
  if data.content_.photo_.sizes_[3] then Type_id = data.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = data.content_.photo_.sizes_[0].photo_.persistent_id_ end
  elseif data.content_.ID == "MessageSticker" then
    Type_id = data.content_.sticker_.sticker_.persistent_id_
  elseif data.content_.ID == "MessageVoice" then
    Type_id = data.content_.voice_.voice_.persistent_id_
  elseif data.content_.ID == "MessageAnimation" then
    Type_id = data.content_.animation_.animation_.persistent_id_
  elseif data.content_.ID == "MessageVideo" then
    Type_id = data.content_.video_.video_.persistent_id_
  elseif data.content_.ID == "MessageAudio" then
    Type_id = data.content_.audio_.audio_.persistent_id_
  end
if redis:sismember(boss..':Filter_Word:'..arg.ChatID,Type_id) then 
  redis:srem(boss..':Filter_Word:'..arg.ChatID,Type_id) 
  return sendMsg(arg.ChatID,arg.MsgID,"📝*¦* تم السماح بها✓️")
  else
  return sendMsg(arg.ChatID,arg.MsgID,"📝*¦* هي بالتأكيد مسموح بها✓️")
  end
  end,{ChatID=msg.chat_id_,MsgID=msg.id_})
  end
  return false 
  end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return GetListAdmin(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشئيين"  or MsgText[1] == "المنشئين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return conslist(msg)
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return whitelist(msg) 
end

if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),filter_={ID="ChannelMembersBots"},offset_=0,limit_=50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(arg.ChatID,arg.MsgID,"🔖| لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,arg.ChatID,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "📌| عـدد الـبـوتات •⊱ {* "..(Total - 1).." *} ⊰•\n\n"
if NumBot == 0 then 
TextR = TextR.."📮| لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."🔖| لم يتم طـرد {* "..NumBotAdmin.." *} بوت لآنهہ‌‏م مـشـرفين."
else
TextR = TextR.."📮| تم طـرد كــل البوتآت بنجآح .\n"
end
end
return sendMsg(arg.ChatID,arg.MsgID,TextR) 
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '🤖| قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end
NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

📮| لـديـک {]]..total..[[} بـوتـآت
🔖| ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(arg.ChatID,arg.MsgID,AllBots) 
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
sendMsg(msg.chat_id_,msg.id_,'🔛| جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,arg.ChatID,function(arg,data)  
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,v.user_id_)
redis:srem(boss..'whitelist:'..arg.ChatID,v.user_id_)
redis:srem(boss..'owners:'..arg.ChatID,v.user_id_)
redis:srem(boss..'admins:'..arg.ChatID,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(arg.ChatID,arg.MsgID,"🚸 ¦ تم طـرد {* "..NumMemDone.." *} من آلحسـآبآت آلمـحذوفهہ‏‏ 🌿")
else
sendMsg(arg.ChatID,arg.MsgID,'🚸 ¦ لا يوجد حسابات محذوفه في المجموعه 🌿')
end
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end  

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(boss..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️¦ في مجموعه  » »  '..redis:get(boss..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ عزيزي المطور ✋🏿\n👨🏻‍🔧¦ شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if MsgText[2] == '1' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك  👍🏿\n📆¦  الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(boss..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end

if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local check_time = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
GetChatMember(arg.ChatID,data.sender_user_id_,function(arg,data)
if data.status_ and data.status_.ID == "ChatMemberStatusEditor" then
SudoGroups = 'مشرف '
elseif data.status_ and data.status_.ID == "ChatMemberStatusCreator" then 
SudoGroups = "منشئ ."
else
SudoGroups = "عضو .!"
end
if arg.UserID == our_id then 
Getrtb = 'ادمن' 
elseif  arg.UserID == SUDO_ID then
Getrtb = 'مطور اساسي ' 
elseif redis:sismember(boss..':SUDO_BOT:',arg.UserID) then
Getrtb = 'مطور ' 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then
Getrtb = 'منشئ' 
elseif redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then
Getrtb = 'المدير ' 
elseif redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then
Getrtb = 'ادمن' 
elseif redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then
Getrtb = 'مميز' 
else
Getrtb = 'عضو' 
end
GetUserID(arg.UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERCAR  = utf8.len(USERNAME)
SendMention(arg.ChatID,arg.UserID,arg.MsgID,'👤¦ العضو » '..USERNAME..'\n\nـ⠀•⊱ { رتـبـه الشخص } ⊰•\n\n🤖¦ في البوت » '..arg.Getrtb..' \n💬¦ في المجموعه » '..arg.SudoGroups..'\n✓',12,utf8.len(USERNAME)) 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID,Getrtb=Getrtb,SudoGroups=SudoGroups})
end,{ChatID=arg.ChatID,UserID=data.sender_user_id_,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "كشف البوت" and not MsgText[2] then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
GetChatMember(msg.chat_id_,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusMember" then 
sendMsg(arg.ChatID,arg.MsgID,'📡*¦* جيد , الـبــوت ادمــن الان \n')
else 
sendMsg(arg.ChatID,arg.MsgID,'📡*¦* كلا البوت ليس ادمن في المجموعة 📛')
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false 
end

if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  "⠀\n⠀•⊱ { الاحـصـائـيـات الـرسـائـل } ⊰•\n"
.."💬¦ الـرسـائـل •⊱ { `"..msgs.."` } ⊰•\n"
.."📞¦ الـجـهـات •⊱ { `"..NumGha.."` } ⊰•\n"
.."📸¦ الـصـور •⊱ { `"..photo.."` } ⊰•\n"
.."📽¦ الـمـتـحـركـه •⊱ { `"..animation.."` } ⊰•\n"
.."🔖¦ الـمـلـصـقات •⊱ { `"..sticker.."` } ⊰•\n"
.."🎙¦ الـبـصـمـات •⊱ { `"..voice.."` } ⊰•\n"
.."🔊¦ الـصـوت •⊱ { `"..audio.."` } ⊰•\n"
.."🎞¦ الـفـيـديـو •⊱ { `"..video.."` } ⊰•\n"
.."📬¦ الـتـعـديـل •⊱ { `"..edited.."` } ⊰•\n\n"
.."📊¦ تـفـاعـلـك  •⊱ "..Get_Ttl(msgs).." ⊰•\n"
.."ـ.——————————\n"
return sendMsg(arg.chat_id_,arg.id_,Get_info)    
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end

if MsgText[1]== 'جهاتي' then
return '🧟‍♂*¦*  عدد جهہآتگ آلمـضـآفهہ‏‏ » 【'..(redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..'】 . \n🐾'
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
USERNAME = ""
Name = data.first_name_
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ end
if data.username_ then USERNAME = "💠¦ المعرف •⊱ @["..data.username_.."] ⊰•\n" end 
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
  SUDO_USERR = "👨🏻‍💻¦ مـطـور البوت •⊱ ["..SUDO_USER.."] ⊰•\n"
else
  SUDO_USERR = ""
end
local Get_info = "👨🏽‍🔧¦ اهـلا بـك عزيزي في معلوماتك 🥀 \n"
.."ـ.——————————\n"
.."🗯¦ الاســم •⊱{ "..FlterName(Name,25) .." }⊰•\n"
..USERNAME
.."⚜️¦ الايـدي •⊱ { `"..data.id_.."` } ⊰•\n"
.."🚸¦ رتبتــك •⊱ "..arg.TheRank.." ⊰•\n"
.."🔰¦ ــ •⊱ { `"..arg.chat_id_.."` } ⊰•\n"
.."ـ.——————————\n"
.." •⊱ { الاحـصـائـيـات الـرسـائـل } ⊰•\n"
.."💬¦ الـرسـائـل •⊱ { `"..msgs.."` } ⊰•\n"
.."📞¦ الـجـهـات •⊱ { `"..NumGha.."` } ⊰•\n"
.."📸¦ الـصـور •⊱ { `"..photo.."` } ⊰•\n"
.."📽¦ الـمـتـحـركـه •⊱ { `"..animation.."` } ⊰•\n"
.."🔖¦ الـمـلـصـقات •⊱ { `"..sticker.."` } ⊰•\n"
.."🎙¦ الـبـصـمـات •⊱ { `"..voice.."` } ⊰•\n"
.."🔊¦ الـصـوت •⊱ { `"..audio.."` } ⊰•\n"
.."🎞¦ الـفـيـديـو •⊱ { `"..video.."` } ⊰•\n"
.."📬¦ الـتـعـديـل •⊱ { `"..edited.."` } ⊰•\n\n"
.."📊¦ تـفـاعـلـك  •⊱ "..Get_Ttl(msgs).." ⊰•\n"
.."ـ.——————————\n"
..SUDO_USERR
sendMsg(arg.chat_id_,arg.id_,Get_info)    
end,{chat_id_=msg.chat_id_,id_=msg.id_,TheRank=msg.TheRank})
return false
end

if MsgText[1] == "تفعيل الردود" 	then return unlock_replay(msg) end
if MsgText[1] == "تفعيل الايدي" 	then return unlock_ID(msg) end
if MsgText[1] == "تفعيل الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[1] == "تفعيل التحذير" 	then return unlock_waring(msg) end 
if MsgText[1] == "تفعيل الايدي بالصوره" 	then return unlock_idphoto(msg) end 
if MsgText[1] == "تفعيل الحمايه" 	then return unlock_AntiEdit(msg) end 
if MsgText[1] == "تفعيل المغادره" 	then return unlock_leftgroup(msg) end 
if MsgText[1] == "تفعيل الحظر" 	then return unlock_KickBan(msg) end 
if MsgText[1] == "تفعيل الرابط" 	then return unlock_linkk(msg) end 
if MsgText[1] == "تفعيل تاك للكل" 	then return unlock_takkl(msg) end 
if MsgText[1] == "تفعيل التحقق" 		then return unlock_check(msg) end 


if MsgText[1] == "تعطيل الردود" 	then return lock_replay(msg) end
if MsgText[1] == "تعطيل الايدي" 	then return lock_ID(msg) end
if MsgText[1] == "تعطيل الترحيب" 	then return lock_Welcome(msg) end
if MsgText[1] == "تعطيل التحذير" 	then return lock_waring(msg) end
if MsgText[1] == "تعطيل الايدي بالصوره" 	then return lock_idphoto(msg) end
if MsgText[1] == "تعطيل الحمايه" 	then return lock_AntiEdit(msg) end
if MsgText[1] == "تعطيل المغادره" 	then return lock_leftgroup(msg) end 
if MsgText[1] == "تعطيل الحظر" 	then return lock_KickBan(msg) end 
if MsgText[1] == "تعطيل الرابط" 	then return lock_linkk(msg) end 
if MsgText[1] == "تعطيل تاك للكل" 	then return lock_takkl(msg) end 
if MsgText[1] == "تعطيل التحقق" 		then return lock_check(msg) end 


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:set(boss..'welcom:witting'..msg.sender_user_id_,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ ارسل كليشه الترحيب الان\n\n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{النقاط} : لاضهار عدد النقاط \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف المطور الاساسي\n➼" 
end

if MsgText[1] == "الترحيب" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(boss..'welcome:msg'..msg.chat_id_))
else 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n🌿¦ نورت المجموعه \n💂🏼‍♀️" 
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
return set_admins(msg) 
end

end -- end of insert group 
if MsgText[1] == "تعطيل الاذاعه"  or MsgText[1] =="تعطيل الاذاعه 🔌"	then return lock_brod(msg) end
if MsgText[1] == "تفعيل تعيين الايدي" or MsgText[1] =="تفعيل تعيين الايدي ⌨️" 	then return unlock_idediit(msg) end 
if MsgText[1] == "تعطيل تعيين الايدي" or MsgText[1] =="تعطيل تعيين الايدي ⚔️" 	then return lock_idediit(msg) end 
if MsgText[1] == "تفعيل الاذاعه" or MsgText[1] =="تفعيل الاذاعه 📇" 	then return unlock_brod(msg) end



if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local mtwren = redis:scard(boss..':SUDO_BOT:')
if mtwren == 0 then  return "⚙️*¦* عذرا لا يوجد مطورين في البوت  ✖️" end
redis:del(boss..':SUDO_BOT:') 
return "📛*¦* تم مسح {* "..mtwren.." *} من المطورين ☔️\n✓"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local addbannds = redis:scard(boss..'gban_users')
if addbannds ==0 then 
return "*⚙️¦ قائمة الحظر فارغه .*" 
end
redis:del(boss..'gban_users') 
return "⚙️*¦* تـم مـسـح { *"..addbannds.." *} من قائمه العام\n✓" 
end 

if MsgText[1] == "رفع منشئ اساسي" or MsgText[1] == "رفع منشى اساسي" then
  if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end

  if not MsgText[2] and msg.reply_id then 
  GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
  if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
  local UserID = data.sender_user_id_
  if UserID == our_id then 
  return sendMsg(ChatID,MsgID,"👤*¦* عذرا لا يمكنني رفع بوت \n📛") 
  end
  GetUserID(UserID,function(arg,data)
  ReUsername = ResolveUserName(data)
  NameUser = Hyper_Link_Name(data)
  if redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
  else
    sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
  redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
  redis:sadd(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID)
  end
  end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
  end,{ChatID=msg.chat_id_,MsgID=msg.id_})
  end


  if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
  GetUserName(MsgText[2],function(arg,data)
  if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
  local UserID = data.id_
  NameUser = Hyper_Link_Name(data)
  if redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
  sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
  else
  redis:hset(boss..'username:'..UserID,'username',arg.UserName)
  redis:sadd(boss..':MONSHA_Group:'..arg.ChatID,UserID)
  sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
  end
  end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
  end 
  if MsgText[2] and MsgText[2]:match('^%d+$') then 
    GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="Upmonsh"}) 
  end
  return false
  end
  
  if MsgText[1] == "تنزيل منشئ اساسي" or MsgText[1] == "تنزيل منشى اساسي" then
    if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end

    if not MsgText[2] and msg.reply_id then 
    GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
    if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
    local UserID = data.sender_user_id_
    GetUserID(UserID,function(arg,data)
    USERNAME = ResolveUserName(data):gsub([[\]],"")
    NameUser = Hyper_Link_Name(data)

    if not redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID) then 
    sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
    else
      sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
    redis:srem(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID)
    end  
    end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
    end,{ChatID=msg.chat_id_,MsgID=msg.id_})
    end


    if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
    GetUserName(MsgText[2],function(arg,data)
    if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
    local UserID = data.id_
    UserName = Flter_Markdown(arg.UserName)
    NameUser = Hyper_Link_Name(data)
    if not redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
    sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️") 
    else
    redis:srem(boss..':MONSHA_Group:'..arg.ChatID,UserID)
    sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳ منشئ اساسي في المجموعة \n✓️")
    end
    end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
    end 
  
    if MsgText[2] and MsgText[2]:match('^%d+$') then 
      GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="Dwmonsh"}) 
    end
  
    return false
  end

  
if MsgText[1] == 'مسح كلايش التعليمات' then 
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {مطور اساسي} فقط  \n🚶" end
 redis:del(boss..":awamer_Klesha_m1:")
 redis:del(boss..":awamer_Klesha_m2:")
 redis:del(boss..":awamer_Klesha_m3:")
 redis:del(boss..":awamer_Klesha_mtwr:")
 redis:del(boss..":awamer_Klesha_mrd:")
 redis:del(boss..":awamer_Klesha_mf:")
 redis:del(boss..":awamer_Klesha_m:")

  sendMsg(msg.chat_id_,msg.id_,"📛*¦* تم مسح كلايش التعليمات  \n❕")
end
  
if MsgText[1] == 'مسح كليشه الايدي' or MsgText[1] == 'مسح الايدي' or MsgText[1] == 'مسح ايدي'  or MsgText[1] == 'مسح كليشة الايدي'  then 
  if not msg.Creator then return "📛*¦* هذا الامر يخص {منشئ اساسي,المنشئ,المطور} فقط  \n🚶" end
  redis:del(boss..":infoiduser_public:"..msg.chat_id_)
  sendMsg(msg.chat_id_,msg.id_,"📛*¦* تم مسح كليشة الايدي بنجاح \n❕")
end

if MsgText[1] == 'تعيين كليشه الايدي' or MsgText[1] == 'تعيين الايدي' or MsgText[1] == 'تعيين ايدي'  or MsgText[1] == 'تعيين كليشة الايدي'  then 
  if not msg.Creator then return "📛*¦* هذا الامر يخص {منشئ اساسي,المنشئ,المطور} فقط  \n🚶" end
  redis:setex(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_,1000,true)
  return '📮*¦* حسننا , الان ارسل كليشه الايدي الجديده \n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{النقاط} : لاضهار عدد النقاط \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف المطور الاساسي\n➼' 
  end


if MsgText[1] == "تنزيل الكل" then
  if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end

    if not MsgText[2] and msg.reply_id then 
    GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
    if not data.sender_user_id_ then return sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
    local UserID = data.sender_user_id_
    msg = arg.msg
    msg.UserID = UserID
    GetUserID(UserID,function(arg,data)
    NameUser = Hyper_Link_Name(data)
    msg = arg.msg
    UserID = msg.UserID
    if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"📛*¦* لآ يمكنك تنفيذ الامر مع البوت\n❕") end

      if UserID == SUDO_ID then 
      rinkuser = 1
      elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
      rinkuser = 2
      elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
      rinkuser = 3
      elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
      rinkuser = 4
      elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
      rinkuser = 5
      elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
      rinkuser = 6
      elseif redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then 
      rinkuser = 7
      else
      rinkuser = 8
      end
      local DonisDown = "\n📛| تم تنزيله من الرتب الاتيه : \n\n "
     if redis:sismember(boss..':SUDO_BOT:',UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المطور ✓️\n"
     end 
     if redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المنشئ الاساسي ✓️\n"
    end 
    if redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المنشئ ✓️\n"
    end 
    if redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المدير ✓️\n"
    end 
    if redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من الادمن ✓️\n"
    end 
    if redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then
      DonisDown = DonisDown.."⭕️| تم تنزيله من العضو مميز ✓️\n"
    end
function senddwon() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله \n❕") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." \n❕") end

if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"👲🏼 » ❲ "..NameUser.." ❳  انه اساسا عضو \n✓️")  end
huk = false
    if msg.SudoBase then 
      redis:srem(boss..':SUDO_BOT:',UserID)
      redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
      redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
      redis:srem(boss..'owners:'..msg.chat_id_,UserID)
      redis:srem(boss..'admins:'..msg.chat_id_,UserID)
      redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
    elseif msg.SudoUser then 
      if rinkuser == 2 then return sendpluse() end
      if rinkuser < 2 then return senddwon() end
      redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
      redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
      redis:srem(boss..'owners:'..msg.chat_id_,UserID)
      redis:srem(boss..'admins:'..msg.chat_id_,UserID)
      redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
    elseif msg.SuperCreator then 
    if rinkuser == 3 then return sendpluse() end
    if rinkuser < 3 then return senddwon() end
    redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
    redis:srem(boss..'owners:'..msg.chat_id_,UserID)
    redis:srem(boss..'admins:'..msg.chat_id_,UserID)
    redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
  elseif msg.Creator then 
      if rinkuser == 4 then return sendpluse() end
      if rinkuser < 5 then return senddwon() end
      redis:srem(boss..'owners:'..msg.chat_id_,UserID)
      redis:srem(boss..'admins:'..msg.chat_id_,UserID)
      redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
   elseif msg.Director then 
      if rinkuser == 5 then return sendpluse() end
      if rinkuser < 5 then return senddwon() end
      redis:srem(boss..'admins:'..msg.chat_id_,UserID)
      redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
    elseif msg.Admin then 
      if rinkuser == 6 then return sendpluse() end
      if rinkuser < 6 then return senddwon() end
      redis:srem(boss..'admins:'..msg.chat_id_,UserID)
      redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
    else
      huk = true
    end

    if not huk then sendMsg(msg.chat_id_,msg.id_,"👲🏼 » العضو ❲ "..NameUser.." ❳ \n"..DonisDown.."\n✓️") end

    end,{msg=msg})
    end,{msg=msg})
    end


    if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
    GetUserName(MsgText[2],function(arg,data)
    if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
    local UserID = data.id_
    if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يمكنك تنفيذ الامر مع البوت\n❕") end
    msg = arg.msg
    NameUser = Hyper_Link_Name(data)

          if UserID == SUDO_ID then 
          rinkuser = 1
          elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
          rinkuser = 2
          elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
          rinkuser = 3
          elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
          rinkuser = 4
          elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
          rinkuser = 5
          elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
          rinkuser = 6
          elseif redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then 
          rinkuser = 7
          else
          rinkuser = 8
          end
          local DonisDown = "\n📛| تم تنزيله من الرتب الاتيه : \n\n "
     if redis:sismember(boss..':SUDO_BOT:',UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المطور ✓️\n"
     end 
     if redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المنشئ الاساسي ✓️\n"
    end 
    if redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المنشئ ✓️\n"
    end 
    if redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من المدير ✓️\n"
    end 
    if redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
      DonisDown = DonisDown.."⭕️| تم تنزيله من الادمن ✓️\n"
    end 
    if redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then
      DonisDown = DonisDown.."⭕️| تم تنزيله من العضو مميز ✓️\n"
    end

    function senddwon() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله \n❕") end
    function sendpluse() sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." \n❕") end
    
    if rinkuser == 8 then return sendMsg(msg.chat_id_,msg.id_,"👲🏼 » ❲ "..NameUser.." ❳  انه اساسا عضو \n✓️")  end
    huk = false
        if msg.SudoBase then 
          redis:srem(boss..':SUDO_BOT:',UserID)
          redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
          redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
          redis:srem(boss..'owners:'..msg.chat_id_,UserID)
          redis:srem(boss..'admins:'..msg.chat_id_,UserID)
          redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
        elseif msg.SudoUser then 
          if rinkuser == 2 then return sendpluse() end
          if rinkuser < 2 then return senddwon() end
          redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
          redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
          redis:srem(boss..'owners:'..msg.chat_id_,UserID)
          redis:srem(boss..'admins:'..msg.chat_id_,UserID)
          redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
        elseif msg.SuperCreator then 
        if rinkuser == 3 then return sendpluse() end
        if rinkuser < 3 then return senddwon() end
        redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
        redis:srem(boss..'owners:'..msg.chat_id_,UserID)
        redis:srem(boss..'admins:'..msg.chat_id_,UserID)
        redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
      elseif msg.Creator then 
          if rinkuser == 4 then return sendpluse() end
          if rinkuser < 5 then return senddwon() end
          redis:srem(boss..'owners:'..msg.chat_id_,UserID)
          redis:srem(boss..'admins:'..msg.chat_id_,UserID)
          redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
       elseif msg.Director then 
          if rinkuser == 5 then return sendpluse() end
          if rinkuser < 5 then return senddwon() end
          redis:srem(boss..'admins:'..msg.chat_id_,UserID)
          redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
        elseif msg.Admin then 
          if rinkuser == 6 then return sendpluse() end
          if rinkuser < 6 then return senddwon() end
          redis:srem(boss..'admins:'..msg.chat_id_,UserID)
          redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
        else
          huk = true
        end
    
    if not huk then sendMsg(msg.chat_id_,msg.id_,"👲🏼 » العضو ❲ "..NameUser.." ❳ \n"..DonisDown.."\n✓️") end
    
      end,{msg=msg})
    end 
  
    if MsgText[2] and MsgText[2]:match('^%d+$') then 
      GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwnAll"}) 
    end
  
    return false
  end

  

--=====================================================================================


if MsgText[1] == "قائمه الاوامر" then
  if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
  local list = redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
  local list2 = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
  message = "📋| الاوامر الجديد : \n\n" i = 0
  for name,Course in pairs(list) do i = i + 1 message = message ..i..' - *{* '..name..' *}* ~> '..Course..' \n'  end 
  if i == 0 then return "📛*¦* لا توجد اوامر مضافه في القائمه \n🚶 " end
  return message
end


if MsgText[1] == "مسح الاوامر" then
  if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
  local Awammer 	= redis:del(boss..":AwamerBot:"..msg.chat_id_)
  redis:del(boss..":AwamerBotArray:"..msg.chat_id_)
  redis:del(boss..":AwamerBotArray2:"..msg.chat_id_)
  if Awammer ~= 0 then
      return "📭¦ تم مسح قائمه الاوامر \n..."
  else
      return "📛*¦* القائمه بالفعل ممسوحه \n🚶"
  end
end


if MsgText[1] == "تعيين امر" or MsgText[1] == "تعين امر" or MsgText[1] == "اضف امر" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if MsgText[2] then

local checkAmr = false
for k, Boss in pairs(XBoss) do if MsgText[2]:match(Boss) then  checkAmr = true end end      
if checkAmr then
redis:setex(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_,300,MsgText[2])
return "📭¦ حسننا عزيزي , لتغير امر {* "..MsgText[2].." *}  ارسل الامر الجديد الان \n..."
else
return "📛*¦* عذرا لا يوجد هذا الامر في البوت لتتمكن من تغييره  \n🚶"
end
else
redis:setex(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "📭¦ حسننا عزيزي , لتغير امر  ارسل الامر القديم الان \n..."
end
end

if MsgText[1] == "مسح امر"  then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if MsgText[2] then
local checkk = redis:hdel(boss..":AwamerBotArray2:"..msg.chat_id_,MsgText[2])
local AmrOld = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
amrnew = ""
amrold = ""
amruser = MsgText[2].." @user"
amrid = MsgText[2].." 23434"
amrklma = MsgText[2].." ffffff"
amrfile = MsgText[2].." fff.lua"
for Amor,ik in pairs(AmrOld) do
  if MsgText[2]:match(Amor) then			
  print("|AMrnew : "..Amor,"|AMrOld : "..ik)
  redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
  elseif amruser:match(Amor) then
    print("|AMrnew : "..Amor,"|AMrOld : "..ik)
    redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
  elseif amrid:match(Amor) then
    print("|AMrnew : "..Amor,"|AMrOld : "..ik)
    redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
  elseif amrklma:match(Amor) then
    print("|AMrnew : "..Amor,"|AMrOld : "..ik)
    redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
  elseif amrfile:match(Amor) then
    print("|AMrnew : "..Amor,"|AMrOld : "..ik)
    redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
end
end
if checkk ~=0 then
return "📭¦ تم مسح الامر {* "..MsgText[2].." *} من قائمه الاومر \n..."
else
return "📛*¦* هذا الامر ليس موجود ضمن الاوامر المضافه  \n🚶"
end
else
redis:setex(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "📭¦  ارسل الامر الجديد المضاف بالقوائم الان\n..."
end


end


--=====================================================================================

  
if msg.SudoBase then

if MsgText[1] == "نقل ملكيه البوت" or MsgText[1] == "نقل ملكيه البوت 📇" then
redis:setex(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل معرف المستخدم لنقل ملكية البوت له ."
end





if MsgText[1] == 'تعيين قائمه الاوامر' then 
  redis:setex(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_,1000,true)
  return '📮*¦* ارسل امر القائمه المراد تعيينهم مثل الاتي "\n|`الاوامر` , `م1` , `م2 `, `م3 `, `م المطور ` , `اوامر الرد `,  `اوامر الملفات` \n➼' 
end


if MsgText[1] == "رفع مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"👤*¦* عذرا لا يمكنني رفع بوت \n📛") 
end
GetUserID(UserID,function(arg,data)
RUSERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':SUDO_BOT:',arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
else
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
redis:hset(boss..'username:'..arg.UserID,'username',RUSERNAME)
redis:sadd(boss..':SUDO_BOT:',arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
ReUsername = arg.UserName
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد رفع  ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
else
redis:hset(boss..'username:'..UserID,'username',ReUsername)
redis:sadd(boss..':SUDO_BOT:',UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم رفع ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 


if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
end
return false
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* عذرا هذا العضو ليس موجود ضمن المجموعات \n❕") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':SUDO_BOT:',arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل  ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
else
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
redis:srem(boss..':SUDO_BOT:',arg.UserID)
end  
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
--================================================
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"📛*¦* لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n❕") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':SUDO_BOT:',UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم بالتأكيد تنزيل  ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
else
redis:srem(boss..':SUDO_BOT:',UserID)
sendMsg(arg.ChatID,arg.MsgID,"📮 » تم تنزيل ❲ "..NameUser.." ❳  مطور في البوت \n✓") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
end
return false
end

if MsgText[1] == "تنظيف المجموعات" then
local groups = redis:smembers(boss..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'💯*¦* جـيـد , لا توجد مجموعات وهميه \n✓')
else
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n🚸*¦* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n📉*¦* اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" then
local pv = redis:smembers(boss..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(boss..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'👨🏼‍⚕️| جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n🚸*¦* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n📉*¦* اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(boss..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'📭¦ حسننا عزيزي 🍁\n🌄 ¦ الان قم بارسال الصوره للترحيب \n🛠' 
end

if MsgText[1] == "تعطيل البوت خدمي"  or MsgText[1] == "تعطيل البوت خدمي 🚫" then 
return lock_service(msg) 
end

if MsgText[1] == "تفعيل البوت خدمي" or MsgText[1] == "تفعيل البوت خدمي 🔃" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(boss..':WELCOME_BOT')
if Photo_Weloame then
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
  SUDO_USERR = "⚖️¦ مـعرف آلمـطـور  » "..SUDO_USER.." 🌿\n👨🏽‍🔧"
else
  SUDO_USERR = ""
end
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(boss..':NameBot:')..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
]]..SUDO_USERR) 
return false
else
return "📛| لا توجد صوره مضافه للترحيب في البوت \n📌| لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(boss..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '📭¦ حسننا عزيزي 🍁\n💬¦ الان قم بارسال الكليشه \n🛠' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(boss..':addnumberusers',MsgText[2]) 
return '💱*¦* تم وضـع شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..MsgText[2]..'】* عضـو  🍁\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'🚸*¦* شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..redis:get(boss..':addnumberusers')..'】* عضـو  🍁\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🔝" then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
return '📮*¦* عدد المجموعات المفعلة » `'..redis:scard(boss..'group:ids')..'`  ➼' 
end

if MsgText[1] == 'مسح كليشه الايدي عام' or MsgText[1] == 'مسح الايدي عام' or MsgText[1] == 'مسح ايدي عام'  or MsgText[1] == 'مسح كليشة الايدي عام' or MsgText[1] == 'مسح كليشه الايدي عام 🗑' then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss.."lockidedit") then return "📛*¦* الامر معطل من قبل المطور الاساسي  \n🚶" end
redis:del(boss..":infoiduser")
return sendMsg(msg.chat_id_,msg.id_,"📛*¦* تم مسح كليشة الايدي العام بنجاح \n❕")
end

if MsgText[1] == 'تعيين كليشه الايدي عام' or MsgText[1] == 'عام تعيين الايدي' or MsgText[1] == 'تعيين ايدي عام'  or MsgText[1] == 'تعيين كليشة الايدي عام'  or MsgText[1] == 'تعيين كليشه الايدي عام 📄' then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss.."lockidedit") then return "📛*¦* تعيين الايدي معطل من قبل المطور الاساسي  \n🚶" end
redis:setex(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '📮*¦* حسننا , الان ارسل كليشه الايدي الجديده \n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{النقاط} : لاضهار عدد النقاط \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف المطور الاساسي\n➼' 
end


if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
local name_gp = redis:get(boss..'group:name'..MsgText[2])
GroupTitle(MsgText[2],function(arg,data)
if data.ID and data.ID == "Error" and data.message_ == "CHANNEL_INVALID" then
if redis:sismember(boss..'group:ids',arg.Group) then
rem_data_group(arg.Group)
sendMsg(arg.chat_id_,arg.id_,'📛*¦* البوت ليس بالمجموعة ولكن تم مسح بياناتها \n🏷*¦* المجموعةة » ['..arg.name_gp..']\n🎫*¦* الايدي » ( *'..arg.Group..'* )\n✓')
else 
sendMsg(arg.chat_id_,arg.id_,'📛*¦* البوت ليس مفعل بالمجموعه ♨️\n🔙*¦* ولا يوجد بيانات لها ✓️')
end
else
StatusLeft(arg.Group,our_id)
if redis:sismember(boss..'group:ids',arg.Group) then
sendMsg(arg.Group,0,'📛*¦* تم تعطيل المجموعه بأمر من المطور  \n🚸*¦* سوف اغادر جاوو 🚶🏻🚶🏻 ...\n✘')
rem_data_group(arg.Group)
sendMsg(arg.chat_id_,arg.id_,'📛*¦* تم تعطيل المجموعه ومغادرتها \n🏷*¦* المجموعةة » ['..arg.name_gp..']\n🎫*¦* الايدي » ( *'..arg.Group..'* )\n✓')
else 
sendMsg(arg.chat_id_,arg.id_,'📛*¦* البوت ليس مفعل بالمجموعة \n🎫*¦* ولكن تم مغادرتها\n🏷*¦* المجموعةة » ['..arg.name_gp..']\n✓')
end
end 
end,{chat_id_=msg.chat_id_,id_=msg.id_,Group=MsgText[2],name_gp=name_gp})
return false
end

if MsgText[1] == 'المطور' then
return redis:get(boss..":TEXT_SUDO") or '🗃¦ لا توجد كليشه المطور .\n📰¦ يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n📡'
end

if MsgText[1] == "اذاعه بالتثبيت"  or MsgText[1] =="اذاعه بالتثبيت 📬" then
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" end
redis:setex(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل رساله ليتم اذاعتها بالتثبيت  \n🔛" 
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل التوجيه للاذاعه \n🔛" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:all'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل الكليشه للاذاعه عام \n🔛" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 👤" then		
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:pv'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل الكليشه للاذاعه خاص \n🔛"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then		
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:groups'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل الكليشه للاذاعه للمجموعات \n🔛" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين
