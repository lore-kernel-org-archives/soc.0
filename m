Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58E1D8A0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043291; cv=none; b=XPnRbvbY1GETN+ljykNmV/5sH89kAT37o/m3sFE9OYaYZvjdiT5Hp87boSGuGVLzkDzqECglF+SwrHre+TEzVYrA1gXZrjUe1UsF6dZe5rxn1xANymfbE1+fb1iprqf5Egi1skH5PzU48632TkdlgWcJnuCuyPYFpvxkCCKs5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043291; c=relaxed/simple;
	bh=eh5XAira+Zvce7id6U/jgwTDPyYCJi5HWvkdCzHEovg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=K7Ks6wZdbLCYmtJZ8vgxAUkqgyMf76arj9QZp5gs/pNns8SROHlRV5XPgCGdoqfNw413Oxr6ixm+SsTjGurN/l6c0u3p6h+nrkvRcgoyDT9M22NPdKzEPXSw2o5W8Key8Zxp+y786oMKA5Yb8jDZDZ8BJeuJwL18AM3eJvJywNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HutmM7Pe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HutmM7Pe"
Received: by smtp.kernel.org (Postfix)
	id 494F0C4CEF2; Thu, 16 Jan 2025 16:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A43EC4CEEF
	for <soc@kernel.org>; Thu, 16 Jan 2025 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043290;
	bh=eh5XAira+Zvce7id6U/jgwTDPyYCJi5HWvkdCzHEovg=;
	h=Subject:From:Date:To:Cc:From;
	b=HutmM7PeU4OOf1/Yu6qy7IVYqavLYiTkObG4vYhq7PRB0UaMqayh249CPub3yQQWj
	 kVqQPDO53XilmW4YxEq67vY1efmRVgrg7BcDIDdfU3F7xK7T9Wp22SF14YB+QVGyFn
	 pH9Tn1zC8Jl9rkWXtvtoMEacAFnR+JouxkhCiwnEr1JYsn36BDMuDkn1KZq9ThmTj4
	 s+g5bRHk1kHg99sCSDHzfXTdMWMffjWcQPgN7fj5Cd2VmqsLp6FDb8vBC3PZDFsNge
	 SUe1RieyQ8TSDS5FRiEhxrvFUIAUoLUL7HlRWDUW5OEq4tJKX1/l7GUvhNW6Xodm9w
	 9yx+zM3Zg39Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 01A2F380AA63;
	Thu, 16 Jan 2025 16:01:53 +0000 (UTC)
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
 <173704331244.1501791.9760113813845646503.git-patchwork-summary@kernel.org>
Date: Thu, 16 Jan 2025 16:01:52 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4,defconfig] arm64: defconfig: enable Maxim TCPCI driver
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921566
  Lore link: https://lore.kernel.org/r/20241231131742.134329-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4,defconfig] arm64: defconfig: enable Maxim TCPCI driver
             [GIT,PULL,3/4] ARM: dts: samsung: DTS for v6.14
             [GIT,PULL,4/4] arm64: dts: samsung: DTS for v6.14

Series: [GIT,PULL,1/2] arm64: dts: various for v6.14
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921574
  Lore link: https://lore.kernel.org/r/20241231132847.135814-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: various for v6.14
             [GIT,PULL,2/2] ARM: dts: various for v6.14

Patch: [GIT,PULL] MediaTek ARM32 DTS updates for v6.14
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=923364
  Lore link: https://lore.kernel.org/r/ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.14
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924531
  Lore link: https://lore.kernel.org/r/20250111171126.369502-1-andersson@kernel.org

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.14
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=921765
  Lore link: https://lore.kernel.org/r/67767DCA.8060902@hisilicon.com

Patch: [GIT,PULL] Microchip AT91 DT updates for v6.14
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=922802
  Lore link: https://lore.kernel.org/r/20250107081424.758980-2-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] Allwinner device tree changes for 6.14
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=923443
  Lore link: https://lore.kernel.org/r/Z36h2FwUxro8rouO@wens.tw

Patch: [GIT,PULL] amlogic ARM DT updates for v6.14
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=922579
  Lore link: https://lore.kernel.org/r/77c645b3-0cdf-49f4-84e9-11c74074b9a8@linaro.org

Series: [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924390
  Lore link: https://lore.kernel.org/r/20250110210753.exsx5yxmxpcdn64y@amicably
    Patches: [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
             [GIT,PULL,3/4] arm64: dts: ti: K3 devicetree updates for v6.14

Series: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=923312
  Lore link: https://lore.kernel.org/r/20250108100826.32458-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14

Series: [GIT,PULL,1/2] Broadcom devicetree changes for 6.14
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=923947
  Lore link: https://lore.kernel.org/r/20250109224756.3632025-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree changes for 6.14
             [GIT,PULL,2/2] Broadcom devicetree-arm64 changes for 6.14

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.14
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924543
  Lore link: https://lore.kernel.org/r/20250111181025.394631-1-andersson@kernel.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.14
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=922580
  Lore link: https://lore.kernel.org/r/72d71d3f-99c3-4767-8c80-8fa7a865c846@linaro.org

Patch: [GIT,PULL] Microchip AT91 DT updates fo v6.14 #2
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=923843
  Lore link: https://lore.kernel.org/r/20250109164317.1154613-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] StarFive Devicetrees for v6.14
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=925020
  Lore link: https://lore.kernel.org/r/20250113-kennel-outplayed-21a52a654c36@spud


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


