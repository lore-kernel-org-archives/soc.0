Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AFFC352A1
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F6B1C43144; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E670CC433D7
	for <soc@kernel.org>; Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828261;
	bh=Td1nb/DouczEqqyBpfmPEazX79fOnbuR2P3F9nfr9Fc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=t606lMg63C00KqsA/FnHaatE2ZjEIGvoNw5DmIB1KrV9lJw6zT9JoXUS4ZMjV0rXE
	 6I3iz4ajKpDXgwi5hhANBAnY1gmid//8au8yzviayja5JITPl1zy4fPdDYo7gyH3bX
	 kCcZtuH1xfh8qQlIVRSpPzb6t8yqlDXhABkrzTD+QKO1W4Bt28i6m1qx6fhw5F7YPR
	 rwVtXgJjBDJ3BVINJ/gFOeF5Kx7B/SsHo+zY/WFV6KDrvMUL9IMeco0v9Oede+XM13
	 SwPkb4MoD8P59oS9cMzpBb4/OiZPiQkb5gNMeLErFZwoMLjrMdgfGplXoUmhb0hwac
	 jUBW2UtC5Ss9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C372FE21EF7;
	Wed, 30 Nov 2022 17:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826179.9936.9133844716271144018.git-patchwork-summary@kernel.org>
Date: Wed, 30 Nov 2022 17:11:01 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] Broadcom devicetree changes for 6.2
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=700206
  Lore link: https://lore.kernel.org/r/20221129191755.542584-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/3] Broadcom devicetree changes for 6.2
             [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.2
             [GIT,PULL,3/3] Broadcom drivers changes for 6.2

Patch: [GIT,PULL] Rockchip dts64 changes for 6.2 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698527
  Lore link: https://lore.kernel.org/r/4716610.aeNJFYEL58@phil

Patch: [GIT,PULL] Qualcomm ARM64 DTS updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698827
  Lore link: https://lore.kernel.org/r/20221124100650.1982448-1-andersson@kernel.org

Patch: [GIT,PULL] Apple SoC RTKit/SART updates for 6.2
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699671
  Lore link: https://lore.kernel.org/r/57f84134-8645-35f6-2427-ee683800c413@marcan.st

Patch: [GIT,PULL] arm64: dts: juno: Updates for v6.2
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=700058
  Lore link: https://lore.kernel.org/r/20221129115111.2464233-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Devicetree fixes for omaps for v6.2
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699050
  Lore link: https://lore.kernel.org/r/pull-1669363695-856423@atomide.com

Patch: [GIT,PULL] ARM: mvebu: dt for v6.2 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699533
  Lore link: https://lore.kernel.org/r/87cz979adf.fsf@BL-laptop

Patch: [GIT,PULL] Renesas ARM DT updates for v6.2 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698822
  Lore link: https://lore.kernel.org/r/cover.1669283381.git.geert+renesas@glider.be

Patch: [GIT,PULL] Devicetree related musb changes for omap3 for v6.2
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699053
  Lore link: https://lore.kernel.org/r/pull-1669364566-84575@atomide.com

Patch: [GIT,PULL] AT91 fixes for 6.1 #3
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699083
  Lore link: https://lore.kernel.org/r/20221125093521.382105-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL,v2] AT91 defconfig updates for 6.2 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699193
  Lore link: https://lore.kernel.org/r/20221125142736.385654-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] AT91 device tree updates for 6.2 #3
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699178
  Lore link: https://lore.kernel.org/r/20221125140525.384928-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.2 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699532
  Lore link: https://lore.kernel.org/r/87fse39aer.fsf@BL-laptop

Patch: arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl
  Submitter: Bhupesh Sharma <bhupesh.sharma@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699838
  Lore link: https://lore.kernel.org/r/20221128200834.1776868-1-bhupesh.sharma@linaro.org

Patch: Revert "ARM: dts: stm32: add fake interrupt propoerty for ASync notif - TEMP/TO REMOVE"
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=699716
  Lore link: https://lore.kernel.org/r/20221128133339.25055-1-alexandre.torgue@foss.st.com


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


