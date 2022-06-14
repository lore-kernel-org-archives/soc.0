Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937ECCA47A
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BE28C341C7; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10F1EC3411E
	for <soc@kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=Xig6TZ0yo3cJiniRjXVmc8l+0gi1khZ+lZix6CGRCxk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aFdH1GgmFNgqaEhWdDRX/UGYPB4FNCEXMkxuMNMjn8H4dl+CcZquBYRypvXwe1qu1
	 QakHI4HAYoCYkeffRNAUY+MT9PdAypEV+I2htxY65y6+O4bi0/MQ2gVBotja+BNbwV
	 weiggCtHminYYwu/l+jZZVUqvwTgK/xU7NbUKl/veU0/DwjH1+uffts8tS3EoZnLgd
	 fq+XHO6YtX4a5eyiuK7sxzo/+E0UW3m8q2pZDLGV7d0B5VQemIfbYkWI/0pLtQyblf
	 sXVTfpAexeXl3NXl2qcNOz1oDPOd4x0TSWQwIxh3c6quFC/nyMLBn6G9cJTxKBwvA/
	 IGjvIjE76jNSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1B1FFD99FF;
	Tue, 14 Jun 2022 20:37:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903386.29335.15072688857055373526.git-patchwork-summary@kernel.org>
Date: Tue, 14 Jun 2022 20:37:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: s32g fixes for v5.19
  Submitter: Chester Lin <clin@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=648038
  Lore link: https://lore.kernel.org/r/Yp9Y4nGrQ2kVKV6S@linux-8mug

Patch: [GIT,PULL] i.MX fixes for 5.19
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=650157
  Lore link: https://lore.kernel.org/r/20220614095515.GU254723@dragon

Series: [GIT,PULL,1/2] ARM: multiplatform changes, part 2
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=646998
  Lore link: https://lore.kernel.org/r/CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com
    Patches: [GIT,PULL,1/2] ARM: multiplatform changes, part 2
             [GIT,PULL,2/2] ARM: SoC changes, part 2

Series: [GIT,PULL,1/2] Broadcom drivers fixes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=648360
  Lore link: https://lore.kernel.org/r/20220608093132.1465703-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/2] Broadcom drivers fixes for 5.19
             [GIT,PULL,2/2] Broadcom maintainers fixes for 5.19

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.19
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=650161
  Lore link: https://lore.kernel.org/r/20220614100007.1029881-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Fix OP-TEE compiler warning for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645956
  Lore link: https://lore.kernel.org/r/20220530112612.GA1511426@jade


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


