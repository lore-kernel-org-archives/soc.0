Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F3CC7EE2E
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 910ADC433A1; Fri, 26 May 2023 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73432C433EF
	for <soc@kernel.org>; Fri, 26 May 2023 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685117419;
	bh=32BNX4uEhgY/qFDy1bej/l0AjhWTQ1OSjTpanpq5Sow=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=d2ClGRrZFLt/H9bAOwm1ywaue269J6tbeuSOlN/qbnJRaKbav/O6K+7u5D5jEdsfm
	 ReZB4Xe/PL64d3o3XMH3en/D89kHNwfagf8XQsRNDtiY8DFQrejh8XejE2GSpjnYjf
	 wRygNGXtB46rUgc4QyeonjldWnkjf+GQ8jK5AIhTb9kjfq8Er6MaDu8DCbDbeVKjk+
	 fcT6dK6wBRoRcrTnBGhCzaHeX/mow6cieEaHd4w6dK1TIN+SHAbHvIzs7JzK9u8me0
	 r2RJVCv42dHVRav7OjOFDUet61P1Vbg1UUx5JiKAKWveNvQ05VwxSfOZSLrWYfIC/Z
	 RPJVGV9voQHxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49BC0C4166F;
	Fri, 26 May 2023 16:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168511741918.25839.13109437731031693116.git-patchwork-summary@kernel.org>
Date: Fri, 26 May 2023 16:10:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v6.4
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=746144
  Lore link: https://lore.kernel.org/r/20230509143453.1188753-1-sudeep.holla@arm.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


