Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D862C4332F
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EBD1C385C3; Mon,  9 May 2022 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09972C385BF
	for <soc@kernel.org>; Mon,  9 May 2022 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652132437;
	bh=JNtARnJmkCtI6vMC+4zU1PSbHZK5GgDb6hOWWpNgDsc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KeZYfHC15hmG/lFEfUL39HpPTaNrg/iOc5tLnx8+r1oYbHfNeCzRhoCQEfFWPXW0f
	 ++pLn+2iKzuZU0JsboKiZhVqXQkC6z1qTYzXvCxLxoeMezcQvCDEWlFoFCPmJIVv1i
	 ghIPlkfFcqZrVwktI5GpON9h7ZamtjGTM04JPodNDQO5Id28nFVPnltGvd6H3ywQ7s
	 y3D0ZZNsQkE0FO/gix873aXIdMerR4iekPJ/hoENRPs17pt5SRqMEZo3bv7kwiiqi4
	 6uvgfwtB0FtIcj8Y8+hDYXOm3ox5Ns7+rxk38Z3pLY5CXU4syiQZdt8B6X/ZoYdRED
	 S8ZSwogyw8uHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DB2A4F03876;
	Mon,  9 May 2022 21:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165213243681.32686.6224586222912918594.git-patchwork-summary@kernel.org>
Date: Mon, 09 May 2022 21:40:36 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] HiSilicon ARMv7 SoC updates for v5.19
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639350
  Lore link: https://lore.kernel.org/r/62762DF0.30602@hisilicon.com

Series: [GIT,PULL,1/2] TI SoC driver updates for v5.19
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639414
  Lore link: https://lore.kernel.org/r/20220507163424.pvqnwrxpoo73lmp2@debtless
    Patches: [GIT,PULL,1/2] TI SoC driver updates for v5.19
             [GIT,PULL,2/2] ARM: dts: TI K2 updates for v5.19

Series: [GIT,PULL,1/6] ARM: tegra: Core changes for v5.19-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639153
  Lore link: https://lore.kernel.org/r/20220506143005.3916655-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] ARM: tegra: Core changes for v5.19-rc1

Patch: ARM: configs: Enable audio on BeagleBone Black in multi_v7_defconfig
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639256
  Lore link: https://lore.kernel.org/r/20220506222646.1671474-1-broonie@kernel.org

Series: [GIT,PULL,1/5] i.MX dt-bindings update for 5.19
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=639455
  Lore link: https://lore.kernel.org/r/20220508033843.2773685-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/5] i.MX dt-bindings update for 5.19
             [GIT,PULL,2/5] i.MX drivers update for 5.19
             [GIT,PULL,5/5] i.MX defconfig update for 5.19


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


