Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF95FC433B4
	for <soc@archiver.kernel.org>; Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C2602613F6; Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ACB9B60241
	for <soc@kernel.org>; Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619558562;
	bh=HUdsZONJ2qVmpr/QS5dFqZ18pRrHaF6qu9tsPcTFkHg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VdIEXEhMyHohNzA9o+aWJ+h43t/1qN2nY6oRf5L/+IeMZzyWyuyXFjqsBJCxDKJqv
	 rgIwUm2Zys4JFC/H0xL5K08uq19Qi85C5Ah5kU2xs5L0/ES/PNi+0ouu0SBblCvRgR
	 17zpY5WEprJgKuHx8+TlZMqNetZ1nQ0vFfmWvP/Zo57PvJQoxXUeAqpI38A1g5xZBk
	 NKEOBe3/jkQXqxTZCQsdebF0Q5jmlk6RMDL6EzheTULgo2WGrgxLF1mn8QiCsjQm8w
	 FQS+1332EgJb4DsDnG4tUi+IsP8BP/qAcJ7clmjWw6WkC+mMs7Y8D6rwK8I27ykAK1
	 pXa2vfLJE/TlQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A17D8609CC;
	Tue, 27 Apr 2021 21:22:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161955856260.21098.16006546303715018957.git-patchwork-summary@kernel.org>
Date: Tue, 27 Apr 2021 21:22:42 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Series: ARM SoC branches for 5.13
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=473335
  Lore link: https://lore.kernel.org/r/CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com
    Patches: [GIT,PULL,1/6] ARM: SoC changes for v5.13
             [GIT,PULL,2/6] ARM: defconfigs for v5.13
             [GIT,PULL,3/6] ARM: SoC drivers for v5.13
             [GIT,PULL,4/6] ARM: devicetree changes for 5.13
             [GIT,PULL,5/6] ARM: platform support for Nuvoton WPCM450
             [GIT,PULL,6/6,look,out,for,dependencies] ARM: platform support for Apple M1
Patch: dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=474163
  Lore link: https://lore.kernel.org/r/20210427210121.1080364-1-arnd@kernel.org
Patch: [GIT,PULL] ARM SoC fixes for v5.12, part 4
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=472467
  Lore link: https://lore.kernel.org/r/CAK8P3a20H54BCzzEtZEq2CXx57e1xeyzxf_uHq+OEMgKQvaC7g@mail.gmail.com

Total patches: 8

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


