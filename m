Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0465AC43381
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:40:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE0A164DE4; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B81D964DE1
	for <soc@kernel.org>; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611844831;
	bh=+rYhJXAyPpTpAXDufc2baNN0x/3x8uTE3xcY7JOk7r4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=eXOnkC/1xeTyUHBdZSpPAf6gmDHCIfheiHBnoahmy1En/M+5Bsl5QdD1pc5hKv4OR
	 1cHtDNpjmX5jd1rDhnk6QKKpQixZpEDiDBBo9M/NXJxtC+9j12xknxuABue5DLH3Ox
	 KdsJSYM6jFMs+HIPo9SO++dMvTCXQXAGlaCvndozGkRJfy8p7daFl28ujz974E1W51
	 UsI5nRI+46cCdv4klvyozaGqu8LRSGFOhKvBnDThjEUSDQ4cVgK0HFWr9FmgBBcm1d
	 UXKs8LQLzL+RMXeMoSxUYBDNMexj6NQuf5IYEhceFyqX92vXaXreWASVM1UkldCwQP
	 tVW4kK7UpC6hg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B407E61E3B;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161184483173.28855.7070445307312016833.git-patchwork-summary@kernel.org>
Date: Thu, 28 Jan 2021 14:40:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Rockchip dts fixes for 5.11
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=423583
  Lore link: https://lore.kernel.org/r/5429065.DvuYhMxLoT@phil
Patch: [GIT,PULL] Fixes for omaps for v5.11-rc cycle
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=423509
  Lore link: https://lore.kernel.org/r/pull-1611818709-243493@atomide.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


