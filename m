Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5142119B5A7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758245; cv=none; b=KI4LQYHXzTmLPwBP8yVueBR1bADbDGOXgcSBijsVsvdCH31wZUMk5v3hXtwB40INFMwlg6/nu3enHQDMqvDf9iCnuSQpTsGszsLuQeA4Vv8w371F+Hq9mkApXNIww3CchJMgAp0iEAy9zYraPGaxyUAKjLAfXoCfUBKIbxMvvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758245; c=relaxed/simple;
	bh=kbVNUBEFhyvnkr6guRU2O7SOkn3jCpNQIK4+/x4fuhI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=qPHz+W0i/w/WGRvGN5sM9ARc/gHBswNB0WvHyM9gB460I3LHm8aeeeuNXqiWEM01fxFUaXjHv48Myvh5LpdwEIJZG63UsCVEiTShhy8h6kecP5gU08B93/NsKkfdE00rcoIOvlozpU/SIHllFnPqZ7cIh2YzacWa5kJwOtUh86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMKJX22J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMKJX22J"
Received: by smtp.kernel.org (Postfix)
	id E67E8C116C6; Fri, 21 Nov 2025 20:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08D4C4CEF1
	for <soc@kernel.org>; Fri, 21 Nov 2025 20:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758244;
	bh=kbVNUBEFhyvnkr6guRU2O7SOkn3jCpNQIK4+/x4fuhI=;
	h=Subject:From:Date:To:Cc:From;
	b=sMKJX22JXgZXlYSVtbmhCI6UDUyqIKfnooWCeicVb9bzrqad+Z/h9JG5kK36S0LIV
	 Fq5PWNBko3IcfyLtQ+1LN0zZqsa+AGu5nvQ/6esXlzuz/S/BpzFPP7Yodp8bVRBBSd
	 FLQzAtx2YKvF1iv+YS5pBhCunxhNeJez67yy6qKJ5RgvTOB+Su2/Y0KyIbB8ksZdli
	 BrOTruUJj/3245RIX0v7T8k9YeJg0oBz8GKWy5vN3Fg62RySvoe5luFA6hz4eVtToq
	 hXfFzrL2H9ikNuD5ETznBvzJFbeEIQpYMPiDw0eFu4f4Ma8/WLUWVV2EqMxByvc4/o
	 WL+NUNaMxZNYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 756BF3A78A68;
	Fri, 21 Nov 2025 20:50:10 +0000 (UTC)
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
 <176375820903.2580769.5900734280421015674.git-patchwork-summary@kernel.org>
Date: Fri, 21 Nov 2025 20:50:09 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.19
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024500
  Lore link: https://lore.kernel.org/r/20251117205341.3177221-1-andersson@kernel.org

Series: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021971
  Lore link: https://lore.kernel.org/r/20251111095542.13958-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
             [GIT,PULL,5/5] MediaTek defconfig updates for v6.19

Patch: [GIT,PULL] Microchip AT91 defconfig updates for v6.19
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024387
  Lore link: https://lore.kernel.org/r/20251117163533.209608-1-claudiu.beznea@tuxon.dev

Series: [GIT,PULL,1/5] i.MX drivers update for 6.19
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024307
  Lore link: https://lore.kernel.org/r/20251117123358.2009662-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX drivers update for 6.19
             [GIT,PULL,5/5] i.MX defconfig changes for 6.19

Patch: [GIT,PULL] soc/defconfig: OMAP updates for v6.19
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024436
  Lore link: https://lore.kernel.org/r/7hv7j8k1og.fsf@baylibre.com

Series: [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023813
  Lore link: https://lore.kernel.org/r/20251115090044.3140331-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
             [GIT,PULL,6/8] ARM: tegra: Default configuration changes for v6.19-rc1
             [GIT,PULL,8/8] arm64: tegra: Default configuration changes for v6.19-rc1

Series: [1/4] arm64: defconfig: enable Exynos ACPM clocks
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021545
  Lore link: https://lore.kernel.org/r/20251110121344.120785-5-krzysztof.kozlowski@linaro.org
    Patches: [1/4] arm64: defconfig: enable Exynos ACPM clocks

Patch: [v2] arm64: defconfig: Remove the redundant SCHED_MC/SCHED_SMT
  Submitter: Huang Shijie <shijie@os.amperecomputing.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1013897
  Lore link: https://lore.kernel.org/r/20251021075704.527626-1-shijie@os.amperecomputing.com

Patch: [GIT,PULL] Rockchip defconfig64 changes for 6.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024548
  Lore link: https://lore.kernel.org/r/2101096.usQuhbGJ8B@phil

Series: Renesas SoC updates for v6.19
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1018147
  Lore link: https://lore.kernel.org/r/cover.1761905410.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.19


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


