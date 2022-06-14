Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792C9CCA47A
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AB29C341C6; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FA45C3411B
	for <soc@kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=2JbHbc5nBj0SFh3X4H3ZIlMUv0JU6E3do7Vx2b7u6MI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=V8gDaKHmOTckuHQIL3pZHjUsf0fWqpaQu9lixRes3CSyODzMe8nU6zkZqFwNQof2f
	 fCqsSNoHZ+sAKzRgFPg6ikiwbgetfdSf3BLqFFemerypTfK0aw+bMlYFu6CP6i6p+T
	 h3uOAFmqLNT7wxZ1KFvdv9wEa/61PjE+zaqMky6sIfmphn+9jLOI3rBOXSoTnvHiou
	 X0lim7w2xM57LRKE0Jlbn/qKyY6oOVH7Hn2zBvDVzw6ksqfdIcSUaiQSuStNrxnOYO
	 5TtB0YZLAlPUikjnC2nG8igQMMqRkprjHaBsieL5wF7Yqy4EA+Y93rXtr9xev9BItE
	 7H3yVOxbmFjag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E99A1E6D466;
	Tue, 14 Jun 2022 20:33:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881490.29335.9703453111434975189.git-patchwork-summary@kernel.org>
Date: Tue, 14 Jun 2022 20:33:34 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] arm64: s32g fixes for v5.19
  Submitter: Chester Lin <clin@suse.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=648038
  Lore link: https://lore.kernel.org/r/Yp9Y4nGrQ2kVKV6S@linux-8mug

Series: [GIT,PULL,1/2] Broadcom drivers fixes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=648360
  Lore link: https://lore.kernel.org/r/20220608093132.1465703-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/2] Broadcom drivers fixes for 5.19
             [GIT,PULL,2/2] Broadcom maintainers fixes for 5.19

Patch: ARM: dts: stm32: move SCMI related nodes in a dedicated file for stm32mp15
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=649715
  Lore link: https://lore.kernel.org/r/20220613071920.5463-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] i.MX fixes for 5.19
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=650157
  Lore link: https://lore.kernel.org/r/20220614095515.GU254723@dragon

Patch: [GIT,PULL] Fix OP-TEE compiler warning for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645956
  Lore link: https://lore.kernel.org/r/20220530112612.GA1511426@jade

Patch: ARM: configs: Enable more audio support for i.MX
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641382
  Lore link: https://lore.kernel.org/r/20220513121258.168364-1-broonie@kernel.org

Series: [1/2] ARM: OMAP1: clock: Convert to CCF
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=647309
  Lore link: https://lore.kernel.org/r/20220603185826.3747697-1-arnd@kernel.org
    Patches: [1/2] ARM: OMAP1: clock: Convert to CCF
             [2/2] ARM: omap1: enable multiplatform

Series: [v2,1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
  Submitter: Serge Semin <Sergey.Semin@baikalelectronics.ru>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=649242
  Lore link: https://lore.kernel.org/r/20220610104030.28399-1-Sergey.Semin@baikalelectronics.ru
    Patches: [v2,1/2] bus: bt1-apb: Don't print error on -EPROBE_DEFER
             [v2,2/2] bus: bt1-axi: Don't print error on -EPROBE_DEFER

Series: [GIT,PULL,1/2] ARM: multiplatform changes, part 2
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=646998
  Lore link: https://lore.kernel.org/r/CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com
    Patches: [GIT,PULL,1/2] ARM: multiplatform changes, part 2
             [GIT,PULL,2/2] ARM: SoC changes, part 2

Patch: [RESEND] ARM: Fix refcount leak in axxia_boot_secondary
  Submitter: Miaoqian Lin <linmq006@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=646504
  Lore link: https://lore.kernel.org/r/20220601090548.47616-1-linmq006@gmail.com

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.19
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=650161
  Lore link: https://lore.kernel.org/r/20220614100007.1029881-1-sudeep.holla@arm.com


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


