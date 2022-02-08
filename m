Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A3BC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC6DEC340F5; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8D17C340F2
	for <soc@kernel.org>; Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644311578;
	bh=eBf6VkJizab1zOCMsddBGwFm6gAbK5MerfN8YGekFaU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qlsVdMrcp7eKjVLcZJT7tpmmLsX2MqJQWiqz+csxMNjlDQVU+/QVZH+0kssmW8+mf
	 0BC0g+LZ4n8WSQu48PImUd5AHfIiXxFZQxXUN8+0RvLvKAIzJxCw7T0QKgQ5E+o+e0
	 Fh8M5b7HHLUXJz4hYxHacGBgNVggN+key50tnQCxlzGZVkLOGhDkHGRLe5mjVf5unc
	 j6lfPY8qb3Bo7I+Jpkkx7IUNTm2PDiQq3IiZoFPLaubDNPrQoE5Qphx5GmQLvCw+Y9
	 7YqPQrhmqHKUR89nsSxH/kMxAJZGjZbowO47YhI6IdjHWZ3kugfb/fL6ERVedlMGUU
	 wWSwDSa+Myc1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84A08E5D084;
	Tue,  8 Feb 2022 09:12:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431157849.18327.5837832641259063159.git-patchwork-summary@kernel.org>
Date: Tue, 08 Feb 2022 09:12:58 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: socfpga: fix for v5.17
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611791
  Lore link: https://lore.kernel.org/r/20220207101002.7566-1-dinguyen@kernel.org

Patch: docs/ABI: testing: aspeed-uart-routing: Escape asterisk
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=610258
  Lore link: https://lore.kernel.org/r/20220201070027.196314-1-joel@jms.id.au

Patch: soc: aspeed: lpc-ctrl: Block error printing on probe defer cases
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=610259
  Lore link: https://lore.kernel.org/r/20220201070118.196372-1-joel@jms.id.au

Patch: MAINTAINERS: add myself as a maintainer for the sl28cpld
  Submitter: Michael Walle <michael@walle.cc>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611930
  Lore link: https://lore.kernel.org/r/20220207184652.1218447-1-michael@walle.cc

Patch: [GIT,PULL] OP-TEE fix for v5.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=610996
  Lore link: https://lore.kernel.org/r/20220203132323.GA4132001@jade

Patch: ARM: dts: spear320: Drop unused and undocumented 'irq-over-gpio' property
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611170
  Lore link: https://lore.kernel.org/r/20220204004117.1232902-1-robh@kernel.org

Patch: [GIT,PULL] OP-TEE fixes for v5.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=608611
  Lore link: https://lore.kernel.org/r/20220126102609.GA1516258@jade

Patch: [GIT,PULL] i.MX fixes for 5.17
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=609713
  Lore link: https://lore.kernel.org/r/20220129073150.GZ4686@dragon

Series: MAINTAINERS: update various stm & sti maintainer names
  Submitter: Philippe CORNU <philippe.cornu@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=605295
  Lore link: https://lore.kernel.org/r/20220113171921.17466-1-philippe.cornu@foss.st.com
    Patches: [1/2] MAINTAINERS: Update Benjamin Gaignard maintainer status
             [2/2] MAINTAINERS: update drm/stm drm/sti and cec/sti maintainers

Patch: [GIT,PULL] Apple SoC MAINTAINERS updates for 5.17
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=603725
  Lore link: https://lore.kernel.org/r/24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st

Patch: ARM: dts: Fix boot regression on Skomer
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611592
  Lore link: https://lore.kernel.org/r/20220205235312.446730-1-linus.walleij@linaro.org

Patch: [GIT,PULL] arm64: dts: TI K3 fixes for v5.17
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611273
  Lore link: https://lore.kernel.org/r/20220204130716.fjlm4vvcbtzcwlwx@chalice

Series: [1/2] MAINTAINERS: arm: samsung: add Git tree and IRC
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611917
  Lore link: https://lore.kernel.org/r/20220207175503.425200-1-krzysztof.kozlowski@canonical.com
    Patches: [1/2] MAINTAINERS: arm: samsung: add Git tree and IRC
             [2/2] MAINTAINERS: add IRC to ARM sub-architectures and Devicetree


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


