Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8962AC76195
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4570EC4339B; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D2FEC433D2
	for <soc@kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=sZo7Ico46jMNp2ZAC/4P39WAYEwipao5m0EJZHyekqc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=sUlfQzsGSwIoA0XNgKD1r2sckYcDrdAbNTj2XpBX2Zfd+HbDSCqvHiR2yBZi2199y
	 3F+HT3vHjSly+YuTBZabfm228ymEv7Wq7yQF0K+9wDB7yKOiLHpg4HtJdWiJHwUNUX
	 W7U9wbN3RTdMEdmD7PUR71uc4KXZph+A/K/P4AhoSpVG4QUC1/A/CeycmWvfN4gd0h
	 mSolKU5ME9QVHScCUDTLerqVfk2bXI2yEhe7lwdDw7OrZ46QGXVEf/N3uTI/y2TKuR
	 VamuzGbGSBUP+hnlZCAqxiw6zHcZTZsGX8GUHS9cwyPzeFT2WMNXWnGNgQO+oQDCCf
	 NyhQ7A4QWfh+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0284DC41612;
	Fri, 24 Mar 2023 18:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082193.24696.4309161679095089943.git-patchwork-summary@kernel.org>
Date: Fri, 24 Mar 2023 18:00:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: spear: remove obsolete config MACH_SPEAR600
  Submitter: Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=731816
  Lore link: https://lore.kernel.org/r/20230320130159.32316-1-lukas.bulwahn@gmail.com

Patch: ARM: mstar: remove unused config MACH_MERCURY
  Submitter: Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=732164
  Lore link: https://lore.kernel.org/r/20230321033810.22017-1-lukas.bulwahn@gmail.com

Patch: [GIT,PULL] Qualcomm ARM64 Devicetree fixes for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=733193
  Lore link: https://lore.kernel.org/r/20230323141642.1085684-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM32 Devicetree fixes for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=733194
  Lore link: https://lore.kernel.org/r/20230323141922.1085875-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm driver fixes for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=733196
  Lore link: https://lore.kernel.org/r/20230323142505.1086072-1-andersson@kernel.org

Patch: [GIT,PULL,1/2] arm64: dts: few cleanups for v6.4
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=731571
  Lore link: https://lore.kernel.org/r/20230319152740.34551-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] ARM: dts: few cleanups for v6.4
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=731572
  Lore link: https://lore.kernel.org/r/20230319152740.34551-2-krzysztof.kozlowski@linaro.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


