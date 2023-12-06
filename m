Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03ACC4167B
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94785C433CB; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E75DC433C7
	for <soc@kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=nq1VHNCUrXOaRojt33mO/rZtQ7M4aO9Ai8jxFojSbyQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Jx5e4wju7I4j6n7MSQsteWaXWFBk7mmMtzWMpAvFb7ygpYHzp/b4m8cPYrWWW9ud1
	 z7l64zyfeFT6yC7n45lixzgIN6wSe4/SwrOP764KybpXqbEGDAUeu7b/3Gl/ByKkC/
	 E7+f7XIBSFmbjIobi5U4MvOzbAlZd/EIiVwjwZ7b2ykHzeiyqeBgLoDJZ7PS+jnyeu
	 k2npxs9WwnoVQOWyF6W+Q0F6k+YlTUlRB6eDA+D/+Uipd3LcGjgIPM5aMF34DJQVJD
	 si2YW79adwxVE0aqX/OdgKMy3nzKeXgYnY+7utj1sErrnrK3hU0hQppS+rQeDzW9Ah
	 0aqxT+PL2CjRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53B7EDD4EEE;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954127.26038.13631426902317228917.git-patchwork-summary@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.7
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=806633
  Lore link: https://lore.kernel.org/r/20231204134724.30465-1-sudeep.holla@arm.com

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 6.7
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=807197
  Lore link: https://lore.kernel.org/r/20231205225021.653045-1-florian.fainelli@broadcom.com

Patch: riscv: split cache ops out of dma-noncoherent.c
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Palmer Dabbelt <palmer@rivosinc.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=797324
  Lore link: https://lore.kernel.org/r/20231028155101.1039049-1-hch@lst.de

Patch: [GIT,PULL] MediaTek ARM64 Device Tree fixes for v6.7
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=805243
  Lore link: https://lore.kernel.org/r/20231129113905.134732-1-angelogioacchino.delregno@collabora.com

Patch: None
  Submitter: Bartosz Golaszewski <brgl@bgdev.pl>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=789633
  Lore link: https://lore.kernel.org/r/20231003145114.21637-18-brgl@bgdev.pl

Patch: [GIT,PULL] OP-TEE fix for 6.7
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=801062
  Lore link: https://lore.kernel.org/r/20231114153113.GA1310615@rayden

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.7-rc4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=805588
  Lore link: https://lore.kernel.org/r/20231130-maternity-majestic-dd29f0170050@spud


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


