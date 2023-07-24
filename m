Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ADFC001B0
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65012C433CA; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E3B5C433C7
	for <soc@kernel.org>; Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207549;
	bh=GEO7N0Bpl/9cGex3ogPRqmH/aBp9qyHVLH2h6Kn+otA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=NiJbq6YQPe1CcCpzmYTKvZ9jLu2NddxP7PC97TwAR7RRq5xotzZgBcWYTKVUgv7W8
	 YvUGMSVegJ04yvsYYl1RRNjz/p2cSSt3qGqFHr3WAEApQaFxY6DnpvOxyKHH2B8IqZ
	 mtmXtIzpJtioO6OPit8WTadRqa2mehv2mpfTK+q4fsLjGZ5RaKmO7DABLT0S+RLYxl
	 Ba5zxJ/vqPcZ4lOObs818WWc4MBHeZNDfeotwUiLylYi5UeDcLsh05zOVSeZsIHno3
	 8JTlgV39YYlGRm8uGpX6AX7CIqyIvFgi7i2sZvcLvfAna/cejxWBK/+DLgJccyGfRr
	 km+ZFa6iM231A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 28635E1F65A;
	Mon, 24 Jul 2023 14:05:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020754907.21041.17461525690863730592.git-patchwork-summary@kernel.org>
Date: Mon, 24 Jul 2023 14:05:49 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: dts: at91: sam9x60: fix the SOC detection
  Submitter: Durai Manickam KR <durai.manickamkr@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=764770
  Lore link: https://lore.kernel.org/r/20230712100042.317856-1-durai.manickamkr@microchip.com

Series: update at91 usart compatible for sam9x60
  Submitter: Durai Manickam KR <durai.manickamkr@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=766796
  Lore link: https://lore.kernel.org/r/20230718065735.10187-1-durai.manickamkr@microchip.com
    Patches: [PATCHv3,1/2] dt-bindings: serial: atmel,at91-usart: update compatible for sam9x60
             [PATCHv3,2/2] ARM: dts: at91: sam9x60: fix the SOC detection

Patch: [GIT,PULL] arm64: dts: juno/vexpress: Fix for v6.5
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=768223
  Lore link: https://lore.kernel.org/r/20230721112359.3369716-1-sudeep.holla@arm.com

Patch: ARM: dts: nspire: Fix arm primecell compatible string
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=764340
  Lore link: https://lore.kernel.org/r/20230711092617.1412815-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi/smccc: Fixes for v6.5
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=768230
  Lore link: https://lore.kernel.org/r/20230721114052.3371923-1-sudeep.holla@arm.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


