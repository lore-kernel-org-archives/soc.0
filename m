Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B4AC71153
	for <soc@archiver.kernel.org>; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3F90C433C9; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE36DC433C7
	for <soc@kernel.org>; Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693340423;
	bh=YSdmieNVFhWmoxAJp2yzGMzVjgmRuie7c12SOWJAuZ8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=cyNGyv/hsdRzDxlFX6kfjqiUrJ5N5TdUuyG5lMLdSb5zXshzAD5PRMRlkxfzfl6Ek
	 LAQs2ErZ1sG3Mv08d0XqPP8VUq59fwOdpcUGfWpje5cdQdfM5tifbp2qzEzdpH97Eg
	 obqGlhR1Ti4npGjbnf/1izUXNMK0izCoO5l0qW/EJfAqKAiLMnnQWP3WTMB1hKP/gs
	 z6qDaFPumHjYXm17XYRrEaGqKwhrPSs9KCnVEYlq6HiK6LWZNuvGODRqFntDQ+Qll0
	 dugWzae0UnbE8nE5ExKLCOEwfWKbeDELaNEitc9FUQNdSeFOuoQTbFJcngQ25O1S52
	 oFAEKOxAMpwsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97065C595D2;
	Tue, 29 Aug 2023 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169334042361.18037.7261232642774474758.git-patchwork-summary@kernel.org>
Date: Tue, 29 Aug 2023 20:20:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=778502
  Lore link: https://lore.kernel.org/r/20230823085146.113562-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] ARM: dts: use capital "OR" for multiple licenses in SPDX
             [2/2] arm64: dts: use capital "OR" for multiple licenses in SPDX

Patch: [GIT,PULL] ARM: socfpga: update for v6.6
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=778407
  Lore link: https://lore.kernel.org/r/20230823021810.958072-1-dinguyen@kernel.org

Patch: [v2] ARM: davinci: Drop unused includes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=778682
  Lore link: https://lore.kernel.org/r/20230823165637.2466480-1-robh@kernel.org

Patch: [v2] bus: fsl-mc: Use common ranges functions
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=778722
  Lore link: https://lore.kernel.org/r/20230823190958.2717267-1-robh@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


