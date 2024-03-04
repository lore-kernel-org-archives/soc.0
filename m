Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2CAC54E49
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1CA9C433B1; Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC3D8C43390
	for <soc@kernel.org>; Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539274;
	bh=VjSVr6n4NEFrSijprIeO/Hxcv6Mbgvuai5N6mq/g6rc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=PeqYgF8P+Q1Z+plFPTZVsEcBIulTw+6AA5XSg17ncJOjRLRbmPt5b4ftIbywnAsu8
	 RUKtW7N7kAcf47PKf5njBvziFYvfnoMjYwe9UMVXgqhBxtAEu2ccvqtHj7L9jo1EM6
	 ueR+vr+q/vrarfXAYuFaRXsSlJcbRM49N0eQYDigpnDTCiU4hp1Cq/4WcyUUTIrb2y
	 F2vYWQif/Ikzu7eGSD7uU17U3uZSrspKm88vhuzIVjzVEhHnTIBhqe/baJyF25q9oq
	 6SP4apY5vFfliTkrIATcAeEbFNy4L3ye3VXqtOyEuLDmDwiRmA5Asup477VqGzueRd
	 HXY/pG0x35nLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B5296D88F87;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927468.27833.12737369581254687421.git-patchwork-summary@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip dts64 changes for 6.9 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831789
  Lore link: https://lore.kernel.org/r/3695004.ElGaqSPkdT@phil

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.9
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831763
  Lore link: https://lore.kernel.org/r/MA0P287MB2822315119DA51FF95EE3071FE5D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM

Patch: [GIT,PULL] Rockchip dts32 changes for 6.9 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831790
  Lore link: https://lore.kernel.org/r/3258282.tdWV9SEqCh@phil

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.9
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830521
  Lore link: https://lore.kernel.org/r/e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.9

Patch: [GIT,PULL] Devicetree changes for omaps for v6.9
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830552
  Lore link: https://lore.kernel.org/r/pull-1709102762-376748@atomide.com

Patch: [GIT,PULL] Renesas DT binding updates for v6.9 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831569
  Lore link: https://lore.kernel.org/r/cover.1709307006.git.geert+renesas@glider.be

Series: [GIT,PULL,1/5] i.MX SoC changes for 6.9
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829673
  Lore link: https://lore.kernel.org/r/20240226034147.233993-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX SoC changes for 6.9
             [GIT,PULL,2/5] i.MX dt-bindings for 6.9
             [GIT,PULL,3/5] i.MX ARM device tree for 6.9
             [GIT,PULL,4/5] i.MX arm64 device tree for 6.9

Patch: [GIT,PULL] Add PowerVR Series5 SGX GPUs for the TI SoCs
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829801
  Lore link: https://lore.kernel.org/r/pull-1708943489-872615@atomide.com

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829551
  Lore link: https://lore.kernel.org/r/20240225050146.484422-1-andersson@kernel.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.9
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830599
  Lore link: https://lore.kernel.org/r/1937f5ef-5d76-4259-931d-523c0e2f0a91@linaro.org

Patch: [GIT,PULL] STM32 DT changes for v6.9#1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831043
  Lore link: https://lore.kernel.org/r/a7ae1058-e24d-4a6b-900f-401f0e3ae17c@foss.st.com

Patch: [GIT,PULL] ARM: socfpga: update for v6.9
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829642
  Lore link: https://lore.kernel.org/r/20240226012528.20380-1-dinguyen@kernel.org

Patch: [GIT,PULL] Qualcomm ARM32 DeviceTree changes for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831931
  Lore link: https://lore.kernel.org/r/20240304033507.89751-1-andersson@kernel.org

Patch: [GIT,PULL] Allwinner device tree changes for 6.9
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829315
  Lore link: https://lore.kernel.org/r/20240223210408.GA9248@jernej-laptop

Patch: [GIT,PULL] arm64: ZynqMP DT changes for v6.9
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829855
  Lore link: https://lore.kernel.org/r/CAHTX3dLEoFMTGg1Q4+OuOwWYd8N73YBTXki8Vvj3cGHUpLJ0=A@mail.gmail.com

Patch: [GIT,PULL] amlogic ARM updates for v6.9
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830598
  Lore link: https://lore.kernel.org/r/b9c60991-65b3-4c80-bf43-b3bb95bea9e4@linaro.org

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.9 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831582
  Lore link: https://lore.kernel.org/r/87a5nihr8g.fsf@BL-laptop

Patch: [GIT,PULL] ARM: mvebu: dt for v6.9 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831581
  Lore link: https://lore.kernel.org/r/87cysehr9k.fsf@BL-laptop


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


