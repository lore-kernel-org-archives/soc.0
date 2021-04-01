Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451FCC43461
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15237610C7; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F3D686108B
	for <soc@kernel.org>; Thu,  1 Apr 2021 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617270061;
	bh=1eTD25TNHfEvphc02Lytwl4nIA5M/7Jbb+eGRPMV3Ac=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ReCmxWLvFRSHdKVzOdfwg75I/mZuuMXatMqKfFjDxhp2g+om94um6AiHNZFjOA99U
	 U9xPLJFYqQGjckKoKvjiQwMH/8xHw/Vo5Q4XceZ3mmiYqWNDSeF2cRDOPt1lCuYjbO
	 pjHsaLpe1FkdoCg1dqCRQ/eedzYYDGz9HNuORF5s2CjWZ4AAM+H2362o+W162eX6Db
	 C+6QtoYrlP0M/5nYEWLzOG42f9rbQh42sn3spGaT7+lOv+FxLrZ4RfX8ZROGyzbPA7
	 hn01G9OHD5rHSpY7aDFCFrCuLABjBcHZcNYH6prXDX7B+peMVb58+DeJFVolj1U6PO
	 IkxkoURD9ubPQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D7F3060727;
	Thu,  1 Apr 2021 09:41:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161727006083.25375.18066690501544276798.git-patchwork-summary@kernel.org>
Date: Thu, 01 Apr 2021 09:41:00 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] More fixes for omaps for v5.12-rc cycle
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=454539
  Lore link: https://lore.kernel.org/r/pull-1616584662-702939@atomide.com
Patch: [GIT,PULL] i.MX fixes for 5.12, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=457937
  Lore link: https://lore.kernel.org/r/20210330090236.GQ22955@dragon
Patch: [GIT,PULL] ARM: SoC fixes for v5.12
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=456323
  Lore link: https://lore.kernel.org/r/CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


