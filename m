Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD50C27C79
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C53BFC4AF09; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AECD0C32781
	for <soc@kernel.org>; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718920283;
	bh=pxZBAeWuxi60jDgazs6Wtv9y5yqcIXYbqnJRxR7ta0g=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=USD7Jux2hUQ/owk9Ng4B5xs8wVuSI9DeM69eQnKkXJ5soHzILjckJafnoyasCE4++
	 Ves1qnt3xWU7nysgXMZh3syQeStQ8KeeaqSB+bUA/Wn4sK6rIkru25bVHRBFAOovL9
	 A12OYXHnhD5pbyheFb7rqaoEYs5J9iOQ/CeFUHRWiVk50HrN4/z1AG8cLZMXupZeT3
	 IUthAYBlXJyX2AxoRPBPgzVQwLOtAQhvdNrv9eq7DQHglO8oDagBWy/49AjEwuehVF
	 lroFKu8PPFtExsbCuRJfaG2BNlmp6Dip8WAgucJMuoWKe/eKIIR99IUnFKDeQjwucO
	 bU6Pq6yotO9dw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 993CBE7C4CA;
	Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171892028357.21354.18122470096322030282.git-patchwork-summary@kernel.org>
Date: Thu, 20 Jun 2024 21:51:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.10-rc4
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=863261
  Lore link: https://lore.kernel.org/r/MA0P287MB28226E34D9390B311201B7C4FECF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM

Patch: [GIT,PULL] i.MX fixes for 6.10
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=862446
  Lore link: https://lore.kernel.org/r/Zm+xVUmFtaOnYBb4@dragon


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


