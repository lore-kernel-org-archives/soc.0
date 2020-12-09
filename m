Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA441C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BDA6C23C32; Wed,  9 Dec 2020 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607533810;
	bh=RV1/SCQbBVkS2Mqnj/F7IeKxWxMnmldgwrY6tdNNZsI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lAVmQLfI/fryQkdyAIA7GOjtPTkUIlgH8BSXD0hY4kSNTZYocChsfsLc0h2ulqHo2
	 TuLOEEj018jOgL9CUAxPCjQb6Iw4T1TrfQZ8B3vwH97pWZwEhIcH9KHuJS3oxYsI2q
	 lmzGi+QTOa7gdWJQATtnUIqbC7157iHtdks9jHp1sjJtibMPeCWAHX5dCafO8VJ8Rw
	 JqzY6VkDwaZsYQEfGo6GzrnsnZ6Z+KKzNiXInKUdJXK49AuH3ALXVxr21YyVj9XGA/
	 dFHrSj09MP0hlISyTZrHe23X3Ghfub/qoDbOYGEW105oCEKvK9/RBxptwB0GH+RRNH
	 Ks8oqa7CaZhfQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160753381054.14869.4614876609892650843.git-patchwork-summary@kernel.org>
Date: Wed, 09 Dec 2020 17:10:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: ARM: mstar: Add basic support for i2m and SMP
  Submitter: Daniel Palmer <daniel@0x0f.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=394023
  Lore link: https://lore.kernel.org/r/20201201134330.3037007-1-daniel@0x0f.com
    Patches: [v2,01/10] dt-bindings: mstar: Add binding details for mstar, smpctrl
             [v2,02/10] dt-bindings: vendor-prefixes: Add honestar vendor prefix
             [v2,03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
             [v2,04/10] ARM: mstar: Add infinity2m support
             [v2,05/10] ARM: mstar: Add common dtsi for SSD201/SSD202D
             [v2,06/10] ARM: mstar: Add chip level dtsi for SSD202D
             [v2,07/10] ARM: mstar: Add dts for Honestar ssd201htv2
             [v2,08/10] ARM: mstar: Add smp ctrl registers to infinity2m dtsi
             [v2,09/10] ARM: mstar: Wire up smpctrl for SSD201/SSD202D
             [v2,10/10] ARM: mstar: SMP support
Patch: [GIT,PULL] ARM: mvebu: arm for v5.11 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393381
  Lore link: https://lore.kernel.org/r/87k0u2j0n7.fsf@BL-laptop
Patch: arm64: Kconfig: meson: drop pinctrl
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=397857
  Lore link: https://lore.kernel.org/r/20201207230156.10198-1-khilman@baylibre.com
Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.11
  Submitter: Michal Simek <monstr@monstr.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=399067
  Lore link: https://lore.kernel.org/r/f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu
Patch: [GIT,PULL] ARM: aspeed: soc changes for 5.11
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=393033
  Lore link: https://lore.kernel.org/r/CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com

Total patches: 14

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


