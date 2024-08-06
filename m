Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552A8C52D6F
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DA23C4AF0C; Tue,  6 Aug 2024 20:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FA5C32786
	for <soc@kernel.org>; Tue,  6 Aug 2024 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974895;
	bh=vTJnmY5ZaC30ldPiruvAa1gaOgsSj+U+gmr0YLDVu7M=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=K/afBFmhwPpaEIWIP5b8L19bG+QhjdbbW9BK0QKuhqOghSse+LEfYVEeCpiJ8GsFJ
	 uXnXwICptcWDWACNyfHl8oRTc6KjXFA84VKtgbZ3dUbGK2WCljw8p0FSySMRbExdxw
	 mUiAPvg+4eu5RwCbtMr05IOPUFVXpGbF1BoSsySmq8BI6CgRZ6FQrrWJHUi3DFq0B3
	 kbGP3J6lOCkcQe30+u7gyPK25gqmzFtKGDs3ELlmblY+l6uwLVtpllH7yrlneBrIDL
	 n5hzBHnc84U6iwvrTcfAH3W513lMOkvSXtB4Yn+iVPHbCnEAcWNTjLKY38994h0p2v
	 32JRLaa6XF0eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B91303824F34;
	Tue,  6 Aug 2024 20:08:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297489318.1692635.18056755261985337172.git-patchwork-summary@kernel.org>
Date: Tue, 06 Aug 2024 20:08:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: Updates for turris-mox-rwtm driver
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=871319
  Lore link: https://lore.kernel.org/r/20240715104723.17751-1-kabel@kernel.org
    Patches: [v4,01/19] firmware: turris-mox-rwtm: Do not complete if there are no waiters
             [v4,02/19] firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()

Series: Fixes for turris-mox-rwtm driver
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=871335
  Lore link: https://lore.kernel.org/r/20240715115912.9507-1-kabel@kernel.org
    Patches: [1/3] firmware: turris-mox-rwtm: Do not complete if there are no waiters
             [2/3] firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
             [3/3] firmware: turris-mox-rwtm: Initialize completion before mailbox

Patch: [GIT,PULL] arm64: dts: ti: K3 devicetree updates for v6.11 - part2
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=871462
  Lore link: https://lore.kernel.org/r/aacd1e96-9ff4-4222-9f4d-29e63041f7fb@ti.com

Series: Make turris-omnia-mcu driver parts optional
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=872454
  Lore link: https://lore.kernel.org/r/20240719085756.30598-1-kabel@kernel.org
    Patches: [1/4] platform: cznic: turris-omnia-mcu: Make watchdog code optional
             [2/4] platform: cznic: turris-omnia-mcu: Make TRNG code optional
             [3/4] platform: cznic: turris-omnia-mcu: Make poweroff and wakeup code optional
             [4/4] platform: cznic: turris-omnia-mcu: Make GPIO code optional

Patch: [GIT,PULL] arm64: dts: TI K3 fixes for v6.11
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=877057
  Lore link: https://lore.kernel.org/r/20240806122659.vmasq2qjy6457bbs@peroxide

Series: turris-omnia-mcu doc fixes
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=875113
  Lore link: https://lore.kernel.org/r/20240730144924.25552-1-kabel@kernel.org
    Patches: [1/2] doc: platform: cznic: turris-omnia-mcu: Fix sphinx-build warning
             [2/2] doc: platform: cznic: turris-omnia-mcu: Use double backticks for attribute value

Patch: arm: dts: arm: versatile-ab: Fix duplicate clock node name
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=875227
  Lore link: https://lore.kernel.org/r/20240730210030.2150467-2-robh@kernel.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.11, take 2
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=870774
  Lore link: https://lore.kernel.org/r/d7810433-71a2-45c2-9095-4abd23c12431@linaro.org


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


