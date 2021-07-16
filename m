Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD081C12002
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C0560613F7; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AA0E3613D8
	for <soc@kernel.org>; Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470525;
	bh=AIR4Ygpr9xidsIoSDG7BBWUAxATOUSoRZhANETuhMBs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=rmC6S5+sCKzSMjL5b3vdbqSSVDPPwyRasCQmCLztO5DlZ1VdQ3RPHyH+07Wh0rKG9
	 nV6tvQUOCH5m7ZwiETLCRepIrOKzVdvrSF/S03Iapj+8iRW+eAZd9TE7ekqMNxNRVh
	 kFLIi3/L1CJTiRKnfsZ7Ltf8PvHDh0g9BaSDIvQEuNgKeqR0lVwHR0BfyyomQRvfPw
	 CNIpIwg0SpuXZPaQ5TU41lhWB4dPJ1hKw64sKeZ8Q/l61KaYmlzldlGDYMB7cKfzQc
	 IATghanIHbSB1Vl/AvdgOlxV5FpoYM+AVDcwZoPn1SzsDh8OcCMc8afubAc0RTMIgp
	 /CABXy2CFwIVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9725260963;
	Fri, 16 Jul 2021 21:22:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052555.25202.13720827870642079502.git-patchwork-summary@kernel.org>
Date: Fri, 16 Jul 2021 21:22:05 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Series: [GIT,PULL,1/4] ARM: SoC changes for 5.14
  Submitter: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=513327
  Lore link: https://lore.kernel.org/r/20210709234054.10288-1-olof@lixom.net
    Patches: [GIT,PULL,1/4] ARM: SoC changes for 5.14
             [GIT,PULL,2/4] ARM: Devicetree material for 5.14
             [GIT,PULL,3/4] ARM: Drivers for 5.14
             [GIT,PULL,4/4] ARM: Defconfig changes for 5.14
Patch: [GIT,PULL] firmware: arm_ffa: Updates for v5.14(part 2)
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=507083
  Lore link: https://lore.kernel.org/r/20210625102807.206112-1-sudeep.holla@arm.com
Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v5.14-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=513163
  Lore link: https://lore.kernel.org/r/20210709150220.2543875-1-thierry.reding@gmail.com
Patch: [GIT,PULL] ARM: aspeed: devicetree fixes for 5.14
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=509473
  Lore link: https://lore.kernel.org/r/CACPK8XefdPzeOUDnDgk9cHQEs-9wF_ZSPdYQRzuNOpGZTyGUKQ@mail.gmail.com
Patch: [v2] arm: Typo s/PCI_IXP4XX_LEGACY/IXP4XX_PCI_LEGACY/
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515315
  Lore link: https://lore.kernel.org/r/82ce37c617293521f095a945a255456b9512769c.1626255077.git.geert+renesas@glider.be
Patch: ARM: configs: Update u8500_defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=513885
  Lore link: https://lore.kernel.org/r/20210712085522.672482-1-linus.walleij@linaro.org
Patch: [GIT,PULL] firmware: arm_ffa: fixes for v5.14
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515603
  Lore link: https://lore.kernel.org/r/20210714165806.2617325-1-sudeep.holla@arm.com
Patch: [GIT,PULL] Renesas fixes for v5.14
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515309
  Lore link: https://lore.kernel.org/r/cover.1626253929.git.geert+renesas@glider.be
Patch: ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
  Submitter: Stefan Wahren <stefan.wahren@i2se.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=513433
  Lore link: https://lore.kernel.org/r/1625915095-23077-1-git-send-email-stefan.wahren@i2se.com
Patch: ARM: configs: Update Integrator defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515439
  Lore link: https://lore.kernel.org/r/20210714122703.212609-1-linus.walleij@linaro.org
Patch: ARM: configs: Update RealView defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515285
  Lore link: https://lore.kernel.org/r/20210714090040.182381-1-linus.walleij@linaro.org
Patch: ARM: configs: Update Versatile defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515251
  Lore link: https://lore.kernel.org/r/20210714081819.139210-1-linus.walleij@linaro.org
Patch: ARM: configs: Update Vexpress defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=514781
  Lore link: https://lore.kernel.org/r/20210713133708.94397-1-linus.walleij@linaro.org
Patch: [v2] ARM: dts: versatile: Fix up interrupt controller node names
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=509631
  Lore link: https://lore.kernel.org/r/20210701132118.759454-1-sudeep.holla@arm.com
Patch: [GIT,PULL] firmware: arm_scmi: Updates for v5.14(part 2)
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=507085
  Lore link: https://lore.kernel.org/r/20210625102819.206172-1-sudeep.holla@arm.com
Patch: [GIT,PULL] firmware: arm_scmi: fixes for v5.14
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=515605
  Lore link: https://lore.kernel.org/r/20210714165831.2617437-1-sudeep.holla@arm.com

Total patches: 19

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


