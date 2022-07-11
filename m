Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DD3CCA47B
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F9FFC341CD; Mon, 11 Jul 2022 16:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E641C34115
	for <soc@kernel.org>; Mon, 11 Jul 2022 16:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657556417;
	bh=zvSAH65NdDsn9SXcAMAYjbNXcobnlCiUMQwlhT4nYu4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Ya5oiC3IfZlL0h+U2uQO3MiGioKD+Tyvkq7DIKQ40Gjukt1/E1l1FRXjXwJkH4+sR
	 twh06CpC/uDw7h6pRYSqxUm7gRMjaIw3/7J+TttiiXk5eDngfNnynvPiELW1yYPAMT
	 ANRtadSTRFIOeMYsmiUCreno2SSKY9jgHcrJC3/rHUjRlE8moNqwFwx8QGQ3dYKAGu
	 Irbem/3NpE5rDX8MdfmqY4VeQ7D/GvH6POgs4tUIKQsGgM6DNfFTcY7i96SNArv/zl
	 51GapLKBlomU7tPknfWSX9Pq3C+juLdqMU1wUjUI+DAz45pPjSUYYCayo5VnQV7ZlD
	 jwHtRBfMrWcQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DCF40E45222;
	Mon, 11 Jul 2022 16:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165755641685.9192.10963789198751935882.git-patchwork-summary@kernel.org>
Date: Mon, 11 Jul 2022 16:20:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.19, round 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658104
  Lore link: https://lore.kernel.org/r/20220709032716.GA9868@dragon


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


