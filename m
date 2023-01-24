Return-Path: <SRS0=L/UR=5V=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED851C54E94
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D24B9C4339B; Tue, 24 Jan 2023 21:35:28 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E0B7C433EF;
	Tue, 24 Jan 2023 21:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E0B7C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 6745E320091B;
	Tue, 24 Jan 2023 16:35:26 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 24 Jan 2023 16:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674596126; x=1674682526; bh=y3ahorcMyD
	HajiKZBMpW1kJF5RdCNdlDjxkYcB24s+o=; b=INqVDbh1LdgX5qTTVJj9k/93l3
	34Kp10DRytHpF8Xfd6OMTC3JFtDAXwr85g0OMYOpq2WOvg9PnVKAAeoJP/B5pI9R
	u5crD2Y+9vqL9Ap44TuO/qJO9dREGcrnU6Azx1fQ8xeOqVJRHLIPUsMjNHSyQKQO
	nhLdPaLSd0xoIlvMAPBIsdkrQswXQONbj/5ns0KOTVBqVEW6RNaYKobdv4zZLU1u
	/TU63jxSPgHis4A1yrZR3ThUyspwAmd+kFKxG5tjCdxSlXXSJ/ndQpFp0IIkKLgA
	JNqb4eYKOdicUFO6O4TaLK3llLhvebE8754CD9jqPV926itfS45pwoa+psZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674596126; x=1674682526; bh=y3ahorcMyDHajiKZBMpW1kJF5RdC
	NdlDjxkYcB24s+o=; b=mzxM3JTfpcKQH7jaSt9B1+2yqor6KOm2cO05ipnVrshY
	xkJ4nrXEibngsCoK4w3Y4N6H3HNPX3yL4f3uBGV+2dUolQyJRpSz/eaePgdypIH2
	/NGJrHez89MScHSz8cEXZmgTYHPgrdJ14vMgLq8MpxicZqvtdmlmcpOzhMFvRwiR
	wDRMTcxv+g7CCJnivzlYDQT3ZBE7gPIj1KfFWm7DyssF1k4G93c/3VZ2I75NtN9t
	lP9MS9AzmohPHoVNOyU6DvrDXAkQXcmnDKUIzp7shsHTcOrB3qRIyneKV+NIjPvA
	uQKTnEXGT1jwp/SVOSz61Xj5GacXWhu57nx223zhsQ==
X-ME-Sender: <xms:HU_QY_LcRc5G_JYvLol1xiTwqIz94VKbFtTZ_onmNwg03MajUMyBmg>
    <xme:HU_QYzKbTmtORcFD4-3uZy1Wjybw6HcrBUyDOlHaOioPgVIwYuSQD4Vdi42RQF6Bq
    lt2hbQuLXGngE_mEaM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvtddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:HU_QY3tYX7UFjvMA_1PxTPdmjlWBFUeJpyQiB8c4B3ZPUnhhYkdFpw>
    <xmx:HU_QY4aaXmMHWLG36waoBLfHIsMEICjL27JggXsoYzcJHWo4wI-6Iw>
    <xmx:HU_QY2bz5zHRAx7FjjihA1kVqjEEW-t9sWz6uy-DC5G68I4-pqgYfg>
    <xmx:Hk_QY_DpUvD_JlTxUHU_4e7N1-qZR0qlKlHB8HmHNzA_sSqJauaoPg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ABEC7B60089; Tue, 24 Jan 2023 16:35:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <51126fc9-6b8a-47c7-9b69-50e5fe9376cc@app.fastmail.com>
In-Reply-To: 
 <167459588964.12731.7302577492098297722.git-patchwork-notify@kernel.org>
References: <20230124110213.3221264-1-alexander.stein@ew.tq-group.com>
 <167459588964.12731.7302577492098297722.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 22:35:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
List-Id: <linux-soc.lore.kernel.org>
To: patchwork-bot+linux-soc <patchwork-bot+linux-soc@kernel.org>,
 "Alexander Stein" <alexander.stein@ew.tq-group.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org
Subject: Re: [PATCH v3 00/10] TQMLS1021A support
Content-Type: text/plain

On Tue, Jan 24, 2023, at 22:31, patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
>
> This series was applied to soc/soc.git (for-next)
> by Arnd Bergmann <arnd@arndb.de>:
>
> On Tue, 24 Jan 2023 12:02:03 +0100 you wrote:
>> Hi,
>> 
>> thanks everyone for the feedback. This is the third round of this series to
>> add support for the TQMLS1021A using the MBLS1021A mainboard.
>> The changelog is included in the individual patches.
>> 
>> Best regards,
>> Alexander
>> 
>> [...]
>
> Here is the summary with links:
>   - [v3,01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
>     (no matching commit)
>   - [v3,02/10] ARM: dts: ls1021a: add TQ-Systems MBLS102xA device tree
>     (no matching commit)
>   - [v3,03/10] ARM: dts: ls1021a: add TQMLS1021A flash partition layout
>     (no matching commit)
>   - [v3,04/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS 
> TM070JVHG33 overlay
>     (no matching commit)
>   - [v3,05/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA HDMI overlay
>     (no matching commit)
>   - [v3,06/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH 
> DC44 overlay
>     (no matching commit)
>   - [v3,07/10] ARM: dts: ls1021a: add TQMLS1021A/MBLS102xA LVDS CDTECH 
> FC21 overlay
>     (no matching commit)
>   - [v3,08/10] ARM: multi_v7_defconfig: Add options to support 
> TQMLS102xA series
>     https://git.kernel.org/soc/soc/c/af8bd008315a
>   - [v3,09/10] kbuild: Add config fragment merge functionality
>     https://git.kernel.org/soc/soc/c/a400c287ce98
>   - [v3,10/10] ARM: add multi_v7_lpae_defconfig
>     https://git.kernel.org/soc/soc/c/e9faf9b0b07a
>

To clarify: only the last three patches are in the soc/defconfig
branch, the dts patches are not yet applied.

      Arnd
