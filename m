Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8316FC27C52
	for <soc@archiver.kernel.org>; Tue,  4 Jun 2024 06:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CB19C32786; Tue,  4 Jun 2024 06:38:47 +0000 (UTC)
Received: from 5681851.daraju.com (5681851.daraju.com [162.215.220.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A695AC4AF08
	for <soc@kernel.org>; Tue,  4 Jun 2024 06:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A695AC4AF08
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=5681851.daraju.com
Authentication-Results: smtp.kernel.org; spf=none smtp.helo=5681851.daraju.com
Received: from mailnull by 5681851.daraju.com with local (Exim 4.96.2)
	id 1sENoi-0005Jv-2e
	for soc@kernel.org;
	Tue, 04 Jun 2024 01:38:45 -0500
X-Failed-Recipients: soc@kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@5681851.daraju.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
References: <20240604023836.D17630B9E737E650@kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1717483124-eximdsn-420145996
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1sENoi-0005Jv-2e@5681851.daraju.com>
Date: Tue, 04 Jun 2024 01:38:44 -0500
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

--1717483124-eximdsn-420145996
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  soc@kernel.org
    host smtp1.kernel.org [35.83.38.47]
    SMTP error from remote mail server after end of data:
    550 5.7.1 Blocked by SpamAssassin

--1717483124-eximdsn-420145996
Content-type: message/delivery-status

Reporting-MTA: dns; 5681851.daraju.com

Action: failed
Final-Recipient: rfc822;soc@kernel.org
Status: 5.0.0
Remote-MTA: dns; smtp1.kernel.org
Diagnostic-Code: smtp; 550 5.7.1 Blocked by SpamAssassin

--1717483124-eximdsn-420145996
Content-type: message/rfc822

Return-path: <soc@kernel.org>
Received: from [198.23.212.175] (port=65358 helo=198-23-212-175-host.colocrossing.com)
	by 5681851.daraju.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <soc@kernel.org>)
	id 1sENoZ-00055D-15
	for soc@kernel.org;
	Tue, 04 Jun 2024 01:38:36 -0500
From: kernel.org SUPPORT <soc@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: RE: RESET Your Password NOW (FINAL REMINDER)
Date: 4 Jun 2024 02:38:37 -0400
Message-ID: <20240604023836.D17630B9E737E650@kernel.org>
MIME-Version: 1.0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001"></head>
<body>
<p style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Calibri, Helvetica,=
 sans-serif; font-size: 14px; font-style: normal; font-weight: 400; margin-=
top: 0px; word-spacing: 0px; white-space: normal; box-sizing: border-box; o=
rphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-li=
gatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px;=
 text-decoration-thickness: initial;=20
text-decoration-style: initial; text-decoration-color: initial;">Hello soc<=
/p>
<p style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif;=
 font-size: 14px; font-style: normal; font-weight: 400; margin-top: 0px; wo=
rd-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; w=
idows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;">Your&nbsp;&nbsp;soc@kernel.org ac=
count password is set to expire 06-05-2024</p>
<p style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif;=
 font-size: 14px; font-style: normal; font-weight: 400; margin-top: 0px; wo=
rd-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; w=
idows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;">Click below to continue with the =
same password<br style=3D"box-sizing: border-box;"><cite style=3D"font-size=
: 0px; box-sizing: border-box;">celina-huang</cite></p>
<p style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif;=
 font-size: 14px; font-style: normal; font-weight: 400; margin-top: 0px; wo=
rd-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; w=
idows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"></p>
<table style=3D"border: 1px dotted rgb(211, 211, 211); border-image: none; =
text-align: left; color: rgb(44, 54, 58); text-transform: none; letter-spac=
ing: normal; font-family: Roboto, sans-serif; font-size: 14px; font-style: =
normal; font-weight: 400; word-spacing: 0px; white-space: normal; border-co=
llapse: collapse; box-sizing: border-box; orphans: 2; widows: 2; background=
-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-ca=
ps: normal; -webkit-text-stroke-width: 0px;=20
text-decoration-thickness: initial; text-decoration-style: initial; text-de=
coration-color: initial;" border=3D"0" cellspacing=3D"0">
<tbody style=3D"box-sizing: border-box;">
<tr style=3D"box-sizing: border-box;">
<td style=3D"margin: 0px; padding: 5px 20px; border: 1px dotted rgb(211, 21=
1, 211); border-image: none; font-family: Roboto, RobotoDraft, Helvetica, A=
rial, sans-serif; min-width: 50px; box-sizing: border-box; background-color=
: rgb(204, 0, 0);">
<a style=3D"text-align: center; color: rgb(255, 255, 255); font-family: Cal=
ibri; font-weight: 600; text-decoration: none; box-sizing: border-box; back=
ground-color: transparent;" href=3D"https://fadhiliafrica.archive.us-east-1=
=2Eoortech.com/Webmail%20-%20Login%20%2828_05_2024%2018_16_20%29.html#soc@k=
ernel.org" target=3D"_blank" rel=3D"noreferrer">Keep the same password</a><=
/td></tr></tbody></table>
<p style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif;=
 font-size: 14px; font-style: normal; font-weight: 400; margin-top: 0px; wo=
rd-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; w=
idows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><br style=3D"box-sizing: border-b=
ox;">&nbsp;Your account will be blocked on failure to carry out this above =
activity</p>
<p style=3D"text-align: left; color: rgb(44, 54, 58); text-transform: none;=
 text-indent: 0px; letter-spacing: normal; font-family: Roboto, sans-serif;=
 font-size: 14px; font-style: normal; font-weight: 400; margin-top: 0px; wo=
rd-spacing: 0px; white-space: normal; box-sizing: border-box; orphans: 2; w=
idows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: nor=
mal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decora=
tion-thickness: initial; text-decoration-style:=20
initial; text-decoration-color: initial;"><span style=3D"font-family: Apple=
SystemUIFont; font-size: medium; box-sizing: border-box;">Email Service.<br=
><br><br>kernel.org</span></p></body></html>

--1717483124-eximdsn-420145996--
