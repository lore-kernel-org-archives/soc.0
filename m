Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC41C433ED
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3C7E561246; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2642F61007
	for <soc@kernel.org>; Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618845009;
	bh=uNDIzwq60LhPlD40QVHxbjiPDBFpuWnBsTxiY1q0TAU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=D63NyFQvviD0ouhe8NlvdA9d/nUp3TiYvUIDCK9T8o4f8BWIUD66+f9P1AhWcPG+u
	 nIEBY+IfZd1TE4XCnG6NdJCcsmvYmLY0+pWLBl4VgCtmH9ke456gynIDu3X7dybPd0
	 D6s73vw6mqn3vwxuexsUGXMvmTSbtcFSz2ndMoVLiAegKj+yNe+qsYNsfQegWNfACc
	 PXLU5f3i/JQFIpp5Mw4lF7V8r0IuGjgji5GKyp94TBJu/tTgWNMu74B+pR9MPegYa0
	 PZECR04i1LCxNiZ9cSytqM8Ddb7ZI3VNWtD/OIYDa66pEMtyNNrJdLrSaOXSg72nok
	 v6ihpvohNXA+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1626E60A0B;
	Mon, 19 Apr 2021 15:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161884500903.21313.10943805498799336722.git-patchwork-summary@kernel.org>
Date: Mon, 19 Apr 2021 15:10:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: ARM: mstar: Add initial support for M5Stack UnitV2
  Submitter: Daniel Palmer <daniel@0x0f.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=468925
  Lore link: https://lore.kernel.org/r/20210417011015.2105280-1-daniel@0x0f.com
    Patches: [1/3] dt-bindings: vendor-prefixes: Add vendor prefix for M5Stack
             [2/3] dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
             [3/3] ARM: dts: mstar: Add a dts for M5Stack UnitV2
Series: dts: mediatek: fixes for v5.13
  Submitter: Matthias Brugger <matthias.bgg@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=468641
  Lore link: https://lore.kernel.org/r/20210416143923.23406-1-matthias.bgg@kernel.org
    Patches: [1/2] arm64: dts: mt8183-pumpkin: fix dtbs_check warning
             [2/2] arm64: dts: mt8183: fix dtbs_check warning

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


