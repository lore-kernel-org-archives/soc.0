Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C52C43217
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E609C36AEF; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16A9FC36AE7
	for <soc@kernel.org>; Mon, 20 Dec 2021 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640014826;
	bh=d5nHSNmp+/8rSPFuTcntOZcMLEILtYlR2pyu1WfBb1A=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=UBRwiR1ShNOiA0W/tkU3Bg4bC/+xdVdSB8vFJ75d2x5h9BSDBKRQ1BhuVygSLbsdM
	 VjAHLzA31r+pg87ClRjPT3zvKgfCYd6kaMrBAVbovGMYNwjmjmlcy7S6gikGioX94z
	 ZoQ3P/aXrOy2SFSg4VVP81lrVDnkKITnCJ+84p8u31IOKpSC55aiD4b23kKBG2GgDh
	 TFEA8yZcEaJ6Z1y6Vvi6zEdvtyrrt/hxtydaUxXQ5P4hWZWkD6WQ1+inBN7IzDwiH9
	 1TtGenAAdDyhvot4nRe5ghFAqHlqC2yww55jQBmrWEFfqbPbzwaAfznMqS3YWjjDqB
	 jpTU+6jYXrqFg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D5133600E8;
	Mon, 20 Dec 2021 15:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001482581.10364.1613827153512200014.git-patchwork-summary@kernel.org>
Date: Mon, 20 Dec 2021 15:40:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.17 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597579
  Lore link: https://lore.kernel.org/r/878rwjm8vj.fsf@BL-laptop

Patch: ARM: dts: Remove "spidev" nodes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597693
  Lore link: https://lore.kernel.org/r/20211217221232.3664417-1-robh@kernel.org

Patch: [GIT,PULL] ARM: mvebu: dt for v5.17 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597581
  Lore link: https://lore.kernel.org/r/875yrnm8uq.fsf@BL-laptop

Patch: [GIT,PULL] ARM: at91: defconfig for 5.17
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597551
  Lore link: https://lore.kernel.org/r/20211217165850.29694-1-nicolas.ferre@microchip.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


