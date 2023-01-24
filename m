Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDB2C54EAA
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E7ADC4339C; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35CADC433EF
	for <soc@kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=FR6gJQMggYOe+hP9CTf3MxfjCyy57ShJJblYtRzJDZs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Er8PyX5WYfAn7ABUhzhWhHGN/dA2TxJx3+e1o6a3l/z5kFAS2pGsoUdx9PeXiYCx0
	 57sm2MYon5PH8igGJQE2LRCUHRY4dwusgOk3cJbHL5AGAXBWocUMK1hfmtGp8UAjv2
	 3okD4bsJ/72C/ngVnB0/y2GwgFeGz1QhGZ4Lf8h7kQM2cZ5ARhRY36oOaTprsZl1Nw
	 nJnPLNj0zTGPiNV75RU7qlRReWUb1DehLrQPSxsuPZgGpwevofsiv2TuQfgkZ2Zi4B
	 CdQl+NPorIX1FDbLiubwnMq88nK6hzkKPmsOkeDc2coi8EIdqeVlxc0WSGK4jWh/d4
	 89DE8VvXVmCWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10E7BC5C7D4;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083400.16533.11606715506431308567.git-patchwork-summary@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=712036
  Lore link: https://lore.kernel.org/r/cover.1673702287.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.3
             [GIT,PULL,3/3] Renesas DT updates for v6.3

Patch: [GIT,PULL] arm64: dts: samsung: for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714481
  Lore link: https://lore.kernel.org/r/20230122122605.30720-2-krzysztof.kozlowski@linaro.org

Patch: ARM: multi_v7_defconfig: Enable wm896x audio CODECs
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=709676
  Lore link: https://lore.kernel.org/r/20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org

Patch: [GIT,PULL] AT91 device tree updates for 6.3
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=713624
  Lore link: https://lore.kernel.org/r/20230119112903.43257-1-claudiu.beznea@microchip.com

Patch: ARM: multi_v5_defconfig: Enable I2C_GPIO
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710312
  Lore link: https://lore.kernel.org/r/20230109-arm-multi-v5-i2c-gpio-v1-1-78e191358548@kernel.org

Series: [GIT,PULL,1/2] Devicetree changes for omaps for v6.3
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715120
  Lore link: https://lore.kernel.org/r/pull-1674566471-434733@atomide.com
    Patches: [GIT,PULL,1/2] Devicetree changes for omaps for v6.3

Patch: [GIT,PULL] arm64: dts: Cleanup for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714470
  Lore link: https://lore.kernel.org/r/20230122121541.29312-1-krzysztof.kozlowski@linaro.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


