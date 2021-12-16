Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D9C433EF
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86F8BC36AE0; Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7025AC36AE4
	for <soc@kernel.org>; Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639674010;
	bh=QGIVguLWrj+PlfwHbE7Wwb+PTfSSUq88iDioq3cTVVg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LpiCm4HaYfuFuaEZlKaeIG/3EQq20MJBWNSbXd6GALlTjwek3F642qIXhiNXHPO9f
	 XXp+ys9zR8jYhm7cHwGFhp0idhMNTsbtZFomCrtCsSC0vX4LPre9J1u81epgM0tWGL
	 zT7V45BPdgpJ6CCx0s1eIXiiNNYVzjXlqj4TvwG23wH7v422VytRMOPbVXx0U5M5bE
	 7sRTYwhxYCOdK8ePl+s0DXa8cIyinXlaB6GQhHe+r3bYjEB9uEiw0C4lPp/At6o/Mh
	 YbNXEQFn2L3m94BCM1e3fL3uRz2gwNZJvzEPPktQb7S7hHwSz6FXKX8aOYbEHqlLOh
	 Et56F8OYECpeA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 445F060A3C;
	Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163967401022.7027.5025953781235166869.git-patchwork-summary@kernel.org>
Date: Thu, 16 Dec 2021 17:00:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,v2] Basic StarFive JH7100 RISC-V SoC support for 5.17
  Submitter: Emil Renner Berthing <kernel@esmil.dk>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596793
  Lore link: https://lore.kernel.org/r/20211216164205.286138-1-kernel@esmil.dk


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


