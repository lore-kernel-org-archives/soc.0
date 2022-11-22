Return-Path: <SRS0=9FPl=3W=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ED0C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 21:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE94BC433D7; Tue, 22 Nov 2022 21:48:28 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43C37C433D6;
	Tue, 22 Nov 2022 21:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43C37C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 1BCEB3200906;
	Tue, 22 Nov 2022 16:48:26 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 22 Nov 2022 16:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669153705; x=1669240105; bh=KRhdDIwUkq
	L9TxMQTwjLqCyv5U/Y3KfB4Ced1o1j6/4=; b=meCJ5J9mjOFTFePzgI112DeZ+W
	k/N91ZsD7M/a55qov9nIGzypsrxHifSx/6OKi1IvTaW9r9UJ4KNpEhOKRgXh2yOH
	5HQthxMMdZ1oupZ0WI8i+RlqMpNON3gqHhB/vEKCXM7xcc/6+G/nl4XhsW6E9HU+
	u6pqULMyrWjXwvXUCmiVsUNnmQsub8UelaHeMlWWNGEWqcu6C774nA9i1EmADGmt
	TOf1JEco3MJnPGWKNHAUyBXeUOwsMy24eubxZeuHXa5MAxI1PS2BWfnR4NCKuyR2
	/jO/pc5eNKL1R1MnM89kEAzyV04g8q5wd/v9nkKTNvH9u3CUTDcFDm3YZsxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669153705; x=1669240105; bh=KRhdDIwUkqL9TxMQTwjLqCyv5U/Y
	3KfB4Ced1o1j6/4=; b=C1+0V1hVZxzf92jB63CQp/VzZnsxPRAZ61JEw8wiGxDI
	AUNlaY7/yuBvxz8WIE764hM3gI6cz1mSwr8vgID6Pa7S/dXS579IRrD70zalCOC3
	CIlR7Hm2zUU0Z4Z7V4BF9zHuo+cN4nLfC5dubW5MVcWI2QgoKjRzq6S1cX4yz9ZQ
	7yAgKXcxzGt7O2ivAqT0twvW5pfclStaV9S4obF+PtcU3bD2LFvCDvHiremw3WMb
	furhn1iM1eky7bU2RCtB+hHOVA1IeCWzgsJygSBz+HUUqe1jIIH4vwoaCmHnaS09
	ViGnmun7JtZpy1Qbyd7g+QC9Mph6xMcNauNLthZuSQ==
X-ME-Sender: <xms:qUN9Y9Bc-hVN400L5os4xwlVC90Xgagjbd7hKh7qzpD5t3e9e63FlA>
    <xme:qUN9Y7iAsoKkA7mtNxNH6XgXwZ3NL_VCGrYRvFAhAmK0xD-FRlsojQgDq0pkUbxmd
    vMAflyKC6ZB6XTtC28>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheelgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:qUN9Y4l2pjbAfuUczFetc7mm1vfL8Hg4RE-4AmQxvz6ye2mHsYrt7A>
    <xmx:qUN9Y3z6jizANd5TvOp2FCXbA1kXl1gSoyBcMY-i2VEHiU1M5k7Y_g>
    <xmx:qUN9YyTTfxwOmr51BfewAE-SdFEHsd5q3WX2WADDf7tElHQP1kOfpg>
    <xmx:qUN9Y9egnK34rc-s-mTYWv4UnWYKXbNDpuO1eoXum-7jzlcJL1U0rg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7DB9AB60086; Tue, 22 Nov 2022 16:48:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com>
In-Reply-To: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
References: <7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org>
Date: Tue, 22 Nov 2022 22:48:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, soc@kernel.org,
 arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.2
Content-Type: text/plain

On Tue, Nov 22, 2022, at 16:24, Neil Armstrong wrote:
>
> for you to fetch changes up to 7dc69c7d073e6004a281db8f7f15cf6ebf702ea0:
>
>    firmware: meson_sm: Fix memcpy vs iomem type warnings (2022-10-17 
> 17:19:04 +0200)
>
> ----------------------------------------------------------------
> Amlogic Drivers changes for v6.2:
> - Fix memcpy vs iomem type warnings in meson_sm driver
>

It looks like a trivial fix, but I think it's actually wrong:
The real problem appears to be the use of the ioremap_cache()
function in meson_sm_map_shmem(), which returns an __iomem
token that is mapped cacheable on architectures that support
this function, but behaves like normal ioremap on others.

This is probably not what you want here, instead this should
be converted to memremap(), with the __iomem annotation dropped.
In the long run, we should try to kill off ioremap_cache
entirely, and not introduce new ones.

     Arnd
