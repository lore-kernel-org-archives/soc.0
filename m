Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5729C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE911C340F5; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97628C340EF
	for <soc@kernel.org>; Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646756412;
	bh=gvEzWsriSS3etBi2OP9gQfD3Kv9QSk3QsbVkrMUC620=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=tGs08eN7uJVQo1w+6CP8fT1+petOlFs296THmo2tyG5/uF+qcAGSacdICgw3gAOSL
	 0t8EnlkgngvW0QndDNeYuncyOp7RIKaA9e931g5LUwGr2Doat8EOYW2tmRuWesx+yC
	 7IqbH+VX8yps8abdHF3P7mONiwrQkQzysEkfSi7ALwhB/s1xy7trBCC0mHNYj49PoJ
	 U+au7nGqXkPqo1hSbBaQ0TbI+iowRSXRbHMd2vuinnUYO3BaPTJAH3qaWsOtLriX39
	 WhjCOW+rDVD8ERwqRCnI0KPPiMulIs+Gh2dSJjGvV46bW5SAjDoZQ9wLQNzjsXc37T
	 rxg674krJbMKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7DA7BE6D3DD;
	Tue,  8 Mar 2022 16:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675641251.4559.13318298799996385132.git-patchwork-summary@kernel.org>
Date: Tue, 08 Mar 2022 16:20:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: tegra: Device tree fixes for v5.17
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=621386
  Lore link: https://lore.kernel.org/r/20220308084339.2199400-1-thierry.reding@gmail.com

Patch: ARM: dts: aspeed: Fix AST2600 quad spi group
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=621236
  Lore link: https://lore.kernel.org/r/20220304011010.974863-1-joel@jms.id.au


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


