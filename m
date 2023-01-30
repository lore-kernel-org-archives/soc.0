Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B277C636D0
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 16:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD976C433D2; Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C69C7C433EF
	for <soc@kernel.org>; Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675097417;
	bh=zAuYKurygCJR+p7KQlQujSRZsp/WZzGFlZTVSRanLJU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KfU+3YMfBwVp+4rF98VuEGiEzG4eUKZKmBnh9xD/NF8/0z8AOa7m9pTchLV4a4+5s
	 IKdioK4h7/4ACJAjThdeNVFbZMZMEYhw3AXBpq645SLnv666KHpycxEDZqzz/OrLwk
	 iaNIivLCsj3VJf/fFD7Od/NZPGj5NWw3kiJ/Vc0F8TdfIUC4w+vz7LSgj3AgZXRrkx
	 9rZVoMhwgogM5JL1JvlX6Y36HP35jud0a/iqIhcgHoabzThMadjBi/P4yjFMFpV5la
	 ZpqASe75HB1OJj6PJfHdF1Gcs9Jm+wBDK+c4yFXVydzPxMQkhhlg1GXYs4aCVGp59q
	 ERgmDjj1A8/Kw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E62BC4314C;
	Mon, 30 Jan 2023 16:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167509741758.16068.8438885039406790128.git-patchwork-summary@kernel.org>
Date: Mon, 30 Jan 2023 16:50:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Allwinner drivers fixes for 6.2
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716464
  Lore link: https://lore.kernel.org/r/Y9RWcDdO0nj98KVj@jernej-laptop

Patch: MAINTAINERS: amd: drop inactive Brijesh Singh
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716183
  Lore link: https://lore.kernel.org/r/20230127105935.99174-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] i.MX fixes for 6.2, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716744
  Lore link: https://lore.kernel.org/r/20230130003614.GP20713@T480


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


