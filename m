Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F43C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106419; cv=none; b=ZdiWtFqGjJL2fBfqLrNtDVOPlYHfAs9/wNhAYE4yy7vY6avIIkcckciK6uwT7/t9LPf1x4N9su2yeNHZPh3iUzLuJJkHixA9lKDGPkX9seRDMc0tptubSnnejcBzRo9eweK/V375S82g3/c1X/l5T/9E6umViTqpZAyP4V/REAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106419; c=relaxed/simple;
	bh=22iJlZdP0LxWk8lAnFjSLYfkW74NRiNVpjerJ501CDY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=k26tB/sgKj1UXHQlbMOpWityptF6llXqfj3u1DNSo7+0SjNNOy8Ii5/KMbCMOBVPElpB096atBcOC3UvLdvtafWuyJfIfkE1gOnGs2xQ7XbdiqmWE73YsNct1x/FcZ8FB9SzU0isE4owa+U71iuInk3a7t1LBCxH5F0WuQPrxLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLcbqDO5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLcbqDO5"
Received: by smtp.kernel.org (Postfix)
	id 0F7661F000C5; Thu, 15 Oct 2026 23:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAA41F000C4
	for <soc@kernel.org>; Thu, 15 Oct 2026 23:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106418;
	bh=FtrlRKSrVKCqNyrv2djA4s/xBgCHeTF1njzW5eC37mc=;
	h=Subject:From:Date:To:Cc;
	b=YLcbqDO5OdmB1sdcWi6xTVvR99U1GPJYqm7nF1/TYbNzEV3w5TTYyE8TDkMIr5o7A
	 RRx6ft25lX8exUaVn2425qqxIIzNncok0I2ZsOUVr37PhGjgV4OIQjduPUfMFyjJGS
	 qbpz9MxO3h6jj0bh4Z2de7fGGg/Bgm76J7E3lg+M7pm2Ey9ha4xY6hBVsDuQm+NiAA
	 9Cis4oN8Wj0ojsgvK7tND4RdfdXBwDP2Pu9kw3T5a570I1BqGTinVOQHpzYcof3As5
	 AOXxaNmv5tLVE79HXYOKoaEaZBv5urcVvdF+4Ik+AwwaDX2BsBkW3f0kKSBZUA0829
	 nYO8dR8MreCCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B6DB63808209;
	Thu, 15 Oct 2026 23:20:17 +0000 (UTC)
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
 <179210641636.4150336.18039780029987568612.git-patchwork-summary@kernel.org>
Date: Thu, 15 Oct 2026 23:20:16 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic ARM64 DT updates for v7.4
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1180241/
  Lore link: https://lore.kernel.org/r/8987c69f-5576-4358-92e4-e9e3b4f4f2dd@linaro.org

Series: [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/series/1179635/
  Lore link: https://lore.kernel.org/r/20261005124915.e632elbacgr6nxgs@anyway
    Patches: [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
             [GIT,PULL,3/5] arm64: dts: ti: K3 updates for v7.4
             [GIT,PULL,5/5] ARM: dts: ti: keystone: Updates for v7.4

Series: [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178814/
  Lore link: https://lore.kernel.org/r/20261003095924.1370238-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1

Patch: [GIT,PULL] late Ux500 DTS changes for v7.4
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1179946/
  Lore link: https://lore.kernel.org/r/CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com

Patch: [GIT,PULL] nuvoton: First batch of arm64 devicetree changes for v7.4
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1181946/
  Lore link: https://lore.kernel.org/r/1a070f5c87b1e4e765a7e481b53f66242a9753ec.camel@codeconstruct.com.au

Patch: [GIT,PULL] ARM: mvebu: dt for v7.4 (#2)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1182507/
  Lore link: https://lore.kernel.org/r/87v77b53qz.fsf@BLaptop.bootlin.com

Series: Renesas SoC updates for v7.4 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/series/1178282/
  Lore link: https://lore.kernel.org/r/cover.1790939711.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v7.4 (take two)
             [GIT,PULL,2/2] Renesas DTS updates for v7.4 (take two)

Patch: [GIT,PULL] Microchip ARM64 device tree updates for v7.4
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1182113/
  Lore link: https://lore.kernel.org/r/20261009061323.29781-1-claudiu.beznea@tuxon.dev

Patch: None
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178576/
  Lore link: https://lore.kernel.org/r/20261002195046.364682-2-florian.fainelli@broadcom.com

Patch: [GIT,PULL] Allwinner DT Changes for 7.4
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1180946/
  Lore link: https://lore.kernel.org/r/asZZLRnqygKV8hMl@home.wens.tw

Patch: [GIT,PULL] Apple SoC DTS changes for v7.4
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/series/1178537/
  Lore link: https://lore.kernel.org/r/20261002190232.6449-1-sven@kernel.org


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


