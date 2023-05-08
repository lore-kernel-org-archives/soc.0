Return-Path: <SRS0=FC7s=A5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74401C77B73
	for <soc@archiver.kernel.org>; Mon,  8 May 2023 05:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FE04C433D2; Mon,  8 May 2023 05:39:00 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4BFD5C433EF
	for <soc@kernel.org>; Mon,  8 May 2023 05:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4BFD5C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 8FDDD3200916;
	Mon,  8 May 2023 01:38:56 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 08 May 2023 01:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683524336; x=1683610736; bh=IG
	uhB1AfYiLDeTeaCQ/lxK2IkfOy97OVYEZQfyjOyE8=; b=HJd/3ixkuBsg4xH/jW
	HALc0Cwu+ulF/i847SnxtIL6wpmn+wKSZzdrX8COeeTh2pJUr7mjgfjAV/yBogVI
	4H+MkQOCtwBkyOE4wsMxGuf23aS4vq/pDPReE7t/ANoKccMY50tE4JOJTjL2TJcC
	Nv+9xteKpPhn2Hyycya5TYfQ5p6WtWS1xUwn3RkX1PmX1otQ2+3ipgKvz+sIAhfE
	nvqUhveiwgO8JhCS+6vuvF07nuv17pBGeTZrDItsC2kDz8gbFHIUJ6/HmleSh07C
	bLV9GVBQ2lIHunynM9vT5DBXCS9o0V9OXafyBGeOsU3H5P6UeYJVCVADTUir/WTz
	5cdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683524336; x=1683610736; bh=IGuhB1AfYiLDe
	TeaCQ/lxK2IkfOy97OVYEZQfyjOyE8=; b=NhLJsAvdYck62CQOjCB7hCftKFF3D
	d27LqxB91+09qM+pOG4hu4dl7Nirzj0DiNmonJncuYTR5p0jEPrP6thcbFY7P+m0
	rle4a4b7EePpHkIhn1YOSChhwcBYX4hCZbf9PR7z6lZQXlpZy0VF7q36V8Up9Gsp
	GJsChYslLGTNuygxZPMK2R8Lp6eoyixShZP2O0iuAqIVmD8vAoBFrZ8G5EBr+iGQ
	SxzWEWTsltXMJvHZKgNEEtVzXFBtNoM32lRvH+XY03YsUy5nPQ9WPdyaWGhAttyg
	Fpv+//Ds8/ITZ0baNIskmRQyX6xlgbaO/bQPXh/603v7NZAY/GmlkiVog==
X-ME-Sender: <xms:74pYZHTiZBhpNP0D8IKwpg3P1zqobXUMkDV9QgKqZqn6OtKiG_gvsg>
    <xme:74pYZIy_TqlfS6KOkc-7hbVLGu7G3eLU-NfORB8Ni7IgAVCfKysdSGJDuI-aCHeSW
    3OIGGfp0JHWMznmxKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:74pYZM2uD8uY6FiKh_pinA8SCEg8kyrFeqmU4plDxicr9nnZzWON7g>
    <xmx:74pYZHAHmbzNTBKdTFgwAsFyyIz8ufJbYPOuw-n6Gl3HJI0jg5lMlg>
    <xmx:74pYZAiPWgFd1ktDCeQo_0-DNnzh_H-BUIQc1glhyj3FrWviveLQFQ>
    <xmx:8IpYZLXMX8Pm0PmIE822VPYkH0-qXK_6C84T2hl0zffVLS9EkwGcIw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E219B60086; Mon,  8 May 2023 01:38:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <730b1560-cf57-482a-966b-93b4c51568b2@app.fastmail.com>
In-Reply-To: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
References: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
Date: Mon, 08 May 2023 07:38:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
Content-Type: text/plain

On Mon, May 8, 2023, at 06:04, Lukas Bulwahn wrote:
> Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
> in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
> with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
> no effect and any further purpose.
>
> Remove the obsolete config S3C64XX_SETUP_IDE.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Indeed, this was only used on the smdk64xx board file,
so the file was removed along with the deletion of the board,
but I forgot to remove the Kconfig option.

Acked-by: Arnd Bergmann <arnd@arndb.de>
