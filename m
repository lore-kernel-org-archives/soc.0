Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B0FC433FE
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3352610CA; Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C87DC60E8C
	for <soc@kernel.org>; Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635319807;
	bh=wWddkmuZ5c2pAG1Z/NssBhd5MAFkLQnBgPk9pEbrrYA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VcwgUMZMydKipiHGEOOo48mBRwZPJHmMIbI0uBE0OTp25DvvWAazEhkaF5Zx/HAl1
	 yJQg6QQP7AGIIqVN7hjfaQYZLiEaCuyTAeeM5JcfD0L++do7GO29aHISTFbCX/oUTs
	 hSwIWmpH/2flEptXvnVj3hxxsjqekuaDGEC6mfhe5oH0uWgeqrl5Mskc4+mxB4uwOn
	 MIR0JruGMRApoKgsTiAM5pA++JloEDY3/oJekJGWL69jEERsuHLroRsLgp9CJl2uwU
	 fH06+tOogM8frcN1oD0pzEhFU07OKdyospfCQ3wJwpk/0L1bW2i+9Hx7UZYp0wyAWj
	 DRGfMKW8kWLvw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B4DC560972;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163531980768.3831.7749043318040362067.git-patchwork-summary@kernel.org>
Date: Wed, 27 Oct 2021 07:30:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC MAINTAINERS updates for 5.16
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=570847
  Lore link: https://lore.kernel.org/r/748d5e4d-9ea6-cf50-cce4-7a7e9267c76b@marcan.st

Patch: [GIT,PULL] Apple SoC DT updates for 5.16
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=570853
  Lore link: https://lore.kernel.org/r/fef30d0a-ad50-ed58-ac20-9e372862b4e4@marcan.st

Patch: [GIT,PULL,v2] soc/fsl drivers changes for fix(v5.15)
  Submitter: Li Yang <leoyang.li@nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=570779
  Lore link: https://lore.kernel.org/r/20211026235744.19258-1-leoyang.li@nxp.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


