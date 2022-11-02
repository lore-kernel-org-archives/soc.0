Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F60C43219
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD87FC43470; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6D8DC433C1
	for <soc@kernel.org>; Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667424016;
	bh=KHfFtmqsFLj9ohKLneqt0ohDsPkHK3wsJXKR0S7ozhg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JKN+T0MiVBkePHk7X76QpBjvrNxG7xSTsneh2rovHykFoD9SNBx/v0YjQxOx1X/yQ
	 NGSHDN15JxuEi70zQovswHL2Hk3zp7HE6GF5/OSM1Zm+iPpHxjzaYaq4134spyGS8i
	 W/BqqzDdlZ/BKmFS/Dmqlg53YD1Ci6+tkFvtGPSRzR1vj0N/ZVEa9YpOEMXxAXm/8A
	 HQwRvuddHMdK0wgdd4aGsFZWnnlhpCIsZ3S58ppNtPsR5fJAFQnte85/x8IAzg7GG2
	 9dD7svDje2x3SyizGOC2few/ICXGhJaegnfa86Po3xnyIoOXROqwhBFE6+RN/00qLI
	 uuyVCVFI2UHZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83756C395FF;
	Wed,  2 Nov 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166742401646.4857.5156608354889013528.git-patchwork-summary@kernel.org>
Date: Wed, 02 Nov 2022 21:20:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] memory: drivers for v6.2
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=689115
  Lore link: https://lore.kernel.org/r/20221026171354.51877-1-krzysztof.kozlowski@linaro.org

Patch: [v3] soc: fsl: qe: Avoid using gpio_to_desc()
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=689312
  Lore link: https://lore.kernel.org/r/20221027081108.174662-1-linus.walleij@linaro.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


