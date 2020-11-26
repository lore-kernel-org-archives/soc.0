Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590B7C63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1BE75221F7; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425639;
	bh=cnRFeVvZExw7+3O2BeZ8l5OR0/TIDqkJognPMCOjCw0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LRM/1ViuWtY2H8ogZqtdxOhDCAB3Yc9I/NOH/M1VcnZH/Z4ZHpnQ6s2NsR3nUlk34
	 ZFy18OZlLrmkxugRSvc/WXZ9yj4rqBALidrpYRHCQb9nebN/u0Xy4vSW8zs1JFGSd6
	 RpcBysxaPHtxDBmeDcN/3fFQpqKwFCcm7NEQGvbU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160642563886.13931.6903333965056201709.git-patchwork-summary@kernel.org>
Date: Thu, 26 Nov 2020 21:20:38 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] soc/fsl driver fix for 5.10
  Submitter: Li Yang <leoyang.li@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=391021
  Lore link: https://lore.kernel.org/r/20201125165922.15487-1-leoyang.li@nxp.com
Patch: [GIT,PULL] arm64: soc: zynqmp: Xilinx SoC fixes for v5.10-rc6
  Submitter: Michal Simek <monstr@monstr.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=390291
  Lore link: https://lore.kernel.org/r/fd5ab967-f3cf-95fb-7947-5477ff85f97e@monstr.eu
Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v5.10-rc6
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=391025
  Lore link: https://lore.kernel.org/r/20201125170306.1095734-1-thierry.reding@gmail.com

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


