Return-Path: <SRS0=ScqD=KR=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A4C5475B
	for <soc@archiver.kernel.org>; Mon, 11 Mar 2024 08:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47C11C43399; Mon, 11 Mar 2024 08:14:46 +0000 (UTC)
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8346DC433F1;
	Mon, 11 Mar 2024 08:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8346DC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id CACAC180007B;
	Mon, 11 Mar 2024 04:14:42 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 11 Mar 2024 04:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1710144882; x=1710231282; bh=SbHMv14S5O
	7x4ZYu/SVG1RgYPtb3OZIHZPWYFSU4sno=; b=ii0ueGHfAd2quPvlyZwdS1Oowy
	GRBXWYwa6GYgCPCXvO1dHypD8g7fvprkTMAW2RNib3kcGBdRS0So2A3xAK4sjIug
	BIWG0aouR2TX0DjerT3uXPjIIgWIFfWRTH8v1Xm26klxowwE4W/hOyuaQKwleGP0
	MTBsUCRejlDhMl0jzw9P7G8O4M6kJCKGc9tZkx9kgaYFjolUms1HE6QfFhqx0Td8
	34/qGpYilFS9WVPXaAKTUgOa9nANWXXMeAO+FeaD2eR3fqzdpzE33VVuzvcbIJDA
	7vM4WYmZIZVkv7Q86J11LW739W78al+iwtvue0F63Dac0THm6jTq/04T4Xng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1710144882; x=1710231282; bh=SbHMv14S5O7x4ZYu/SVG1RgYPtb3
	OZIHZPWYFSU4sno=; b=XfmqDJoX+iyl7gh1hixerc4VOPGkXoIxVabyLEdEM+eB
	CtHH3muRGYsNzXKSzTqRCcpgDJmJf+Z83MkCip0YgTLR5LdadUNeiKInxTRtPzXO
	Z/yT7Xvg51lGaX4R5zr4SWPAajVuvg4g7yaK3nbYTbceCUUE+2JlOV/Aut3X4oII
	dgHpt+HMLyfhvtOMrLgA6aIdvHXkvFSPF3mZLxC+k/z9sItT+1PXDBVaQte4pgbg
	1hA2Nzr9HPK5jrUVayZw2ZKDRJlo+rAY+a9CVbIFBa5imKXV+rSE6VCnKFgjO+K8
	xRRAbGllLy0199BCV7cHFWC7oYeEG9SRP8dcHSdZ+g==
X-ME-Sender: <xms:cb3uZe_eMt8HqM0122J058GdDuHYFripAMpWS3Z0mVWky4YhD7jDAw>
    <xme:cb3uZevBPctmG2VvtzZ2ceRPC7Bo4e1aB_hk8zagDPPyh5crYTKJ18o1Q9M2v-rbR
    DJlpxqpDu7AMRmXTTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjedtgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepjedvvddvudeludehjeeitdehheeivdejgfelleffiefgvefhhfeuudfhgeef
    feehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:cb3uZUALiYthbg4uQ3IKN0OD2HWN-nld4dID7UCH8idSZrKbV1oJIQ>
    <xmx:cb3uZWe2WK1B7Yr2tupVTRNd3pQXFGyDsj0-6tlsyHWnI2Ilj7T3wA>
    <xmx:cb3uZTP43TdRyKL_7AubIJgt6BlTbiXPchVtkbdINoQ8ja7nWfJd6A>
    <xmx:cr3uZfDdYWGpN9L51k0qBZ7nfj4wvxA-V3EzJdn0XhYGrCUcTkqm9fDJebU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C7B27B6008D; Mon, 11 Mar 2024 04:14:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <b95843cc-7f8f-46d8-a6c6-0c25de77ad1b@app.fastmail.com>
In-Reply-To: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
References: <20240307200441.2151734-1-florian.fainelli@broadcom.com>
Date: Mon, 11 Mar 2024 09:14:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
To: "Florian Fainelli" <florian.fainelli@broadcom.com>, soc@kernel.org
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-arm-kernel@lists.infradead.org, "Olof Johansson" <olof@lixom.net>,
 "Kevin Hilman" <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 1/3] Broadcom devicetree-arm64 changes for 6.9
Content-Type: text/plain

On Thu, Mar 7, 2024, at 21:04, Florian Fainelli wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
>
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.9/devicetree-arm64
>
> for you to fetch changes up to 27058b95fbb784406ea4c40b20caa3f04937140c:
>
>   arm64: dts: broadcom: bcmbca: bcm4908: drop invalid switch cells 
> (2024-01-29 10:43:10 -0800)
>
> ----------------------------------------------------------------
> This pull request contains Broadcom ARM64-based SoCs changes for 6.9,
> please pull the following:
>
> - Rafal defines a proper NVMEM layout for the Asus GT-AC5300 router and
>   removes some invalid Device Tree properties pertaining to the
>   Ethernet switch on bcm4908

I merged your three branches into the soc/late branch of the
soc tree since they came in after I had finished the other
pull requests. My plan is to send a separate PR for the late
branch a few days after the other ones.

      Arnd
