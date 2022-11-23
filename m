Return-Path: <SRS0=HTn7=3X=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A2DC433FE
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 11:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9146AC433D6; Wed, 23 Nov 2022 11:06:13 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEB26C433B5;
	Wed, 23 Nov 2022 11:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DEB26C433B5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id ECEA95C0035;
	Wed, 23 Nov 2022 06:06:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 23 Nov 2022 06:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669201570; x=1669287970; bh=wvfPj5pMnm
	aDF6gRWRHa//LmSERArtOMBKB8CpCTPDI=; b=M32kAZ2OiFJL2z2CMsoEX3h0L6
	Hw4/snuy+8umGVo+CaG8YiuH+iehWAWXT06AspcxUXX9yYjnnx+WJH1dmumRFqSx
	AASF3NHULhJoyDPoxOo/gaMA/lKJEYN9vaLAvVYSqDJxEIq68W0L6FnB/De9bdE6
	9coOxb1CE3a7ugeHtFA0gAO4E0ilI0y/uQNYMqJ9Pa8GAdybF9BNe8g5MO/6T+sa
	5ouyWXFE6qdJJlgPZpck2UA88hMhflPGR+HBOv3KI2ypzijtDWYulE85cC6LNygY
	oAgg5i9tzsOCg49+g6ReFZ57s+Xo8d/cqE8dtRg3rOgllNYPNY6Ihkt+N+ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669201570; x=1669287970; bh=wvfPj5pMnmaDF6gRWRHa//LmSERA
	rtOMBKB8CpCTPDI=; b=Ainvw3U44bMuDov4b1vyqz+51oMbkOUmQEbcgroF0aoA
	7LgyQQanp25CGnTi8Hnd/6VpJp/72ZoRJCPZiGVJLq2Y/10s3pin9y4OQedJbuKV
	ddmDR136P9kf0TGHMQ968nMmKUGJZ2nAvqI7fLN5LkNSuFcgTH42mPWyRJ7JxTyK
	yjMhLJrbd1oVz3yK7+W6V8Dz/lWcf1H1CxpPvgJvcdXeDo8gVFnBFItwDzlxyVc7
	jcvhHiZ83ClrbkDysHJXhYPLCSDO9Ir5DN1ISkBm78SrlvaieIiHvc4aZ4IlUxa3
	nt7/IIRhwMbe7eklC3IdUY12FMhU1ZjT5pj3t+N0qg==
X-ME-Sender: <xms:ov59YzRSvQDJM4PqvUbrqcV-hhJfgOeitShNZ1pMo-feFBs7-jEhHw>
    <xme:ov59Y0zUXJCCESHP1CuUKI0Q03MX0SqgW5_Q2t_nMQdwvEUSjsParfztrvngdZhgv
    52lYKc4CNdwAg_5Sck>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedugddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ov59Y40Es3PeQJEfEQlVhl3ofvw_jSvEWTJ8FQzbfhEz22tciRgr3Q>
    <xmx:ov59YzAKL9YMP8d2eFPBWDv_0mXJjLAm6h_qQjJc8SdYZvkfSq-k6g>
    <xmx:ov59Y8g6srUOLDSToqWVeRpvkIPdEMFH6zJXw1vsF9rnl-bS3Wn2YA>
    <xmx:ov59Y0JGlX09xoMslOj_o7gScu9602YfyT-pVsCe4HggmqdvardIuA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CF9FEB60086; Wed, 23 Nov 2022 06:06:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <894fa542-bb95-4fad-971e-30f133ae2c46@app.fastmail.com>
In-Reply-To: 
 <166915562582.11152.9314638583392404867.git-patchwork-notify@kernel.org>
References: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
 <166915562582.11152.9314638583392404867.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:05:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.2
Content-Type: text/plain

On Tue, Nov 22, 2022, at 23:20, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
>
> This pull request was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Tue, 22 Nov 2022 16:24:59 +0100 you wrote:
>> Hi,
>> 
>> Here's an Amlogic Drivers change for v6.3, fixes memcpy vs iomem type warnings in meson_sm driver.
>> 
>> Neil
>> 
>> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
>> 
>> [...]
>
> Here is the summary with links:
>   - [GIT,PULL] amlogic Drivers updates for v6.2
>     https://git.kernel.org/soc/soc/c/ad654a0a21bb
>
> You are awesome, thank you!
> -- 

Sorry about this, I meant to remove this change when I originally
complained about this, and it looked I accidentally kept working
on the branch that still had it. I've fixed it up now, and it's
gone again once I push out the latest updaet.

     Arnd
