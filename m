Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C71C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4BF0C340F6; Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF6D7C340E7
	for <soc@kernel.org>; Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646060417;
	bh=yzhUu1TVOiYBl5zhtRd9A1/HwFvHcurdqvdN8umR0W4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Sr3XqrwDgl5OWSkwefmf7qM8tOpvn3u7BAAs191PY8bGNY0pk4T6N0L9mieXevHni
	 YADCntojCjmaudu5hDsIV0S5ND+YFOh8Wdn9mzQ/1sLyxDK/CGFofoSjBrJxosFMDC
	 fI+R4q9B0ND5GHy4lWj1wsxaSHb7rMnTDwsRYEP7jFPPeJPbr4+gHju7Nz1YP4EluG
	 XL/XSLgLsoG7a894gw5SCJCEIyA1bUGGyttXvTEyxvd8XJ2PQ/KFzlLNgfNqP0EOFr
	 9OyvXdFtYybWu/vXbrbQ8y3CzhPF7d3TH9EiWaxFiWHcVq+cD9ccmGcLlpIHclBGgM
	 vqHfSXrDfJslQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD76CE6D4BB;
	Mon, 28 Feb 2022 15:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164606041763.949.3414399999883615142.git-patchwork-summary@kernel.org>
Date: Mon, 28 Feb 2022 15:00:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] soc/tegra: Changes for v5.18-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618103
  Lore link: https://lore.kernel.org/r/20220225164741.1064416-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/5] soc/tegra: Changes for v5.18-rc1
             [GIT,PULL,2/5] dt-bindings: Changes for v5.18-rc1
             [GIT,PULL,3/5] ARM: tegra: Device tree changes for v5.18-rc1
             [GIT,PULL,4/5] arm64: tegra: Device tree changes for v5.18-rc1
             [GIT,PULL,5/5] arm64: tegra: Default configuration updates for v5.18-rc1

Patch: [GIT,PULL,v2] ARM: aspeed: devicetree changes for 5.18
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618567
  Lore link: https://lore.kernel.org/r/CACPK8XdUXy5cnEDKmNirtByNMBGCjXwZpdKqJ0ytc0f34vzbBA@mail.gmail.com

Series: [GIT,PULL,1/3] TI SoC driver updates for v5.18
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618711
  Lore link: https://lore.kernel.org/r/20220228120655.wobd72acngl2bz6k@ecard
    Patches: [GIT,PULL,1/3] TI SoC driver updates for v5.18
             [GIT,PULL,2/3] TI K3 defconfig updates for v5.18
             [GIT,PULL,3/3] TI K3 device tree updates for v5.18

Patch: [v4] ARM: pxa: remove Intel Imote2 and Stargate 2 boards
  Submitter: Jonathan Cameron <jic23@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618411
  Lore link: https://lore.kernel.org/r/20220227134431.908998-1-jic23@kernel.org


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


