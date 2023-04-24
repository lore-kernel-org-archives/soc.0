Return-Path: <SRS0=VwEy=AP=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4664C7618E
	for <soc@archiver.kernel.org>; Mon, 24 Apr 2023 20:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 769F2C4339B; Mon, 24 Apr 2023 20:59:17 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 936C0C433D2
	for <soc@kernel.org>; Mon, 24 Apr 2023 20:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 936C0C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7C95D5C0181;
	Mon, 24 Apr 2023 16:59:14 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 24 Apr 2023 16:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1682369954; x=1682456354; bh=YZR03TenSPMwHMOQYMC6jZ6OC
	YtJLxUpls1rXekOnhQ=; b=hkPdVoGlfSNfE2YMdriSSkg3sF4pblK8hsqReIbeZ
	0OUe8EGuVszpcJEqBWGLUrPy0dBXROzDSDOo5eLwDawjQY28YRw2MHYoyvKzks7B
	Dhqwv8GMSXSYQ+3CQBctyo+8srzNFdhVtczAdEo1hle0cPLryd7wxGl0KM26IXBb
	jFOSD1yrxdN8LKfSPllnp3YxNze3/k+5e2jRhV3Ba9LjjVTEcunWJlg0bH88xJ+c
	/52+N3YhfkYNs4ANDgHPyQQuqfqVE87Sa0HzSNH6qJPzJ6a4dTKSpEdYnkmYi8UU
	CdnHjYW6sbm8M36TkE4dWqJqUhGFnnaXqYqvmoUken9DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682369954; x=1682456354; bh=YZR03TenSPMwHMOQYMC6jZ6OCYtJLxUpls1
	rXekOnhQ=; b=exuXq+0yr8hllOhiHFcN4UzkKKZOdgKWNvbu2jlVVcS3u3vsuL5
	x2aCxgc+MIcaeRWDd52nA7BOf5VUumxGptUviunxvvSF4RgYZx56TE+2iM9d9FpS
	+18hpfoF59i9wSD+xPjzGikdiKh8se+Mulyz8V/Npd5FKDCzyOM6KyNQQExQ8z6z
	gscQv+tCHcLVZa3A/aaGCMcxmi8a4or4e7XJOmk5CK/d1FtgRLvRSZXa4KeOvJYy
	NsdobVXc5xxz/i0Cj3Y//wsq+8aX8tJxSVelaOz5n7q1cJitr+gbttFZI1b+iyNJ
	HvKkKNilGmULR/BV4AwYeXS51nzWPT812Dw==
X-ME-Sender: <xms:ou1GZDUF0TKNWeOwNWL4wXjiPoJzdhBpToAFEePkrBFGY0qCA47Nhg>
    <xme:ou1GZLnxfnioANqg4gyHTpjE3y6IVJ8BBn2CEOVVmEi4MHDuZYUlTV9b3Pg-w-Z2-
    Aw6PTZIagz0GzTaN0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeeuhfffffdvkefhiedvhfdthfeuvedtfffhheejieefkeeggeeuudegfeehudff
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ou1GZPZ5JZdgmmBCJa0I5vnqgYoF4y-l5yB1RGh_QAqzem24G1sBNg>
    <xmx:ou1GZOVdMw452z83DcEo6XDvj7cmiY1qrtFzH1gboU_eSTWGU4iVgQ>
    <xmx:ou1GZNl8mpPr5JLZn1Ph4vYgs9q5GTEYVD_aT638Oh1BTxNmPjuelg>
    <xmx:ou1GZNtgYKTlHXcPwaqfBE_UmYJ7NQKpqFPMOXS0SfFhM6nco2Bsdg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F3FF6B60086; Mon, 24 Apr 2023 16:59:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com>
Date: Mon, 24 Apr 2023 22:58:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL 0/4] SoC branches for 6.4
Content-Type: text/plain

At 1062 non-merge commits, this is another large merge window for the
SoC tree with the largest chunk coming from the Qualcomm tree, and 80%
of the total is just devicetree changes.

There are a couple of new SoCs, but all of them are just variations of
other ones we already supported. We had submissions for several entirely
new SoC families, all of which ended up not being ready, so they are
not included.

There were 206 contributors, and the most of active of them by number
of commits are:

    131 Krzysztof Kozlowski
     75 Konrad Dybcio
     54 Manivannan Sadhasivam
     44 AngeloGioacchino Del Regno
     36 Neil Armstrong
     30 Bartosz Golaszewski
     27 Rob Herring
     25 Philippe Schenker
     24 Geert Uytterhoeven
     21 Marek Vasut
     18 Douglas Anderson
     14 Oleksij Rempel
     14 Janne Grunau
     14 Cristian Ciocaltea
     13 Stefan Wahren
     12 Peng Fan
     12 Johan Hovold
     11 Kathiravan T
     11 Conor Dooley
     10 Sebastian Krzyszkowiak
     10 Alexandre Mergnat

and the dirstat is:

   0.2% Documentation/devicetree/bindings/arm/msm/
   0.1% Documentation/devicetree/bindings/arm/tegra/
   0.5% Documentation/devicetree/bindings/arm/
   1.0% Documentation/devicetree/bindings/clock/
   0.1% Documentation/devicetree/bindings/firmware/
   0.1% Documentation/devicetree/bindings/soc/amlogic/
   0.1% Documentation/devicetree/bindings/soc/imx/
   0.1% Documentation/devicetree/bindings/soc/
   0.3% Documentation/devicetree/bindings/
   0.1% Documentation/staging/
  18.6% arch/arm/boot/dts/
   0.2% arch/arm/configs/
   0.2% arch/arm/mach-mv78xx0/
   0.1% arch/arm/mach-omap2/
   0.3% arch/arm/mach-oxnas/
   0.4% arch/arm/
   1.8% arch/arm64/boot/dts/amlogic/
   4.5% arch/arm64/boot/dts/apple/
   0.3% arch/arm64/boot/dts/broadcom/bcmbca/
  12.9% arch/arm64/boot/dts/freescale/
   0.3% arch/arm64/boot/dts/marvell/
   4.4% arch/arm64/boot/dts/mediatek/
   1.1% arch/arm64/boot/dts/nvidia/
  20.5% arch/arm64/boot/dts/qcom/
   4.3% arch/arm64/boot/dts/renesas/
   2.7% arch/arm64/boot/dts/rockchip/
   1.5% arch/arm64/boot/dts/sprd/
   5.9% arch/arm64/boot/dts/ti/
   0.1% arch/arm64/boot/dts/
   0.1% arch/arm64/configs/
   0.1% arch/riscv/boot/dts/allwinner/
   2.0% arch/riscv/boot/dts/starfive/
   0.1% drivers/bus/
   0.1% drivers/edac/
   0.2% drivers/firmware/arm_scmi/
   0.1% drivers/firmware/
   0.1% drivers/mailbox/
   1.8% drivers/soc/bcm/brcmstb/pm/
   1.8% drivers/soc/mediatek/
   0.1% drivers/soc/microchip/
   3.6% drivers/soc/qcom/
   0.1% drivers/soc/tegra/
   0.1% drivers/soc/ti/
   0.2% drivers/soc/
   0.7% drivers/tee/optee/
   0.1% drivers/
   2.4% include/dt-bindings/clock/
   0.8% include/dt-bindings/reset/
   0.2% include/linux/soc/mediatek/
   0.1% include/linux/soc/qcom/
   0.1% include/
