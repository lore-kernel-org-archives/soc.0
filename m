Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501D3C27C79
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19148C4AF0C; Thu, 20 Jun 2024 21:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB051C32781
	for <soc@kernel.org>; Thu, 20 Jun 2024 21:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718919259;
	bh=Vsm9ADH7VUMESUfjI6Noml3alFtor1yEfjcw3Iw5lMw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=B6x1P4shmiVhNBItr9QHEH0c9pw4239JvJkE1VkkRCUMwrhGAJfYDTnogtWad0hAp
	 hJxhU+Elb5GwpiQZzP7d2cEA1+Nwl/VRXtJewfE6cBrsp3Itqj7fpAOX03Bi8x2IGh
	 rpx59AfBLORSJFPiiG5hcIKes8NzlpLkP+iUmwXNMqFrhLwN5E7BWfw1tdUMa/9ZiV
	 eExlrvx8yhPVICWCsPqVIUZZ5Pq/vRZfA+Lg46L6PL95ttjB3s6QUDRVax2sv7CKBK
	 qwEYIbJcOo38kbkzAF7+iP/ccqI7NdRX9Nx2In5zK2WakmH8+XjVfQISUxBn4Rofz8
	 S8pL46vBTDZDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D3C8ACF3B97;
	Thu, 20 Jun 2024 21:34:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171891925878.21354.13688772124016849554.git-patchwork-summary@kernel.org>
Date: Thu, 20 Jun 2024 21:34:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

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

Series: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.10
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=849055
  Lore link: https://lore.kernel.org/r/20240429213703.2327834-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.10
             [GIT,PULL,2/4] Broadcom devicetree changes for 6.10

Patch: [RESEND] firmware: psci: Fix return value from psci_system_suspend()
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=853366
  Lore link: https://lore.kernel.org/r/20240515095528.1949992-1-sudeep.holla@arm.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


