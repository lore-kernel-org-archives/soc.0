Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DD4C433ED
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 07:50:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C16FA611AF; Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AAE52610CF
	for <soc@kernel.org>; Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617954610;
	bh=09UJTSZMV+ejLwUgQCMuEv6vrjiLJGirUq6hK+Mz6do=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XAqD6wOXOmlwClqHxkcaAX9XJD6y3dK1gvk2S2cc4r+dpSjDadtfyJGPaiAmwFb//
	 ljiATgBlKDV/5joxEZDFxv7NR+3h0lrunCJhhUXlDLuXENIs4iJd18KNIel6prtVaD
	 CeIJApPPAC3JnWZukiyjogIPL7OqXHvWk5pUnWoyKcmF3gTnJDrWlwC97ZcloC3PK5
	 SJAVbrnMm0VFgL4MDNdKIsWpLaoMTWYz91DR24c+ynkcd7Kqqs2AnmzoV6Vmd0HbDy
	 w4On/cxgwnjY10X0tFZ3WW0FNfDMoZCJ049Y9kXLw8JG2YlZpEGjeDai9h3Z7P56n+
	 tZns5WSbafemw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9462D60A71;
	Fri,  9 Apr 2021 07:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161795461055.18683.12969650701171042003.git-patchwork-summary@kernel.org>
Date: Fri, 09 Apr 2021 07:50:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] ARM: bmc: devicetree changes for 5.13
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=463983
  Lore link: https://lore.kernel.org/r/CACPK8Xe-KV5BeQwOH6NKC1++FCVqwwNCGBh7hEbBORfrmxfTtQ@mail.gmail.com
Patch: asm-generic/io.h: Unbork ioremap_np() declaration
  Submitter: Hector Martin <marcan@marcan.st>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=463945
  Lore link: https://lore.kernel.org/r/20210409052038.58925-1-marcan@marcan.st
Patch: [GIT,PULL] ARM: aspeed: lpc changes for 5.13
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=463995
  Lore link: https://lore.kernel.org/r/CACPK8Xcb12LsVr7CUaXXjQskKbVjb7x+jgueG1Hik-kBPWtDSg@mail.gmail.com
Patch: [GIT,PULL] ARM: nuvoton: Add WPCM450 support
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=464003
  Lore link: https://lore.kernel.org/r/CACPK8Xdj20TcJckH8fx757ACa4hT4j3bZEctT0Przjv8XJd7KA@mail.gmail.com

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


