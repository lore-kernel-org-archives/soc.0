Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726A1C3A5A7
	for <soc@archiver.kernel.org>; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 489A4C43149; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B4ACC433D7
	for <soc@kernel.org>; Sun,  4 Dec 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670156416;
	bh=rYfHlZbQZ9mp46ZpxZ8xOT5dnRukNi3vNsF78P33+hQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=BB1MhjK5QixrCGBw2+MRg8bJFf6Jbpz7NgUcIc12hY7htYX0Q7Ow7ojypN/DCVkWf
	 +aWLc1QHvfNFpvd1Kb3U/9slSZzx9TVXLJoe8SITyglsMSd+e5SZMDn6v1uFvN+8ii
	 YNgcQFbRR7iRvX75Fbezytrpx8O94Wd3WXLs1KnetJ+6F7llr+cK3aSlBOO2/Fzo2A
	 gfB9JlKfB5d3mjkuRQQ8WS6dnaizVkidVefSGKUGJvf0YI8jTn3PXzn9PjnlZlSuVk
	 heqYm1umJPt344anx7pANROTpLYNvGbpDkLsDc4mnrUNiqWSMMME1rlhuVhuw55ebI
	 kH4lmItXA53Rg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E8913C5C7C6;
	Sun,  4 Dec 2022 12:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167015641589.6046.6163463251637075213.git-patchwork-summary@kernel.org>
Date: Sun, 04 Dec 2022 12:20:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: mmp: PXA168 timer fixes
  Submitter: Doug Brown <doug@schmorgal.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=701523
  Lore link: https://lore.kernel.org/r/20221204005117.53452-1-doug@schmorgal.com
    Patches: [1/2] ARM: dts: pxa168: add timer reset and clock
             [2/2] ARM: mmp: fix timer_read delay

Patch: [linux-next,v2] pxa: Remove dev_err() after platform_get_irq()
  Submitter:  <zhang.songyi@zte.com.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=701058
  Lore link: https://lore.kernel.org/r/202212021042043546303@zte.com.cn

Patch: [GIT,PULL] ARM: dts: Second cleanup for v6.2
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=701554
  Lore link: https://lore.kernel.org/r/20221204082909.5649-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Apple SoC DT updates for 6.2 (v2)
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=701534
  Lore link: https://lore.kernel.org/r/a9353121-7fed-fde7-6f40-939a65bfeefb@marcan.st


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


