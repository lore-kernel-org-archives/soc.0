Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DDEC3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CFAB3221FF; Fri, 27 Nov 2020 17:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497020;
	bh=EPw2Gglo6I7fHsJn/NZpbM1QNL8VhDL7aRMhxkM/aSM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=v3GTOAvkhMXwZvUHnvVMV74QfkD/wlmqy/IfmPKUeEQUxb0Sk+gFvmW/OYMkIAm27
	 +2NmP+FmAbL4KMINkjEIWY6jurwQjFjH74wOSa9zJrT0eQMmKjzL8HL5kXj4IqHHBb
	 Q7Pyk+LxwaIAZ2vNmJwoThtXD1VcFSSK4Z+dDmzo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702058.7685.701409788216086929.git-patchwork-summary@kernel.org>
Date: Fri, 27 Nov 2020 17:10:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] Fixes for omaps for v5.10-rc cycle
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=391929
  Lore link: https://lore.kernel.org/r/pull-1606460270-864284@atomide.com
Patch: [GIT,PULL] OP-TEE driver for v5.11
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=390879
  Lore link: https://lore.kernel.org/r/20201125120134.GA1642471@jade

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


