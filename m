Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0100C4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 14:40:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A51223600; Mon,  7 Dec 2020 14:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607352040;
	bh=zmAujjqms+QIsIe3jaoQyy19v3bc2fA5g0KqNaTpUOM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=iNRqYY8uAA0tz1KV2RrupMUrQ249QhY0hYu0Qp3lvynweBAfZyqKfZuyYhBAohi5M
	 7t5G5xBPTAkmdRs4ARtGJVht8NpW/OpcFDtkTOxM4hr4ldSnH1ihsayF747ihN9OMw
	 yL6OJ+cDtjWqEs5Bc67YgVFhMozK9ThLjOdQNjnL3mJ9H9T9BTx23X+MUh09HLlvlY
	 jqpBs0WxIc/Qmr9aeWfz+xunQ5Ud8MxjR7EUxxDyAg6LfEuGIDtvQEFi3/CsF5N+2B
	 2ynyZR75wVqjCbXDtWBmA42oieYvFy8XUS5JIB6Sy8LygKVwhNzVqiPF6vTPJWpXGo
	 j3F4lqJVd7G6A==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160735204030.15166.6243493514500237201.git-patchwork-summary@kernel.org>
Date: Mon, 07 Dec 2020 14:40:40 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.10, round 5
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393827
  Lore link: https://lore.kernel.org/r/20201201091820.GW4072@dragon

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


