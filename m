Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A4ECAAD4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73746C43141; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57834C433C1
	for <soc@kernel.org>; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766603;
	bh=Ont9uvNU4G2QS809cdhsO9f0scXOigLTFUprzgn2Z4c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Z3VipQVEgyR+wd9Hku5JwrYy0K2z+kyfD8ZGOlrvH0mrxGwBBlZJsSK/FVKx+LCrh
	 UI7/s+DyyCS/+iVo8RI6Db6iVfBoPPxBrKgnL0JySly58iKLSQe9RtCWIq74lrElwn
	 tQqv9Lsx5Rxq9qqnSHXzW+QgFNa60eXxjYfEdNzvZDQNvZHnRqI7l8Vxib2uMbSOSE
	 SwWeopqNZsAkrNAcBnbsKHWKWc5Xf4cVkDteep3CeGk5SDWl/4C5bHahE9km8g/KRl
	 NfDUUMyWDV6zNNUWTSyFVW8fBoWPYQ7fr4rIMWx+4AO8TDkLpNgoVkO05A/UbvyUoe
	 zEompnqrZ5NIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33B75E924D4;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176660315.19402.144377041033082091.git-patchwork-summary@kernel.org>
Date: Mon, 29 Aug 2022 09:50:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX fixes for 6.0
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=670088
  Lore link: https://lore.kernel.org/r/20220823092631.GV149610@dragon

Patch: [GIT,PULL] DTS fixes for the Versatile family
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=670825
  Lore link: https://lore.kernel.org/r/CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com

Patch: [GIT,PULL] Fix TEE system compiler warning fo4r v6.0
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=671001
  Lore link: https://lore.kernel.org/r/YwdHcdEUib7obbbW@jade

Patch: arm64: defconfig: Drop ARM_CPUIDLE(generic idle driver) config
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=669748
  Lore link: https://lore.kernel.org/r/20220822121604.2213778-1-sudeep.holla@arm.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


