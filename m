Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B16C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF73EC340F5; Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA388C340EB
	for <soc@kernel.org>; Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757014;
	bh=+aW1aB5X7gLW/5nLQunzVSI0mpxonY1e3wNo0XvW76c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=hIBmM9pxLiP4O7IwEyuK7yiEsTeqEeXN5ggZCi12vocQcKUHZOryD8ccfA8mZS0nQ
	 mv170vC8XYiYIbOrA82llqv2E6UTqDOECNELD4w8guEIW1EiETSoNCqzSvBVd2axEn
	 ralc7Rn5RMbc5DXKsWztzI2EzUd78Fg9Usqvv1t4wCB0h/P1QdBaNSiZXXMC68aCKt
	 kRbVyRg7KT8tEaBKJiKKIv8KrXQpOAqqfXKUsXWkHydegJBxbx8PjUcTBF/elBbjwP
	 ZKDSF4XGq3X8YKnAd/FAoOkWVJOEG5+MeS8xONutUURprLD9Toun6X0Q+X35frcbNw
	 NYwyyJQO9sLxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5BF2E6D3DD;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701456.9628.10151230982542269838.git-patchwork-summary@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: arm64: defconfig: enable Layerscape SFP driver
  Submitter: Michael Walle <michael@walle.cc>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=620511
  Lore link: https://lore.kernel.org/r/20220304202124.3401165-1-michael@walle.cc

Series: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 5.18
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=621161
  Lore link: https://lore.kernel.org/r/20220307194817.3754107-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 5.18
             [GIT,PULL,3/4] Broadcom devicetree-arm64 changes for 5.18

Patch: [GIT,PULL] arm64: zynqmp: Xilinx DT changes for v5.18
  Submitter: Michal Simek <michal.simek@xilinx.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=620020
  Lore link: https://lore.kernel.org/r/19464dc6-eca9-f9a7-8aba-43af094d7c37@xilinx.com

Patch: [GIT,PULL] ARM: at91: defconfig for 5.18 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=620396
  Lore link: https://lore.kernel.org/r/20220304144746.23779-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] ARM: at91: dt for 5.18 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=620417
  Lore link: https://lore.kernel.org/r/20220304160036.27392-1-nicolas.ferre@microchip.com

Patch: arm: multi_v5: enable configs for versatile
  Submitter: Anders Roxell <anders.roxell@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=621471
  Lore link: https://lore.kernel.org/r/20220308121933.3967868-1-anders.roxell@linaro.org

Patch: [GIT,PULL] ARM: at91: soc for 5.18 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=620391
  Lore link: https://lore.kernel.org/r/20220304144216.23340-1-nicolas.ferre@microchip.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


