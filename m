Return-Path: <SRS0=TOKk=HC=samokat.ru=ap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E9C5ACB3
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 04:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AFDBC433C7; Tue, 21 Nov 2023 04:01:12 +0000 (UTC)
Received: from mx08.samokat.ru (mx08.samokat.ru [45.90.244.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3DEE9C433C8
	for <soc@kernel.org>; Tue, 21 Nov 2023 04:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DEE9C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=samokat.ru
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samokat.ru
Received: from os-081902002.samokat.io (localhost.localdomain [127.0.0.1])
	by mx08.samokat.ru (Proxmox) with ESMTP id 942C518611E
	for <soc@kernel.org>; Tue, 21 Nov 2023 06:27:06 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samokat.ru; h=cc
	:content-description:content-transfer-encoding:content-type
	:content-type:date:from:from:mime-version:reply-to:reply-to
	:subject:subject:to:to; s=mx08; bh=Y6pD9fRLODwrM9h1xLnuG9W/s5Zzx
	soItNuqaC1FKq0=; b=uG7HvXitPI58Vkv9vtZNutqxboj/DoIPZNh3st+sY0/j7
	sY9A+QJwbrRm5syRYHorly9MgX9Z0eQ3VJoiU2cqq/2Cq5V1POh1hJ9G1wfQDXJ+
	3ZHdlYrH0TTRdEvQvQ1oLrbbp3HWqLoBIUnl8cUNhiS3h82DUcGamXAIAgVGQvP0
	hjf4H3cXJsSZM4lzu7z4yVZ9ayBh28GpkgyT8ywGRT+rM8v8H3XP5lUXJbQeonFq
	nnNdq3qgFiMSYlg6cHS2xIk4lRxrEWdbagcRJHexLq5vPo6Ixmit+t6K2XgP+5pR
	qzGuCrqO7T/WyLLvYWAyqfIopSDSAwK0HT/mGVj9g==
Received: from ksmg-08.samokat.ru (os-081902003.samokat.io [10.18.145.3])
	by mx08.samokat.ru (Proxmox) with ESMTPS id B59AF187E99
	for <soc@kernel.org>; Tue, 21 Nov 2023 05:33:29 +0300 (MSK)
Received: from os-081902003.samokat.io (localhost [127.0.0.1])
	by ksmg-08.samokat.ru (Postfix) with ESMTP id B4E541A0004
	for <soc@kernel.org>; Tue, 21 Nov 2023 05:33:29 +0300 (MSK)
Received: from [85.195.105.114] (os-081144001.samokat.io [10.18.144.1])
	by ksmg-08.samokat.ru (Postfix) with ESMTP
	for <soc@kernel.org>; Tue, 21 Nov 2023 05:33:29 +0300 (MSK)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Heartfelt 
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
From: "Anna Pechorin"<ap@samokat.ru>
Date: Mon, 20 Nov 2023 18:33:29 -0800
Reply-To: dealings100@hotmail.com
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181488 [Nov 20 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ap@samokat.ru
X-KSMG-AntiSpam-Rate: 60
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Prob_reply_not_match_from}, {Prob_msgid_missed_1b}, {Tracking_cluster_exceptions, from}, {Tracking_free_reply_not_from}, {Tracking_cnf_strong}, {Tracking_dating_nourl, reply1}, {Tracking_dating_reply, mail_free}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;samokat.ru:7.1.1;127.0.0.199:7.1.2;hotmail.com:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/21 00:12:00 #22490067
X-KSMG-AntiVirus-Status: Clean, skipped
Message-Id: <20231121032706.942C518611E@mx08.samokat.ru>

Hello

How are you, I hope this email finds you in good health and spirit? Before =
I continue let me humbly apologize for coming into your space unsolicited. =
Nonetheless, I take solace in the fact that it is with the best intention a=
nd for our mutual benefit.

I chose you among other contacts I came across in my search for someone who=
 can be of help.  It took a great deal of brain storming to arrive at my de=
cision I must say, with the hope that my contact with you will be private a=
nd confidential.

The business idea that I have is to partner with you by investing in your c=
ountry and you becoming my fund manager. This whole idea is borne out of th=
e fact that presently I am totally indisposed to carry out any financial tr=
ansaction owing to restrictions relating to the Russia /Ukraine war and the=
 suspicious death of my husband, Ivan Pechorin in the hand of our President=
 Vladimir Putin. =


It will be an absolute pleasure, if you would have the wherewithal to handl=
e this project to my satisfaction. Every detail concerning this project wou=
ld be laid bare to you upon indication of your interest. =


Strictly respond to: dealings100@hotmail.com

Best regards

Anna Pechorin.

