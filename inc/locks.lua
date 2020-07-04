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



---------------Lock ------------------- 
function unlock_KickBan(msg)
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if not redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر الحظر والطرد بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_KickBan"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل امر الحظر والطرد \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end
 
function lock_KickBan(msg)
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر الحظر والطرد مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."lock_KickBan"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل امر الحظر والطرد \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end 

---------------Lock Link-------------------
function lock_check(msg)
    if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
    if not redis:get(boss.."lock_check"..msg.chat_id_) then
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التحقق بالتأكيد تم تعطيلها \n✓",16,utf8.len(msg.TheRankCmd)) 
    else 
    redis:del(boss.."lock_check"..msg.chat_id_)
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل التحقق \n✓",16,utf8.len(msg.TheRankCmd)) 
    end
    end
    
    function unlock_check(msg)
    if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
    if redis:get(boss.."lock_check"..msg.chat_id_) then
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التحقق بالتأكيد تفعيلها \n✓",16,utf8.len(msg.TheRankCmd)) 
    else
    redis:set(boss.."lock_check"..msg.chat_id_,true)
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل التحقق \n✓",16,utf8.len(msg.TheRankCmd)) 
    end
    end
    

---------------Lock ------------------- 
function unlock_takkl(msg)
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر تاك للكل مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."lock_takkl"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل امر تاك للكل \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end
 
function lock_takkl(msg)
    if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
    if not redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر تاك للكل بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_takkl"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل امر تاك للكل \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end 

---------------Lock ------------------- 
function unlock_leftgroup(msg)
    if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
    if redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر المغادره مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."lock_leftgroup"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل امر المغادرها \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end
 
function lock_leftgroup(msg)
    if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
    if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر المغادرها بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_leftgroup"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل امر المغادرها \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end 


