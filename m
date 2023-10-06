Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F159E94124
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B328C433CD; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21B5AC433C8
	for <soc@kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626685;
	bh=Px42cnRJqWtKCeK9NQjSU1IG1R/P5oIYU+UyWNHuoU8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XXuHE6XbD/U+WS68pCaYFL/gBoyHE8zhJM8yX3DotlM22XW9p9Foo6diFG/VvgcLa
	 P+6zhKGu5h7uHdDzRkZSJjCwvz7ul3S6G+G6p06PopDY2+seC4cCp1ZBnjefbad0X5
	 BoaXG3ZsH0OpQ95tyueRDn9OHTmnJHgI+6mqbT1wb4w3b3eo+jfca9fk65EkGFaILZ
	 TlhM9j+zGyCLGPqoRtNefFSiA6IyPRzh0iNEOrGvD5ou3EXa54W0iwq8LjiDNcZ+Un
	 Iv3zGsnE+Kol55p/GkGUaZeoD13AufSaSeJeDYuU31AZvvSONs5ZHO7AF0zmNXBXWk
	 U14a1wDzFZ/+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3AD7E632D2;
	Fri,  6 Oct 2023 21:11:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169662668492.6539.9836191123048157182.git-patchwork-summary@kernel.org>
Date: Fri, 06 Oct 2023 21:11:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: MediaTek: Update MAINTAINERS and dts fixes for v6.7
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=789567
  Lore link: https://lore.kernel.org/r/20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com
    Patches: [1/5] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
             [2/5] arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
             [3/5] arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions
             [4/5] arm64: dts: mediatek: fix t-phy unit name
             [5/5] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail

Patch: [GIT,PULL] Renesas fixes for v6.6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=790513
  Lore link: https://lore.kernel.org/r/cover.1696578170.git.geert+renesas@glider.be

Patch: [GIT,PULL] AMDTEE fix for v6.6
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=789662
  Lore link: https://lore.kernel.org/r/20231003171835.GA669924@rayden


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


