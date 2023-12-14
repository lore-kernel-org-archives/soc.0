Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E80C4332F
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 570F0C433C9; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41D57C433C7
	for <soc@kernel.org>; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702588339;
	bh=tNf55XGQ4zdkawv4AlXu742rDiJv+mo8AYqDxsQGWEY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=eIytQNl7/AZh+Z2EboSKVfNxwohkImuobHTympS2JoUBVjelbKdXZwNI5xAOtTyzD
	 RSMY5qJD3Fb+LsZrJcgsEgG512+YNNHlku1y0AsVeXh7VQOvFqFGWBqjjPAiR86DV0
	 PDglKtp8jkWUDDb/E6XrvFDjvGmB9yoJlhrK2qWWZnkTFYBjkmOW6ct9fVK5CiblJ5
	 VNjfdy4PR96Qy20WJ+HC+ifg+Mh0me6nHpbn9nBp/i6xnM2ojynrthz/6eYCUlGyCv
	 MbcGBILOflHN5EJ6RV5tWJaiAxFTNI603hLO2NWAyPY/tvu6TKfhQHM0Tu6b5PJMVu
	 4ukfohwb7Xi6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2B53CDD4EFA;
	Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170258833917.10180.4005481642813995287.git-patchwork-summary@kernel.org>
Date: Thu, 14 Dec 2023 21:12:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Reset controller fixes for v6.7
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809717
  Lore link: https://lore.kernel.org/r/20231213152606.231044-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] Allwinner fixes for 6.7
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810199
  Lore link: https://lore.kernel.org/r/ZXtVUJ0SG2NRpPG4@archlinux


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


