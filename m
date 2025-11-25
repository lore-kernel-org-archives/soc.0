Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E242C2459C5
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078661; cv=none; b=tWExFjQvmFHfhlk9anU63tMLfyJFJSYl3u8du8d2YiMZ2CMl+ARS+WsRiHbmPsyGo9+gLCHRhLHT8XXHdfiDJEjFkaHDfk4c5l8xLQcdvmz81Lj9bdV7KtLpm3zpqciWDFK82oEGrQ6tUwmth/1HWgZ+lSpO5FQIGRYenYkG0cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078661; c=relaxed/simple;
	bh=xQ2FDxqTWSTqhTJBvNlnQKTjQM+4KE0U6kmlU6OHqaw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=BySm231skdJhAgptWLG9tKG4MoLcOwdtMjztZAPhnuLwHhWxSCC55sP7Wg9bR0lHfIkcnvfMSERRqFfp9C96Q1PeefT/RpGtU7FZhXdYnNXdy/hZFS5uGdCA0PeN2wqv7CwCjMcgewxc4I4QFlToaKmHEqpdEPVbH40oMSAme4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWmkqpCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWmkqpCW"
Received: by smtp.kernel.org (Postfix)
	id 8A4C0C19421; Tue, 25 Nov 2025 13:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752ACC116B1
	for <soc@kernel.org>; Tue, 25 Nov 2025 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078660;
	bh=xQ2FDxqTWSTqhTJBvNlnQKTjQM+4KE0U6kmlU6OHqaw=;
	h=Subject:From:Date:To:Cc:From;
	b=UWmkqpCWlq6dVfb+UiSAO4PHjcjg9uFPXRIkMexyJkefxBPnyGEBaN7jAFPOIv9zp
	 TM7DyP9klmSnDxpqEspddCpmo33/5Guiprbmx0XHtUpl6E/BQLnWC5rj7Z5+uPHo9J
	 6Zz+qiSp2GeI6CmNMk5QWVHMgBLjdIk89SStsrPnr11pf4uNhp68SorLvfod5mOPpi
	 3A+yTQYgG+Y5wf9grd2mTvxwAns222l0MwwD4cMZbTDdwsE3XU4O3Wh1JDztEwRsbo
	 IHe63qH0nbuIroy66wbmVt9t2KqiMWaGBqNR9PXL27ZnQtL66f3neU7/9ZCIiwRgIz
	 w0cyi+guMqIDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFB63A8D153;
	Tue, 25 Nov 2025 13:50:23 +0000 (UTC)
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
 <176407862250.736376.259234030646786183.git-patchwork-summary@kernel.org>
Date: Tue, 25 Nov 2025 13:50:22 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023813
  Lore link: https://lore.kernel.org/r/20251115090044.3140331-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
             [GIT,PULL,3/8] amba: Fixes for v6.19-rc1
             [GIT,PULL,4/8] soc/tegra: Changes for v6.19-rc1

Patch: [GIT,PULL] soc/drivers: OMAP updates for v6.19
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024435
  Lore link: https://lore.kernel.org/r/7hzf8kk1pz.fsf@baylibre.com

Patch: [GIT,PULL] memory: drivers for v6.19 - replacement pull (v2)
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1026617
  Lore link: https://lore.kernel.org/r/20251122143409.68115-2-krzk@kernel.org

Patch: [GIT,PULL] soc: ti: Driver updates for v6.18
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024309
  Lore link: https://lore.kernel.org/r/20251117141206.pqjzjzegxajziyof@resort

Patch: [GIT,PULL] Allwinner Driver changes for 6.19
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023943
  Lore link: https://lore.kernel.org/r/aRmEosrxfxFVY9zH@wens.tw

Patch: [GIT,PULL] Qualcomm driver updates for v6.19
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024477
  Lore link: https://lore.kernel.org/r/20251117200001.3169354-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip driver changes for 6.19 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024549
  Lore link: https://lore.kernel.org/r/2002416.CQOukoFCf9@phil

Patch: [v2] arm64: dts: sprd: sc9860: Simplify clock nodes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027092
  Lore link: https://lore.kernel.org/r/20251124210031.767382-2-robh@kernel.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.19 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027105
  Lore link: https://lore.kernel.org/r/2244391.irdbgypaU6@diego

Patch: [GIT,PULL] Reset controller updates for v6.19
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1025737
  Lore link: https://lore.kernel.org/r/20251120095059.2787351-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] soc/maintainers: OMAP updates for v6.19
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024437
  Lore link: https://lore.kernel.org/r/7hqztwk1n5.fsf@baylibre.com

Patch: [GIT,PULL] STM32 Bus firewall for v6.19
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024731
  Lore link: https://lore.kernel.org/r/745d50db-7d68-4789-808a-c5ed88819a78@foss.st.com

Series: [GIT,PULL,1/5] i.MX drivers update for 6.19
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024307
  Lore link: https://lore.kernel.org/r/20251117123358.2009662-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX drivers update for 6.19

Series: [1/4] arm64: defconfig: enable Exynos ACPM clocks
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021545
  Lore link: https://lore.kernel.org/r/20251110121344.120785-5-krzysztof.kozlowski@linaro.org
    Patches: [1/4] arm64: defconfig: enable Exynos ACPM clocks
             [GIT,PULL,2/4] samsung: drivers for v6.19

Series: Renesas SoC updates for v6.19 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023459
  Lore link: https://lore.kernel.org/r/cover.1763115230.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v6.19 (take two)

Series: Renesas SoC updates for v6.19
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1018147
  Lore link: https://lore.kernel.org/r/cover.1761905410.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.19
             [GIT,PULL,2/3] Renesas driver updates for v6.19


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


