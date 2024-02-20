Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515EBC5475B
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1476FC433C7; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3D78C43390
	for <soc@kernel.org>; Tue, 20 Feb 2024 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463502;
	bh=S1Pu94T+NeNNu47iAqsCLnvFzX6H4AtnFpvmVBp9cHY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KZqVsJ8Tkp5sU7Mum6Qj4xOlsfJo38IOjqS0cqGTAqwqjRPjQEoPCQGz7ZRDvWyzV
	 jYi6nvNjmHFMxC8Q6IMxIRGxG0CNMa7t+oB9VsIeXjBgDaA1RTKg6FxUdA5aRFweti
	 2c8eooX+hSShH+IWjvTY/ZApZ2/YGtzCY7JhpgITKH099T9zvP5SSEfbGMnd8SboRy
	 gwV5VKsCTl2d/WhX+8V+/fBzqceVqJZA63ET1/jzSiKV9bzxPCx+6UQlwibRnfGITM
	 6uWwq80VoxrctmPW1Zz0gwsF2g1uUs0Fvu4u74BI1HRIvNt4SCQzX3ERjbXO7ztRAp
	 g2XOTEarBxNzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB955D990CD;
	Tue, 20 Feb 2024 21:11:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846350184.4365.18252009577961394399.git-patchwork-summary@kernel.org>
Date: Tue, 20 Feb 2024 21:11:41 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.8
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=825778
  Lore link: https://lore.kernel.org/r/2450634.jE0xQCEvom@phil

Series: dts: Fix dtc interrupt warnings
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=825772
  Lore link: https://lore.kernel.org/r/20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org
    Patches: [1/6] arm64: dts: freescale: Disable interrupt_map check
             [2/6] arm: dts: Fix dtc interrupt_provider warnings
             [3/6] arm64: dts: Fix dtc interrupt_provider warnings
             [4/6] arm: dts: Fix dtc interrupt_map warnings
             [5/6] arm64: dts: qcom: Fix interrupt-map cell sizes
             [6/6] dtc: Enable dtc interrupt_provider check

Patch: [GIT,PULL] i.MX fixes for 6.8
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=823632
  Lore link: https://lore.kernel.org/r/20240206151744.2459-1-shawnguo2@yeah.net

Patch: ARM: ep93xx: Add terminator to gpiod_lookup_table
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=823101
  Lore link: https://lore.kernel.org/r/20240205102337.439002-1-alexander.sverdlin@gmail.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


