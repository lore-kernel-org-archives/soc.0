Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9613AC433DB
	for <soc@archiver.kernel.org>; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6AAC964DDD; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 52EC964DDC
	for <soc@kernel.org>; Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611844831;
	bh=2VhS645DSHcVQl8f0OXZ2M2VooWUpHszHZPuMx9gspg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=UqRoC/14yKI10cDTRrfErnOYF48j6MoooiYOhJELdHQaSkwa+vUn8vch3VqrkGH4L
	 jji6V3KWgGrWHPYcjMP9hevnA2xDTZteTn0MSe034abHA4ODb2yIQLwZzDFuzY6GPg
	 exEc0GTjF5s531k79DwuJnYq8FeMhPtZdWKCzcYFtguVf1WfyLPXoqxkurhAzJxy/A
	 GAv4ZrytHpzqFQkXrySVMN+Tfw+rIOcGEmLHMQxAPCKuZQeP+w7pejBsVc941UQ3eH
	 nlwA6eLZkThnxMgHBuglc7gKslvzao6akErm+Hfh2W2qu08SjEoeSOqbfLAXLVCarm
	 hoXa1QKN85jUQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 36FA261E3B;
	Thu, 28 Jan 2021 14:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161184483113.28855.6175238403258757682.git-patchwork-summary@kernel.org>
Date: Thu, 28 Jan 2021 14:40:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

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


