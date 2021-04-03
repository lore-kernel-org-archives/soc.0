Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E570C433ED
	for <soc@archiver.kernel.org>; Sat,  3 Apr 2021 20:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE28A6128C; Sat,  3 Apr 2021 20:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B6ECD6121F
	for <soc@kernel.org>; Sat,  3 Apr 2021 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617481808;
	bh=K/xcMFyamejMgA+u7d3xwS4Zx5SWFVWWNnk4g7wQ61U=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aD4QGxhEacXfGXIgMmrLgpiI8TSJ+WbYnhLrvnvbJ5J4qlCqoI/T6Qs7OkMCub9E0
	 yIvH7Yo2od18029KhfoWbSDGBz8LKY2aNtswbFT7QqzvuSiDcEBX59RJ8ieDxEP3uY
	 Z1pUSOTVZg6rfY1Y4bxE0wHiKuE+kN0H5dZfMA3ntHc5bmf4eRx7QXabrcDg/NWxvE
	 b8l7W1WgKDPV9tJHb3xAHRUiYGSvhEYSKT0/ZEVS/hFloI0viLJDwinWx9cvUQwlQ0
	 tmCsiIA+wazA/VrUbwyi6uQKjsFDCMGbnfhDV62flAcom2EAr/OvjXOUvsyaYfMvqX
	 +nRLaQ71kXvcg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A2A7E600DF;
	Sat,  3 Apr 2021 20:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161748180861.30393.16999410181441608355.git-patchwork-summary@kernel.org>
Date: Sat, 03 Apr 2021 20:30:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] ARM: mvebu: fixes for v5.12 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=460407
  Lore link: https://lore.kernel.org/r/87a6qgctit.fsf@BL-laptop

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


