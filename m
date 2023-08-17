Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B857C2FC1F
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60B9EC433CA; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4ABBCC433C8
	for <soc@kernel.org>; Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276628;
	bh=wTFA/Xav0D4haE+Sv6sG5yLlDIDd8koUm98pIKxrW38=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ggyd4q2n4VSCFblM0aFIQhRJ9lQpBbjD9LTgEq5Xq0ixWwV18s6xnEEYsDOZdNipi
	 Ttib+NH1JLD29TlgZ6VxZImSm7NSAMAiy3dUU9t0nEww48hISN0DXLa5Z2R0PS1BoR
	 vueOdv3j7ogmrjV72eiOVtFY72qTCQ4JHvnMBTB3iNBqrSkaqdybln4GlX9mJ6SPTM
	 mptxwdrCvRQK8FGAxbrya8erWOoi4Az/zv2wzRmc5WY5BXsRsaTOnqqjpEtVceVu1A
	 TWN8JFtM9IEPUAk39iKzwtDxoOVxymOJczxKX74eZ1VkWaQfdUPFFGntTUuzxsXkLr
	 2rHsbF/H28hIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3678FC59A4C;
	Thu, 17 Aug 2023 12:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662822.28155.8974298924260429908.git-patchwork-summary@kernel.org>
Date: Thu, 17 Aug 2023 12:50:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm ARM64 fixes for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776302
  Lore link: https://lore.kernel.org/r/20230815142042.2459048-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts fixes for 6.5
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776794
  Lore link: https://lore.kernel.org/r/4519945.8hzESeGDPO@phil

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776484
  Lore link: https://lore.kernel.org/r/pull-1692158536-457318@atomide.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


