Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9C2EB64D8
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9CEC6C433CB; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80937C433C8
	for <soc@kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=QQBSYAqL51ovwz5wE3z4AyBtF+nRHpAfWyg5vuLEOKU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=A+XHXVysI8uVyD4ETAZ+dLTNyLSaz9RUxkO8+yO9sNYeK0setej6C9r7/+bZve65L
	 46itZPKp76ilzuSLBfTAcgUsdhyfdJtEniYe00z0IANqVaDMRHUMKOJ0pkrGuKx2kk
	 lAH52tqvO/kcgwsFzOocoIOPzq6HpFtYLbPHej4gSc5vUPpib4oG7zpVy4KZXXSrXR
	 9GprZovfkxJGO8HHx9SNCSbLkDMo4VXZhgetsDbU78+EM6bvglwujWneTl4Bmph5YU
	 E+j4RRYx0w7TCD27qo4eUVL2zCrYUQYSAu9c0Xd1JfLEkmcsmS3mCUcYZCo4MknumP
	 9BPfzQy83mDYw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57995C395C7;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943627.9834.12466343415967169923.git-patchwork-summary@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] : soc: mediatek: Updates for v6.5
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757558
  Lore link: https://lore.kernel.org/r/1ed1e5ae-6305-e63a-84a0-3c43f69c8f8b@gmail.com

Series: [GIT,PULL,1/6] soc/tegra: Changes for v6.5-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755850
  Lore link: https://lore.kernel.org/r/20230609193620.2275240-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] soc/tegra: Changes for v6.5-rc1
             [GIT,PULL,2/6] firmware: tegra: Changes for v6.5-rc1
             [GIT,PULL,4/6] memory: tegra: Changes for v6.5-rc1
             [GIT,PULL,5/6] PCI: tegra: Changes for v6.5-rc1

Patch: [GIT,PULL] AT91 DT updates for 6.5 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759035
  Lore link: https://lore.kernel.org/r/20230621093853.1575312-1-claudiu.beznea@microchip.com

Series: [GIT,PULL,1/2] soc: ti: Updates for v6.5
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757567
  Lore link: https://lore.kernel.org/r/20230615164127.qcgwrbwpmclx5wlm@landscape
    Patches: [GIT,PULL,2/2] arm: dts: Keystone2 updates for v6.5
             [GIT,PULL,1/2] soc: ti: Updates for v6.5

Patch: [GIT,PULL] More Qualcomm driver updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757557
  Lore link: https://lore.kernel.org/r/20230615163104.1461905-1-andersson@kernel.org

Series: [GIT,PULL,1/2] arm64: defconfig: TI K3 updates for v6.5
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757547
  Lore link: https://lore.kernel.org/r/97a49740-32e7-f899-d153-743b5a57eba7@ti.com
    Patches: [GIT,PULL,1/2] arm64: defconfig: TI K3 updates for v6.5

Patch: [GIT,PULL] More Qualcomm ARM64 defconfig updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757533
  Lore link: https://lore.kernel.org/r/20230615154119.1460952-1-andersson@kernel.org

Patch: [GIT,PULL] defconfig: mediatek: Updates for v6.5
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757555
  Lore link: https://lore.kernel.org/r/92e336ca-bbbb-6d6c-297a-13deaae4138b@gmail.com

Patch: [GIT,PULL,v2] ARM: Move dts files to vendor sub-directories
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759250
  Lore link: https://lore.kernel.org/r/20230621185025.GA3197738-robh@kernel.org

Patch: [GIT,PULL] Qualcomm driver updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756034
  Lore link: https://lore.kernel.org/r/20230611010044.2481875-1-andersson@kernel.org

Series: [GIT,PULL,1/4] i.MX dt-bindings for 6.5
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755939
  Lore link: https://lore.kernel.org/r/20230610072530.418847-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/4] i.MX dt-bindings for 6.5
             [GIT,PULL,4/4] i.MX defconfig changes for 6.5


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


