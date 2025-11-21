Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62581DF72C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756532; cv=none; b=WdvHk2mLaSjHs09iFGDjPuPB4U8hA13csmOAoKwhQ70anLAeYU2RNI7m5+LLhSbwI5eWf4Z03WAn5uEpSlKYKiLw9x26kKHxQTKY7SfRAH8JJEoO0kIQb0s2TH3fRjt96bHzWnIMdRFHskQBHoezQ5bKEnoCrePM5zwbujy7RFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756532; c=relaxed/simple;
	bh=VT983X1O3xsQdmvuuXo0K/vo8tvwPsJHDT8Whdo67Bo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=CSrBcO7CLa4tCLDSg0/k+nUHxzQvV+pf8I1a2SZhZF0rTLyq2HLVtFQ85fBQFnJHOtYfFsKoMVyu/ahaMREh6bo/ANS5hdgPhjoHmDehsOWk4DrZ+MzOUaYABF5q037nNNTlgoCoiS8oGR5x9ZxFpc0tj/rKNMS4ND/PVfkY/z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpW5qhRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpW5qhRa"
Received: by smtp.kernel.org (Postfix)
	id 5DAD8C116C6; Fri, 21 Nov 2025 20:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EB3C4CEF1
	for <soc@kernel.org>; Fri, 21 Nov 2025 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756531;
	bh=VT983X1O3xsQdmvuuXo0K/vo8tvwPsJHDT8Whdo67Bo=;
	h=Subject:From:Date:To:Cc:From;
	b=dpW5qhRaYUCMjmak1KIDejeUo2BvA+Hl7u5vBXTG0pp8kfIBVGCrihFXstohkXi3R
	 tZ7BDSj1f5FYcUNof/kXhowpOyCEIfRTthXYFH3vZ26wwAOtHtuQHBz3CCeFOwi3+L
	 F+YEFKCMTLnnF3Qt16/jxM1HQ7dbQKvXaUtZXI3OjERf4Cbae+CjCAPX4AK9CNdzFn
	 w9Ne/xQOeTWhpeuxBJLjBKTWDJx7rmd+Rn6UOXveOL/NGLgK+XWK7wBVz+0YRfj5RS
	 uFDCSeIAHRHmlQEgDgFAcNcoaoKpyn8T2ZWZ/zy40AhSBG7yj3tGzHRCfwVEkje9gl
	 q8Y45nQ0mG7KQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE7113A78A68;
	Fri, 21 Nov 2025 20:21:36 +0000 (UTC)
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
 <176375649554.2571237.17761231185197151069.git-patchwork-summary@kernel.org>
Date: Fri, 21 Nov 2025 20:21:35 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.19
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024504
  Lore link: https://lore.kernel.org/r/20251117205824.3178198-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts32 changes for 6.19 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024550
  Lore link: https://lore.kernel.org/r/2311720.Mh6RI2rZIc@phil

Patch: [GIT,PULL] Rockchip dts64 changes for 6.19 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024554
  Lore link: https://lore.kernel.org/r/2046060.taCxCBeP46@phil

Series: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021971
  Lore link: https://lore.kernel.org/r/20251111095542.13958-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
             [GIT,PULL,2/5] MediaTek ARM32 DTS updates for v6.19
             [GIT,PULL,3/5] MediaTek ARM64 DTS updates for v6.19

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.19
  Submitter: Yixun Lan <dlan@gentoo.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1022886
  Lore link: https://lore.kernel.org/r/20251113180732-GYC0846694@gentoo.org

Series: [GIT,PULL,1/5] i.MX drivers update for 6.19
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024307
  Lore link: https://lore.kernel.org/r/20251117123358.2009662-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX drivers update for 6.19
             [GIT,PULL,3/5] i.MX ARM device tree changes for 6.19
             [GIT,PULL,4/5] i.MX arm64 device tree changes for 6.19

Series: [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023813
  Lore link: https://lore.kernel.org/r/20251115090044.3140331-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/8] syscore: Changes for v6.19-rc1
             [GIT,PULL,2/8] dt-bindings: Changes for v6.19-rc1
             [GIT,PULL,5/8] ARM: tegra: Device tree changes for v6.19-rc1
             [GIT,PULL,7/8] arm64: tegra: Device tree changes for v6.19-rc1

Patch: [GIT,PULL] ARM: dts: omap: updates for v6.19
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024425
  Lore link: https://lore.kernel.org/r/7hcy5glgfx.fsf@baylibre.com

Series: [1/4] arm64: defconfig: enable Exynos ACPM clocks
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021545
  Lore link: https://lore.kernel.org/r/20251110121344.120785-5-krzysztof.kozlowski@linaro.org
    Patches: [1/4] arm64: defconfig: enable Exynos ACPM clocks
             [GIT,PULL,4/4] arm64: dts: samsung: DT for v6.19

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.19
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024556
  Lore link: https://lore.kernel.org/r/20251117223345.3192497-1-andersson@kernel.org

Patch: [GIT,PULL] arm64: dts: ti: K3 updates for v6.19 part2
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1026433
  Lore link: https://lore.kernel.org/r/7ad1ef51-e56f-44b2-acbf-70bc1f43dce9@ti.com

Patch: [GIT,PULL] Allwinner DT changes for 6.19
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023944
  Lore link: https://lore.kernel.org/r/aRmEvz0F1yVCgE-B@wens.tw

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.19
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1025166
  Lore link: https://lore.kernel.org/r/PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM

Patch: [GIT,PULL] STM32 DT changes for v6.19#1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024729
  Lore link: https://lore.kernel.org/r/e5a44767-d50f-44c1-9c74-1eb9c539cc50@foss.st.com

Patch: [GIT,PULL] PXA1908 DT changes for 6.19
  Submitter: Duje Mihanović <dujemihanovic32@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1015184
  Lore link: https://lore.kernel.org/r/5048490.31r3eYUQgx@radijator

Patch: [GIT,PULL] CIX dts changes for v6.19-rc1
  Submitter: Peter Chen <peter.chen@cixtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1025149
  Lore link: https://lore.kernel.org/r/aR1jBv4cL0P5u8Pp@nchen-desktop

Patch: [GIT,PULL] Microchip AT91 device tree updates for v6.19
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024388
  Lore link: https://lore.kernel.org/r/20251117163533.209608-2-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.19 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1026374
  Lore link: https://lore.kernel.org/r/87ikf3a26a.fsf@BLaptop.bootlin.com

Patch: [GIT,PULL] arm/arm64: dts: socfpga: updates for v6.19
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024308
  Lore link: https://lore.kernel.org/r/20251117125331.381114-1-dinguyen@kernel.org

Patch: [GIT,PULL] RISC-V T-HEAD Devicetrees for v6.19
  Submitter: Drew Fustini <fustini@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021318
  Lore link: https://lore.kernel.org/r/aRDFOnmcW6GIJ6bt@x1

Series: Renesas SoC updates for v6.19
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1018147
  Lore link: https://lore.kernel.org/r/cover.1761905410.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.19
             [GIT,PULL,3/3] Renesas DTS updates for v6.19

Patch: [GIT,PULL] aspeed: First batch of devicetree changes for 6.19
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1017941
  Lore link: https://lore.kernel.org/r/d2bd7e3e6045ac68875fd220e528c76f4fb2faac.camel@codeconstruct.com.au

Series: Renesas SoC updates for v6.19 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023459
  Lore link: https://lore.kernel.org/r/cover.1763115230.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v6.19 (take two)
             [GIT,PULL,2/2] Renesas DTS updates for v6.19 (take two)


Total patches: 33

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


