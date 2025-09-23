Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EB8265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662445; cv=none; b=JG2hvXbWfhM/hWgk+rExBFqUDK22dfCBHFxCq8NFZZEEg5tq0uyG0/YTIgzpSyFE8TAyPEYOxiBECl3T7AgSe+Q9INqp4QL1QFjm/jygl3dk/8HHkBWY05LQZsXNiqwYglxWB5zdljZ3iEqijH4XeyQPYqoBzfkZp79GFJCIuRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662445; c=relaxed/simple;
	bh=30S3NLxeLEDh0w0N7UMmL7ufYVY2AIhbFCTbHvHCcuk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Dj6DGcvMMTnYxCRkc7/elT/u77CG5t7CoXiG4XnWAmWEqtJNn1HWD1oYmC7DotOvwsT2ILon03cdp2yT+iu7tueR2zMVmwA0yJo5XJZQpWfnvET+l+7f8msS4MDR5lcv8CSpYVhauoH+y3ywQPrc/uCRGxvHIlLVKmHv4mN4FhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOaxOZft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOaxOZft"
Received: by smtp.kernel.org (Postfix)
	id B9F39C113D0; Tue, 23 Sep 2025 21:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41EFC4CEF5
	for <soc@kernel.org>; Tue, 23 Sep 2025 21:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662444;
	bh=30S3NLxeLEDh0w0N7UMmL7ufYVY2AIhbFCTbHvHCcuk=;
	h=Subject:From:Date:To:Cc:From;
	b=uOaxOZftJl3sh3OMbEeO65HQAqbqIIDyDwPZvfGqB5FV2zaRdB31dBPDBMDm/pVnq
	 7dAzGu0ABVob6snmOnxOLa8TYashZY37IFeynk5rBIilE/2Q7q3YVeGLsUpPJJuHyz
	 XWnJV3wY+NKT4aT67PUbPBzzxr8DWLLHnCLkm9YL9ZpKc0bMmxLwsjtzOjkFQK5XdP
	 QPkSlI2CrSkqsfMKU/Vt9vUkFXiVW0sWxAeDMZHiIFXD1BnnJcHQU7df9ImxGQhYM1
	 cMxOQnKF3Wd0NELr8dTK7WgkjPC4x+BuLtONAviMSwJDwGVnYGQrZBb9ECY6c7XE9c
	 ICZK1EEF3TiaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B17AE39D0C20;
	Tue, 23 Sep 2025 21:20:42 +0000 (UTC)
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
 <175866244125.1926563.13941585758203251764.git-patchwork-summary@kernel.org>
Date: Tue, 23 Sep 2025 21:20:41 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] More Qualocmm Arm64 DeviceTree updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004587
  Lore link: https://lore.kernel.org/r/20250921022346.598294-1-andersson@kernel.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.18
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004123
  Lore link: https://lore.kernel.org/r/d40e7e96-4a7c-4e4f-b36f-750c6525b95c@linaro.org

Patch: [GIT,PULL] Qualcomm Arm32 defconfig updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004579
  Lore link: https://lore.kernel.org/r/20250921020746.596400-1-andersson@kernel.org

Patch: [GIT,PULL] Amlogic drivers updates for v6.18
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004122
  Lore link: https://lore.kernel.org/r/003cb467-531d-4a8d-a97f-19d59154132f@linaro.org

Patch: [GIT,PULL] CIX device tree changes for v6.18-rc1
  Submitter: Peter Chen <peter.chen@cixtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1005131
  Lore link: https://lore.kernel.org/r/aNIyhPSV6lJaZIvR@nchen-desktop

Series: [GIT,PULL,1/2] Apple SoC driver changes for v6.18
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004504
  Lore link: https://lore.kernel.org/r/20250920123028.49973-1-sven@kernel.org
    Patches: [GIT,PULL,1/2] Apple SoC driver changes for v6.18
             [GIT,PULL,2/2] Apple SoC DTS changes for v6.18

Patch: [GIT,PULL] memory: drivers for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001815
  Lore link: https://lore.kernel.org/r/20250912140030.204650-2-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/3] arm64: dts: ti: K3 updates for v6.18
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003032
  Lore link: https://lore.kernel.org/r/20250916175349.pxg6gxd4vg5vfmhx@overvalue
    Patches: [GIT,PULL,1/3] arm64: dts: ti: K3 updates for v6.18
             [GIT,PULL,2/3] ARM: dts: ti: keystone: Updates for v6.18
             [GIT,PULL,3/3] soc: ti: Driver updates for v6.18

Patch: [GIT,PULL] ARM: microchip/at91: dt for 6.18 #1
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004988
  Lore link: https://lore.kernel.org/r/20250922170346.40876-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] Allwinner Device Tree changes for 6.18 part 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004940
  Lore link: https://lore.kernel.org/r/aNFg7iuBtyWkCZg6@wens.tw

Patch: [GIT,PULL] ARM: OMAP: SoC: updates for v6.18
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004421
  Lore link: https://lore.kernel.org/r/7h7bxup0ob.fsf@baylibre.com

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.18
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003241
  Lore link: https://lore.kernel.org/r/MAUPR01MB11072ABA02A18CC7AA9B88874FE17A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM

Patch: [GIT,PULL] ARM: dts: ti: omap updates for v6.18
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004407
  Lore link: https://lore.kernel.org/r/7hbjn6p2bk.fsf@baylibre.com

Patch: [GIT,PULL] TEE add QCOMTEE driver for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002615
  Lore link: https://lore.kernel.org/r/20250915174957.GA2040478@rayden

Patch: [GIT,PULL] More Qualcomm device driver updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004575
  Lore link: https://lore.kernel.org/r/20250921020225.595403-1-andersson@kernel.org

Patch: [GIT,PULL] Allwinner Driver changes for 6.18
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003478
  Lore link: https://lore.kernel.org/r/aMrsfw-_v3IAiKH8@wens.tw

Patch: arm64: dts: apm-shadowcat: Drop "apm,xgene2-pcie" compatible
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004333
  Lore link: https://lore.kernel.org/r/20250919161529.1293151-1-robh@kernel.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.18 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004681
  Lore link: https://lore.kernel.org/r/2079092.kXSN5OTJKJ@diego

Patch: [GIT,PULL] MediaTek ARM64 DTS updates for v6.18 - part two
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003291
  Lore link: https://lore.kernel.org/r/c0e2e902-2a10-44a7-9592-491ba7382df0@gmail.com

Patch: [GIT,PULL] Allwinner Device Tree changes for 6.18
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003480
  Lore link: https://lore.kernel.org/r/aMrtuZg8HlR--TAt@wens.tw

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.18
  Submitter: Yixun Lan <dlan@gentoo.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004018
  Lore link: https://lore.kernel.org/r/20250919055525-GYC5766558@gentoo.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004578
  Lore link: https://lore.kernel.org/r/20250921020612.596098-1-andersson@kernel.org

Patch: arm64: dts: apm-shadowcat: Move slimpro nodes out of "simple-bus" node
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004332
  Lore link: https://lore.kernel.org/r/20250919161509.1292227-1-robh@kernel.org

Patch: [GIT,PULL] Rockchip soc32 changes for 6.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004682
  Lore link: https://lore.kernel.org/r/6025175.zQ0Gbyo6oJ@diego

Patch: [GIT,PULL] ARM: microchip: soc for 6.18 #1
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002967
  Lore link: https://lore.kernel.org/r/20250916150328.27015-1-nicolas.ferre@microchip.com


Total patches: 28

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


