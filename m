Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0395EE021C
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA02CC4CEC6; Wed, 11 Sep 2024 09:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEEAC4CEC5
	for <soc@kernel.org>; Wed, 11 Sep 2024 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046444;
	bh=14LY9SlvoI5HaxelioYrmumeW9ykJBBpHLkNkeIJcno=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QphvP/1jDhVLBFMsNSQkfOn8rQieXrG15q9Xrj17MFXcrp5jtn7rCTH8iNAqY7cQ9
	 7F27zos67WqgIMHOrcOMd8EPLwbMnBGcfarfp/D/0QEARg5+EN7vTlWhZDDCkxnK5R
	 WuQs/baOVjYR0LejoRUEAvYdgSR4vgsQXCcZzfO6XZDUP4JZcndcOMBVp5gLdENm4k
	 mcuDaXTbDmuamf+cAkK4LSPo3taC/vrxaT8Cs0+6GgDabDJB0zoLyawmmmoOdhSDb+
	 Ui7xI8KUOjuQoMtF2Ga0ehV9/jdt+FXc7PXOSj/Pv4QWxM4NRd7Gao9WyX7ZXY/+gL
	 xYBmiUyuzP27g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B2F5F3822FA4;
	Wed, 11 Sep 2024 09:20:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604644522.555636.16699455715229709499.git-patchwork-summary@kernel.org>
Date: Wed, 11 Sep 2024 09:20:45 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] Broadcom devicetree changes for 6.12
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887863
  Lore link: https://lore.kernel.org/r/20240906180643.2275460-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom devicetree changes for 6.12
             [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.12
             [GIT,PULL,3/4] Broadcom drivers changes for 6.12
             [GIT,PULL,4/4] Broadcom soc changes for 6.12

Patch: [GIT,PULL] MediaTek driver updates for v6.12
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=888555
  Lore link: https://lore.kernel.org/r/bfa9ab87-9de8-41fc-bfd1-de5ec324cfe0@gmail.com

Patch: [GIT,PULL] MediaTek config updates for v6.12
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=888553
  Lore link: https://lore.kernel.org/r/ea168bd6-b54b-47d3-ba5d-e545a9b406c1@gmail.com

Series: [GIT,PULL,1/2] arm64: dts: minor improvements for v6.12
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887770
  Lore link: https://lore.kernel.org/r/20240906140513.71307-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: minor improvements for v6.12
             [GIT,PULL,2/2] ARM: dts: minor improvements for v6.12

Patch: [GIT,PULL] MediaTek arm64 DTS updates for v6.12
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=888554
  Lore link: https://lore.kernel.org/r/059656ad-5365-4097-86a1-f4ba43edf5da@gmail.com

Patch: [GIT,PULL] RISC-V config for v6.12
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=889085
  Lore link: https://lore.kernel.org/r/20240910-annex-ravage-07d63041a7c5@spud

Patch: firmware: imx: remove duplicate scmi_imx_misc_ctrl_get()
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=888585
  Lore link: https://lore.kernel.org/r/20240909203023.1275232-1-arnd@kernel.org


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


