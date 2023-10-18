Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285ACCDB483
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC2B5C433D9; Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D302FC433C8
	for <soc@kernel.org>; Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643633;
	bh=vRExftAdefBHzfu4MLeq+iTKyZ+YT0MzMPcTx3cne0w=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FwiId3RssWY7ahx9OQK2e2gb62xSa9UD4V0kXV83lgj/uh08HR7zr+/JykNWGjdmP
	 VY3r0jmboCKbZSOv3h+WR31mNpXcdBDuaulE4bdVOaX73kM8kTX7LM0UA/iZELMA1i
	 mUmbQi9Cb0w8D35j4WwsyyGZXCJq+GDOJh73kKX+DHeKNA/72OjFiV4yIrB4DAlaDy
	 Jjf+3WdnKfLthzAUVFVxXk6hMLdie8zvxpSHXJy0OTtQ5L+koFCWvaYI5mRqLgCQFt
	 QXDv6PGQCR1ghKabeyOFQkkfTi3GSjwczCBkZCAfn3cYb3eGlIF5GgqqOmWl0HM/5D
	 GngZ4m0Ae5Hhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7476C04E24;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764363374.8197.16730191932296029310.git-patchwork-summary@kernel.org>
Date: Wed, 18 Oct 2023 15:40:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm driver updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793331
  Lore link: https://lore.kernel.org/r/20231015204014.855672-1-andersson@kernel.org

Patch: arm/arm64: dts: Removed undocumented and unused "pl022,hierarchy" property
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788618
  Lore link: https://lore.kernel.org/r/20230928190859.1072420-1-robh@kernel.org

Patch: [GIT,PULL] Rockchip dts32 changes for 6.6 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793717
  Lore link: https://lore.kernel.org/r/2167992.Mh6RI2rZIc@phil

Series: Renesas SoC updates for v6.7
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788761
  Lore link: https://lore.kernel.org/r/cover.1695985418.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7
             [GIT,PULL,2/5] Renesas ARM SoC updates for v6.7

Patch: [GIT,PULL] Rockchip dts64 changes for 6.7
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793715
  Lore link: https://lore.kernel.org/r/1870252.CQOukoFCf9@phil

Patch: [GIT,PULL] RISC-V Devicetrees for v6.7
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793598
  Lore link: https://lore.kernel.org/r/20231016-filing-payroll-7aca51b8f1a3@spud

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=794184
  Lore link: https://lore.kernel.org/r/pull-1697606314-911862@atomide.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


