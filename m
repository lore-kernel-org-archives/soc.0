Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED55C4332F
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0E3B2611BF; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB91661168
	for <soc@kernel.org>; Wed, 13 Oct 2021 19:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634154007;
	bh=AQ7cWfFYa4JLMeB3OWvUR+t3ePY6IIqvD4uwuNclVyE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZtK5M6aScV3kb4m6obvqIQ/WgnenVJKDRCwj8px07kX5XeduGGDzE6ZnGEWNfO5og
	 MpfJyVZ42CPmIqz611oN0v2KkkyyEEHtFlPF9af2llUCz+ur/qKFbFZRM7BmXpMC8q
	 QoFeESH+W9EFPz8IOi+lmvuaAG9nJ7aFSTXWUAS/e/Mu9927CO86St+9q6od/5VPf8
	 6qExawppoLou7HXHZiYcbIV7V0Sv+zgBvxqLzYtHORl2GWdCfyeGXGoi2Gsl+toXkE
	 o9GXk1L0eRDa2TMKa6wcKaKkjKzvdsIsb8lyruKJo/tc7JBZIs3ux0SFbD+lnRDJc9
	 xnWTb37bkarKQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D9E7C60966;
	Wed, 13 Oct 2021 19:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163415400683.8098.6027840091671534691.git-patchwork-summary@kernel.org>
Date: Wed, 13 Oct 2021 19:40:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

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


