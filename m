Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D81C433F5
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79B1360F5B; Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 63C9660E96
	for <soc@kernel.org>; Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637586010;
	bh=uON47fLe57QoPh7zDboYdTKM6jWR5+i/8i+N7eCpeiw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=IMZMfwMet5ngHAt3KqEBH5riM9v8jXWp5FrKesaaFXBFCiHNXD1eUejV3iQVmmsoS
	 mpIqHqEFNPZjKK3yNdWi0+idLiui9v97lygheGRR+wB0OsFZPjEijqPisIAFg/p8k1
	 murqazkXLIw08Wb/CNgZkF/EA6Qzytck8ei5UHko8ikqXKuCnnSdtTUkBaF48psMBA
	 5cJoDSz/d/+GKQShhPOzrXeNXAj6ocnpJsHSFL51hYsCqJVrbHLiUYC26aJy2CkW7H
	 xY1+bJRcvaZvn8LLI4Ej7e+kaF9UBvI7OBPmepAaZ4k0GeTROwLlppU/6lhrstn2qR
	 ypnKG5WFW+bQg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 548B260972;
	Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163758601029.20556.12526582532634210717.git-patchwork-summary@kernel.org>
Date: Mon, 22 Nov 2021 13:00:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: Add clock node and phandles for M10V platform
  Submitter: Sugaya Taichi <sugaya.taichi@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=580013
  Lore link: https://lore.kernel.org/r/1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com
    Patches: [v2,1/4] ARM: dts: milbeaut: add a clock node for M10V
             [v2,2/4] ARM: dts: milbeaut: set clock phandle to timer node
             [v2,3/4] ARM: dts: milbeaut: set clock phandle to uart node
             [v2,4/4] MAINTAINERS: Add entry to MAINTAINERS for Milbeaut


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


