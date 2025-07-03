Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C332F0034
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558388; cv=none; b=Ls8/Y5gRbvJu1ADcAQb0xIlEP3KBGY57fd3wM1od8rFp+eqUyqIOEvgOAQu6XL6lHlptBp+Y2P3rLHoykTF3axSVtnPzRFPdla5Ozh7yeCIUMu4R9Hikc6WDhTLBmkKIIwhXwKjefrWVx2BZ9o15DnaBl4jezkLgf5tCI+mzVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558388; c=relaxed/simple;
	bh=JzhrF16qL+zT7B/Le3eoGJ3SkziJ1yvC4uzV8Ge31nw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Yh5ArXwxYGqYK/pmUaMhL6tMyeFygZAPLYBMG3EIdoPhTOUVeVi5jN459BTEl/OqXogUeho1L/MRgMiXbEqfZSdQnfgCpcORGOexWxBRF73K/eTXp4ODjHaoYTZH+CvAliFTOb8so4FSW4+rZBLdaIgO6J4U7dlFP2Zo9KnER8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULFshXoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULFshXoN"
Received: by smtp.kernel.org (Postfix)
	id 1B712C4CEF2; Thu,  3 Jul 2025 15:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065E7C4CEE3
	for <soc@kernel.org>; Thu,  3 Jul 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558388;
	bh=JzhrF16qL+zT7B/Le3eoGJ3SkziJ1yvC4uzV8Ge31nw=;
	h=Subject:From:Date:To:Cc:From;
	b=ULFshXoN/iMrzZ6jJwN3BEm1o5xX0Kuv7P1SYxU6wtZ00DhOstEkAf+Vco+ehcEVa
	 WqL5xQpTwJfYclUlBwDls1NuW7VESufR+mCDrFjaGreozvfFN6w1VyiOPgiTknBhxo
	 Ba2s8wG+dpAf+23R2SPvbvEjmKIsNblEATI9iXxn5ubZkYQ0037s/KlNF/2qLMHNGe
	 CBuVpA5LvYTgebv3uDDuco8Kuj9m5/YDARgTRzGukXXS+907lYTAIJLdbST+tTzkPg
	 myUz/TCLC2ADqkRpvs6eXXLGST0ad6PFCgejlWH1ga5mP1DXMcc0XQozr3UUxB7E/j
	 qbTSw2v5IZhNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7509D383B274;
	Thu,  3 Jul 2025 16:00:13 +0000 (UTC)
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
 <175155841191.1537604.11785300419449661144.git-patchwork-summary@kernel.org>
Date: Thu, 03 Jul 2025 16:00:11 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: MAINTAINERS: Switch ASPEED tree to shared BMC repository
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=977972
  Lore link: https://lore.kernel.org/r/20250702-bmc-tree-update-v1-1-c270cd8af0ab@codeconstruct.com.au

Series: arm64: dts: lg: DT cleanups
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=970028
  Lore link: https://lore.kernel.org/r/20250609-dt-lg-fixes-v1-0-e210e797c2d7@kernel.org
    Patches: [1/2] arm64: dts: lg: Refactor common LG1312 and LG1313 parts
             [2/2] arm64: dts: lg: Add missing PL011 "uartclk"

Patch: [GIT,PULL,fixes] ARM: samsung: soc fixes for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=972430
  Lore link: https://lore.kernel.org/r/20250616094538.33256-2-krzysztof.kozlowski@linaro.org

Patch: [v2] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
  Submitter: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=977770
  Lore link: https://lore.kernel.org/r/20250701145803.140004-2-u.kleine-koenig@baylibre.com

Series: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=977453
  Lore link: https://lore.kernel.org/r/20250630190216.1518354-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
             [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17

Patch: arm64: dts: cavium: thunder2: Add missing PL011 "uartclk"
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=970029
  Lore link: https://lore.kernel.org/r/20250609215706.3009692-2-robh@kernel.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


