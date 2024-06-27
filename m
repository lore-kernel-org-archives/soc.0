Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109C5C3064D
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDB41C4AF0A; Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6FF8C32786
	for <soc@kernel.org>; Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500463;
	bh=Too+y/j39fQD2NfacPPhIx34k5jUWW6ejlggvRvC3RA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gc82oXE113k4dp1umYt+sTrCOT6JST5rcsg1EcrJveH1Yg8y3LqDbUWQ46hlT/v7L
	 8hUv+i+Wm/Oq2NFkoRUSpyJn3su59KvKWZpOxvjP+U3bOTIqXl/+CN7ts0EWmSB4m8
	 rcm400/sRgVte142+9bZ2GA89vGz1sFZaOB+oQYB59IUtu1og0tNsWXeO6agHuVeSY
	 a4f4Zj0EmXZ72FtWwVIi0i1oeb8ANRKdtjuk9VnCOUD0tQP5Vd73ZSRBsEFwimUFi6
	 3mKZDjGutN6yDx3JNlBnmkAMIavSxOl6KXv+CXvS7P8LmlLjDyuVOIFBs1AhjxKHNc
	 3ewTtojle/9+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C018AC433A2;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046377.29698.7093489013185397129.git-patchwork-summary@kernel.org>
Date: Thu, 27 Jun 2024 15:01:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Reset controller updates for v6.11
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=865836
  Lore link: https://lore.kernel.org/r/20240626163258.61222-1-p.zabel@pengutronix.de

Series: Renesas SoC updates for v6.11
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861990
  Lore link: https://lore.kernel.org/r/cover.1718355309.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM defconfig updates for v6.11
             [GIT,PULL,2/2] Renesas DTS updates for v6.11

Patch: [v2] soc: add missing MODULE_DESCRIPTION() macros
  Submitter: Jeff Johnson <quic_jjohnson@quicinc.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=865435
  Lore link: https://lore.kernel.org/r/20240625-md-drivers-soc-v2-1-8bc7c03e3e69@quicinc.com

Patch: [GIT,PULL] ARM: socfpga: updates for v6.11
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=865911
  Lore link: https://lore.kernel.org/r/20240626210728.21295-1-dinguyen@kernel.org

Patch: [GIT,PULL] arm64: dts: juno: Updates for v6.11
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=863762
  Lore link: https://lore.kernel.org/r/20240620093924.375244-2-sudeep.holla@arm.com

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for 6.11
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=865325
  Lore link: https://lore.kernel.org/r/CAHTX3dLbNAYL4hm+bs=GByA4DqjRr3Rt6WESram8VyU1By8Mow@mail.gmail.com

Patch: [GIT,PULL,UPDATED] firmware: arm_ffa: Updates for v6.11
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=864850
  Lore link: https://lore.kernel.org/r/20240624103451.2870146-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.11
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=863763
  Lore link: https://lore.kernel.org/r/20240620093924.375244-3-sudeep.holla@arm.com

Patch: [GIT,PULL] OP-TEE add notif wait timeout parameter for v6.11
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866073
  Lore link: https://lore.kernel.org/r/20240627095325.GA2585076@rayden


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


