Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23703C4332F
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D37B3C43396; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAD36C433F0
	for <soc@kernel.org>; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=gm8r9LVW5llzclqLze21TQHhDb0ByWKlM/EJtOZY7SI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=RIGuKTMdZRbDjUMvXWg4yESO+um/4kmkdj1pSTNvnlNXFf8UsGThyE6zSovf/b/lm
	 LjbH/TI1BtBzetpxvLEoebvtzy96qVHD6hT4LBnU7Uw2SzmcWZHa3gUSpjkBZw9+8Q
	 Eu5Gl3xcmZphfS1Qd3ZJZoiND9iPUmTAVSB9KRZjO7y1gnIPUGBHtyUD1VJcDApZs3
	 GpRLnQ2/flZQng79Ynpoy5E0R+F1BhalXwQcVKOMgV+metCBUAGL620oPa0AEAIv+n
	 YEKf2erInGGQhzgTG3Volrm7yeL+p8lkSyOx5S7BKR+P3YAQCHSQOE50cqHLIyT4DG
	 /ywfaMnfrUI/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7E68CC00445;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563344.24111.3666388653835436342.git-patchwork-summary@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] arm64: dts: fixes for v6.1
  Submitter: Matthias Brugger <mbrugger@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=705067
  Lore link: https://lore.kernel.org/r/af4c45ce-a150-438f-dab4-e47b120c32c4@suse.com

Patch: [GIT,PULL] soc: mediatek: fixes for v6.1
  Submitter: Matthias Brugger <mbrugger@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=705068
  Lore link: https://lore.kernel.org/r/29c8b913-53cf-096f-fe44-832ceaeac116@suse.com

Patch: [v2] ARM: pxa: fix building with clang
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=704822
  Lore link: https://lore.kernel.org/r/20221215162529.3659187-1-arnd@kernel.org

Patch: soc: tegra: fix CPU_BIG_ENDIAN dependencies
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=704847
  Lore link: https://lore.kernel.org/r/20221215165336.1781080-1-arnd@kernel.org

Patch: ARM: disallow pre-ARMv5 builds with ld.lld
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=704823
  Lore link: https://lore.kernel.org/r/20221215162635.3750763-1-arnd@kernel.org

Patch: ARM: dts: spear: drop 0x from unit address
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=703553
  Lore link: https://lore.kernel.org/r/20221210113347.63939-1-krzysztof.kozlowski@linaro.org

Patch: MAINTAINERS: add related dts to IXP4xx
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=704576
  Lore link: https://lore.kernel.org/r/20221214204223.177807-1-linus.walleij@linaro.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


