Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08165C47422
	for <soc@archiver.kernel.org>; Fri, 26 Jan 2024 06:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7E3AC43394; Fri, 26 Jan 2024 06:11:33 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08B98C433F1;
	Fri, 26 Jan 2024 06:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08B98C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B53BA5C0094;
	Fri, 26 Jan 2024 01:11:30 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 26 Jan 2024 01:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706249490; x=1706335890; bh=/CCMH9FSFZ
	DjHQrfvolM2WN5ZRXNGFWCK29ihGnlVUU=; b=eq/o9ndKEIPihn6o8GJ9Tlixb1
	aZ/vGHpIgaRtujX1eQxOdLoDBAY1YKnbEoet949mGcdRJltW1zy3Q/iWzETaeV07
	oPogFtpFCX0KvDsl2V64XvKjrXtwlflr9bHPq8a1QezhaD6i7uQVGmESiDpeeqmk
	2akei/JoBeqz9pRyGVUYw7KbVjEBRMMXPBETpxC6oKcHg4kin+Yf9iwyrAtwRAhZ
	5ZWx438cACbK0GtBnm5zw+20Z5exjsWSLi2p2AmwZ3SXaBH24zZ2bHzXSnEOj3gG
	cDPAwLX47yj3IK1SBCKB7SRS9bLcoJshwdAJjNpdiGtkkeOOFBtXDg1y2pgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706249490; x=1706335890; bh=/CCMH9FSFZDjHQrfvolM2WN5ZRXN
	GFWCK29ihGnlVUU=; b=a7hf9e0k1/e+V77ZfQv7wRF8evLMd83SzGTU2hBVF7xn
	6bmBAJ5ZAZXiTj/25ukeCXo2j5l4DfA4XX93HYb93mWFoFFTo0UV52gr6s+yQ1Kg
	PP7vXeo7ao5E/T545HyRhECVSdOBO58eg9W+rb/BHamV72BSAz5H80xm8oWMB8yV
	OypDdj5y7m9P3bTIv0pLi2c1t4OZFM6ejYx7F+czl/sgbdDn1J1ysFCZGk4BR8jn
	AjmCObCPVMBukW3ENjHe5rPAysVTcGDrWbcVahPaklBQoVmb9gvnmCM6+M9gWGWV
	XJZCRcu8XFvhb4QlDU9VXlVJuKRmx3thX1kZJBYNyg==
X-ME-Sender: <xms:Ek2zZRXJiXaaZvTR-c05RgualuKuwC4FA41hQWHPWoWG7qrIACz7sA>
    <xme:Ek2zZRmYpSCiKqijrAxZUK-3Ez4wUSpiB7NhT7ULTcuA9NNYC0w8VM7_B0zOb_KcG
    qflfVTIuny3RuR-iko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeliedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepfeeuueeijeekvdehgfetudfhteefvdeggfdugfekieefjeeihefhhfegleeh
    gfeunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvg
X-ME-Proxy: <xmx:Ek2zZdaQlInb0u0tTkLmfsN_UK9lgy_obBhxOvc1DSWU3GixiwNwPw>
    <xmx:Ek2zZUVbjWzlKgqyG-89eavl5EbaZDfvnhAxVudE5tJ198f029GYUQ>
    <xmx:Ek2zZbmeD25elPWTOLyn4J3XlylI1guR8ykn1WfuS6VLGHz0f5bW-A>
    <xmx:Ek2zZZadf9UGPbHdykZY4zgxixMM52121IjikE0iNThn656yTed1Wg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 49799B6008D; Fri, 26 Jan 2024 01:11:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <0f091a2a-0bc8-42ca-9d5d-aa218fa88e93@app.fastmail.com>
In-Reply-To: 
 <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: 
 <MA0P287MB28228572C526C5099A8BDA2DFE7B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 26 Jan 2024 07:11:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org
Cc: "Conor Dooley" <conor@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, "Inochi Amaoto" <inochiama@outlook.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 "Chao Wei" <chao.wei@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
Content-Type: text/plain

On Wed, Jan 24, 2024, at 08:50, Chen Wang wrote:
> Hey Arnd,
>
> Please pull one DT fix for Sophgo SG2042 based off v6.8-rc1.

Thank you for the pull request I found a few small mistakes,
so please respin the tag and the email:

>
> are available in the Git repository at:
>
> git@github.com:sophgo/linux.git 
> tags/riscv-dt-fixes-sophgo-sg2042-for-v6.8-rc1

This is not a URL I can pull from. 

You may want to add something  like this in your .gitconfig in
order to turn it into a normal https:// URL when sending
a pull request:

[url "https://github.com"]
       insteadOf = git@github.com

> ----------------------------------------------------------------
> RISC-V Devicetrees fix for Sophgo/SG2042 v6.8-rc1
>
> This patch is [2/2] of [1]. The binding part [2] has been merged in 
> v6.8-rc1, but
> the dt patch [3] is missed. This fix add the dt patch.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> Link: 
> https://lore.kernel.org/all/IA1PR20MB4953C912FC58C0D248976564BB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ 
> [1]
> Link: 
> https://lore.kernel.org/all/09b2fc2f-dde9-4f43-9704-d8053bfc85cf@linaro.org/ 
> [2]
> Link: 
> https://lore.kernel.org/all/IA1PR20MB4953669C097D9C9E24B549FFBB86A@IA1PR20MB4953.namprd20.prod.outlook.com/ 
> [3]

The tag description is what gets turned into the merge commit
when I pull it, so it needs to be something that makes sense
for the long-term git history as well as for me to understand
why I need to pull it.

For a normal branch, that would mainly mean that you should
give a summary of the branch contents. In this case, I see you
have only one patch, so it's probably easier to send that
patch to soc@kernel.org individually, with the same cc list.

       Arnd
