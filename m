Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F95EE021C
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0C5EC4CECC; Wed, 11 Sep 2024 09:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A689C4CEC5
	for <soc@kernel.org>; Wed, 11 Sep 2024 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726045228;
	bh=eezlErP+IlkhWb4jWlgWuYG9DXLGiosq7efKC92iV3c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=B/3j0zMomakWE921vQlJr1SalyYKGTWTKzlUPwvSfuQMp5YPshleitfYH9mxKKKR/
	 k0Fkp1Hs60cWy8Itw89hnd8a+BpDsst6LbrXuswxZexptovqR0WiNZbjHRCzGHFk5f
	 YzZ/sai9XX3+4tt7MnBM9fKucMPothMQMG3bILBuUgnufGsNanHOzDkJZWWmlm8lSR
	 Dlj90C7dYD6MHYwuo+86+i87U8H5tvpRaxT/qGJ+A8ZRKo25Sp80nA3FykPNdZFgVH
	 nNgvPb2z73PXOPhctR5Fbbf2m1Zok71VNEZ3slTg/yjKqTsliIpX7NdtysuZPiS//a
	 SNlz8HNLOQMwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1B3A3822FA4;
	Wed, 11 Sep 2024 09:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604522915.547769.3986819620651946120.git-patchwork-summary@kernel.org>
Date: Wed, 11 Sep 2024 09:00:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: platform: cznic: turris-omnia-mcu: fix HW_RANDOM dependency
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=888324
  Lore link: https://lore.kernel.org/r/20240909110417.247453-1-arnd@kernel.org

Patch: [GIT,PULL] RISC-V soc fixes for v6.11-final
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=888477
  Lore link: https://lore.kernel.org/r/20240909-hybrid-groovy-601a33b5b309@spud


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


