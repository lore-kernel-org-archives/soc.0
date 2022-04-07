Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140EC43219
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD2E2C385A9; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90C3DC385A4
	for <soc@kernel.org>; Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649334247;
	bh=SWt9z1th49UKI1crpI4icwl2tYumQsfFt4sL/2MXg6k=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=s22S78PWJSJ7sH/kYf9WdZKcsmx1A4etXtVGsEkExqcNa79cQfa0KB47TbaC6yTSd
	 1dTl5vdEm2JuchVXEORKJlQMRP3exeW0DEroqDTEzN3WzOSC5LeyHdTscfuVp5G30j
	 c8DHYdlnzNByoEc1UJJloWWo3+WxW0tE+ZGKVsEdxr0oxBIg748RZQoP68bymPRkKo
	 XjfqyB+oO/jpg05KrmqMFtDaDwxxs9PNZQzZiodwwFGdjLLZ2JDk+qxDXo7LqKH5rA
	 M7jlDOIYwWMvaEz5XHNcSS1CScziBLOuSiDLtlQqaFSwJlIAbGgfhLYLiDuN7OQK4o
	 wt4/uAMpPtQXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68754E85BCB;
	Thu,  7 Apr 2022 12:24:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164933424736.10369.11001814424980074317.git-patchwork-summary@kernel.org>
Date: Thu, 07 Apr 2022 12:24:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [RESEND] arm64: dts: imx: Fix imx8*-var-som touchscreen property sizes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629669
  Lore link: https://lore.kernel.org/r/Yk3moe6Hz8ELM0iS@robh.at.kernel.org

Patch: arm: configs: imote2: Drop defconfig as board support dropped.
  Submitter: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629132
  Lore link: https://lore.kernel.org/r/20220405135252.10283-1-Jonathan.Cameron@huawei.com

Patch: [RESEND] arm: dts: imx: Fix boolean properties with values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629668
  Lore link: https://lore.kernel.org/r/Yk3mR5yae3gCkKhp@robh.at.kernel.org

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629976
  Lore link: https://lore.kernel.org/r/20220407110818.1436181-1-sudeep.holla@arm.com

Patch: [GIT,PULL] ARM: vexpress: Fixes for v5.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629977
  Lore link: https://lore.kernel.org/r/20220407110828.1436206-1-sudeep.holla@arm.com

Patch: [RESEND] arm/arm64: dts: qcom: Fix boolean properties with values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629670
  Lore link: https://lore.kernel.org/r/Yk3m92Sj26/v1mLG@robh.at.kernel.org

Patch: [RESEND] arm: dts: at91: Fix boolean properties with values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629664
  Lore link: https://lore.kernel.org/r/Yk3leykDEKGBN8rk@robh.at.kernel.org

Patch: [RESEND] arm64: dts: tegra: Fix boolean properties with values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=629671
  Lore link: https://lore.kernel.org/r/Yk3nShkFzNJaI3/Z@robh.at.kernel.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


