Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E8205AD9
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450693; cv=none; b=vD/buV+U2S12Yiy0sC0cfz41e4lR3mHyrJaCS+s/NzdOTtbItxI84EoDqey7LctBtDjb9Nnc2KGLWRZnk/lz148QEwYNX5x2mLU8co0SfAYtoWoK5pd0rdct8mLRAp6yv7TZkVOyCb6Nlgdp3F7lsPqeaYGz8nkKmoLvK3d2qRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450693; c=relaxed/simple;
	bh=niBUecoQ7uaDMP8dX/HZPHFaQfz6ZHjmBkEv7AmJeqQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=O+j2Y4UMApzsZsI+wld5bVuWjfnxk61I3EjXQ++IDkntdG2vgqPl1f+AM+NMibTiZWg1d2C6ZVmTUO0pOCa/9jMQ1Ia/3pYEQcA4Drqr1e+T9DVWpqPSTQnFm2gCMNsrCV5BLQZfov4+R5vAdeJifcmETFn9MOq1Sm/B7Wl1kGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtBRc+I2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtBRc+I2"
Received: by smtp.kernel.org (Postfix)
	id 82E85C4CED6; Tue, 12 Nov 2024 22:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69383C4CECD
	for <soc@kernel.org>; Tue, 12 Nov 2024 22:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450693;
	bh=niBUecoQ7uaDMP8dX/HZPHFaQfz6ZHjmBkEv7AmJeqQ=;
	h=Subject:From:Date:To:Cc:From;
	b=WtBRc+I2Fh0d7KgfpkyRVwYjXjFaA8d4fnSYGpYmpDCO6K4yYY2WSl0S0mcC4rjBv
	 UEhNKCaIrmOX618IJzX70OocLTJLhtNKHIMf1nQytomBpqYaPfyq8xpANba7QKr4F1
	 L8gBkBY7F6IIc67SPwto8QFdbkJYE1femMW3M42/ZRLzEUFKnu7wwEG14jQ56tVogN
	 NQe/aGYnzOSLKbAv3dL2eYR3DLGRkiL5Epvno7RJpLsXEDUQlk/FPrXt+kUqUXQtVc
	 hPg7Ahv4JFPxmOGC4NrUgt7DMvDYhvo83j/7rO7ivNb1m9kKJR2I6JjGK1ayHbczoh
	 V4h4jhFrhSC+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B28E83809A80;
	Tue, 12 Nov 2024 22:31:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145070332.694695.3322171572907324745.git-patchwork-summary@kernel.org>
Date: Tue, 12 Nov 2024 22:31:43 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: dts: PL022 clock fixes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906652
  Lore link: https://lore.kernel.org/r/20241105-dts-spi-fixes-v2-0-623501e5d1ca@kernel.org
    Patches: [RESEND,v2,1/2] arm64: dts: seattle: Update spi clock properties
             [RESEND,v2,2/2] arm64: dts: lg131x: Update spi clock properties

Series: [GIT,PULL,1/3] samsung: drivers for v6.13
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=904107
  Lore link: https://lore.kernel.org/r/20241029081002.21106-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.13
             [GIT,PULL,2/3] arm64: dts: samsung: DTS for v6.13
             [GIT,PULL,3/3] ARM: samsung: soc/mach for v6.13

Patch: [GIT,PULL] amlogic ARM DT updates for v6.13
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906961
  Lore link: https://lore.kernel.org/r/ffaa3755-8c5d-4fc3-86bf-9129d3889bff@linaro.org

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.13
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906965
  Lore link: https://lore.kernel.org/r/3ded4795-2186-4e06-bda6-9c9a65a3fdb9@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.13
             [GIT,PULL,2/2] arm64: defconfig: Updates for v6.13 for TI K3 platforms

Patch: [GIT,PULL] ARM: Zynq SoC changes for 6.13
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905408
  Lore link: https://lore.kernel.org/r/CAHTX3dKLb4nOVpVvnwyxE6zJZNXpiB4hh=WzpKWwhqP7aLobjw@mail.gmail.com

Series: [GIT,PULL,1/2] Broadcom defconfig changes for 6.13
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=903637
  Lore link: https://lore.kernel.org/r/20241028035449.734504-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom defconfig changes for 6.13
             [GIT,PULL,2/2] Broadcom soc changes for 6.13

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.13
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906707
  Lore link: https://lore.kernel.org/r/MA0P287MB2822DC23E1EE47A5C7D41476FE532@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM

Patch: [GIT,PULL] Allwinner device tree changes for 6.13 part 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908148
  Lore link: https://lore.kernel.org/r/ZzC-OF57MT_yCeWH@wens.tw

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for 6.13
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905404
  Lore link: https://lore.kernel.org/r/CAHTX3d+x1WrXhsp6+PQbo-B3T9q21tqE1RkhVsh0r7my3vH37g@mail.gmail.com

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.13
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906962
  Lore link: https://lore.kernel.org/r/6fb3d64a-3913-4db0-9cdc-336af32a88a9@linaro.org

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree changes for v6.13
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906578
  Lore link: https://lore.kernel.org/r/20241105164901.7787-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V Devicetrees for v6.13
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=907716
  Lore link: https://lore.kernel.org/r/20241108-washboard-material-6b9ff196063d@spud

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.13
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905867
  Lore link: https://lore.kernel.org/r/20241104035709.19094-1-andersson@kernel.org

Patch: [GIT,PULL] Apple SoC DT updates for v6.13
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908441
  Lore link: https://lore.kernel.org/r/a8a19596-5d46-4562-9555-3b3ae7a5a3e5@marcan.st

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.13
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905864
  Lore link: https://lore.kernel.org/r/20241104034744.14378-1-andersson@kernel.org

Series: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=906009
  Lore link: https://lore.kernel.org/r/20241104112625.161365-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


