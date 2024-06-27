Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C50C41513
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2FB6C4AF07; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BB42C2BBFC
	for <soc@kernel.org>; Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719499257;
	bh=8thw5hZXEDrPoUgJ6jUHUTL/fBuPzZxcNkfmbncmqEU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JIVhxyF+Snh347WyyBz4Lw1BOiwCSSVCuhXGCKAEP1lTmBpHtffBGkOjUb0rXk7aJ
	 /mX4nticTPk5WTWKvwqScOliLPd54wxDv+cESMnNzw9hChZZD3ssRtDjplcrPSULfO
	 HLa1sfw6UC35GurINhwFmnhWrSTTmT67cBvL5uocKvQ9RbEsc7w7C1IHRFY2cCi9Ft
	 7n8Vw3SmPbYsmlucBLPkfv2N7eKXJAbgqWiCp4URUdl37OdkBLN7/FozWsW68/8C47
	 mhi3VPmeAMwupyoYAJPK8mCYzBgY0zq6SZhzHS1KUDuW0hNhDHLtMFRwWrIegZJgQe
	 skOAVB9mMpPnA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6CEDFC433E9;
	Thu, 27 Jun 2024 14:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171949925731.15510.3673990596757862486.git-patchwork-summary@kernel.org>
Date: Thu, 27 Jun 2024 14:40:57 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [RESEND] drivers/soc/litex: drop obsolete dependency on COMPILE_TEST
  Submitter: Jean Delvare <jdelvare@suse.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=862582
  Lore link: https://lore.kernel.org/r/20240617133004.59887629@endymion.delvare

Patch: [GIT,PULL] Reset controller fixes for v6.10
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=865837
  Lore link: https://lore.kernel.org/r/20240626163443.61384-1-p.zabel@pengutronix.de


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


