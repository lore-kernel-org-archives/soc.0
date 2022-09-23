Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03059ECAAD8
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC478C433B5; Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6475C433D6
	for <soc@kernel.org>; Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663950026;
	bh=M/E5rPqfzQx3pn4UdVc9KWjnGNs8lM56Edy2VbI/ZnI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Dn1F801VlOU8U/9T1W5DO3cJxx8uwHw/WeWbw3hxH74jLe5eyLxZ7iXTFQKZyUZYM
	 CIt3AaAJgzQhUjcBOa9yVorlmPT2JRoMJvLtxZfYT0g3wYFqwo92JRZ8BSt8pFlnAZ
	 CMgK/64XpKF83kmktAr0xKe+ecpCGeiBAeFxbexVKtYDYcoyFPthcw/PzjUFCP2Uwm
	 GSCzSnaAg3oO2Q89qN2kW1rOZLD+vPgMEAuLYliXffMLcN4SReMyvEXHqAUIbt9GXl
	 Kiqe1KHTurudEJeo9wrJDA/U1JYVr4mlwcT0XBcC7TjbkeHa1xYc140RuXR1wQ2K4f
	 OHJigth+/tDcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A36C8E4D03B;
	Fri, 23 Sep 2022 16:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166395002660.3905.2443600156099893992.git-patchwork-summary@kernel.org>
Date: Fri, 23 Sep 2022 16:20:26 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: arm64: configs: Enable all PMUs provided by Arm
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678293
  Lore link: https://lore.kernel.org/r/20220919162753.3079869-1-broonie@kernel.org

Series: [GIT,PULL,1/6] soc/tegra: Changes for v6.1-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677602
  Lore link: https://lore.kernel.org/r/20220916101957.1635854-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] soc/tegra: Changes for v6.1-rc1
             [GIT,PULL,2/6] soc/tegra: cbb: Changes for v6.1-rc1
             [GIT,PULL,3/6] firmware: tegra: Changes for v6.1-rc1
             [GIT,PULL,6/6] arm64: tegra: Default configuration changes for v6.1-rc1

Patch: [GIT,PULL] Qualcomm ARM defconfig updates for 6.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679089
  Lore link: https://lore.kernel.org/r/20220921153734.1314952-1-andersson@kernel.org

Series: [GIT,PULL,1/4] i.MX DT bindings update for 6.1
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677941
  Lore link: https://lore.kernel.org/r/20220918092806.2152700-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/4] i.MX DT bindings update for 6.1
             [GIT,PULL,2/4] i.MX drivers change for 6.1

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for 6.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679077
  Lore link: https://lore.kernel.org/r/20220921150314.1312358-1-andersson@kernel.org

Series: Misc hisi_lpc changes
  Submitter: John Garry <john.garry@huawei.com>
  Committer: Wei Xu <xuwei5@hisilicon.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=674020
  Lore link: https://lore.kernel.org/r/1662366186-233933-1-git-send-email-john.garry@huawei.com
    Patches: [v3,1/5] bus: hisi_lpc: Don't dereference fwnode handle
             [v3,2/5] bus: hisi_lpc: Use devm_platform_ioremap_resource
             [v3,3/5] bus: hisi_lpc: Correct error code for timeout
             [v3,4/5] bus: hisi_lpc: Don't guard ACPI IDs with ACPI_PTR()
             [v3,5/5] bus: hisi_lpc: Use platform_device_register_full()

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.1 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679933
  Lore link: https://lore.kernel.org/r/87h70yxfmy.fsf@BL-laptop

Patch: [GIT,PULL] ARM: soc: MediaTek related SoC diver updates for v6.1
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678147
  Lore link: https://lore.kernel.org/r/498fe3e5-a237-121a-d500-fbb0994906cb@gmail.com

Patch: [GIT,PULL] ARM: mvebu: dt for v6.1 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679940
  Lore link: https://lore.kernel.org/r/87edw2xfle.fsf@BL-laptop

Patch: [GIT,PULL] Qualcomm driver updates for 6.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679099
  Lore link: https://lore.kernel.org/r/20220921155753.1316308-1-andersson@kernel.org

Patch: [GIT,PULL] Allwinner drivers changes for 6.1
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677989
  Lore link: https://lore.kernel.org/r/YyeOthH4y8wy8A8R@kista.localdomain

Patch: [GIT,PULL] Allwinner config changes for 6.1
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=677991
  Lore link: https://lore.kernel.org/r/YyePcA5YHOZjdOf7@kista.localdomain

Patch: [GIT,PULL] Devicetree changes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678168
  Lore link: https://lore.kernel.org/r/pull-1663587735-853102@atomide.com

Patch: [GIT,PULL] HiSilicon driver updates for v6.1
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676377
  Lore link: https://lore.kernel.org/r/631FE463.6070701@hisilicon.com


Total patches: 22

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


