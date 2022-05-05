Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FC6C433EF
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5505C385B3; Thu,  5 May 2022 19:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF69BC385AA
	for <soc@kernel.org>; Thu,  5 May 2022 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779107;
	bh=MS9fSXUi/tABakFrrNwvSMnicQZqv68H+VD5wXgjuVw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aufgiZCCQKvRu+AISCRMgoY5qV1dNAK7ZJmludU+CpIEZZfPnb6xJ9rtAH1tLvC2R
	 Qo0bvdg963K/siOHJ2LKSpVh8yOta+M4TbKonN5c2lApLTPKwsXeZnf2mGQ7JP5mjV
	 suGx47FKwwXCTq+Xm0E1f4WycFH5hmiIqoex3CodwfDotNjXRDK4eIDlu+DmAoFoR3
	 mqL0wDogHBP53aFVpMpX3komK2w0Azn854jCnxAa0tKHNaH6sRdgRa3HmscYIy6R8/
	 Kmi+2jaVND2k4IEvgSsWV12Siwb7R1GfDpmJKQP3InxJz02vY4zBDygXWfSgZAqxb6
	 pyPFun9sDttgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC9B5E8DBDA;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910763.9627.15807728190751756738.git-patchwork-summary@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v5.19
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638263
  Lore link: https://lore.kernel.org/r/20220504112906.3491985-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/6] Broadcom defconfig changes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638454
  Lore link: https://lore.kernel.org/r/20220504210942.1838248-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/6] Broadcom defconfig changes for 5.19
             [GIT,PULL,2/6] Broadcom devicetree changes for 5.19
             [GIT,PULL,3/6] Broadcom devicetree-arm64 changes for 5.19
             [GIT,PULL,4/6] Broadcom drivers changes for 5.19
             [GIT,PULL,6/6] Broadcom soc changes for 5.19

Patch: [GIT,PULL] arm64: dts: juno: Updates for v5.19
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638264
  Lore link: https://lore.kernel.org/r/20220504112917.3492009-1-sudeep.holla@arm.com

Patch: [GIT,PULL] TEE SHM vmalloc for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638026
  Lore link: https://lore.kernel.org/r/20220503192916.GA3288817@jade

Patch: [GIT,PULL] firmware: arm_ffa: Updates for v5.19
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638262
  Lore link: https://lore.kernel.org/r/20220504112853.3491961-1-sudeep.holla@arm.com

Patch: [GIT,PULL] More devicetree changes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638565
  Lore link: https://lore.kernel.org/r/pull-1651726643-535261@atomide.com

Patch: [GIT,PULL] OP-TEE RPC arg for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638435
  Lore link: https://lore.kernel.org/r/20220504201759.GA180315@jade

Patch: [GIT,PULL] Apple SoC RTKit/SART/NVMe driver
  Submitter: Sven Peter <sven@svenpeter.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638789
  Lore link: https://lore.kernel.org/r/20220505154020.84638-1-sven@svenpeter.dev

Patch: [GIT,PULL] TEE menu for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638024
  Lore link: https://lore.kernel.org/r/20220503191626.GA3278203@jade

Patch: [GIT,PULL] STM32 DT changes for v5.19 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=638252
  Lore link: https://lore.kernel.org/r/5818c943-882d-7e50-430d-ae3299a108ee@foss.st.com

Patch: [GIT,PULL] Reset controller updates for v5.19
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=637981
  Lore link: https://lore.kernel.org/r/20220503160057.46625-1-p.zabel@pengutronix.de


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


