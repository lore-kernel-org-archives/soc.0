Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F824C3F6B0
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 14:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEB2CC43143; Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9672C433C1
	for <soc@kernel.org>; Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658933413;
	bh=OD2TxZNMppWih3XyyjRBKIzzHSSHGk/WZMLLO1mHg7U=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Pzjmw9yiWDNyxPJClcUtlhzo9QibYpkNATv8/Q93V9WUqXkRh/PcBch9gLMu+E29h
	 BCQR3ed45cZZ55uKlCri0pGEAXMGZF48Gp6q7FKvGBJCnFkwdpGJgXw1PL0pTi7bAU
	 Z3DYy4Cwlqsd9uUFdJaEflBvOOUCOL70JEKmzB0flLdHrWdCVsEWPzJtYo+hG393WI
	 OeAwKnUwKUhxJngLtA86lZOOyBQIXzL7yLn8PuB2l18lJ1cXlxFXzWtVUQSIKq0WWM
	 RD/YT23ZaRH7jsXc8BAESHq7nRuPnSHoD74Hj/CDwiJkukp6z+5wXp20VdNvsgG7tn
	 6HggPtGkb0FBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2CE4C43142;
	Wed, 27 Jul 2022 14:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165893341361.18215.5887701419977203687.git-patchwork-summary@kernel.org>
Date: Wed, 27 Jul 2022 14:50:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [1/4] dt-bindings: soc: bcm: drop quotes when not needed
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=663051
  Lore link: https://lore.kernel.org/r/20220726115841.101249-1-krzysztof.kozlowski@linaro.org
    Patches: [1/4] dt-bindings: soc: bcm: drop quotes when not needed
             [2/4] dt-bindings: soc: bcm: use absolute path to other schema
             [3/4] dt-bindings: soc: microchip: drop quotes when not needed
             [4/4] dt-bindings: soc: microchip: use absolute path to other schema

Patch: ARM: dts: lan966x: keep lan966 entries alphabetically sorted
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Claudiu Beznea <claudiu.beznea@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=662995
  Lore link: https://lore.kernel.org/r/20220726084931.1789855-1-claudiu.beznea@microchip.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


