Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AE3CE7B0B
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBA13C433CC; Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6D78C433CA
	for <soc@kernel.org>; Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888044;
	bh=6HGcu8CeWtCUH1ECFwwHOa7kK2XuFmMd7/2fUmGkBp4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=oW9ob/VHG+OSRSTVvejzcfH3pq7g2La1Qax6CfxG2g4sjILyapKMPKZYxIxgD4TBT
	 09KPNmC9/nShQSjWd9f16VjKw69mMdM25eUGvNaak+8FustlscKg2RWQ5IfywwCJnT
	 TIvIN4c1blsHjuEVlwmNO/6QEG8s54v4LHDlRZdwmAfSJPbB8GZczLzNPUUr6jELga
	 syiQpDdG0PitOPbRBLh86QG4xkHJPjRHjh/17WqA6157eHNtbYokejURNvq/WF7nKt
	 zulCG2qlnLxAIh6j2Wyi9mrkdyjlpsYcLbD/LddIGiAIltjeBAmwCBSIpoejV+Y0QE
	 klpnUjXIEbF8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B230E29AFE;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588804456.3136.5579809041941492875.git-patchwork-summary@kernel.org>
Date: Thu, 28 Sep 2023 08:00:44 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: locomo: fix locomolcd_power declaration
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788242
  Lore link: https://lore.kernel.org/r/20230927194844.680771-1-arnd@kernel.org

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788086
  Lore link: https://lore.kernel.org/r/20230927121555.158619-1-sudeep.holla@arm.com

Patch: arm64: defconfig: enable syscon-poweroff driver
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=781145
  Lore link: https://lore.kernel.org/r/20230901115732.45854-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] firmware: arm_scmi: Fix for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788087
  Lore link: https://lore.kernel.org/r/20230927121604.158645-1-sudeep.holla@arm.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


