Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C0C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 14:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E198EC34118; Thu, 26 May 2022 14:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9852C34116
	for <soc@kernel.org>; Thu, 26 May 2022 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653576013;
	bh=n0a3JTK8J50anE3Yx9EanDCbhWSnbWxoXaq9g4JfvQI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=bccgww68b9ldwsYNl+gEa+E/F5YCu4/UPpk8vcxkjH5lLl/hPPGhtzTq86nZBEo3I
	 kqqOMlqWPt0IjfAVhIgDUrjI0JzNYmTYaua9ZlvBzYhDqqIc9lxLFkCyFk+huUMxd5
	 ZHtP0QbCx2oXDFxBihcJhiCDI5nEhVs3pHxE8Qd6Ahlnf6l/pqyymwhfiPM1eUfpT9
	 iTZ4WS/0jdwqvrDEtNkQKSJr1XisHRkm0D8R8XD9XMHp6yMC71WGDnqZlB32VveDfd
	 fhQNI266FfBZG2fVmC55k3mhtg5aEBwWdbNFEhzI/FvdsZuO38yS/P30wQdW6JU/DC
	 Fuk7CLV2WqT1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AE875F03938;
	Thu, 26 May 2022 14:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165357601366.28072.772932284811015091.git-patchwork-summary@kernel.org>
Date: Thu, 26 May 2022 14:40:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: ixp4xx: Consolidate Kconfig fixing issue
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=644047
  Lore link: https://lore.kernel.org/r/20220522072356.34062-1-linus.walleij@linaro.org

Patch: ARM: ep93xx: clock: Do not return the address of the freed memory
  Submitter: Alexander Sverdlin <alexander.sverdlin@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=644152
  Lore link: https://lore.kernel.org/r/20220523050421.322555-1-alexander.sverdlin@gmail.com

Patch: Introduce HPE GXP Architecture
  Submitter: Hawkins, Nick <nick.hawkins@hpe.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=642028
  Lore link: https://lore.kernel.org/r/20220516163310.44842-1-nick.hawkins@hpe.com

Patch: [GIT,PULL] ARM: mvebu: arm for v5.19 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641402
  Lore link: https://lore.kernel.org/r/87o801r2ss.fsf@BL-laptop


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


