Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23884C47082
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F34AA6141D; Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DC0A461408
	for <soc@kernel.org>; Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934025;
	bh=q2GJBqTQZmFjX/GJqFhPugT85yQhQqViBofSU32bdYU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FWmB89VI6gFJT1V7zI6LlgUyheRM8SJVIjRw0ZBQC+OEtdKe7zD8eHGW+LPH40TWd
	 6JlEN2I5IEV3zFirA5JjEPTkogCD9S4eha0es/Po3TJiuGTufEEDpBef1Au+46e/+D
	 nY/yBcoJySGqDhfiqe0N0FYefRVc/MxgCgaisHwAZyUg/RQbRoh7nM0PWcRp4GU227
	 bQc3GzLB5FqCFIcc1PVHzkLXM35+kRWedkzOLgrab8NZipRJ4x3cMm/NBGgoj+OI8G
	 ZA/1Jp90yAHuvm4ruuygD+L5trePCL5lkQ/N5YSPk0tCCkmS0sYnhx/oUrBNinMVBc
	 WI7ykmF/aX+HA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D3F40609EF;
	Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402583.32315.7810806257785563449.git-patchwork-summary@kernel.org>
Date: Sat, 05 Jun 2021 23:00:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] ARM: SoC fixes for 5.13
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=486049
  Lore link: https://lore.kernel.org/r/CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com
Patch: [GIT,PULL] PM and build warning fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=492255
  Lore link: https://lore.kernel.org/r/pull-1622614772-543196@atomide.com
Patch: [GIT,PULL] SATA regresion fix for TI dra7 for v5.13
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=492241
  Lore link: https://lore.kernel.org/r/pull-1622613578-121536@atomide.com
Patch: [GIT,PULL] i.MX fixes for 5.13
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=489247
  Lore link: https://lore.kernel.org/r/20210527011758.GD8194@dragon
Patch: [GIT,PULL] amlogic fixes for v5.13-rc
  Submitter: Neil Armstrong <narmstrong@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=490963
  Lore link: https://lore.kernel.org/r/73e76706-f3f4-bebf-10dd-d2ec9106a234@baylibre.com
Patch: [GIT,PULL] arm64: dts: TI K3 fixups for v5.13 rc
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=484261
  Lore link: https://lore.kernel.org/r/20210518115634.467vgpbzplal5kou@obituary
Patch: [GIT,PULL] OP-TEE fix for v5.13
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=484189
  Lore link: https://lore.kernel.org/r/20210518100712.GA449561@jade

Total patches: 7

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


