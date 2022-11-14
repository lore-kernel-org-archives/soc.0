Return-Path: <SRS0=Bbg4=3O=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B530C43217
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 215ADC433B5; Mon, 14 Nov 2022 15:37:36 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED798C433C1;
	Mon, 14 Nov 2022 15:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED798C433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EA1155C016A;
	Mon, 14 Nov 2022 10:37:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Mon, 14 Nov 2022 10:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668440253; x=1668526653; bh=GLxOLES7b1
	nhr5FuHwpRvZH3KeqwCfOlyPeKYnA29Xo=; b=D+7PrkClU0CUkb8LzM7PRiuQWz
	Py0xhrIioR9QWqssnSAhJ1BlvNE304fi5Rbkncik7v9qBch968OcUeZDQ1tOwlia
	ElGidm/up/FzW7mEuQD9g2JjePvMUPeptoA2tTBX1imI725icb5VjbyxpGpoqt8q
	HhzPz0MAn/h+qGWfhL8cipCrpAlN4RveAScq+M2sSgPqMJyZUFMX3PoKgOjPOtl+
	iWdjpcSigzci4n58nNCalPI2qJShiG5hPlumlGWKZYsi5EOAqlFngNmUOIL85w+/
	gS3G9fwPwuLez0b8T7+NEkDxVKI1K5ou6H0H+KUB1eY2rbOe8mhTMDHaVgCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668440253; x=1668526653; bh=GLxOLES7b1nhr5FuHwpRvZH3Keqw
	CfOlyPeKYnA29Xo=; b=mDBTN3xa+X6kopr/136uXyJ7+HZdtaE9FW9fNwV9vYsz
	F+oNzO5vQzpJr0WC4IfqkxdcG5bMNpX8cqQYK1ZgPio3j25CvTjshhyDMbkl2nPm
	6Ji7G2cGR++FgZbYY8iPpRTPjy/HZuZI6Wtycx0F82TlWunluTcM/L0It/VwOEXk
	AaXIgxuwtkKtJWVHfQiSI3suf70khv7tIWLtyZ9XhhTkYgpDndYqUQSaD/4P/hsL
	S2prSV50S4rddB/Z5laXUiOJupsfr7OiXTJTw1pJIadTAKLo5mF0IfQr/aAOfVlC
	1Wbj50BoU1ZvVlL8z1jO7h0se8KOQ5Y8X0aIenfTlQ==
X-ME-Sender: <xms:vWByY-EGjgnS0Xd-gAYSmr2GOYOwe7zzcKZC0H6LCKtaD5sD69xj6A>
    <xme:vWByY_UvCWkvjJJ1RBG6I6UVhU9PO5pVV7KFqWcuRDuf1zzPDRvMiY6IPnB0B7uVD
    e8XG9JJFrqO8Zf3xgk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedvgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:vWByY4LhO52fxv3U8sdyW7wMKcAXt595SGOCWcU8TCB8KgphA81RKg>
    <xmx:vWByY4E81aM4Z61ByksYBdapWEIYE07suX_BFXGkDrKFu6_e6YkzKA>
    <xmx:vWByY0VtVjecLVDK6RAM_Pdcd5H8uNGBNYrVOe4aQbt3lbSSZHGrKA>
    <xmx:vWByY9fs3vNel5xkGEGibkAO869PFpcEv7_qbVU7rBCRf6d-w3K1OQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6A69AB60086; Mon, 14 Nov 2022 10:37:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <79ecabde-e561-4f7d-8c6f-78331c880e04@app.fastmail.com>
In-Reply-To: 
 <166843982063.12382.5702013296268460619.git-patchwork-notify@kernel.org>
References: <20221111054201.18528-1-zhuyinbo@loongson.cn>
 <166843982063.12382.5702013296268460619.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 16:37:13 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc@kernel.org, "Yinbo Zhu" <zhuyinbo@loongson.cn>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org
Subject: Re: [PATCH v7 1/2] soc: loongson: add GUTS driver for loongson-2 platforms
Content-Type: text/plain

On Mon, Nov 14, 2022, at 16:30, patchwork-bot+linux-soc@kernel.org wrote:
>
> Here is the summary with links:
>   - [v7,1/2] soc: loongson: add GUTS driver for loongson-2 platforms
>     (no matching commit)
>   - [v7,2/2] dt-bindings: soc: add loongson-2 chipid
>     https://git.kernel.org/soc/soc/c/06ebd23a33ec

The first commit had a small merge conflict against linux-6.1-rc2
that I resolved. It's all merged now, but it caused me a little
extra work, and it means that the automated tracking does not
work.

I suspect the patch was not generated against a recent -rc release
but either a previous kernel or the current git HEAD commit for
the loongarch tree.

     Arnd
