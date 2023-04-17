Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DC5C77B7A
	for <soc@archiver.kernel.org>; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71694C4339B; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C5EBC433D2
	for <soc@kernel.org>; Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681746620;
	bh=pj8s13BIIRM/FP2ujpqVfawStZgWGG1sgP/WvfSirYs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=B4JCufsmZez2wMMGLyJekSFyDesUpTYQ7Xls4y1Fmn4uwdx9YTA47LzCH5VE4nwvL
	 DhwRG0aUt8pAdJUe2MCmbIbVc3mZyNanUKi0f11ofra1qqzL5YzEowmg7Js/ifX3KF
	 AG6+3AmVEIQ5v2454vwhYR5Fk2PyeBQQ79/W/+YSKjd+gWKDGWm3aOgG+NvoMjP1Ja
	 eawvlzfZtCtJZ+EGPZEJT8lBiua/YXza5zUJnpN2lz7uZpioWfF+lAYHItopG2UG+s
	 hzBmZHHo+uqRTkxAxs2q236dVeIpyiwhr90HmjnK1ObqxSZmPofSkaLkoM3AOGzZdW
	 Gwx0y5MeDTZVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D338E330AC;
	Mon, 17 Apr 2023 15:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168174662014.17676.862844983935023266.git-patchwork-summary@kernel.org>
Date: Mon, 17 Apr 2023 15:50:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC DT updates for 6.4 (v2)
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740409
  Lore link: https://lore.kernel.org/r/d0862463-acb3-ce83-6493-281a833ec87e@marcan.st

Patch: [GIT,PULL] memory: drivers: late pull for v6.4, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740228
  Lore link: https://lore.kernel.org/r/20230416143248.308942-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.4
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740558
  Lore link: https://lore.kernel.org/r/20230417145743.1904318-1-sudeep.holla@arm.com

Patch: [GIT,PULL] ARM: vexpress: Update for v6.4
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=740557
  Lore link: https://lore.kernel.org/r/20230417145724.1904259-1-sudeep.holla@arm.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


