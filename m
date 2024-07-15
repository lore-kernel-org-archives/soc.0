Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B7C3DA5D
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A12CCC4AF10; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A281C4AF0B
	for <soc@kernel.org>; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044230;
	bh=QZNoeL4MOGmqEAH4kinkKsKS1W//awTwTjpGviA7mHs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=fgLDfdyWUBZUVk+NnvVjImPlSAnZyl83ICSNlH1p1ZUbdgnggCCyw/gJSm+CFAlE/
	 RYK+NC84TBC0oI7g3cJh7L740KKoD6IZHIO6rL3PB9T0Y1m8FLz+GhakX+kaFDNJKg
	 Z/lABl0K80rYIbb2W/3O9fBWShtVHmFCuqyuXsCQsCBV9gdMqOB8qV4HS/+ehjzyjZ
	 dNgv+sx2g7Qo86ptaNrssL5OdTugEJVEVTqsZD15RwuBKMcHoym4RUM8EPXTNINqM+
	 rsGAI9YtjpH8Yvfp6YLi/e8AoshJIPQRYWLH241YgsU25nV3PLt5LT5yLgKOLMmFtO
	 wRk+tkq2kRI3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74AE8C43443;
	Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172104423042.10224.10681146402354689846.git-patchwork-summary@kernel.org>
Date: Mon, 15 Jul 2024 11:50:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: MAINTAINERS: drop riscv list from cache controllers
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=871326
  Lore link: https://lore.kernel.org/r/20240715-pesticide-strike-6217a07b72ef@wendy

Patch: ARM: pxa: fix build breakage on PXA3xx
  Submitter: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=871000
  Lore link: https://lore.kernel.org/r/ZpH12w9vyZZDdzDb@google.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


