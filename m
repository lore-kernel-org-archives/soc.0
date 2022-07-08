Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3D6C433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFA1FC341CD; Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96312C341CA
	for <soc@kernel.org>; Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657281614;
	bh=Ys7ywvf+qjiZL5bmcGJqLjiCHo2COu1qlbgDv/NU7FM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=dWS+AhRxFV7NpVTt5dLmdFYPLCERKFrnkee4F/itRlo3XBoeMKo59Fty0MAZARZ/i
	 eFhyYFkJ/K0W6r3C247HyRW9RL3o//3GPeE9+zu6peGbUFbgMLN/aHXBw4cXmfy6iw
	 GLK+kbz03XxRICYiLlDWcvSAsW+O7jgQhap6NSqBkkr+eYzrT/P8YELRfgvA5IlEev
	 RTO6Xl25ENi11W/li9YOGHnL8P8dq5ptTp/kKv/tbHPTvvAVQIZRVcq0seaOXRssFI
	 NyRcWYrIsGn5hOy1OiTWcuEZX2pZAC2iOeUTh0i+kztC5HzfGzVWCrDuV1WmKirVm8
	 bqfXg+F6adn6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72E03E45BDB;
	Fri,  8 Jul 2022 12:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165728161441.25834.15706714240671062968.git-patchwork-summary@kernel.org>
Date: Fri, 08 Jul 2022 12:00:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v5.20 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657832
  Lore link: https://lore.kernel.org/r/cover.1657278843.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM DT updates for v5.20 (take two)
             [GIT,PULL,2/3] Renesas ARM SoC updates for v5.20
             [GIT,PULL,3/3] Renesas DT binding updates for v5.20 (take two)


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


