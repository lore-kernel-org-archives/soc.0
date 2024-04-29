Return-Path: <SRS0=itBq=MC=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF69C4345F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 20:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D675C4AF19; Mon, 29 Apr 2024 20:06:11 +0000 (UTC)
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF990C113CD;
	Mon, 29 Apr 2024 20:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CF990C113CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id BB4B81380368;
	Mon, 29 Apr 2024 16:06:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 29 Apr 2024 16:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714421168; x=1714507568; bh=3bIwKnsy9i
	fetBfNY+3G/QZkKlWgtgdGBGngqxa9+ik=; b=HbgG3qj53eKRmhBscBhH1xlRmn
	nDm1RH9c12EwGP98UP9Dd5b4MFxjJb8KLi2ng0+aakho2SZNziHbM5g7VZJC2Q2Q
	2MDIBDz63ydAXDudYk+0GOi8Bcv4C+UH1ctYR8e04PbMF3jVCIKz/+S11lreX3E8
	9lf6HOCseuOUOUS/McJKDHy3vHKyb9Zzap07BxVnRqJja16J3nLmYnOitHN58jiO
	nAZVOqNl0A+vwtMj5qguJFboE/j8Qjbteom9myV3jI50wBw3cgAP/ad6dr53lB10
	hgd0vNiq+QnQoIGsr88wbQSl1dVH/g2uiy2J8chwDOzwCrsgm3scC/xhyibg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714421168; x=1714507568; bh=3bIwKnsy9ifetBfNY+3G/QZkKlWg
	tgdGBGngqxa9+ik=; b=fSDBHS9wSxfB5RWx+g2dy6rwGvjR9rbbqx+5P6UcAhmR
	1ozFK2kjugdPmjxCqPcQx3ZvFGsGd4iTGOzytCfp175R0N7hW86eqPXYN4qXFT1W
	+m24+5LxTJFuXZNHIIwHPMtrPjZVqDubP9fhX3GzBx/nmgJs/I8vLA5MUQaSib1r
	Caonbc2kwHjy281NfbgEXkSlLgB9+Ybj9yasNvcNFUeVIfAQR1W1UrvIZJZWG9BN
	cZTeSPe6SUfVAU1atticcTacOFlAXsYhNkk8D+sqpKSZWDGtKAqBauFsaGDXKqcJ
	OcHf5OUlI8h3CuWbzmDhXnWSuaapTVTTwpr9A8yKxw==
X-ME-Sender: <xms:sP0vZtjxn-7_N5zXNwSraCLu-FBqrtL32VClpOu7vBRPaAEDjCrFPg>
    <xme:sP0vZiAleNg2jMMSc-J2iRxoGJ57iDuaw_3JaZhHUyKCA4E2lgTgC51P0XgGvJ_F4
    HW7F3W8HxS-3ewOEAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdduuddgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:sP0vZtHmYg0d8ITut70uysTKybASUJ1ARZMd1oTW5Uhg7aXNKp56Ig>
    <xmx:sP0vZiR5C9rggca3QB8yaPVT_D2Gp_K3xmgTWloaHX9Y5hdB4NYhVA>
    <xmx:sP0vZqywLEcgZhZRoTvN31wjnSjZsQznZZxjw_vzTWipvz5RAHitYA>
    <xmx:sP0vZo5dOPwUBFsS0zFgTpkOSLCQfAyWYBEXmIqKAK0YXZ4ncvSptg>
    <xmx:sP0vZkttMvmIiFhfqqzcBbgI3TttK5YCyTsFdr-Ptur63gMrEYlNOc7W>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4AFC7B6008F; Mon, 29 Apr 2024 16:06:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
MIME-Version: 1.0
Message-Id: <7eab1a4b-4cb0-4142-b3ba-fe9e73f41eff@app.fastmail.com>
In-Reply-To: 
 <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
References: <20240429140245.238210-1-angelogioacchino.delregno@collabora.com>
Date: Mon, 29 Apr 2024 22:05:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
Content-Type: text/plain

On Mon, Apr 29, 2024, at 16:02, AngeloGioacchino Del Regno wrote:
> This introduces the new Airoha (MediaTek) EN7581 home networking
> platform (routers) in early stages, but with support for its
> Evaluation Board, a few more MediaTek based machines, and
> improvements for existing ones.

Could you respin the pull request without the defconfig
and Kconfig.platform changes and send those as separate
patches? I always try to keep these in distinct branches
on my end so I can send my own pull requests separately.

The actual changes in your tree all look good to me.

     Arnd
