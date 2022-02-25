Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAA3C4332F
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF6E8C340F3; Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4C31C340E7
	for <soc@kernel.org>; Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809662;
	bh=F9Fur3cXaxDzrpo7PZm+GHrHwjwdZMYASjHUE2FbjrE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Z1oSGqXRe3CU1bAnFW/le7tBmNGfH3ZAFW4dpnv9swKqm6/QgYKZ432q9nSXBil+f
	 eL7162GinLy1WgfY+m8EpNNQ7wXJyDplNb7Tf9mQaYhhfHIYrdLgy1bUUK/DGfZH3G
	 QXpnYdK1jxv0mu85WBgYjad4eJRqigAc7xv1OCBY3mk7XtoyOX8n2YI2LOcKAk4eoQ
	 XPWE0DsOmaVVVolsYPMjeqFxcd1LeCpwgAt0Jste+/EovmZZGyt2Beg7noWdPnq/Jp
	 564wpVyfD0Kfqx2nCY7T0OhfwuMHfBvsO37ESZhF166BelRO8Ui8uRFV2iUWfVwrqK
	 q2iXR/EfEzu/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1F0CE6D453;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966266.15608.13305451591228338923.git-patchwork-summary@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: at91: defconfig for 5.18
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617970
  Lore link: https://lore.kernel.org/r/20220225113220.51401-1-nicolas.ferre@microchip.com

Series: [GIT,PULL,1/6] i.MX drivers update for 5.18
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=616607
  Lore link: https://lore.kernel.org/r/20220222075226.160187-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers update for 5.18
             [GIT,PULL,2/6] i.MX SoC update for 5.18
             [GIT,PULL,3/6] i.MX dt-bindings change for 5.18
             [GIT,PULL,4/6] i.MX arm device tree change for 5.18
             [GIT,PULL,5/6] i.MX arm64 device tree change for 5.18
             [GIT,PULL,6/6] i.MX defconfig change for 5.18

Series: [GIT,PULL,1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613462
  Lore link: https://lore.kernel.org/r/20220211112556.98940-1-dinguyen@kernel.org
    Patches: [GIT,PULL,1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1

Series: Renesas SoC updates for v5.18
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613503
  Lore link: https://lore.kernel.org/r/cover.1644587197.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.18
             [GIT,PULL,2/4] Renesas ARM DT updates for v5.18
             [GIT,PULL,3/4] Renesas driver updates for v5.18
             [GIT,PULL,4/4] Renesas DT binding updates for v5.18

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v5.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=616879
  Lore link: https://lore.kernel.org/r/20220222201742.3338589-1-sudeep.holla@arm.com

Patch: [GIT,PULL] ARM: dts: mstar: updates for v5.18
  Submitter: Romain Perier <romain.perier@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=615081
  Lore link: https://lore.kernel.org/r/20220216193131.59794-1-romain.perier@gmail.com

Patch: [GIT,PULL] Devicetree changes for omaps for v5.18
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617058
  Lore link: https://lore.kernel.org/r/pull-1645606669-127734@atomide.com

Patch: [GIT,PULL] Rockchip driver changes for 5.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617770
  Lore link: https://lore.kernel.org/r/9977257.a15B8eIVjX@phil

Patch: [GIT,PULL] AMDTEE simplification for v5.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=615837
  Lore link: https://lore.kernel.org/r/20220218175632.GA926082@jade

Patch: [GIT,PULL] ARM: nuvoton: devicetree changes for 5.18
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=616210
  Lore link: https://lore.kernel.org/r/CACPK8XdjF6dG04hR+iMpUP8=LSJi5x-hRivgCGDaY7o_461eJw@mail.gmail.com

Patch: [GIT,PULL] Rockchip dts32 changes for 5.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617769
  Lore link: https://lore.kernel.org/r/19595245.eudUkVceaq@phil

Patch: [GIT,PULL] STM32 DT changes for v5.18 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618070
  Lore link: https://lore.kernel.org/r/893924a9-bcc4-9fa9-4f8e-7f56e77f6854@foss.st.com

Patch: [GIT,PULL] ARM: at91: dt for 5.18
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617961
  Lore link: https://lore.kernel.org/r/20220225110735.18080-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] Ux500 DTS updates for v5.18
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613619
  Lore link: https://lore.kernel.org/r/CACRpkdaDcEqtSnWzRBnBHVweh2n=Dj3meHG9LND+K0Czb9ORGg@mail.gmail.com

Patch: [GIT,PULL] tee: shared memory updates for v5.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=615856
  Lore link: https://lore.kernel.org/r/20220218184802.GA968155@jade

Patch: [GIT,PULL] Renesas ARM DT updates for v5.18 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618037
  Lore link: https://lore.kernel.org/r/cover.1645795643.git.geert+renesas@glider.be

Patch: [GIT,PULL] IXP4xx spring cleaning patches
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613757
  Lore link: https://lore.kernel.org/r/CACRpkdahK-jaHFqLCpSqiXwAtkSKbhWQZ9jaSo6rRzHfSiECkA@mail.gmail.com

Patch: [GIT,PULL] ARM: at91: soc for 5.18
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617982
  Lore link: https://lore.kernel.org/r/20220225121943.71494-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] arm64: dts: juno: Update for v5.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=616880
  Lore link: https://lore.kernel.org/r/20220222201812.3338619-1-sudeep.holla@arm.com

Patch: ARM: mstar: Select ARM_ERRATA_814220
  Submitter: Daniel Palmer <daniel@0x0f.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617019
  Lore link: https://lore.kernel.org/r/20220223064807.261878-1-daniel@0x0f.com

Series: Renesas SoC updates for v5.18 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617952
  Lore link: https://lore.kernel.org/r/cover.1645784465.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM DT updates for v5.18 (take two)
             [GIT,PULL,2/2] Renesas driver updates for v5.18 (take two)

Patch: [GIT,PULL] Rockchip dts64 changes for 5.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=617768
  Lore link: https://lore.kernel.org/r/6456947.djgVdjDsCv@phil

Patch: [GIT,PULL] IXP4xx DTS changes for v5.18
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613792
  Lore link: https://lore.kernel.org/r/CACRpkdaMk+XECwhXJYeiF8SMU6cQsj_dk8gGMoPE3zAURAPqTw@mail.gmail.com


Total patches: 32

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


