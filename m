Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C82AC0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83A66C433C9; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E5F2C433C7
	for <soc@kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=hPQR49kyT02iH7bJ+YZUwI8MOSVOTK22K9nEdNzZfDI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uhelNkKisr7FseNHmeDe9/Bt/Bj6Ckt+ikG6JObcMZatp3EYC762dJ2cir0u+E9hk
	 3NXbmtre9qjTOdkZC5ng/oDGGRRch6yD381+oiadGgI4cwNi/nKw9mU+Iy5HA5gWvF
	 /bL+4Zk6yLmDJ2t+kCJjdnUU8oCNIPAz8b35+3FNmf1gEcQyoBbr5kxmDZ6hJswHOF
	 yd+ZcWogYUsuK+sxUHvaUlGNsl+YF6+u4sOqax2Pprx3gO6R34bxU27zDAQyz7E+as
	 xWOYROPrcri9+n5hoa24LhcvVqZ1guQZP05MKFMd/HJFF60Cj7+x3kx8K1PsujZEIv
	 ofojNcUeEN/5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 564A1E505D5;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562734.32343.2644054063429855739.git-patchwork-summary@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=770555
  Lore link: https://lore.kernel.org/r/cover.1690545139.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.6

Patch: [GIT,PULL] ARM: vexpress: Updates for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773097
  Lore link: https://lore.kernel.org/r/20230804123214.3258032-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/3] samsung: drivers for v6.6
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775030
  Lore link: https://lore.kernel.org/r/20230810151250.220202-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.6

Patch: [GIT,PULL] amlogic Drivers updates for v6.6
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773124
  Lore link: https://lore.kernel.org/r/77e328b5-0d47-36e8-f62d-c745df06fb87@linaro.org

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773099
  Lore link: https://lore.kernel.org/r/20230804123231.3258141-1-sudeep.holla@arm.com

Patch: [RESEND] ARM: multi_v7_defconfig: Enable TLV320AIC3x
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=771176
  Lore link: https://lore.kernel.org/r/20230731-arm-tlv320aic31xx-config-v1-1-013c8c321dad@kernel.org

Patch: [GIT,PULL] Reset controller updates for v6.6
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774032
  Lore link: https://lore.kernel.org/r/20230808145950.3057250-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] Allwinner drivers changes for 6.6
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773442
  Lore link: https://lore.kernel.org/r/20230806180650.GA127142@jernej-laptop

Patch: [GIT,PULL] arm64: soc: ZynqMP SoC changes for v6.6
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773072
  Lore link: https://lore.kernel.org/r/399efa45-df0a-4ec7-e25c-774bb8bf6fb4@monstr.eu

Series: [GIT,PULL,1/4] soc/tegra: Changes for v6.6-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=770498
  Lore link: https://lore.kernel.org/r/20230728094129.3587109-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/4] soc/tegra: Changes for v6.6-rc1

Patch: [GIT,PULL] hisilicon: driver updates for v6.6
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775260
  Lore link: https://lore.kernel.org/r/64D605DE.2070303@hisilicon.com


Total patches: 11

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


