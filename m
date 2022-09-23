Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44020C6FA90
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 241FAC43470; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B5CAC433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=VJqEr8dCY+4CPOJOj32v9gM0er+RPaUrxpfPduZDdD4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=H0vYAQBPvfDOxKGciq213FOvEmmH7G9Eyw5T5fuwZNCJ+OJlCbOAfVm5De0GMtZGq
	 kSju3ohNdUs96osGaDYFGQyDJk+UQavbmCB13jLnbAKyZLJC+rW1wtKpXdMTrs2BFJ
	 DNQwhxGgyWp+bhNgKb4eL7kBcRDFk5Wj2qe1BCH7HuTBPTHWBeo45MZP9WXjUs0FQW
	 0fe7P3eFdA1NFQr4Wmv6l4/uPBPvEWvT5gXGjDhSBfTA5g8gA4EbLgKLO7mbkTLc5Y
	 jmQu76uTQ9b9O1BoVUWJKs3t4z+FmFoCM9m57RxcHnAw8Y++pU4hBsS9rLAGH0Edpy
	 pxDH9egdp8luQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB1CAE4D03B;
	Fri, 23 Sep 2022 14:52:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472789.12526.4162593674268442054.git-patchwork-summary@kernel.org>
Date: Fri, 23 Sep 2022 14:52:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] i.MX DT bindings update for 6.1
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677941
  Lore link: https://lore.kernel.org/r/20220918092806.2152700-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/4] i.MX DT bindings update for 6.1
             [GIT,PULL,3/4] i.MX device tree change for 6.1
             [GIT,PULL,4/4] i.MX arm64 device tree update for 6.1

Patch: [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.0
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679062
  Lore link: https://lore.kernel.org/r/20220921142939.1310163-1-andersson@kernel.org

Series: [GIT,PULL,1/6] soc/tegra: Changes for v6.1-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677602
  Lore link: https://lore.kernel.org/r/20220916101957.1635854-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] soc/tegra: Changes for v6.1-rc1
             [GIT,PULL,4/6] dt-bindings: Changes for v6.1-rc1
             [GIT,PULL,5/6] arm64: tegra: Device tree changes for v6.1-rc1

Patch: [GIT,PULL] Allwinner drivers fixes for 6.0
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677986
  Lore link: https://lore.kernel.org/r/YyeN0m78+m9nNEah@kista.localdomain

Series: Renesas SoC updates for v6.1 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678182
  Lore link: https://lore.kernel.org/r/cover.1663588772.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM DT updates for v6.1 (take two)

Patch: [GIT,PULL] arm64: dts: MediaTek updates for v6.1
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678139
  Lore link: https://lore.kernel.org/r/3b915692-c8a9-c508-5a4a-0fdb49355e99@gmail.com

Patch: [GIT,PULL] Qualcomm ARM DTS updates for 6.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679184
  Lore link: https://lore.kernel.org/r/20220921222619.1338380-1-andersson@kernel.org

Patch: [GIT,PULL] SoC fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676837
  Lore link: https://lore.kernel.org/r/pull-1663140667-273537@atomide.com

Patch: [GIT,PULL] Qualcomm ARM64 DTS updates for 6.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679195
  Lore link: https://lore.kernel.org/r/20220921234854.1343238-1-andersson@kernel.org

Patch: [GIT,PULL] TI K3 device tree updates for v6.1
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679059
  Lore link: https://lore.kernel.org/r/44729b46-27f9-94a0-17ed-8868649a4a0a@ti.com

Patch: [GIT,PULL] Allwinner device tree changes for 6.1
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677990
  Lore link: https://lore.kernel.org/r/YyePKDnOeP8Tdt5n@kista.localdomain

Patch: [GIT,PULL,1/1] Broadcom drivers fixes for 6.0
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677983
  Lore link: https://lore.kernel.org/r/20220918205038.3017866-1-f.fainelli@gmail.com


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


