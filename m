Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F42C43217
	for <soc@archiver.kernel.org>; Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4290C4347C; Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBB4DC433B5
	for <soc@kernel.org>; Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668633616;
	bh=wfsT+5rYCBA+HPfJNz/oeDRiVlAlzxHNDmICdRC/HTE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Qe1Z9AWmlRw3R+wFBi1y/EYi1qKynuk7jX2GxwUEm7NCYBlRx0znSu5HnasLArrDW
	 Jyy6r/1zFDejRTY9ItKS6ZnMj97tQ3KHtAEsiGyWkp2u8e4wbOXeNYyxLJT95+7JTs
	 aDeuYdYLd7/82h8QW6+qzYcHLKlk7VrL8+9vVS+SF86KEDAyvTdGkdX3Wdzt0BfpHk
	 Ges0yId3ZaQu07DY/VTSmXUA7FZFxoauVmFOq7DXZ0hi43YeUftr5tgGlc9tGKCK3j
	 l5wo6cFw6oO7L6qOXABykLYOcwTMhu4PzyyywiMEiKxAIaCPYrmrCN8qix4/ObPbuU
	 VAP8bXD6PdB2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87AC9C395F6;
	Wed, 16 Nov 2022 21:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166863361648.3865.1238729773255710746.git-patchwork-summary@kernel.org>
Date: Wed, 16 Nov 2022 21:20:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] HiSilicon maintainers fixes for v6.1
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=695776
  Lore link: https://lore.kernel.org/r/63744BAB.5020307@hisilicon.com

Patch: [GIT,PULL] i.MX fixes for 6.1, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=695843
  Lore link: https://lore.kernel.org/r/20221116090402.GA1274@T480


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


