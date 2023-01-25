Return-Path: <SRS0=6jEA=5W=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5F2C27C76
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 08:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55895C4339B; Wed, 25 Jan 2023 08:25:48 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 09B43C433D2;
	Wed, 25 Jan 2023 08:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 09B43C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 82EBA320091D;
	Wed, 25 Jan 2023 03:25:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 25 Jan 2023 03:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674635145; x=1674721545; bh=SqLhVj0qbW
	8ZqAiFSGT9rEZMFTBymmWecD0fEbqlVa4=; b=Saij7uF78rLCrjsu9U4i5f+/VS
	pLFrYWWcPyqmC2DD+2g8UHJ/K16aeIcaIyd+7gp7P4yHEVzqL7uo9Ccvs6nrEhND
	9idVNJBac0RZrzwxe47+nT2tr5d+2bAfAEs1EVcwIn5zYkS7wSIsCCrh0Ln7EscT
	3vjy+5LTdqI3OUq/Hj3YIWva3AFMTJs1ogRMRwOQG5yGLK8w6aA0dBdb4phpPWV1
	vyGQKZ5y4I3Xcrq0CjobHhgiMnOwwkxuz1SBxjrGoemka2MgZxgl91TuEq4L+Rkn
	Ywpn/Ai1rnI5NxemcCIByQLmAiszDP3SajV7WryRE8fyhCS4Twv+xlMdjjIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674635145; x=1674721545; bh=SqLhVj0qbW8ZqAiFSGT9rEZMFTBy
	mmWecD0fEbqlVa4=; b=b/IeGmX70zXR4TmiGZF82aza03IrWyXrdmUhUMt7dhzp
	fb7MWfhG0PBR+3CBg60zmUxjiqq1BLAcDNJryaka9fkPUeGjY1u7YKn3pt7fsxRc
	AEBMWDkHZD+5Oxef5g2e/L+Hu7tJsxsWewMFgeMSKKvJeYfUH9F6dN/NzZ6ugYCM
	WPLK47oJGALvDjhd7MF5DArInyxGvzMmGA3XTg1ey64bysw5bAqCwy+K2GNMrh0Q
	IVRhVZdvikCtdWIyG0z/SC0HdsWRIQcVvuNoR3EgN+dfrEiLSLGPpieLO/T98CPc
	QCQ08b4gKH6eHV/KEgMxzQPyV7i7+r9fE1tpVQ0NhA==
X-ME-Sender: <xms:iOfQYy4BhrdjvJQJGhwceiuWpPrJNVdd7zYK2gIIumxGASzQXVsWbg>
    <xme:iOfQY77we8tgPQSEE776SW1iXfkAf46XPSb2SKn0_Un_zFUHs93cZ6G2Mxa7o2KSK
    dEi0dmH_jfo4iQUSHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvuddguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:iOfQYxeNmKi5loEwFB0P7I7Tzw3koehOISjmUtNfXb0u2k1S8lUOdQ>
    <xmx:iOfQY_Iozh-ZCFyw3BLIpl0xA05ls41CzRb8N3Hp1-tyeJAHFiGN_A>
    <xmx:iOfQY2Kf7JqrkUHThv9c_smpvvcr8_Q91LYYmaByg38rNhacyqE_TQ>
    <xmx:iefQY3om2-pKsbBbOwDebStmXfGX7HoAWbfQBYzlvijcR8Oa6vMN1A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BA64DB60086; Wed, 25 Jan 2023 03:25:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <3dabfe7f-1a15-4397-a360-ff048bc97a31@app.fastmail.com>
In-Reply-To: <20230113160651.51201-3-nick.hawkins@hpe.com>
References: <20230113160651.51201-1-nick.hawkins@hpe.com>
 <20230113160651.51201-3-nick.hawkins@hpe.com>
Date: Wed, 25 Jan 2023 09:25:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Hawkins, Nick" <nick.hawkins@hpe.com>, soc@kernel.org
Cc: "Guenter Roeck" <linux@roeck-us.net>,
 "Verdun, Jean-Marie" <verdun@hpe.com>, "Rob Herring" <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, "Russell King" <linux@armlinux.org.uk>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] ARM: multi_v7_defconfig: Add GXP Fan and SPI support
Content-Type: text/plain

On Fri, Jan 13, 2023, at 17:06, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> In order for HPE platforms to be supported by linux on GXP it is
> necessary for there to be fan and spi driver support. There fan driver
> can support up to 16 fans that are driven by pwm through the CPLD. The
> SPI driver supports access to the core flash and bios part. The SPI
> driver spi-gxp was added previously to linux.
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>

Applied to the soc/defconfig branch, but left the 1/2 for
now as I still had comments.

    ARnd
