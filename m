Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F693C43217
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 70108611CA; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 594DE611CB
	for <soc@kernel.org>; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634154007;
	bh=q7ALS/yh08xgqWKE2g+jamkE1DxaeDAfSfZaJbEI7wU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qUI11a53E9Fm7PRngvqvWYdcB7ieBXXVcu4KCkCiPzI5quT9Jcsq2KMHV8aORDzej
	 goRwU0tEtjQoB1h3Vb/bHu2EoPp9BhiSm4PRI5+OQVynzIRxZSHw+F8vdJS3NzGKXo
	 1cvqp1Mx0aWjiQYBWGXDuce+Iz79I7xIR0mpt6nk1blmsJiE9yKLDHFZ3/WgzuQPaY
	 RLDjtE/O250oLjM+ShSKo+d/Sxjrp7V4j+9gV3kB7+dV7hwV9WLUgLf7s4xgADxrQ1
	 DWyDOva4kF8FIVpRTbUOL0ngfpdrdkQfAz/36/pcAiFg8uYMhB6apDSt6XCa735nTt
	 QzghWte15KZLQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 51FFF60173;
	Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163415400733.8098.1121908961189721666.git-patchwork-summary@kernel.org>
Date: Wed, 13 Oct 2021 19:40:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] another OP-TEE fix for v5.15
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=562657
  Lore link: https://lore.kernel.org/r/20211013122854.GA1542549@jade

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 5.15
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=562153
  Lore link: https://lore.kernel.org/r/20211012213841.1872021-1-f.fainelli@gmail.com


Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


