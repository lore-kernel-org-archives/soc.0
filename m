Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E55BC46CA1
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6525C433D9; Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF74BC433C7
	for <soc@kernel.org>; Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491917;
	bh=XBGDcz/QSZf262QHxlSxyV3ANrSs1u7o0sx/TDXWM5A=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=RKSjkiUxaSF5lcrhyxF26A1DLykvR4Myy6gtF9IAqqWjF7YQZy0y5kwHRZAopHPyw
	 fjsrtpr2TxY4FOHA+1ts/Z/yD792H7RtlLFSOz94vzVyuZrDv0EO7qD4Xf2d9wo8Yr
	 LyEPhqsrmT7NRH3FAGJOrbqBnN8mGQj9KQ34BfCSKcIeif8mUXJ9iUZL7IHePsZzpH
	 6eUEXnvA7TqWHDTJ8ppb78lrhOfQ5GjY3hdiF3GMhOo3QLykkb3tEjoqgPLxdySni6
	 S5ePBLqteqx/Fg6QlwsWsLfA+Mc4kNMJV9gYXkCR4rTm0IkAretvQN5wa4J95U0VKz
	 rmlmRO0/wp1mw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AAF56C43170;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191761.22284.15812201880658783033.git-patchwork-summary@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.7
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793351
  Lore link: https://lore.kernel.org/r/CACPK8XebMAQvgQTRH+KoaTFg7CzRkS79Fz3Kn8p4mbaezWGkUQ@mail.gmail.com

Patch: [GIT,PULL] Qualcomm ARM DeviceTree updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793333
  Lore link: https://lore.kernel.org/r/20231015204558.855987-1-andersson@kernel.org

Series: [GIT,PULL,1/4] i.MX dt-bindings changes for 6.7
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793287
  Lore link: https://lore.kernel.org/r/20231015132300.2268016-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/4] i.MX dt-bindings changes for 6.7
             [GIT,PULL,2/4] i.MX ARM device tree changes for 6.7
             [GIT,PULL,3/4] i.MX arm64 device tree chanages for 6.7

Patch: [GIT,PULL] Convert drivers/soc to struct platform_driver::remove_new()
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793259
  Lore link: https://lore.kernel.org/r/20231014215918.prqhkk7kp2vobe3a@pengutronix.de

Patch: [GIT,PULL] STM32 DT changes for v6.7 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793461
  Lore link: https://lore.kernel.org/r/8a6b3ca9-f10d-825e-e371-8aeff3289a25@foss.st.com

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793317
  Lore link: https://lore.kernel.org/r/20231015191107.854658-1-andersson@kernel.org

Series: [GIT,PULL,1/6] soc/tegra: Changes for v6.7-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793062
  Lore link: https://lore.kernel.org/r/20231013153723.1729109-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] soc/tegra: Changes for v6.7-rc1
             [GIT,PULL,2/6] firmware: tegra: Changes for v6.7-rc1
             [GIT,PULL,4/6] memory: tegra: Changes for v6.7-rc1

Patch: [GIT,PULL] RISC-V SoC drivers for v6.7
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793582
  Lore link: https://lore.kernel.org/r/20231016-predator-affiliate-e8affd3a7be9@spud

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.7
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793443
  Lore link: https://lore.kernel.org/r/b3e1bf66-9182-4d48-88ef-7efc20466e7c@linaro.org

Patch: [GIT,PULL] ARM: aspeed: soc changes for 6.7
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793353
  Lore link: https://lore.kernel.org/r/CACPK8XcTx9bd7DkguFOZ4qCxk8MJWm-yeNMLGDCnO+wv7dwa1g@mail.gmail.com

Patch: [GIT,PULL] ARM: vexpress: Update for v6.7
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=791774
  Lore link: https://lore.kernel.org/r/20231010124339.1620012-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.7
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=791775
  Lore link: https://lore.kernel.org/r/20231010124347.1620040-1-sudeep.holla@arm.com

Series: Renesas SoC updates for v6.7
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788761
  Lore link: https://lore.kernel.org/r/cover.1695985418.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7
             [GIT,PULL,3/5] Renesas driver updates for v6.7

Patch: [GIT,PULL] amlogic Drivers updates for v6.7
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793444
  Lore link: https://lore.kernel.org/r/00ef6ab3-59c1-484a-9d70-50f16e4cc584@linaro.org

Series: [GIT,PULL,1/2] ARM: defconfig: pull for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793422
  Lore link: https://lore.kernel.org/r/20231016072911.27148-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] ARM: defconfig: pull for v6.7
             [PULL,2/2] soc: samsung: exynos-chipid: Convert to platform remove callback returning void

Patch: [GIT,PULL] memory: drivers for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793429
  Lore link: https://lore.kernel.org/r/20231016074013.28286-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] firmware: arm_ffa: Updates for v6.7
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=791776
  Lore link: https://lore.kernel.org/r/20231010124354.1620064-1-sudeep.holla@arm.com

Patch: [GIT,PULL] soc: mediatek: Updates for v6.7
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=791253
  Lore link: https://lore.kernel.org/r/d25ccd90-277a-fd05-8605-f7d1d129d4fa@gmail.com


Total patches: 24

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


