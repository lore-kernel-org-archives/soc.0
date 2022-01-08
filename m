Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBE5C433FE
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40E68C36AEF; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AABEC36AED
	for <soc@kernel.org>; Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641679214;
	bh=h1JP1EHptDlxE1C2KpSRlnFWj0kRBr0wbOfVUgOYlVM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=UP1JzLatH2wYHsjHKcJQDIjgV0X4izaLwpGojoqPDsutS7rajUk56TDQMntS9K1vS
	 g8sO7MXJ14WTCmDW7XLbvmysQ7bQxkOOJwZ96+/cLwgE1xT6teUMSpXnhSlh1Ibnox
	 e48Cc2FpX3I6vjZ5/jgMkBokSqNI+79iI9AJXaAu5nvppPF9imGT4dtkF/yqA9KXGR
	 /aMtnfywc3GyqNeXHIBt4oPFuA46n+cABE1h+E1xDL4QUHb/s5+s+DvcpEdDI7TfCz
	 W+GC9UgUfBPPI3LCX1I5UAZgSllmtTRmO9zvonaPMqRnLZlptr/asHid0fJlrqdAYq
	 33VnjUrE/0UEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A2B1F79403;
	Sat,  8 Jan 2022 22:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164167921410.24856.16410937182312294700.git-patchwork-summary@kernel.org>
Date: Sat, 08 Jan 2022 22:00:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: socfpga: dts updates for v5.17, part 2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=603023
  Lore link: https://lore.kernel.org/r/20220105213603.804026-1-dinguyen@kernel.org

Series: [GIT,PULL,1/2] memory: drivers for v5.17
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=601224
  Lore link: https://lore.kernel.org/r/20211224111124.6097-1-krzysztof.kozlowski@canonical.com
    Patches: [GIT,PULL,1/2] memory: drivers for v5.17
             [GIT,PULL,2/2] memory: omap: drivers for v5.17

Patch: [GIT,PULL] arm64: dts: samsung: Second pull for v5.17
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=601474
  Lore link: https://lore.kernel.org/r/20211227112959.7325-1-krzysztof.kozlowski@canonical.com

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v5.17
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=599384
  Lore link: https://lore.kernel.org/r/20211222141342.56395-1-sudeep.holla@arm.com

Patch: [GIT,PULL] soc/fsl drivers changes for next(v5.17)
  Submitter: Li Yang <leoyang.li@nxp.com>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=603427
  Lore link: https://lore.kernel.org/r/20220107033736.26762-1-leoyang.li@nxp.com

Patch: [v2] ARM: configs: aspeed: Add support for USB flash drives
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=599079
  Lore link: https://lore.kernel.org/r/20211222004123.128157-1-joel@jms.id.au

Patch: [GIT,PULL] Reset controller updates vor v5.17
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=602956
  Lore link: https://lore.kernel.org/r/20220105172618.302522-1-p.zabel@pengutronix.de


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


