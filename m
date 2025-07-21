Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B3DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111898; cv=none; b=Uxiuw3TVy+guWfhQg5xCQVNck82B+6zj088LaXeUFgYL7YXHSH5HSNOYbLwmc9Ur2SEDHEdiGPZsnTsgPbF2NLJlD0LgxN9uRz/OD6GSJKlI1S2lGZLfuDyWoO6tWbLXyqV7GUWA/N/FKkkJX/gtk1a5kBfnduppNfRwHCHcBWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111898; c=relaxed/simple;
	bh=EEGbpEC4a9jrpVqpaqULXiE2ipzt/klurc1qbVDTzWI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ty8G7q6npcsGxas1uFGeDVD0p6tdU7M28PNBuQquVfNl9Rk7cm8K+npjZ7QtyHrI7vd3hh9iEzbPgAEoiXYG4m6kGvEfOdl9huB80g+qLcwPb65/Ynn+LhiMIJscU1fjU56RmRBKz4QzMcbbmq1I/9ksZ4xYtIctwGRYINMfaeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBP7MTEO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBP7MTEO"
Received: by smtp.kernel.org (Postfix)
	id 59B92C4CEF4; Mon, 21 Jul 2025 15:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CF5C4CEED
	for <soc@kernel.org>; Mon, 21 Jul 2025 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111898;
	bh=EEGbpEC4a9jrpVqpaqULXiE2ipzt/klurc1qbVDTzWI=;
	h=Subject:From:Date:To:Cc:From;
	b=mBP7MTEOco0aFb7Wk1zxYGrjewu6Y8TeOF45viibY8BXki4jP3Xq0wCaZMWeR5dZs
	 m4wg3U4MQU81qOuwhSlSEtwqbtawAKfWH379sF6xxqI/ZoeVHr87QJ3IhtAsBEXSpj
	 bRC69fEnb/TVZUZwnbPMJQk98NBzRa6nDWIsdUwongZt24JtNAtfYr+2UdUP1F4tXC
	 75ZHXppMgVS/DWCJ5NHPOHeD/ZciP6sxxhaNGIHyRtGHV1hWq5FsZatsojVneFaygR
	 fXpNdlgE40IaAW/lAUYR3wzZz479YiZQo1xB269Q1/HDKCMbldsouC/CukkfH8vFLD
	 OYE8+LuAtXqnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 37BC2383B266;
	Mon, 21 Jul 2025 15:31:58 +0000 (UTC)
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
 <175311191671.94241.17474703317018429186.git-patchwork-summary@kernel.org>
Date: Mon, 21 Jul 2025 15:31:56 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: Introduce CIX P1 (SKY1) SoC
  Submitter: Peter Chen <peter.chen@cixtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984356
  Lore link: https://lore.kernel.org/r/20250721144500.302202-1-peter.chen@cixtech.com
    Patches: [v11,1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
             [v11,2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
             [v11,3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
             [v11,4/9] dt-bindings: mailbox: add cix,sky1-mbox
             [v11,5/9] mailbox: add CIX mailbox driver
             [v11,6/9] arm64: defconfig: Enable CIX SoC
             [v11,7/9] dt-bindings: clock: cix: Add CIX sky1 scmi clock id
             [v11,8/9] arm64: dts: cix: Add sky1 base dts initial support
             [v11,9/9] MAINTAINERS: Add CIX SoC maintainer entry

Series: add Voyager board support
  Submitter: Ben Zong-You Xie <ben717@andestech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=981539
  Lore link: https://lore.kernel.org/r/20250711133025.2192404-1-ben717@andestech.com
    Patches: [v2,1/9] riscv: add Andes SoC family Kconfig support
             [v2,2/9] dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
             [v2,3/9] dt-bindings: interrupt-controller: add Andes QiLai PLIC
             [v2,4/9] dt-bindings: interrupt-controller: add Andes machine-level software interrupt controller
             [v2,5/9] dt-bindings: timer: add Andes machine timer
             [v2,6/9] riscv: dts: andes: add QiLai SoC device tree
             [v2,7/9] riscv: dts: andes: add Voyager board device tree
             [v2,8/9] riscv: defconfig: enable Andes SoC
             [v2,9/9] MAINTAINERS: Add entry for Andes SoC

Patch: arm64: dts: nuvoton: npcm8xx: Drop the GIC "ppi-partitions" node
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980828
  Lore link: https://lore.kernel.org/r/20250710-nuvoton-arm64-dt-v1-1-ec7db96ea507@codeconstruct.com.au

Patch: [GIT,PULL] aspeed: devicetree changes for 6.17
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980817
  Lore link: https://lore.kernel.org/r/36d50489cac1fbae01ec699b742f6c6c459a01cb.camel@codeconstruct.com.au

Patch: [GIT,PULL] SOC FSL for 6.17
  Submitter: Christophe Leroy <christophe.leroy@csgroup.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980878
  Lore link: https://lore.kernel.org/r/c947d537-cae5-44f0-abd8-0c558bac46d2@csgroup.eu

Series: [GIT,PULL,1/3] arm64: defconfig: for v6.17
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980689
  Lore link: https://lore.kernel.org/r/20250709191523.171359-4-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] arm64: defconfig: for v6.17
             [GIT,PULL,2/3] ARM: dts: samsung: dts for v6.17
             [GIT,PULL,3/3] arm64: dts: samsung: dts for v6.17

Series: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=981411
  Lore link: https://lore.kernel.org/r/20250711083656.33538-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
             [GIT,PULL,2/4] MediaTek ARM32 DTS updates for v6.17
             [GIT,PULL,3/4] MediaTek ARM64 DTS updates for v6.17
             [GIT,PULL,4/4] MediaTek driver updates for v6.17

Series: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=977453
  Lore link: https://lore.kernel.org/r/20250630190216.1518354-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
             [GIT,PULL,4/5] Broadcom drivers changes for 6.17
             [GIT,PULL,5/5] Broadcom maintainers changes for 6.17

Patch: [GIT,PULL] Reset controller updates for v6.17
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=981092
  Lore link: https://lore.kernel.org/r/20250710152513.1346298-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] aspeed: drivers changes for 6.17
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980823
  Lore link: https://lore.kernel.org/r/9123f151280e52c63dcb645cb07d4eee3462c067.camel@codeconstruct.com.au

Patch: [GIT,PULL] ARM: dts: vt8500: for v6.17
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980656
  Lore link: https://lore.kernel.org/r/20250709184800.168462-2-krzysztof.kozlowski@linaro.org


Total patches: 34

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


