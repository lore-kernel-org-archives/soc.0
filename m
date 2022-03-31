Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C37EC433EF
	for <soc@archiver.kernel.org>; Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67E46C3410F; Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CBD2C340EE
	for <soc@kernel.org>; Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648764611;
	bh=eu3OnTMfQmEalfvGRAKBNJmrv6dXhzFvgC5J0fM23CQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=oaGp/wFQg+g5yiKJZrgcLUrqGHX2bTyM1UeFxrkh25Eyy3ywHNF+yBYJ0vUNmTCk4
	 bpn4T+WkCkwCmrioeykZbkUlxMbGmxWa7h2gg62cFWXxbZFZGsVt0xQJX1K9tGaQMd
	 XSvBYbjXMRkuC3b/PMq6gefQOAxCjksazDwpA7+zGvMfe+rP0/tZRMEzLJgoXxqMR3
	 B9Uw1IFhAcqdVbY/ncrV3XcCZb5KjhupQMB+Gt+pS1dGIbXX5xnMKJc1CJd9jC6mAf
	 ZVFJQvWXpvLiGHHOf/eZWcm8t+04GslUkl/knyyD/DEpL3TsV5v5PN3/0TqlmeQgVc
	 8ej55Ac9KrVlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E947E7BB0B;
	Thu, 31 Mar 2022 22:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164876461105.22027.13522881235296064289.git-patchwork-summary@kernel.org>
Date: Thu, 31 Mar 2022 22:10:11 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: DT updates for dma-names ordering checks
  Submitter: Kuldeep Singh <singh.kuldeep87k@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=626480
  Lore link: https://lore.kernel.org/r/20220326042313.97862-1-singh.kuldeep87k@gmail.com
    Patches: [1/4] ARM: dts: spear13xx: Update SPI dma properties
             [2/4] ARM: dts: spear1340: Update serial node properties
             [3/4] arm64: dts: ls1043a: Update i2c dma properties
             [4/4] arm64: dts: ls1046a: Update i2c node dma properties


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


