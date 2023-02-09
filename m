Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2935C636D7
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2742C433AA; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A1CCC433A1
	for <soc@kernel.org>; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675951221;
	bh=m4PE1X8BHtB5jQBEFIbwjL62oqH1OufQrUkvqlvDY9s=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=p33ZhdcVDSDbZKwbCnimqEIaTROxpvqO58ZKilZquTqwXWC5iskurLm/2rCFMKbaO
	 M1tQjooT9usrBqLQwyXrsYK1KrIgPmiTqU3HMwlcyWseHCgQab8LAQnuNpQNKd+tS7
	 jknqoPQkG059qASm2krSyMkv7hMkb5NeLLSFCuW5DzpIFLVF3RR4OK+T4MIYOR9LEB
	 2+uPCYqQbQZWgyRaLUUliTsTdEmq5ulbxWEn9gNUmdMOSEFSJjJUTmv+F3h5ryj3D8
	 0caLjsSraYeJxbyI0HLUcNNbbjYX4ndQRieBpZgIi6Wg1EOtY1BUmgH4IT5AuP/4py
	 5dfa4pHSBStIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71BD8E21ECB;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167595122134.31919.15304740726884818505.git-patchwork-summary@kernel.org>
Date: Thu, 09 Feb 2023 14:00:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Update UniPhier devicetree for 6.3
  Submitter: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=719315
  Lore link: https://lore.kernel.org/r/20230207023514.29783-1-hayashi.kunihiko@socionext.com
    Patches: [1/8] ARM: dts: uniphier: Align node names for SoC-dependent controller and PHYs with bindings
             [2/8] ARM: dts: uniphier: Add missing reg properties for glue layer
             [3/8] ARM: dts: uniphier: Add syscon compatible string to soc-glue-debug
             [4/8] ARM: dts: uniphier: Add syscon-uhs-mode to SD node
             [5/8] arm64: dts: uniphier: Align node names for SoC-dependent controller and PHYs with bindings
             [6/8] arm64: dts: uniphier: Add missing reg properties for glue layer nodes
             [7/8] arm64: dts: uniphier: Add syscon compatible string to soc-glue-debug
             [8/8] arm64: dts: uniphier: Add syscon-uhs-mode to SD node

Patch: [PULL] memory: renesas-rpc-if: Remove redundant division of dummy
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=719604
  Lore link: https://lore.kernel.org/r/20230207173051.449151-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] AT91 device tree updates for 6.3 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720229
  Lore link: https://lore.kernel.org/r/20230209084930.289721-1-claudiu.beznea@microchip.com

Patch: arm64: dts: uniphier: Fix property name in PXs3 USB node
  Submitter: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=719313
  Lore link: https://lore.kernel.org/r/20230207021429.28925-1-hayashi.kunihiko@socionext.com

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.3
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=719333
  Lore link: https://lore.kernel.org/r/CACPK8XdbffU5yRSZF-zR2xv-+6aJK+hEXP8TOkW=SvS+nNTGxg@mail.gmail.com


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


