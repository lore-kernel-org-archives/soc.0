Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01205C48BC4
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB70BC43394; Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5BC1C43390
	for <soc@kernel.org>; Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463561;
	bh=OQDf775KmClE/mZkMU7B+NXNbSAUgg0bidKrz05UZsk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=IYfCBrWx1A7zwHPc0PmeDTzMvS3cd8flKrdaCjU0wU54Eow0PxMBYOrsMPiUXbRqg
	 LEgmzPij9HcD2V/wCaiMV/CXPNaTrwwUM83jR059+uo2A7Fl+DW9yHH/TdGcOORfhS
	 BDBFhK3YHVLhyOdgJqClMkkYM+DtebBimOHk5BpRIgrWUBdorxnTYd68W9P3TzqruO
	 PW81vtB8RHTkM/uvuOj4q5vsr8ywhBy2O9CdyoOxFbIoo1Ksq+8So+EfJbeYnRzmwp
	 Dwir+Tk9po2YRx7pPTLe/+HUShe5Qye/18szI278GYZ/13uA6bWcjQl0BIK61kQae7
	 xXizxZh2fThSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3E9CD990D7;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356173.4365.15023961281034282366.git-patchwork-summary@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.9
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=824738
  Lore link: https://lore.kernel.org/r/cover.1707487826.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.9
             [GIT,PULL,2/4] Renesas driver updates for v6.9

Series: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827466
  Lore link: https://lore.kernel.org/r/20240219131230.157792-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
             [GIT,PULL,2/2] MediaTek soc driver updates for v6.9

Patch: [GIT,PULL] Rockchip dts fixes for 6.8
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=825778
  Lore link: https://lore.kernel.org/r/2450634.jE0xQCEvom@phil

Patch: [GIT,PULL] memory: drivers for v6.9
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827275
  Lore link: https://lore.kernel.org/r/20240218183046.32721-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] i.MX fixes for 6.8
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=823632
  Lore link: https://lore.kernel.org/r/20240206151744.2459-1-shawnguo2@yeah.net

Series: [GIT,PULL,1/4] samsung: drivers for v6.9
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827269
  Lore link: https://lore.kernel.org/r/20240218182141.31213-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v6.9

Patch: arm64: config: disable new platforms in virt.config
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827382
  Lore link: https://lore.kernel.org/r/20240219093819.644324-1-arnd@kernel.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


