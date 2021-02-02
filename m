Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16386C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:20:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DF04064F8C; Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C87AC64F50
	for <soc@kernel.org>; Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612286411;
	bh=cLjhWjih0ZmNXmA1VXtjBgW8Q7cX2m0b4LemPpqYJMs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=azHm/DBbi+AHyMG2TUxne5qrLiDR09rM4BR8sVTeuHFYwTZxB1NvMntc0xbSn+teq
	 LBE2oDIgvpcSWrMWaMIlMyQAqThhG5OTToVYOrgznEjg6gwy7W2NL9jK7DyZBhNuwl
	 fZwUiXs/cMIPkXJ/Hino1rA934m7gEl7u9Z0WoKIG9KZsgibVaOLGR0J0CwUAswQ6t
	 fuK6lj7LjovKJIIM4Vn6f30WDV86jC5NGsClNntUZW8KLfwq0zVTLJikkONFMv3RFG
	 gd5AvQtbAFYkfaTBngaimMxCUh98wHWRQ6097iQ7+RYKBBsyy0zXMmdIab+SIk/6T8
	 tX5+OiVb317dQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B1B20609D7;
	Tue,  2 Feb 2021 17:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161228641167.5662.218169174610095557.git-patchwork-summary@kernel.org>
Date: Tue, 02 Feb 2021 17:20:11 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [01/12] dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges property
  Submitter: Lubomir Rintel <lkundrak@v3.sk>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=418703
  Lore link: https://lore.kernel.org/r/20210121034130.1381872-2-lkundrak@v3.sk
    Patches: [01/12] dt-bindings: gpio: mrvl-gpio: Fix the gpio-ranges property
             [02/12] media: dt-bindings: marvell,mmp2-ccic: Allow power-domains property
             [03/12] ARM: dts: mmp2-olpc-xo-1-75: Fix memory node name
             [04/12] ARM: dts: mmp2-olpc-xo-1-75: Drop linux,usable-memory from /memory
             [05/12] ARM: dts: mmp3-dell-ariel: Drop linux,usable-memory from /memory
             [06/12] ARM: dts: mmp3: Extend the MPMU reg range
             [07/12] ARM: dts: mmp2: Use symbolic names for audio clocks
             [08/12] ARM: dts: mmp2-olpc-xo-1-75: Use symbolic names for audio clocks
             [09/12] ARM: dts: mmp3-dell-ariel: Add the embedded controller
             [10/12] ARM: dts: mmp3-dell-ariel: Add the power button node
             [11/12] ARM: dts: mmp3-dell-ariel: Replace SSP2 with spi-gpio
             [12/12] ARM: dts: mmp3: Fix the CCIC interrupts
Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.12 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=425513
  Lore link: https://lore.kernel.org/r/87pn1jn48s.fsf@BL-laptop
Patch: ARM: dts: ux500: Add Flash LEDs to Samsung phones
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=425217
  Lore link: https://lore.kernel.org/r/20210201091308.284465-1-linus.walleij@linaro.org
Patch: [GIT,PULL] ARM: mvebu: dt for v5.12 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=425511
  Lore link: https://lore.kernel.org/r/87sg6fn49o.fsf@BL-laptop

Total patches: 15

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


