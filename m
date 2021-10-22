Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1119AC433EF
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E00F061183; Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C1C0560E9B
	for <soc@kernel.org>; Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933408;
	bh=vkiN8MBHwQBQO8zqcNkgpPklTIrMPZipa4nvmRFekfk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=IKwyKk9hbtWenXNyVq9zkjV/1v57Tws/2VBKyZql+pUFZGZmcVPTGdN3/azT2U2Ji
	 J6WGwNd1fL2DdEpnP/jbHd3oUIbJLhtfCVtuUcxqSxnWEYM9CH/sQRAzpfxYDnf+Hc
	 RtpOB8e2XWlt6jVlxczm6Oe/V9sEDpQV3Ws4ZR92JQKqshkKNCl7AdpcRoxumr9wM4
	 Wmupj2SalxykOR8EVCpm8dFyxubbgzHa6r1Jpma0X1OsnUt8M8S0n+9S8m2DWd2aN2
	 lCnLLAyBjo7WE7Oh2fye3IUojJfhclQYYLXziqR6beZUnvcSmXqayNCFxyfqICwuDE
	 mAhjsgzwtWsWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B0B7D60A2A;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163493340866.6553.12257314209002690174.git-patchwork-summary@kernel.org>
Date: Fri, 22 Oct 2021 20:10:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: Add support for the Mercury+ AA1 module
  Submitter: Paweł Anikiel <pan@semihalf.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=567949
  Lore link: https://lore.kernel.org/r/20211021151736.2096926-1-pan@semihalf.com

Patch: [v2] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on PCI nodes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=568617
  Lore link: https://lore.kernel.org/r/20211022141156.2592221-1-robh@kernel.org

Patch: soc: aspeed: Add UART routing support
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=568233
  Lore link: https://lore.kernel.org/r/20211022000616.481772-1-joel@jms.id.au

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 5.16, round 2
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=567543
  Lore link: https://lore.kernel.org/r/CACPK8Xd=eAMk-S3akhGgL4i_K190Nz9t=_CrdHQMJ+nbW172mg@mail.gmail.com

Patch: [GIT,PULL] soc/fsl drivers changes for next(v5.16)
  Submitter: Li Yang <leoyang.li@nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=568251
  Lore link: https://lore.kernel.org/r/20211022010027.11866-2-leoyang.li@nxp.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


