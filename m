Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4C8C43217
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A973C340F4; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23579C340EB
	for <soc@kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645216811;
	bh=+IytbWgy38AQsOtTGeaSPevrhjV7jz8xWefq12rWKG4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=jpRnBNT3w3LMDzG+Mdo3SisymiUPYxS+YzdTA+VjNTPWmaZqUNzdMLSgQyRCsw9V6
	 Kp5JY2o5yloWBfP1vtywkspbI1+Cogi/Oiho4KYRSA8q2o+ELrWdx1Mg/sYEVsjNcc
	 mrBZrggGtKGXsbU3+Aixvmpk4WasGur4x8E5gg+r39Xz19QMzbZtF/ZfrevhA4IbkM
	 VxvB9T9yMcBC0WqXsCJQtkzM8yJSCmYkgRyNG+X1EJfjRQqByFz+gq6kuCPGpsU6nq
	 BCVIYL8MpouwUTPK3XtXe0SlAIXMMzjnKzJYYp0uPLNaozd4k2dBBFIwRKhaDyJs5D
	 7Z09f2xRxOR+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EE441E5D07D;
	Fri, 18 Feb 2022 20:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164521681092.10306.11499974110452230664.git-patchwork-summary@kernel.org>
Date: Fri, 18 Feb 2022 20:40:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] OP-TEE another fix for v5.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=614106
  Lore link: https://lore.kernel.org/r/20220214125931.GA1332792@jade

Patch: [GIT,PULL] arm64: dts: juno: Fix for v5.17
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=614130
  Lore link: https://lore.kernel.org/r/20220214142615.2375269-1-sudeep.holla@arm.com

Patch: [GIT,PULL] ARM: at91: fixes for 5.17
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613493
  Lore link: https://lore.kernel.org/r/20220211133515.15314-1-nicolas.ferre@microchip.com

Series: [GIT,PULL,1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=613462
  Lore link: https://lore.kernel.org/r/20220211112556.98940-1-dinguyen@kernel.org
    Patches: [GIT,PULL,1/2] ARM: dts: socfpga: dts bindings cleanup for v5.18, part 1
             [GIT,PULL,2/2] arm64: dts: socfpga: dts updates for v5.17, part 2

Patch: [GIT,PULL] firmware: arm_scmi: Fix for v5.17
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=614136
  Lore link: https://lore.kernel.org/r/20220214144245.2376150-1-sudeep.holla@arm.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


