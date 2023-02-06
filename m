Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECA7C05027
	for <soc@archiver.kernel.org>; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 157FFC4339E; Mon,  6 Feb 2023 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F15DFC433EF
	for <soc@kernel.org>; Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675682418;
	bh=+3ivyBHseb4io6zphT2+HX9H7+67lAjTzfl66DOTjlA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=rpxcLQ86SLfVHmjZ2QJvrDsLlaPhUfCGFJyfPmWIROTM8ehQFRdxmssvK2AZjPI0P
	 8gka19xA3U1F+Vnv26jwR52Zu/Yeu3TiIEfMiQjiovqOHzO5YbxZ+PXpmQXwDYUjA5
	 PkPQYSIZ3nOeeyhuT9I2SZtaKCUn8k/kFa8et9b2nvtw1SHJ1+Y+cbtk/jzf3I5Pf9
	 sKulLaqRHgS7nNLrj08dY9vzESwrQenuVa2Tt4FsEPgY+OGttZV2Qxp4wOSTYhipJM
	 JYfUoqBWLua3ZLiBo8wnXNRpULuJRbbnlpq7IVgX9DXm986+TKRTJ+NxBZQMmKxX2y
	 g0NV7UMcPg1rQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C50D3E55EFB;
	Mon,  6 Feb 2023 11:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167568241772.3898.6357279753642649779.git-patchwork-summary@kernel.org>
Date: Mon, 06 Feb 2023 11:20:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] samsung: drivers: secoond pull for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718909
  Lore link: https://lore.kernel.org/r/20230205144657.951749-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Apple SoC RTKit/PMGR updates for 6.3
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718791
  Lore link: https://lore.kernel.org/r/4790bdc4-b6e2-228b-771f-023363f65fb3@marcan.st

Patch: [v2] ARM: defconfig: Add IOSCHED_BFQ to the default configs
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718603
  Lore link: https://lore.kernel.org/r/20230203140404.1125850-1-linus.walleij@linaro.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


