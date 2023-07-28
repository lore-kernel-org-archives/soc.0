Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE7EEB64DD
	for <soc@archiver.kernel.org>; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31D5CC433CC; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B9F1C433C7
	for <soc@kernel.org>; Fri, 28 Jul 2023 20:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690576824;
	bh=1xMcwo21WZpX+9NWvMCHKjziR4PdQEEkRdbEIGJ0DWQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZZPuZVVpq3ML+EU28piZHQwzmwfd/Nwvr8foL04vY+lnseI19zxP7wmUJIie0uQ4X
	 aMy04cKFnDGl7+qedewJOalULdwWYWumA2CsNhwpvf19ZSJP+pZ186FW4GXpQWE9so
	 YrEa3DBtnJafDrwKKkxRMHBwAOG+/0Kz32eKJt9ez6RAQcrZ256fZSoK2Pp9rRitem
	 DDvNyrKVHgjn7XGt4iw59N9tzjsTPzT2x0JEncAWZtpJYIJDwYz5Ynarm/I/M84e8m
	 nJKvOLh10FUz4Tz38RbBKOT1UiCnOzQItZVxyL7j+IoD3D5bm+gUksLddZwKIB5zwd
	 S6yNGSpHmME/w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA28FC39562;
	Fri, 28 Jul 2023 20:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169057682389.20429.6236779904109332344.git-patchwork-summary@kernel.org>
Date: Fri, 28 Jul 2023 20:40:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX fixes for 6.5
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=769177
  Lore link: https://lore.kernel.org/r/20230725075837.GR151430@dragon

Patch: [GIT,PULL] memory: fixes: Tegra drivers for v6.5
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=769609
  Lore link: https://lore.kernel.org/r/20230726084811.124038-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Renesas fixes for v6.5
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=770132
  Lore link: https://lore.kernel.org/r/cover.1690463347.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


