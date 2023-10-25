Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0702C0032E
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2005C433D9; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B2FEC433C8
	for <soc@kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=G475z6rt3yrFjzgVQ3HIKR9+gQVCBE/tinOHVt+RpCM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=BODk2WaiOvTUCoJjwGOut/TjJsTJDYPHSIpPva04rnKLVPluMxHLQRoFukxZfAHJU
	 ZVdC4zQY1AxOVIPBhzpIZ7bH0N5pVPHGIQQmHnhVYCqvicuJSjgn2Pd7zoNygHXLyu
	 g2rGKGZ3njHWTrWthOBpC1289Ehgu03aufihuYZv3AC9wptFcPOCqvDNHxmj8otseq
	 +VKdg49/g4TKRa8NTgdolj4yVwWuopkIlUpZaV5EKrKoGxiQjZ9Rgpef7YZj40ziUG
	 rYxgm/Dkig2IDOqufk1okDzsJXpJwA4+RhBZOQ+zU3kJZ7uHNM3Le47THSePpF8q7C
	 OkigCHhpT3KEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 633EDE4CC0F;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882834.12441.1391871222916502173.git-patchwork-summary@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: dts: samsung: Second round for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796022
  Lore link: https://lore.kernel.org/r/20231024132615.65609-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] soc: ti: Driver updates for v6.7
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794408
  Lore link: https://lore.kernel.org/r/20231018165226.33x5cjn5jmgnm3di@magnolia

Series: [GIT,PULL,1/2] Broadcom devicetree changes for 6.7
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796084
  Lore link: https://lore.kernel.org/r/20231024155927.977263-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree changes for 6.7
             [GIT,PULL,2/2] Broadcom drivers changes for 6.7

Patch: [GIT,PULL] More Qualcomm driver updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796566
  Lore link: https://lore.kernel.org/r/20231025201109.1016121-1-andersson@kernel.org

Patch: [GIT,PULL] ARM: mvebu: arm for v6.7 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794795
  Lore link: https://lore.kernel.org/r/87zg0e8w4v.fsf@BL-laptop

Patch: [GIT,PULL] Rockchip dts64 changes for 6.7 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796146
  Lore link: https://lore.kernel.org/r/2777623.BEx9A2HvPv@phil

Patch: [GIT,PULL] arm64: dts: ti: K3: Second round of updates for v6.7
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=796114
  Lore link: https://lore.kernel.org/r/35a3c4c9-5c1b-4891-9ea2-e3f648a9afe0@ti.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