---------------Lock ------------------- 
function unlock_AntiEdit(msg)
if not msg.SuperCreator then return "📛*¦* هذا الامر يخص {المنشئ الاساسي,المطور} فقط  \n🚶" end
if redis:get(boss.."antiedit"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الحماية مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."antiedit"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل الحماية \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end
 
function lock_AntiEdit(msg)
if not msg.SuperCreator then return "📛*¦* هذا الامر يخص {المنشئ الاساسي,المطور} فقط  \n🚶" end
if not redis:get(boss.."antiedit"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الحماية بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."antiedit"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل الحماية \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end 

------Lock ------------------- 
function unlock_idphoto(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss.."idphoto"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الايدي بالصوره مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."idphoto"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل الايدي بالصوره \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end
 
function lock_idphoto(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss.."idphoto"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الايدي بالصوره بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."idphoto"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل الايدي بالصوره \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function unlock_linkk(msg)
    if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الرابط مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."lock_linkk"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل الرابط \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end
 
function lock_linkk(msg)
    if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الرابط بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_linkk"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل الرابط \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function unlock_waring(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss.."lock_woring"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التحذير مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."lock_woring"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل التحذير \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end
end
 
function lock_waring(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss.."lock_woring"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التحذير بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_woring"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل التحذير \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function lock_ID(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss.."lock_id"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الايدي بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_id"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل امر الايدي\n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function unlock_ID(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss.."lock_id"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." امر الايدي شغال بالفعل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else 
redis:set(boss.."lock_id"..msg.chat_id_,true)  
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل امر الايدي \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function unlock_Welcome(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss.."welcome:get"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تفعيل الترحيب مفعل مسبقاً\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else redis:set(boss.."welcome:get"..msg.chat_id_,true)  
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل الترحيب \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function lock_Welcome(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss.."welcome:get"..msg.chat_id_) then 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الترحيب بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."welcome:get"..msg.chat_id_) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل الترحيب \n✓" ,16,utf8.len(msg.TheRankCmd)) 
end 
end

function lock_All(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:mset(
boss.."lock_username"..msg.chat_id_,true,
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_forward"..msg.chat_id_,true,
boss.."mute_contact"..msg.chat_id_,true,
boss.."mute_location"..msg.chat_id_,true,
boss.."mute_document"..msg.chat_id_,true,
boss.."lock_link"..msg.chat_id_,true,
boss.."lock_tag"..msg.chat_id_,true,
boss.."lock_edit"..msg.chat_id_,true,
boss.."lock_spam"..msg.chat_id_,true,
boss.."lock_bots"..msg.chat_id_,true,
boss.."lock_webpage"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true,
boss.."mute_inline"..msg.chat_id_,true
)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الكل  \n✓",16,utf8.len(msg.TheRankCmd)) 
end

function Unlock_All(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:del(
boss.."lock_username"..msg.chat_id_,
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_forward"..msg.chat_id_,
boss.."mute_contact"..msg.chat_id_,
boss.."mute_location"..msg.chat_id_,
boss.."mute_document"..msg.chat_id_,
boss.."lock_link"..msg.chat_id_,
boss.."lock_tag"..msg.chat_id_,
boss.."lock_edit"..msg.chat_id_,
boss.."lock_spam"..msg.chat_id_,
boss.."lock_bots"..msg.chat_id_,
boss.."lock_webpage"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_,
boss..":tqeed_video:"..msg.chat_id_,
boss..":tqeed_photo:"..msg.chat_id_,
boss..":tqeed_gif:"..msg.chat_id_,
boss..":tqeed_fwd:"..msg.chat_id_,
boss..":tqeed_link:"..msg.chat_id_,
boss.."mute_inline"..msg.chat_id_
)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الكل  \n✓",16,utf8.len(msg.TheRankCmd)) 
end

function lock_Media(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:mset(
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true
)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.."\n🔛¦ تم قفل الوسائط  \n✓",16,utf8.len(msg.TheRankCmd)) 
end

function Unlock_Media(msg)
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:del(
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_
)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.."\n🔛¦ تم فتح الوسائط  \n✓",16,utf8.len(msg.TheRankCmd)) 
end

function tqeed_photo(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالصور بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."mute_photo"..msg.chat_id_)
redis:set(boss..":tqeed_photo:"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الصور بالتقييد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function fktqeed_photo(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالصور بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..":tqeed_photo:"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الصور بالتقييد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock -------------------
function tqeed_video(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالفيديو بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss..":tqeed_video:"..msg.chat_id_)
redis:set(boss..":tqeed_video:"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الفيديو بالتقييد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function fktqeed_video(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالفيديو بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..":tqeed_video:"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الفيديو بالتقييد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock -------------------
function tqeed_gif(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد الممتحركه بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."mute_gif"..msg.chat_id_)
redis:set(boss..":tqeed_gif:"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل المتحركه بالتقييد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function fktqeed_gif(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد المتحركه بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..":tqeed_gif:"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح المتحركه بالتقييد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock -------------------
function tqeed_fwd(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالتوجيه بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."mute_forward"..msg.chat_id_)
redis:set(boss..":tqeed_fwd:"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل التوجيه بالتقييد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function fktqeed_fwd(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد التوجيه بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..":tqeed_fwd:"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح التوجيه بالتقييد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
 
---------------Lock -------------------
function tqeed_link(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالروابط بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss..":tqeed_link:"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الروابط بالتقييد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function fktqeed_link(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالروابط بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..":tqeed_link:"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الروابط بالتقييد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock -------------------
function tqeed_photo(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالصور بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss..":tqeed_photo:"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الصور بالتقييد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function fktqeed_photo(msg)
if not msg.Admin then return "🚸*¦ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التقييد بالصور بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..":tqeed_photo:"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الصور بالتقييد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not msg.SudoBase then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if redis:get(boss.."lock_twasel") then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التواصل بالتاكيد تم تعطيله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_twasel",true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل التواصل  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_twasel(msg)
if not msg.SudoBase then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if not redis:get(boss.."lock_twasel") then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التواصل بالتاكيد تم تفعيله \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_twasel")
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل التواصل \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end


---------------Lock ------------------- 
function unlock_idediit(msg)
    if not msg.SudoBase then return "📡*¦* هذا الامر يخص المطور الاساسي فقط  🚶" end
    if redis:get(boss.."lockidedit") then 
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تعيين الايدي للمطور مفعل مسبقاً \n✓" ,16,utf8.len(msg.TheRankCmd)) 
    else redis:set(boss.."lockidedit",true)
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل تعيين الايدي للمطور\n✓" ,16,utf8.len(msg.TheRankCmd)) 
    end
end
     
function lock_idediit(msg)
    if not msg.SudoBase then return "📡*¦* هذا الامر يخص المطور الاساسي فقط  🚶" end
    if not redis:get(boss.."lockidedit") then 
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تعيين الايدي للمطور بالتأكيد معطل\n✓" ,16,utf8.len(msg.TheRankCmd)) 
    else
    redis:del(boss.."lockidedit") 
    return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل تعيين الايدي للمطور\n✓" ,16,utf8.len(msg.TheRankCmd)) 
    end 
end 

    
---------------Lock bro-------------------
function lock_brod(msg)
if not msg.SudoBase then return "📡*¦* هذا الامر يخص المطور فقط  🚶" end
if not redis:get(boss.."lock_brod") then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." اذاعه المطورين بالتاكيد تم تعطيله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_brod")
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل اذاعه المطورين  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
function unlock_brod(msg)
if not msg.SudoBase then return "📡*¦* هذا الامر يخص المطور فقط  🚶" end
if redis:get(boss.."lock_brod") then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." اذاعه المطورين بالتاكيد تم تفعيله \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:set(boss.."lock_brod",true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل اذاعه المطورين  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock replay-------------------
function lock_replay(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."replay"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الردود بالتاكيد تم تعطيله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."replay"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تعطيل الردود  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_replay(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."replay"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الردود بالتاكيد تم تفعيله \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:set(boss.."replay"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل الردود  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock bot service-------------------
function lock_service(msg)
if not msg.SudoBase then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if not redis:get(boss.."lock_service") then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم بالتاكيد تعطيل نظام البوت خدمي \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:del(boss.."lock_service")
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم  تعطيل نظام البوت خدمي \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_service(msg)
if not msg.SudoBase then return "🚸*¦ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
if redis:get(boss.."lock_service") then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم بالتأكيد تفعيل نظام البوت خدمي \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:set(boss.."lock_service",true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم تفعيل نظام البوت خدمي \n✓\n🚸¦ اصبح البوت الان بامكان اي شخص\n🔚¦ ان يستخدم البوت للتفعيل",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Link-------------------
function lock_mmno3(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الفشار بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_mmno3"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الفشار \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_mmno3(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الفشار بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_mmno3"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الفشار \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Link-------------------
function lock_pharsi(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الفارسيه بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_pharsi"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الفارسيه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_pharsi(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الفارسيه بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_pharsi"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الفارسيه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Link-------------------
function lock_lang(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_lang"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الانكليزيه بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_lang"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الانكليزيه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_lang(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_lang"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الانكليزيه بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_lang"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الانكليزيه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Link-------------------
function lock_link(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_link"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الروابط بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_link"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الروابط \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_link(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_link"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الروابط بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_link"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الروابط \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Add-------------------
function lock_Add(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_Add"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الاضافه بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_Add"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الاضافه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_Add(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_Add"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الاضافه بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_Add"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الاضافه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_tag"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التاك (#) بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_tag"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل التاك (#) \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_tag(msg)

if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_tag"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التاك(#) بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_tag"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح التاك (#) \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end

if redis:get(boss.."lock_username"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." المعرفات @ بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_username"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل المعرفات @ \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_username(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_username"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." آلمـعرفآت بآلتآگيد تم فتحهآ @ \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_username"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح آلمـعرفآت @ \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_edit"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التعديل بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_edit"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل التعديل \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_edit(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_edit"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التعديل بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_edit"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح التعديل \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if   redis:get(boss.."lock_spam"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الكلايش بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_spam"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الكلايش \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_spam(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_spam"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الكلايش بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_spam"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الكلايش \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_flood"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التكرار بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_flood"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل التكرار \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_flood(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_flood"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التكرار بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_flood"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح التكرار \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_bots"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." البوتات بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل البوتات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_bots(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_bots"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." البوتات بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
redis:del(boss.."lock_bots"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح البوتات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Join-------------------
function lock_join(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_join"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الاضافه بالتاكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_join"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الاضافه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_join(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_join"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الاضافه بالتاكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_join"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الاضافه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_markdown"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الماركدوان بالتاكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_markdown"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الماركدوان \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_markdown(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_markdown"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الماركدوان بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_markdown"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الماركدوان \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_webpage"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الويب بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_webpage"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الويب \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_webpage(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_webpage"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الويب بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_webpage"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الويب \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_gif"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." المتحركه بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_gif"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل المتحركه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
Tkml = "/G/?i="
function unmute_gif(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_gif"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." المتحركه بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_gif"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح المتحركه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Game-------------------
function mute_game(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_game"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الالعاب بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set("mute_game"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الالعاب \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_game(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_game"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الألعاب بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_game"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الألعاب \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_inline"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الانلاين بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_inline"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الانلاين \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_inline(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_inline"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الانلاين بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_inline"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الانلاين \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Text-------------------
function mute_text(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_text"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الدرشه بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_text"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الدردشه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_text(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_text"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الدردشه بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_text"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الدردشه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_photo"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الصور بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_photo"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الصور \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_photo(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_photo"..msg.chat_id_)then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الصور بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_photo"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الصور \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Video-------------------
function mute_video(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_video"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الفيديو بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_video"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الفيديو \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_video(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_video"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الفيديو يال��أكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_video"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الفيديو \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_audio"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الصوت بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_audio"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الصوت \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_audio(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_audio"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الصوت بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_audio"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الصوت \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_voice"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." البصمات بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_voice"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل البصمات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_voice(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_voice"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." البصمات بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_voice"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح البصمات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end

if   redis:get(boss.."mute_sticker"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الملصقات بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_sticker"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الملصقات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_sticker(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_sticker"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الملصقات بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_sticker"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الملصقات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_contact"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." جهات الاتصال بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_contact"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل جهات الاتصال \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_contact(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_contact"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." جهات الاتصال بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_contact"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح جهات الاتصال \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_forward"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التوجيه بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_forward"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل التوجيه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_forward(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_forward"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التوجيه بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_forward"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح التوجيه \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Location-------------------
function mute_location(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_location"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الموقع بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_location"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الموقع \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_location(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_location"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الموقع بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_location"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الموقع \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute Document-------------------
function mute_document(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_document"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الملفات بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_document"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الملفات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_document(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_document"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الملفات بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_document"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الملفات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الاشعارات بالتأكيد تم قفلها \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_tgservice"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الاشعارات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_tgservice(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الاشعارات بالتأكيد تم فتحها \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_tgservice"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الاشعارات \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الكيبورد بالتأكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."mute_keyboard"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل الكيبورد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unmute_keyboard(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." الكيبورد بالتأكيد تم فتحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."mute_keyboard"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح الكيبورد \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." البوتات بالطرد بالتاكيد تم قفله \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
redis:set(boss.."lock_bots_by_kick"..msg.chat_id_,true)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم قفل البوتات بالطرد (مع طرد الي ضافه) \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_bots_by_kick(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." البوتات بالطرد بالتاكيد مفتوحه \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تم فتح البوتات بالطرد  \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
---------------locks pin-------------------
function lock_pin(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if redis:get(boss.."lock_pin"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التثبيت بالفعل مقفل \n✓",16,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss.."lock_pin"..msg.chat_id_,true) 
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تـم قفل التثبيت \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end

function unlock_pin(msg)
if not msg.Admin then return "📡*¦* هذا الامر يخص الادمنيه فقط  🚶" end
if not redis:get(boss.."lock_pin"..msg.chat_id_) then
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." التثبيت بالفعل مفتوح \n✓",16,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss.."lock_pin"..msg.chat_id_)
return SendMention(msg.chat_id_,msg.sender_user_id_,msg.id_,"🙋🏼‍♂️ » عزيزي "..msg.TheRankCmd.." تـم فتح التثبيت   \n✓",16,utf8.len(msg.TheRankCmd)) 
end
end
function Flterzhrfa(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"ﭛ","ي")	
Name = utf8.gsub(Name,"ﺥ","خ")	
Name = utf8.gsub(Name,"ڽ","ن")	
Name = utf8.gsub(Name,"ٽ","ث")	
Name = utf8.gsub(Name,"ڜ","ش")	
Name = utf8.gsub(Name,"ﺵ","ش")	
Name = utf8.gsub(Name,"ﭒ","ي")	
Name = utf8.gsub(Name,"ﮛ","ك")	
Name = utf8.gsub(Name,"ﻡ","م")	
Name = utf8.gsub(Name,"ټ","ت")	
Name = utf8.gsub(Name,"ڼ","ن")	
Name = utf8.gsub(Name,"ﺻ","ص")	
Name = utf8.gsub(Name,"ڝ","ص")	
Name = utf8.gsub(Name,"ﻢ","م")	
Name = utf8.gsub(Name,"ﮑ","ك")	
Name = utf8.gsub(Name,"ﺮ","ر")	
Name = utf8.gsub(Name,"ﺳ","س")	
Name = utf8.gsub(Name,"ٿ","ت")	
Name = utf8.gsub(Name,"ﺦ","خ")	
Name = utf8.gsub(Name,"ڞ","ض")	
Name = utf8.gsub(Name,"ﺢ","ح")	
Name = utf8.gsub(Name,"Ξ","")	
Name = utf8.gsub(Name,"ﺶ","ش")	
Name = utf8.gsub(Name,"ﻠ","ا")	
Name = utf8.gsub(Name,"ﻤ","م")	
Name = utf8.gsub(Name,"ﺾ","ض")	
Name = utf8.gsub(Name,"ﺺ","ص")	
Name = utf8.gsub(Name,"ھ","ه")	
Name = utf8.gsub(Name,"۾","م")	
Name = utf8.gsub(Name,"ﺴ","س")	
Name = utf8.gsub(Name,"ﺿ","ض")	
Name = utf8.gsub(Name,"ڟ","ظ")	
Name = utf8.gsub(Name,"ﻧ","ن")	
Name = utf8.gsub(Name,"ﺤ","ح")	
Name = utf8.gsub(Name,"ﺠ","ج")	
Name = utf8.gsub(Name,"ﺷ","ش")	
Name = utf8.gsub(Name,"ﭴ","ج")	
Name = utf8.gsub(Name,"ژ","ز")	
Name = utf8.gsub(Name,"ٹ","ت")	
Name = utf8.gsub(Name,"ع","ع")	
Name = utf8.gsub(Name,"ﺧ","خ")	
Name = utf8.gsub(Name,"ﺯ","ز")	
Name = utf8.gsub(Name,"ڙ","ز")	
Name = utf8.gsub(Name,"ﻦ","ن")	
Name = utf8.gsub(Name,"ٸ","ئ")	
Name = utf8.gsub(Name,"ﮂ","د")	
Name = utf8.gsub(Name,"ﮃ","د")	
Name = utf8.gsub(Name,"ﭵ","ج")	
Name = utf8.gsub(Name,"ڻ","ن")	
Name = utf8.gsub(Name,"ښ","س")	
Name = utf8.gsub(Name,"ٻ","ب")	
Name = utf8.gsub(Name,"ﯙ","و")	
Name = utf8.gsub(Name,"ﮫ","ه")	
Name = utf8.gsub(Name,"ﺸ","ش")	
Name = utf8.gsub(Name,"ﺹ","ص")	
Name = utf8.gsub(Name,"ں","ر")	
Name = utf8.gsub(Name,"ﻥ","ن")	
Name = utf8.gsub(Name,"ڛ","س")	
Name = utf8.gsub(Name,"غ","غ")	
Name = utf8.gsub(Name,"ٺ","ت")	
Name = utf8.gsub(Name,"ﭶ","ج")	
Name = utf8.gsub(Name,"ﭨ","")	
Name = utf8.gsub(Name,"ﻖ","ق")	
Name = utf8.gsub(Name,"ۄ","و")	
Name = utf8.gsub(Name,"ڄ","ج")	
Name = utf8.gsub(Name,"ڥ","ف")	
Name = utf8.gsub(Name,"ﮄ","ذ")	
Name = utf8.gsub(Name,"ﮅ","ذ")	
Name = utf8.gsub(Name,"ﮁ","ج")	
Name = utf8.gsub(Name,"ۅ","و")	
Name = utf8.gsub(Name,"څ","ج")	
Name = utf8.gsub(Name,"ﮋ","ز")	
Name = utf8.gsub(Name,"ﺟ","ج")	
Name = utf8.gsub(Name,"ﻣ","م")	
Name = utf8.gsub(Name,"ﻲ","ي")	
Name = utf8.gsub(Name,"ۆ","و")	
Name = utf8.gsub(Name,"ن","ن")	
Name = utf8.gsub(Name,"چ","خ")	
Name = utf8.gsub(Name,"ا","ا")	
Name = utf8.gsub(Name,"ﻟ","ل")	
Name = utf8.gsub(Name,"ﺣ","ح")	
Name = utf8.gsub(Name,"ﺲ","س")	
Name = utf8.gsub(Name,"ۇ","و")	
Name = utf8.gsub(Name,"ڇ","ج")	
Name = utf8.gsub(Name,"ﺰ","ز")	
Name = utf8.gsub(Name,"ﭪ","ف")	
Name = utf8.gsub(Name,"ڦ","ق")	
Name = utf8.gsub(Name,"ﭩ","")	
Name = utf8.gsub(Name,"ڀ","ب")	
Name = utf8.gsub(Name,"ۀ","ه")	
Name = utf8.gsub(Name,"ـ","")	
Name = utf8.gsub(Name,"ﭓ","ي")	
Name = utf8.gsub(Name,"ﻞ","ل")	
Name = utf8.gsub(Name,"ڡ","ف")	
Name = utf8.gsub(Name,"ء","ء")	
Name = utf8.gsub(Name,"ﻎ","غ")	
Name = utf8.gsub(Name,"ﺙ","ث")	
Name = utf8.gsub(Name,"ﺜ","ث")	
Name = utf8.gsub(Name,"ﻌ","ع")	
Name = utf8.gsub(Name,"ﺚ","ث")	
Name = utf8.gsub(Name,"ﺝ","ج")	
Name = utf8.gsub(Name,"ہ","")	
Name = utf8.gsub(Name,"ځ","ح")	
Name = utf8.gsub(Name,"ﮓ","ك")	
Name = utf8.gsub(Name,"ڠ","غ")	
Name = utf8.gsub(Name,"ﻔ","ف")	
Name = utf8.gsub(Name,"ﻙ","ك")	
Name = utf8.gsub(Name,"ﻜ","ك")	
Name = utf8.gsub(Name,"ﻝ","ل")	
Name = utf8.gsub(Name,"ﻚ","ك")	
Name = utf8.gsub(Name,"ڂ","خ")	
Name = utf8.gsub(Name,"ۂ","")	
Name = utf8.gsub(Name,"ﻕ","ق")	
Name = utf8.gsub(Name,"ڣ","ف")	
Name = utf8.gsub(Name,"ﺘ","ت")	
Name = utf8.gsub(Name,"ﻍ","غ")	
Name = utf8.gsub(Name,"ﻗ","ق")	
Name = utf8.gsub(Name,"ﭻ","ج")	
Name = utf8.gsub(Name,"ﮆ","ذ")	
Name = utf8.gsub(Name,"ﭳ","ج")	
Name = utf8.gsub(Name,"ۃ","ة")	
Name = utf8.gsub(Name,"ڃ","ج")	
Name = utf8.gsub(Name,"ﺞ","ج")	
Name = utf8.gsub(Name,"ڢ","ف")	
Name = utf8.gsub(Name,"ﻘ","ق")	
Name = utf8.gsub(Name,"ی","ى")	
Name = utf8.gsub(Name,"ﮭ","ه")	
Name = utf8.gsub(Name,"ﮧ","")	
Name = utf8.gsub(Name,"ڌ","ذ")	
Name = utf8.gsub(Name,"̭","")	
Name = utf8.gsub(Name,"ﭸ","ج")	
Name = utf8.gsub(Name,"ﭼ","ج")	
Name = utf8.gsub(Name,"ﮯ","")	
Name = utf8.gsub(Name,"ﭬ","ف")	
Name = utf8.gsub(Name,"ڭ","ك")	
Name = utf8.gsub(Name,"ﮉ","ذ")	
Name = utf8.gsub(Name,"ﭭ","ف")	
Name = utf8.gsub(Name,"ۍ","ى")	
Name = utf8.gsub(Name,"ڍ","د")	
Name = utf8.gsub(Name,"ﭧ","")	
Name = utf8.gsub(Name,"ﮊ","ز")	
Name = utf8.gsub(Name,"ﺒ","ب")	
Name = utf8.gsub(Name,"ﭯ","ف")	
Name = utf8.gsub(Name,"ﭽ","ج")	
Name = utf8.gsub(Name,"ﯾ","ي")	
Name = utf8.gsub(Name,"ڬ","ك")	
Name = utf8.gsub(Name,"ﻃ","ط")	
Name = utf8.gsub(Name,"ڎ","ذ")	
Name = utf8.gsub(Name,"ێ","ئ")	
Name = utf8.gsub(Name,"ﻑ","ف")	
Name = utf8.gsub(Name,"ﯼ","ى")	
Name = utf8.gsub(Name,"ﻒ","ف")	
Name = utf8.gsub(Name,"ﮈ","د")	
Name = utf8.gsub(Name,"ﮡ","")	
Name = utf8.gsub(Name,"گ","ك")	
Name = utf8.gsub(Name,"ﻉ","ع")	
Name = utf8.gsub(Name,"ڏ","ذ")	
Name = utf8.gsub(Name,"ﺖ","ت")	
Name = utf8.gsub(Name,"ﭹ","ج")	
Name = utf8.gsub(Name,"ﮬ","ه")	
Name = utf8.gsub(Name,"ڮ","ك")	
Name = utf8.gsub(Name,"ﭺ","ج")	
Name = utf8.gsub(Name,"ﭢ","ت")	
Name = utf8.gsub(Name,"ڈ","د")	
Name = utf8.gsub(Name,"ۈ","و")	
Name = utf8.gsub(Name,"ﭤ","ت")	
Name = utf8.gsub(Name,"ﭠ","ت")	
Name = utf8.gsub(Name,"ﮥ","ه")	
Name = utf8.gsub(Name,"ک","ك")	
Name = utf8.gsub(Name,"ﺑ","ب")	
Name = utf8.gsub(Name,"ۉ","و")	
Name = utf8.gsub(Name,"ډ","د")	
Name = utf8.gsub(Name,"ﺗ","ت")	
Name = utf8.gsub(Name,"ﭥ","ت")	
Name = utf8.gsub(Name,"ﯡ","و")	
Name = utf8.gsub(Name,"ڨ","ق")	
Name = utf8.gsub(Name,"ي","ي")	
Name = utf8.gsub(Name,"ڊ","د")	
Name = utf8.gsub(Name,"ۊ","و")	
Name = utf8.gsub(Name,"ﮮ","")	
Name = utf8.gsub(Name,"ﻋ","ع")	
Name = utf8.gsub(Name,"ﯠ","و")	
Name = utf8.gsub(Name,"ﻊ","ع")	
Name = utf8.gsub(Name,"ﮦ","ه")	
Name = utf8.gsub(Name,"ﮢ","")	
Name = utf8.gsub(Name,"ﻈ","ض")	
Name = utf8.gsub(Name,"ﯿ","ي")	
Name = utf8.gsub(Name,"ۋ","و")	
Name = utf8.gsub(Name,"ڋ","د")	
Name = utf8.gsub(Name,"ﭣ","ت")	
Name = utf8.gsub(Name,"ﮤ","ه")	
Name = utf8.gsub(Name,"ﭮ","ف")	
Name = utf8.gsub(Name,"ﭫ","ف")	
Name = utf8.gsub(Name,"ﯽ","ى")	
Name = utf8.gsub(Name,"ﭡ","ت")	
Name = utf8.gsub(Name,"ﭾ","ج")	
Name = utf8.gsub(Name,"ﭦ","")	
Name = utf8.gsub(Name,"ﻐ","غ")	
Name = utf8.gsub(Name,"ڵ","ل")	
Name = utf8.gsub(Name,"ٵ","ا")	
Name = utf8.gsub(Name,"ﮔ","ك")	
Name = utf8.gsub(Name,"ﭗ","ب")	
Name = utf8.gsub(Name,"ﮜ","ك")	
Name = utf8.gsub(Name,"ﭝ","ي")	
Name = utf8.gsub(Name,"ڔ","ر")	
Name = utf8.gsub(Name,"ﻆ","ظ")	
Name = utf8.gsub(Name,"ﮌ","ر")	
Name = utf8.gsub(Name,"ﻪ","ه")	
Name = utf8.gsub(Name,"ڴ","ك")	
Name = utf8.gsub(Name,"ە","ه")	
Name = utf8.gsub(Name,"ﮗ","ك")	
Name = utf8.gsub(Name,"ﮝ","ك")	
Name = utf8.gsub(Name,"ﮙ","ك")	
Name = utf8.gsub(Name,"ﺓ","ة")	
Name = utf8.gsub(Name,"ڕ","ر")	
Name = utf8.gsub(Name,"ﮚ","ك")	
Name = utf8.gsub(Name,"ﮕ","ك")	
Name = utf8.gsub(Name,"ط","ط")	
Name = utf8.gsub(Name,"ﺪ","د")	
Name = utf8.gsub(Name,"ڷ","ل")	
Name = utf8.gsub(Name,"ٷ","ؤ")	
Name = utf8.gsub(Name,"ﺩ","د")	
Name = utf8.gsub(Name,"ﮘ","ك")	
Name = utf8.gsub(Name,"ﻁ","ط")	
Name = utf8.gsub(Name,"ﯝ","ؤ")	
Name = utf8.gsub(Name,"ﮱ","")	
Name = utf8.gsub(Name,"ﯚ","و")	
Name = utf8.gsub(Name,"ﻂ","ط")	
Name = utf8.gsub(Name,"ﭞ","ت")	
Name = utf8.gsub(Name,"ږ","ر")	
Name = utf8.gsub(Name,"̷","")	
Name = utf8.gsub(Name,"ٶ","ؤ")	
Name = utf8.gsub(Name,"ڶ","ل")	
Name = utf8.gsub(Name,"ﭜ","ي")	
Name = utf8.gsub(Name,"ﮎ","ك")	
Name = utf8.gsub(Name,"ﭲ","ج")	
Name = utf8.gsub(Name,"ڗ","ز")	
Name = utf8.gsub(Name,"ﮞ","")	
Name = utf8.gsub(Name,"̶","")	
Name = utf8.gsub(Name,"ڱ","ك")	
Name = utf8.gsub(Name,"ٱ","ا")	
Name = utf8.gsub(Name,"ر","ر")	
Name = utf8.gsub(Name,"ﺭ","ر")	
Name = utf8.gsub(Name,"ﭙ","ب")	
Name = utf8.gsub(Name,"ﺔ","ة")	
Name = utf8.gsub(Name,"ﺽ","ض")	
Name = utf8.gsub(Name,"ڐ","ذ")	
Name = utf8.gsub(Name,"ې","ي")	
Name = utf8.gsub(Name,"ﺕ","ت")	
Name = utf8.gsub(Name,"ﮟ","")	
Name = utf8.gsub(Name,"ڰ","ك")	
Name = utf8.gsub(Name,"ﻄ","ط")	
Name = utf8.gsub(Name,"ﻩ","ه")	
Name = utf8.gsub(Name,"ﺛ","ث")	
Name = utf8.gsub(Name,"ﮏ","ك")	
Name = utf8.gsub(Name,"ۑ","ى")	
Name = utf8.gsub(Name,"ڑ","ر")	
Name = utf8.gsub(Name,"ﻇ","ظ")	
Name = utf8.gsub(Name,"ٳ","ا")	
Name = utf8.gsub(Name,"ﺡ","ح")	
Name = utf8.gsub(Name,"ڳ","ك")	
Name = utf8.gsub(Name,"ﮪ","ه")	
Name = utf8.gsub(Name,"ﻛ","ك")	
Name = utf8.gsub(Name,"ﺼ","ص")	
Name = utf8.gsub(Name,"ﻅ","ظ")	
Name = utf8.gsub(Name,"ﻬ","ه")	
Name = utf8.gsub(Name,"̐","")	
Name = utf8.gsub(Name,"ﺂ","ا")	
Name = utf8.gsub(Name,"͠","")	
Name = utf8.gsub(Name,"ﮠ","")	
Name = utf8.gsub(Name,"ﻰ","ى")	
Name = utf8.gsub(Name,"ﭿ","ج")	
Name = utf8.gsub(Name,"ﮀ","ج")	
Name = utf8.gsub(Name,"ﮇ","ذ")	
Name = utf8.gsub(Name,"ﮍ","ر")	
Name = utf8.gsub(Name,"ﮐ","ك")	
Name = utf8.gsub(Name,"ﭷ","ج")	
Name = utf8.gsub(Name,"ﮰ","")	
Name = utf8.gsub(Name,"ے","")	
Name = utf8.gsub(Name,"پ","ب")	
Name = utf8.gsub(Name,"ﻨ","ن")	
Name = utf8.gsub(Name,"Ζ","z")	
Name = utf8.gsub(Name,"ﭚ","ب")	
Name = utf8.gsub(Name,"ﭘ","ب")	
Name = utf8.gsub(Name,"ٲ","ا")	
Name = utf8.gsub(Name,"ڲ","ك")	
Name = utf8.gsub(Name,"ﭖ","ب")	
Name = utf8.gsub(Name,"ﭕ","ي")	
Name = utf8.gsub(Name,"ﭔ","ي")	
Name = utf8.gsub(Name,"ﻏ","غ")	
Name = utf8.gsub(Name,"ﻀ","ض")	
Name = utf8.gsub(Name,"ګ","ك")	
Name = utf8.gsub(Name,"ڪ","ك")	
Name = utf8.gsub(Name,"ڧ","ف")	
Name = utf8.gsub(Name,"ڤ","ق")	
Name = utf8.gsub(Name,"ﮖ","ك")	
Name = utf8.gsub(Name,"ﺬ","ذ")	
Name = utf8.gsub(Name,"ڒ","ر")	
Name = utf8.gsub(Name,"ﺨ","خ")	
Name = utf8.gsub(Name,"ﭱ","ف")	
Name = utf8.gsub(Name,"ﻓ","ف")	
Name = utf8.gsub(Name,"ﺱ","س")	
Name = utf8.gsub(Name,"ﺫ","ذ")	
Name = utf8.gsub(Name,"ﺐ","ب")	
Name = utf8.gsub(Name,"ﮩ","")	
Name = utf8.gsub(Name,"ﮨ","")	
Name = utf8.gsub(Name,"ﮣ","")	
Name = utf8.gsub(Name,"ﭰ","ف")	
Name = utf8.gsub(Name,"ۓ","")	
Name = utf8.gsub(Name,"୭","و")	
Name = utf8.gsub(Name,"ﯛ","و")	
Name = utf8.gsub(Name,"ۿ","ه")	
return Name
end

function FlterEmoje(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"[🤚🔕♠🤗😇💂🌶🤣🚹⛸⚠😅🍕🍛🧝🌿💛#😕🧞*1032547🥌98🎡🎋🏼🎰🤑🚮☠🥜⃣🛌🌙🚙👏🛍💑⛳🏌🍢👲🔡❤🐀😨🥁🦇🏣㊗💰🚒🌟🐾🦅🐃🐷🤲🎩📳🇼🍎👛◻💻➗🔪🎂🌪🔔🍊✊🐚🍽🍫❗🚴🎒♏🧢🍁🌓😸🍦󠁢😶🗓🐡🛠✏😉🎯🍋🎟🔳🌨🎱💟⛏🤳📆🔅🍴📲🥊🖍🌡📬🆑🐇🗺😾🕰📵🏈🇮🍥➰🤠👥🕥😃😤😔🐹🎬⌛💎☃📖🔨👫🙄🥒⚜🏫🥃🍘🥥📍🦕💜🗝🙃🕤🐯👤🧔🏭🚭🚘💒🐓👁🤾🏐🏮🚋🌾📗🥈📚🤧🏃〰👱🔧🥖🇾☘🔘🔙⚗🛡🏖💹🉑🚛💩🛏♋🔸💴⏬✋👷😞☎🦂🎽🐞️🌘🌄⛵🈺🏸🎍📝🐪🍑😙🤓⚓󠁴💠🌔😵🥦📇🐌♓😘😢🐙🕦🏆🚨❇🙎🔶🛂🍲🥟📉🐕🍳🚈🔞😳🔌😊🌅🔊⛓🚻🚁✨💢🌊⚛😆😿🎈🏗🇭❓🙀🐨🚡🤢🔃▫🇶👿🤤📋🖋👕🐔😮🔵👂🌏⏏👦🐧🕎◾🍺🌧🖐📟🧙👶🌤↖🏬🤜⌚🏋🛐™🍜🤯🧣↘🔣🐣🥘🎫🎌😓🗨🚐🧚💲🍡😪🙏🖖⛽🏑⛲🎢🥗🚌🦁🚆☺🕒🎛⛹💏🐼🍶🚑🕞🤮🕕⏫🤰‼🎥🏀😰🌎📻󠁥🍂🇻🎴👸💼➖💆🕹👧🛩🍚❣🍓🤥🐄🍒♎🔽👵🔓🍠💍🏉▶🎠🎊👡📎💖🔺😺🍱📀⛎😽😷☣🦃🌯⛷🖼🚄💬🤐🦎♣🚦🍹‍🌱🛃🦄🦒🐈🕸🏟✖🚍😥↪🤝🏇⬇🌦🔄🚖⏺⬛♂⏲💁🚧🔤🚼👞🏄😩☂🕜🌚🧒⏯🎮🏯🌭🍵🔭💐🐤🕠💗🚎🛋🍧🤔🏽👒🤷🇸👘☝👴🔷⚖✴🉐✂🥂🕊👹⛴👅🚞😂📪🐺🦀󠁣🌃✉♒🤩🥕🎖🚀🕢😟🕵🇪👃🎑🏪🤟💿🥫😚🏩🏔🍏👢🏙📈⚒💝👠🎲🚲🖲⁉🇨🌳🚯🧀🕌🛶⛪🍌🧓🙈🇿⤴😬☪⚽🌈📔㊙💇🇯🗿🙁🍅☯🍞😠👍🕴▪👊💋🖱🎗🙌😎🐦🥡🔦💉🌺🔰🛣🕘🎶👳🍮🌜🐰↙🚔🕖🎿↕🐑🔛⛺🖕🧜🔟🖨🏕🎻🥝🎾🥐🤙🈳⚾🗑👣🚗🥧🏤🚕😒🤬🛷🤱🚏🚅🐂🐋🐜🤘⏪🦗⚱🔻👌〽👼💀👝☦⛱⏹󠁷📼📄🕺🎓😍🚩󠁧🔹🧡🥨➕🦌🤹ℹ🎉♉💨🏴❕🗼🏥🤪👮󠁳🏊🧟👖🙉☢🙇🔒👬📱🍈🏘🍐🕐😫🛄🧠🛥👭🎇🍭🤡🦑♍🐟🚃💧😋🚸🕍🚾✍🗽😹🎹🛒🧥🔎👓🚚🦖📷🤛👗🔜🥔🍖😄🔠💘🐴🤕󠁬🎄🧖🍗😈😧🈷🐽🌂♑💯🛑📁🧑🛰🎨☕🐒☑⛈🤨👐⛑🇳🔢🎞💪🍀⏸🌍💙🍃👺🍍🈸😜🈂⏮↩🌩🌵✈🏁😻👚🎙👋🔈☮🍬⛅🍸🐍🤫🎅🚿🏎🏳😁🚵💞🐢🐩💃😛🎪😴🕋🍆📯🥀💅🚳🙂🤶🌑⭕☁🥋👇🌌🍝😡⏱🔆🗯💶🥠🆓🌲👀🚢🕚💔🍇🦍⚕🇱🇰🦓🎧🥉🏺◼🌰🧦🔍💊🐠🌼🛎✅☸⚡💌👉🤵💕🚣📰👑🌽🚓😑📏👔♥◀🤽🐝🕛😌🧗🈵🗒🔐🈴🌕🌛🦐🎣🥞💣↔👾🅰😐🕟🥙👰🐏🚷🐆📡🥇👻🐲🌸🧘♨🎼🌗🌠✡🎤🅿🚬⛰🤞🍙🏓🔝💳🦋🕉🥚🔖🍪🛫🗜🔬🏡🤭🏚🔥❔💄🌥🕔✌🌫󠁮🐁👟🐛♈😭🌋🇦🔑🌞🐊🏷📒🎦🌴🍟🚉🍉💓🐮💷🔱💽🚇🐫🚥🐘🌐🥑🔲🛤🙍🐬📧⬅🐥⛔󠁿🏹👨🌝🇽🐖📿🔼😖😼📘🙋🥛🚺⏩🍾🗞🌹📠🗾🔗🏵🎃😝🖤🏒🛸🍯🦈🚜🔁🎭🌁💤😦💦👯®🏞👽👩💺💱📢🤖📸©👪🦆👙🦔📴🧐⏭🇴👄💚🎚📹🛢🐐🇷🍄🌖😀🌬🧤🐿❄🕝🍩🛵🔏🖊✒🍔🖌🖇🔇📐🧕📕📊📙📂🗂📓📅🗣🗳🗄📜📨🏅📑📤📦📫🔯📭📮🎐📩🈁🗡📃📥🎁🎏🛴🎀🎎😗🚪🚽🚰🕓♀🆕🐸💈🕳🐭🔋⚰😱🔩⚙🔫💡🕯🚟💸🕗💵⏰⏳📺📽📞🛳💾🕧🙊⌨🖥🕡🕣🕙🀄☀🕑🏢🛁💭♦🇲🃏🔉📣🎳🏜⬜⚪⚫🔴➿🔚✔🤦🏍🔂🎵⤵🔀➡⬆↗6🎺🆙🆒🔮🆖🆗🏧🛅🇺♿🦉👈✳❎⛩Ⓜ🌀♻🥅🈯🚱📛🚫🏠🅱🕶🌆🎸🚂🅾🆘☄❌🈹🈲🈶🈚☹🆚💮⭐🆔🐗♌♐🤴☔♊😯✝🇵📶🇹🇧🇩🇬🇫🎆🌇🌉🏛🏦🏨🏝◽😲🗻⛄🏰🚤🚊🛬🚝🚠🎷🆎🤸🤺🏂🤼🏏🥣🥢🍷🥄🍼🌻🥤🍻🍿🍰🌮🍣🍤🥪🍨🥓🥩💥🌒💫🌷🐉🐎🦏🐳🐅🕷😏🐵🐶🐱⚔🦊🐻👜🚶🙅🙆🧛📌🗃👆👎🤒😣👍🏿👍🏾👍🏽👍🏼👍🏻🤝🏿🤝🏾🤝🏽🤝🏽🤝🏼🤝🏻🙏🏿🙏🏾🙏🏽🙏🏼🙏🏻👏🏿👏🏾👏🏽👏🏼👏🏼👏🏻🙌🏿🙌🏾🙌🏽🙌🏼🙌🏻👐🏿👐🏾👐🏽👐🏼👐🏻🤲🏿🤲🏾🤲🏽🤲🏼🤲🏻✌🏿✌🏾✌🏽✌🏼✌🏻🤞🏿🤞🏾🤞🏽🤞🏼🤞🏻🤜🏿🤜🏾🤜🏽🤜🏼🤜🏻🤛🏿🤛🏾🤛🏽🤛🏼🤛🏻✊🏿✊🏾✊🏽✊🏼✊🏻👊🏿👊🏾👊🏽👊🏼👊🏻👎🏿👎🏾👎🏽👎🏼👎🏻👇🏿👇🏾👇🏽👇🏼👇🏻👆🏿👆🏾👆🏽👆🏼👆🏻👉🏿👉🏾👉🏽👉🏼👉🏻👈🏿👈🏾👈🏽👈🏼👈🏻👌🏿👌🏾👌🏽👌🏼👌🏻🤘🏿🤘🏾🤘🏽🤘🏼🤘🏻🤟🏿🤟🏾🤟🏽🤟🏼🤟🏻🤙🏿🤙🏾🤙🏽🤙🏼🤙🏻👋🏿👋🏾👋🏽👋🏼👋🏻🖖🏿🖖🏾🖖🏽🖖🏼🖖🏻🖐🏿🖐🏾🖐🏽🖐🏼🖐🏻🤚🏿🤚🏾🤚🏽🤚🏼🤚🏻✋🏿✋🏾✋🏽✋🏼✋🏻☝🏿☝🏾☝🏽☝🏼☝🏻💅🏿💅🏾💅🏽💅🏼💅🏻🤳🏿🤳🏾🤳🏽🤳🏼🤳🏼🤳🏻🤳✍🏿✍🏾✍🏽✍🏼✍🏻💪🏿💪🏾💪🏽💪🏼💪🏻👃🏿👃🏾👃🏽👃🏼👃🏻👂🏿👂🏾👂🏽👂🏼👂🏻👦🏿👦🏾👦🏽👦🏼👦🏻🧒🏿🧒🏾🧒🏽🧒🏼🧒🏻👶🏿👶🏾👶🏽👶🏼👶🏻🧔🏿🧔🏾🧔🏽🧔🏼🧔🏻🧓🏿🧓🏾🧓🏽🧓🏼🧓🏻👱🏿‍♂️👱🏾‍♂️👱🏽‍♂️👱🏼‍♂️👱🏻‍♂️👱🏿‍♀️👱🏾‍♀️👱🏽‍♀️👱🏼‍♀️👱🏻‍♀️👩🏿👩🏾👩🏽👩🏼👩🏻👨🏿👨🏾👨🏽👨🏼👨🏻👧🏿👧🏾👧🏽👧🏼👧🏻👳🏿‍♂️👳🏾‍♂️👳🏽‍♂️👳🏼‍♂️👳🏻‍♂️👳🏿‍♀️👳🏾‍♀️👳🏽‍♀️👳🏼‍♀️👳🏻‍♀️👲🏿👲🏾👲🏽👲🏼👲🏻👵🏿👵🏾👵🏽👵🏼👵🏻👴🏿👴🏾👴🏽👴🏼👴🏻🕵🏿️‍♂️🕵🏾️‍♂️🕵🏽️‍♂️🕵🏼️‍♂️🕵🏻️‍♂️🕵🏿️‍♀️🕵🏾️‍♀️🕵🏽️‍♀️🕵🏼️‍♀️🕵🏻️‍♀️💂🏿‍♂️💂🏾‍♂️💂🏽‍♂️💂🏼‍♂️💂🏻‍♂️💂🏿‍♀️💂🏾‍♀️💂🏽‍♀️💂🏼‍♀️💂🏻‍♀️👷🏿‍♂️👷🏾‍♂️👷🏽‍♂️👷🏼‍♂️👷🏻‍♂️👷🏿‍♀️👷🏾‍♀️👷🏽‍♀️👷🏼‍♀️👷🏻‍♀️👮🏿‍♂️👮🏾‍♂️👮🏽‍♂️👮🏼‍♂️👮🏻‍♂️👩🏿‍🎓👩🏾‍🎓👩🏽‍🎓👩🏼‍🎓👩🏻‍🎓👨🏿‍🍳👨🏾‍🍳👨🏽‍🍳👨🏼‍🍳👨🏻‍🍳👩🏿‍🍳👩🏾‍🍳👩🏽‍🍳👩🏼‍🍳👩🏻‍🍳👨🏿‍🌾👨🏾‍🌾👨🏽‍🌾👨🏼‍🌾👨🏻‍🌾👩🏿‍🌾👩🏾‍🌾👩🏽‍🌾👩🏼‍🌾👩🏻‍🌾👨🏿‍⚕️👨🏾‍⚕️👨🏽‍⚕️👨🏼‍⚕️👨🏻‍⚕️👩🏿‍⚕️👩🏾‍⚕️👩🏽‍⚕️👩🏼‍⚕️👩🏻‍⚕️👨🏿‍🏭👨🏾‍🏭👨🏽‍🏭👨🏼‍🏭👨🏻‍🏭👩🏿‍🏭👩🏾‍🏭👩🏽‍🏭👩🏼‍🏭👩🏻‍🏭👨🏿‍🏫👨🏾‍🏫👨🏽‍🏫👨🏼‍🏫👨🏻‍🏫👩🏿‍🏫👩🏾‍🏫👩🏽‍🏫👩🏼‍🏫👩🏻‍🏫👨🏿‍🎤👨🏾‍🎤👨🏽‍🎤👨🏼‍🎤👨🏻‍🎤👩🏿‍🎤👩🏾‍🎤👩🏽‍🎤👩🏼‍🎤👩🏻‍🎤👨🏿‍🎓👨🏾‍🎓👨🏽‍🎓👨🏼‍🎓👨🏻‍🎓👩🏿‍🔬👩🏾‍🔬👩🏽‍🔬👩🏼‍🔬👩🏻‍🔬👨🏿‍🔧👨🏾‍🔧👨🏽‍🔧👨🏼‍🔧👨🏻‍🔧👩🏿‍🔧👩🏾‍🔧👩🏽‍🔧👩🏼‍🔧👩🏻‍🔧👨🏿‍💼👨🏾‍💼👨🏽‍💼👨🏼‍💼👨🏻‍💼👩🏿‍💼👩🏾‍💼👩🏽‍💼👩🏼‍💼👩🏻‍💼👨🏿‍💻👨🏾‍💻👨🏽‍💻👨🏼‍💻👨🏻‍💻👩🏿‍💻👩🏾‍💻👩🏽‍💻👩🏼‍💻👩🏻‍💻👨🏿‍🚀👨🏾‍🚀👨🏽‍🚀👨🏼‍🚀👨🏻‍🚀👩🏿‍🚀👩🏾‍🚀👩🏽‍🚀👩🏼‍🚀👩🏻‍🚀👨🏿‍🚒👨🏾‍🚒👨🏽‍🚒👨🏼‍🚒👨🏻‍🚒👩🏿‍🚒👩🏾‍🚒👩🏽‍🚒👩🏼‍🚒👩🏻‍🚒👨🏿‍🎨👨🏾‍🎨👨🏽‍🎨👨🏼‍🎨👨🏻‍🎨👩🏿‍🎨👩🏾‍🎨👩🏽‍🎨👩🏼‍🎨👩🏻‍🎨👨🏿‍🔬👨🏾‍🔬👨🏽‍🔬👨🏼‍🔬👨🏻‍🔬🧛🏿‍♀️🧛🏾‍♀️🧛🏽‍♀️🧛🏼‍♀️🧛🏻‍♀️🧝🏿‍♂️🧝🏾‍♂️🧝🏽‍♂️🧝🏼‍♂️🧝🏻‍♂️🧝🏿‍♀️🧝🏾‍♀️🧝🏽‍♀️🧝🏼‍♀️🧝🏻‍♀️🧙🏿‍♂️🧙🏾‍♂️🧙🏽‍♂️🧙🏼‍♂️🧙🏻‍♂️🧙🏿‍♀️🧙🏾‍♀️🧙🏽‍♀️🧙🏼‍♀️🧙🏻‍♀️🎅🏿🎅🏾🎅🏽🎅🏼🎅🏻🤶🏿🤶🏾🤶🏽🤶🏼🤶🏻🧜🏿‍♂️🧜🏾‍♂️🧜🏽‍♂️🧜🏼‍♂️🧜🏻‍♂️🧜🏿‍♀️🧜🏾‍♀️🧜🏽‍♀️🧜🏼‍♀️🧜🏻‍♀️🧛🏿‍♂️🧛🏾‍♂️🧛🏽‍♂️🧛🏼‍♂️🧛🏻‍♂️👼🏿👼🏾👼🏽👼🏼👼🏻🤵🏿🤵🏾🤵🏽🤵🏼🤵🏻👰🏿👰🏾👰🏽👰🏼👰🏻🤴🏿🤴🏾🤴🏽🤴🏼🤴🏻👸🏿👸🏾👸🏽👸🏼👸🏻🧚🏿‍♂️🧚🏾‍♂️🧚🏽‍♂️🧚🏼‍♂️🧚🏻‍♂️🧚🏿‍♀️🧚🏾‍♀️🧚🏽‍♀️🧚🏼‍♀️🧚🏻‍♀️🙅🏿‍♂️🙅🏾‍♂️🙅🏽‍♂️🙅🏼‍♂️🙅🏻‍♂️🙅🏿‍♀️🙅🏾‍♀️🙅🏽‍♀️🙅🏼‍♀️🙅🏻‍♀️💁🏿‍♂️💁🏾‍♂️💁🏽‍♂️💁🏼‍♂️💁🏻‍♂️💁🏿‍♀️💁🏾‍♀️💁🏽‍♀️💁🏼‍♀️💁🏻‍♀️🙇🏿‍♂️🙇🏾‍♂️🙇🏽‍♂️🙇🏼‍♂️🙇🏻‍♂️🙇🏿‍♀️🙇🏾‍♀️🙇🏽‍♀️🙇🏼‍♀️🙇🏻‍♀️🤰🏿🤰🏾🤰🏽🤰🏼🤰🏻🤷🏿‍♀️🤷🏾‍♀️🤷🏽‍♀️🤷🏼‍♀️🤷🏻‍♀️🤦🏿‍♂️🤦🏾‍♂️🤦🏽‍♂️🤦🏼‍♂️🤦🏻‍♂️🤦🏿‍♀️🤦🏾‍♀️🤦🏽‍♀️🤦🏼‍♀️🤦🏻‍♀️🙋🏿‍♂️🙋🏾‍♂️🙋🏽‍♂️🙋🏼‍♂️🙋🏻‍♂️🙋🏿‍♀️🙋🏾‍♀️🙋🏽‍♀️🙋🏼‍♀️🙋🏻‍♀️🙆🏿‍♂️🙆🏾‍♂️🙆🏽‍♂️🙆🏼‍♂️🙆🏻‍♂️🙆🏿‍♀️🙆🏾‍♀️🙆🏽‍♀️🙆🏼‍♀️🙆🏻‍♀️💇🏿‍♂️💇🏾‍♂️💇🏽‍♂️💇🏼‍♂️💇🏻‍♂️💇🏿‍♀️💇🏾‍♀️💇🏽‍♀️💇🏼‍♀️💇🏻‍♀️🙍🏿‍♂️🙍🏾‍♂️🙍🏽‍♂️🙍🏼‍♂️🙍🏻‍♂️🙍🏿‍♀️🙍🏾‍♀️🙍🏽‍♀️🙍🏼‍♀️🙍🏻‍♀️🙎🏿‍♂️🙎🏾‍♂️🙎🏽‍♂️🙎🏼‍♂️🙎🏻‍♂️🙎🏿‍♀️🙎🏾‍♀️🙎🏽‍♀️🙎🏼‍♀️🙎🏻‍♀️🤷🏿‍♂️🤷🏾‍♂️🤷🏽‍♂️🤷🏼‍♂️🤷🏻‍♂️🕺🏿🕺🏾🕺🏽🕺🏼🕺🏻💃🏿💃🏾💃🏽💃🏼💃🏻🕴🏿🕴🏾🕴🏽🕴🏼🕴🏻🧖🏿‍♂️🧖🏾‍♂️🧖🏽‍♂️🧖🏼‍♂️🧖🏻‍♂️🧖🏿‍♀️🧖🏾‍♀️🧖🏽‍♀️🧖🏼‍♀️🧖🏻‍♀️💆🏿‍♂️💆🏾‍♂️💆🏽‍♂️💆🏼‍♂️💆🏻‍♂️💆🏿‍♀️💆🏾‍♀️💆🏽‍♀️💆🏼‍♀️💆🏻‍♀️🏃🏿‍♂️🏃🏾‍♂️🏃🏽‍♂️🏃🏼‍♂️🏃🏻‍♂️🏃🏿‍♀️🏃🏾‍♀️🏃🏽‍♀️🏃🏼‍♀️🏃🏻‍♀️🚶🏿‍♂️🚶🏾‍♂️🚶🏽‍♂️🚶🏼‍♂️🚶🏻‍♂️🚶🏿‍♀️🚶🏾‍♀️🚶🏽‍♀️🚶🏼‍♀️🚶🏻‍♀️🏋🏿️‍♂️🏋🏾️‍♂️🏋🏽️‍♂️🏋🏼️‍♂️🏋🏻️‍♂️🏋🏿️‍♀️🏋🏾️‍♀️🏋🏽️‍♀️🏋🏼️‍♀️🏋🏻️‍♀️🤾🏿‍♀️🤾🏾‍♀️🤾🏽‍♀️🤾🏼‍♀️🤾🏻‍♀️🤸🏿‍♂️🤸🏾‍♂️🤸🏽‍♂️🤸🏼‍♂️🤸🏻‍♂️🤸🏿‍♀️🤸🏾‍♀️🤸🏽‍♀️🤸🏼‍♀️🤸🏻‍♀️🏄🏿‍♂️🏄🏾‍♂️🏄🏽‍♂️🏄🏼‍♂️🏄🏻‍♂️🏄🏿‍♀️🏄🏾‍♀️🏄🏽‍♀️🏄🏼‍♀️🏄🏻‍♀️🧘🏿‍♂️🧘🏾‍♂️🧘🏽‍♂️🧘🏼‍♂️🧘🏻‍♂️🧘🏿‍♀️🧘🏾‍♀️🧘🏽‍♀️🧘🏼‍♀️🧘🏻‍♀️🏌🏿️‍♂️🏌🏾️‍♂️🏌🏽️‍♂️🏌🏼️‍♂️🏌🏻️‍♂️🏌🏿️‍♀️🏌🏾️‍♀️🏌🏽️‍♀️🏌🏼️‍♀️🏌🏻️‍♀️🧗🏿‍♀️🧗🏾‍♀️🧗🏽‍♀️🧗🏼‍♀️🧗🏻‍♀️🏇🏿🏇🏾🏇🏽🏇🏼🏇🏻🚣🏿‍♂️🚣🏾‍♂️🚣🏽‍♂️🚣🏼‍♂️🚣🏻‍♂️🚣🏿‍♀️🚣🏾‍♀️🚣🏽‍♀️🚣🏼‍♀️🚣🏻‍♀️🤽🏿‍♂️🤽🏾‍♂️🤽🏽‍♂️🤽🏼‍♂️🤽🏻‍♂️🤽🏿‍♀️🤽🏾‍♀️🤽🏽‍♀️🤽🏼‍♀️🤽🏻‍♀️🏊🏿‍♂️🏊🏾‍♂️🏊🏽‍♂️🏊🏼‍♂️🏊🏻‍♂️🚵🏿‍♂️🚵🏾‍♂️🚵🏽‍♂️🚵🏼‍♂️🚵🏻‍♂️🚵🏿‍♀️🚵🏾‍♀️🚵🏽‍♀️🚵🏼‍♀️🚵🏻‍♀️🚴🏿‍♂️🚴🏾‍♂️🚴🏽‍♂️🚴🏼‍♂️🚴🏻‍♂️🚴🏿‍♀️🚴🏾‍♀️🚴🏽‍♀️🚴🏼‍♀️🚴🏻‍♀️🧗🏿‍♂️🧗🏾‍♂️🧗🏽‍♂️🧗🏼‍♂️🧗🏻‍♂️🤹🏿‍♀️🤹🏾‍♀️🤹🏽‍♀️🤹🏼‍♀️🤹🏻‍♀️🤹🏿‍♂️🤹🏾‍♂️🤹🏽‍♂️🤹🏼‍♂️🤹🏻‍♂️🛀🏿🛀🏾🛀🏽🛀🏼🛀🏻🛌🏿🛌🏾🛌🏽🛌🏼🛌🏻]","")	

return Name
end
