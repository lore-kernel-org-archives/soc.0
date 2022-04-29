Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1845C433EF
	for <soc@archiver.kernel.org>; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCBA1C385AC; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6E5EC385A4
	for <soc@kernel.org>; Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651267811;
	bh=xySB2k3IRSF1xuan5+GblkJ7PYE13ff9YSm39fgfJEU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VgRy+acvIi0FP2QBQgaDjbdxEvwBhMl8MeReRtH0h6qtCIkfPFkC6+yrzQl9nCiLl
	 3HnWdzIqU2Q38S/vllrFTIHa+izPR1QHix/YBXYJgMiy4C6TV8ZUG/aGYsdLF835nr
	 xJF/ATdM2o3cha/HWP84CEWEGdduEsdU6Kw5EukJGXKBUmbyiFdqS8FiGN9X/qggGp
	 cKBzsdypHVquhOvkVZrkstpeIBFfQLKJCWPX41dHkoKtHGpFPAIhZ6RPeFP1U1Lsxm
	 MfxNb5yyZD9rL/L20gSRh8b4TVUav3VGt3G7tJ1gA13PdHIWyvVHvRvntmNgKVN/si
	 /z+RY0lTOocqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87B6AE5D087;
	Fri, 29 Apr 2022 21:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165126781150.28372.2302371489962720975.git-patchwork-summary@kernel.org>
Date: Fri, 29 Apr 2022 21:30:11 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.18, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=635511
  Lore link: https://lore.kernel.org/r/20220426013427.GB14615@dragon

Patch: [GIT,PULL] ARM: tegra: Default configuration fixes for v5.18
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=636848
  Lore link: https://lore.kernel.org/r/20220429080626.494150-1-thierry.reding@gmail.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


