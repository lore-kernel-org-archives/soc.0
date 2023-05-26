Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27076C7EE23
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 20:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E525FC4339E; Fri, 26 May 2023 20:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF8BAC433D2
	for <soc@kernel.org>; Fri, 26 May 2023 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685134221;
	bh=LIT83kZQTF5etRGvOFo1Iprp9PN9KsHiYP/U95y5rnk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=rqHMjBkPPZCfwSApcRKhoCGFqyLvQPjUoIzaO7Jc9o1swUKIMkzB1b6y68DN/Qt91
	 +KT1+uIzlgS6BluIJDz1AReGHonKaSZhCaDoicS52HEMHYknlud0r560bVXUmfCZ4Y
	 +6py+pK59Dru+ZoPFXXbouoLA4dVrjkJvt2+HB8rtPobLURZS15GR2nLjlAJfLIIHw
	 +CsW/7LH9fuEo7cLHlZVr1q5oju2HqT0BotLCIh/nTClsTS2gog25MO+Hl9X8WMtrF
	 gvQU1EZoZEaPLW5+G2HTFK7TF9jDv25cmQdlAzAV+r1S5WaVrnBCtdIrHNDL7AUJyS
	 N2m2mYRZvbqGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5C25E22B06;
	Fri, 26 May 2023 20:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168513422153.30982.1660154755256172155.git-patchwork-summary@kernel.org>
Date: Fri, 26 May 2023 20:50:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: s32g2/s32v234 DT changes for v6.5
  Submitter: Chester Lin <clin@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=751388
  Lore link: https://lore.kernel.org/r/ZHC8PO8lDjTae7nV@linux-8mug

Patch: arm64: defconfig: Enable ARCH_SPARX5 and ARCH_REALTEK
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748493
  Lore link: https://lore.kernel.org/r/20230517143011.549319-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] SoC/misc: SRAM driver and binding updates
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748307
  Lore link: https://lore.kernel.org/r/CACRpkdbEQ7nTnJTj5WMtxvH057fDSbX5tNs5j4Y=5KSBMpa-Sw@mail.gmail.com

Series: Renesas SoC updates for v6.5
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=751307
  Lore link: https://lore.kernel.org/r/cover.1685094238.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.5


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


