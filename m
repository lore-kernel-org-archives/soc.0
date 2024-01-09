Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA94C46CD2
	for <soc@archiver.kernel.org>; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2681C43399; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCCDFC433F1
	for <soc@kernel.org>; Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704786025;
	bh=oSyUeq51XmuPYii0/o05HrggU5sJUEvuZ9L9BTNN5F8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lYIFTIcOY9PcerANXKHh0zj86jx+nc4o/JHzyJ/0G7GTEo7RQ0faTFSv8qn7qduL5
	 5A3tMgfX6cH89HJ6WPvMDov+aF2pi4+WCaJ6DyBR/MGR+cIyI23KeAXgpSmdwFQ231
	 f07Q+N3oMOwFLNLM+M180DNX6ifLNLfksKrWz3SImFGCzGhqmKAPcrWVkR58ZC6xSv
	 bvhNKOA9jB2HYjVlHq6yS/sc59X7SEb7470Us4I3/1At0i7bJbKQnAGAM2A6+k5VEX
	 GSXqvwXOOH15EJRKt+z+AlvJWUqwC8LIYnVSmNt7B1lNT9UbxlC1KDu/9/N6hkuCRp
	 r31lhtW/rxOsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9896BC4166F;
	Tue,  9 Jan 2024 07:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170478602557.21956.8070622632652140435.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jan 2024 07:40:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: multi_v7_defconfig: Enable STM32 IPCC mailbox driver
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=814938
  Lore link: https://lore.kernel.org/r/20240107-arm-defconfig-stm32-ipcc-v1-1-924721db5661@kernel.org

Patch: [v2] soc: pxa: ssp: fix casts
  Submitter: Duje Mihanović <duje.mihanovic@skole.hr>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=814823
  Lore link: https://lore.kernel.org/r/20240106-pxa-ssp-v2-1-69ac9f028bba@skole.hr

Patch: ARM: davinci: always select CONFIG_CPU_ARM926T
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=815034
  Lore link: https://lore.kernel.org/r/20240108110055.1531153-1-arnd@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


