Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1609C433FE
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8531FC36AE7; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69814C34114
	for <soc@kernel.org>; Fri, 13 May 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652436018;
	bh=XOvGZvHOzQZUtsF0/E3naOcObsBKccW/09L+CHJB6Vk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=AZdQEXcKSNGa3VPV6qjKhSFuvEx2EXGrx4r3W2F3OfZbEtLnvIQOgmzpIxghs/7Qf
	 Jz6k+1w2NKFOlTZW00j7bE1jnsCYA2GFewmnnAAYCItPVy9ie8FmXdLExV2UvHxLz4
	 yeXQGoVJegEIUVZd/HSr1JewkgAK994d2f5JPSQ3cU7mnlIZ9Emno1VYwMDVt/eFWt
	 Y8Sp/SyIJyIRN9jmHqfrGy2A7Hc6Jujs4Zf8hyI0hxesmrsBK/3mts69SaJr8JglGF
	 7a14+XEYCKcuphEvtgiEZFDJYG7E821suiW6wxNXkp3QVc0dBB+a27UTr51NcyzeVK
	 ytcNQeJiigx4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43273F03934;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165243601816.30999.6664807869762769398.git-patchwork-summary@kernel.org>
Date: Fri, 13 May 2022 10:00:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: dt-bindings: clock: stm32mp1: adapt example for "st,stm32mp1-rcc-secure"
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640504
  Lore link: https://lore.kernel.org/r/20220511092559.4952-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] Rockchip driver changes for 5.19 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640757
  Lore link: https://lore.kernel.org/r/3998951.tdWV9SEqCh@phil

Patch: [GIT,PULL] Rockchip soc32 changes for 5.19 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640756
  Lore link: https://lore.kernel.org/r/4421093.ElGaqSPkdT@phil

Patch: [GIT,PULL] Rockchip dts32 changes for 5.19 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640755
  Lore link: https://lore.kernel.org/r/6919636.31r3eYUQgx@phil

Patch: [GIT,PULL] Rockchip dts64 changes for 5.19 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=640754
  Lore link: https://lore.kernel.org/r/7748558.DvuYhMxLoT@phil


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


