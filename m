Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A49C433E0
	for <soc@archiver.kernel.org>; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5976864F24; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 427BE64EF6
	for <soc@kernel.org>; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616109012;
	bh=sxjCG6cFPvoDypJulAiefvWzSSrt74Zl+PEcrnInaLM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Ex69TMUI8ACxKNjGyYpe0/Me/YxycJwXFBV3bBucD1ZGMHTuc7iMyJMMCVBBR89Fe
	 /3HDBgz6CQ4sEfTn3p74tvK97/Lxx2M3xA2jPXqAjU7/8ZHSxxhtRKVMqZcFev3bWa
	 1NX29WTB+W1P6964jOsSbAfUhwLB3Js0b++gTEPTijQQK7wAj4kispcU10ea/CUQft
	 liZmygAW2XV5jO9FoV/8OE2HvjrMsyXg85aAIwFCcUPUiuK9sPGl5i6sCD/GWCgZ+s
	 NtRTNSdwX+oYLCA+vA7rMK8sDFfa380rCU2NXfWdafmU/2HnQ6yJrZBE/yqsM6V3Ps
	 R2kMVntP0NM4g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C5EB600E8;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161610901221.20140.8633935211374619076.git-patchwork-summary@kernel.org>
Date: Thu, 18 Mar 2021 23:10:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Series: [GIT,PULL,1/2] Broadcom late devicetree changes for 5.12
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=434323
  Lore link: https://lore.kernel.org/r/20210217011654.2561426-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/2] Broadcom late devicetree changes for 5.12
             [GIT,PULL,2/2] Broadcom late drivers changes for 5.12
Patch: [GIT,PULL] ARM: at91: fixes for 5.12
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=445517
  Lore link: https://lore.kernel.org/r/20210310160547.55382-1-nicolas.ferre@microchip.com
Patch: [GIT,PULL] i.MX fixes for 5.12
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=450545
  Lore link: https://lore.kernel.org/r/20210318090145.GA22955@dragon
Patch: [GIT,PULL] Fixes for omaps for v5.12-rc cycle
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=442069
  Lore link: https://lore.kernel.org/r/pull-1614868603-800959@atomide.com

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


