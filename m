Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC314C5478C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B41FC43399; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65C50C433F1
	for <soc@kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568697;
	bh=8Of4rsgI2VA1lkJpQAfpFzMD9qCQ9rl+16Ojyi+0Xew=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Ay3J8R4GZaFYYl9VfVU3O+9usXlgZy3Nz4y4NOTSA+KyWQ71OAYVejb6wbOueCAxz
	 NJoUn/0kOknkCTcyFeiDttoi0ca0Qrm5slyb7CAEX78x7L5WQTRUPAEoxTjvX39fMG
	 DVekQUce4OnYPhK6l9EBCs6VttBiVAA4frENGObx8VzAD37bzNTGJ5ruoPdAs3qmVU
	 jeNOZi2+rEzZqqWLZ/2iw8bBFNLf86sNSmU4ZL/dYPV/pGsKbeo8DzPAD/mHzidgcq
	 3/07SQcofnlmZutundD+aRdp0hQSbmJY1nHSyWy6XgdoTrWfWBJq09Zj/puFOpLGme
	 G7S/i3/cvUxdA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4773ED9A4B9;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956869723.25915.17078523945020162366.git-patchwork-summary@kernel.org>
Date: Mon, 04 Mar 2024 16:11:37 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.8, round 2
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829588
  Lore link: https://lore.kernel.org/r/ZdtPJzdenRybI+Bq@dragon

Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v6.8
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829904
  Lore link: https://lore.kernel.org/r/20240226144536.1525704-1-thierry.reding@gmail.com

Patch: [GIT,PULL] Allwinner device tree fix for 6.8
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829306
  Lore link: https://lore.kernel.org/r/20240223205450.GA8881@jernej-laptop

Patch: [GIT,PULL] OP-TEE fix for 6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832094
  Lore link: https://lore.kernel.org/r/20240304132727.GA3501807@rayden

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829536
  Lore link: https://lore.kernel.org/r/20240225025205.479589-1-andersson@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


