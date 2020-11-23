Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25257C2D0E4
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EEFB32080A; Mon, 23 Nov 2020 16:52:16 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2E10C221FE;
	Mon, 23 Nov 2020 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150336;
	bh=ZbQO0wa84CKGmqS3FOl4uLA3+qgQpN0+P3FceI0HToQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXj/yv9uz5UzttE6VGWWc6FV1Xg1QQMrWsYmjHNRzvVeoNeszOwuGFUdjQCnccSsX
	 /+n8SE44mbIgPz1rdAJgxUkAtruQ6dWN3sY+11rUBXvZPc/XNBuMCeNeXwkjiSDPyv
	 J6/XM2g2xs/sgUQo5I/yZFZoPAzH5ZRUDdYTR5G8=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: mark.rutland@arm.com,
	soc@kernel.org,
	olof@lixom.net,
	benjaminfair@google.com,
	avifishman70@gmail.com,
	arm@kernel.org,
	joel@jms.id.au,
	robh+dt@kernel.org,
	yuenn@google.com,
	Tomer Maimon <tmaimon77@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: add Nuvoton NPCM730 device tree
Date: Mon, 23 Nov 2020 17:52:02 +0100
Message-Id: <160615031117.69876.2661433561026777420.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201119080002.100342-1-tmaimon77@gmail.com>
References: <20201119080002.100342-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 19 Nov 2020 10:00:02 +0200, Tomer Maimon wrote:
> Add Nuvoton NPCM730 SoC device tree.
> 
> The Nuvoton NPCN730 SoC is a part of the
> Nuvoton NPCM7xx SoCs family.

Applied to arm/dt, thanks!

[1/1] ARM: dts: add Nuvoton NPCM730 device tree
      commit: b2d91953b66c724eaf8d7f84f37c006d966f67ac

       Arnd
