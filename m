Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B0AEB64D7
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49140C433CB; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33213C433C0
	for <soc@kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=4dO5LZi97mGUnHVfztp1p+7vimC2jN3XmLtSHokLZno=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=I/kaafxD8N/T3n3Mpim05+NKgOnUXUTo05J9dmSUnGVoYb1llEMJfcV/RwXUwjpEP
	 EcRDXXE8wDo1zb0ugTVqbRX/FD5S/8zv0CfhDpjZHNigVwXU5IDnfD1sO4bNnG34xZ
	 5y2Q7zMLgV7PfE4XCz0C4DuEUbnUpdvtmiXtlv+0ewgIO7GWQHAUo1IZ82XCsQwU+O
	 E5tDXgKmQRNC+h0XPm+CuCWhKErlqrhGi3QLeE2r4vSi/DQGXzgLc50IZT2xZ6GelX
	 rPNalqx+4xT7FN1Jds4finBhKmqLRfcsfmVORjbnXD+gCSYjjQEQGqInHDyO1+AQQi
	 p0R3VLLo3KekQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06157E301FA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611195.12258.4921365563262859150.git-patchwork-summary@kernel.org>
Date: Tue, 20 Jun 2023 21:21:51 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V Devicetrees for v6.5 Part 2
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=758730
  Lore link: https://lore.kernel.org/r/20230620-fidelity-variety-60b47c889e31@spud

Patch: [GIT,PULL] More Qualcomm ARM64 DTS changes for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757546
  Lore link: https://lore.kernel.org/r/20230615162043.1461624-1-andersson@kernel.org

Patch: [PULL] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756400
  Lore link: https://lore.kernel.org/r/20230612180102.289745-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/3] Broadcom devicetree changes for 6.5
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=758394
  Lore link: https://lore.kernel.org/r/20230619134920.3384844-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/3] Broadcom devicetree changes for 6.5
             [GIT,PULL,2/3] Broadcom devicetree-arm64 changes for 6.5

Patch: [GIT,PULL] ARM: mvebu: dt for v6.5 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757881
  Lore link: https://lore.kernel.org/r/87a5wzh8b1.fsf@BL-laptop

Patch: [GIT,PULL,RESEND] arm64: dts: ZynqMP DT changes for v6.5
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756719
  Lore link: https://lore.kernel.org/r/CAHTX3d+2s_KmCnd=x5hydGb+LYoznAzYGTizvqqN2NFmrBurfw@mail.gmail.com

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.5 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757883
  Lore link: https://lore.kernel.org/r/877cs3h87m.fsf@BL-laptop

Series: [GIT,PULL,1/2] soc: ti: Updates for v6.5
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757567
  Lore link: https://lore.kernel.org/r/20230615164127.qcgwrbwpmclx5wlm@landscape
    Patches: [GIT,PULL,2/2] arm: dts: Keystone2 updates for v6.5

Patch: [GIT,PULL] ARM: mediatek: dts32 updates for v6.5
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757556
  Lore link: https://lore.kernel.org/r/98e21acb-d792-6a8c-2de6-12d5af8a8111@gmail.com

Series: [GIT,PULL,1/2] arm64: defconfig: TI K3 updates for v6.5
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757547
  Lore link: https://lore.kernel.org/r/97a49740-32e7-f899-d153-743b5a57eba7@ti.com
    Patches: [GIT,PULL,1/2] arm64: defconfig: TI K3 updates for v6.5
             [GIT,PULL,2/2] arm64: dts: ti: K3 updates for v6.5

Patch: [GIT,PULL] STM32MP25 support for v6.5 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756216
  Lore link: https://lore.kernel.org/r/080fc303-45c1-6cc0-4c5e-694e730896a6@foss.st.com

Patch: [GIT,PULL] Allwinner device tree changes for 6.5
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755877
  Lore link: https://lore.kernel.org/r/20230609210452.GA17638@jernej-laptop

Series: [GIT,PULL,1/4] i.MX dt-bindings for 6.5
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755939
  Lore link: https://lore.kernel.org/r/20230610072530.418847-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/4] i.MX dt-bindings for 6.5
             [GIT,PULL,2/4] i.MX ARM device tree for 6.5
             [GIT,PULL,3/4] i.MX arm64 device tree for 6.5

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756033
  Lore link: https://lore.kernel.org/r/20230611004944.2481596-1-andersson@kernel.org

Patch: arm: dts: Enable device-tree overlay support for AT91 boards
  Submitter: Cristian Birsan <cristian.birsan@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757922
  Lore link: https://lore.kernel.org/r/20230616152932.1484154-1-cristian.birsan@microchip.com

Series: [GIT,PULL,1/6] soc/tegra: Changes for v6.5-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755850
  Lore link: https://lore.kernel.org/r/20230609193620.2275240-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] soc/tegra: Changes for v6.5-rc1
             [GIT,PULL,3/6] dt-bindings: Changes for v6.5-rc1
             [GIT,PULL,6/6] arm64: tegra: Device tree changes for v6.5-rc1

Patch: [GIT,PULL] More Qualcomm ARM32 DeviceTree updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757561
  Lore link: https://lore.kernel.org/r/20230615163926.1462225-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.5 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756102
  Lore link: https://lore.kernel.org/r/3239799.44csPzL39Z@phil

Patch: [GIT,PULL] arm64: dts: mediatek: Updates for v6.5
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757570
  Lore link: https://lore.kernel.org/r/27843c96-142e-930e-33b2-b634182e7cfa@gmail.com

Patch: [GIT,PULL] STM32 DT changes for v6.5 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756208
  Lore link: https://lore.kernel.org/r/08d711de-bb6d-a976-735b-5e18b19818ea@foss.st.com


Total patches: 26

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


