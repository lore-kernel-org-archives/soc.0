Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A206C6379F
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72AF3C4339C; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DBACC4339E
	for <soc@kernel.org>; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676025618;
	bh=aPUH1GR9TZLQAggwnoofim/IAIRCHbNPn/T1eFCH+i4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=iOogmb47Y+1z1cFpBtj53g0185Luj7iIN9hpepSb685YK9TPlcwzmHrggYPzWC+ch
	 Rf7A7bROcdB4HGU0sGp2KLO9XTPp+fEQ2nV8hbp3UcKLBk5fSP63lrAcXCJUI6Heiv
	 G2JU2fVc1vEnomBzyX8ABeWF6tWelHgIrARtPBlzZp9he7j4bGPBO6HzO/IW2pwQAC
	 LI/UH0F4ZQWoXQdCoE0GyX5JZJDKHxA9MpQoAn+cVaHtLx1OdjAFpN6IWvFSSxEaZT
	 yYq89K+wmEB3dEBnTlsKSqa48zZU1WiQHuymr65tM5MuC8hx4CzpvN4ng/tF7QTNG7
	 ZZmQF180O5HrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3CBCAE55EFD;
	Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167602561824.9597.18365832223112861884.git-patchwork-summary@kernel.org>
Date: Fri, 10 Feb 2023 10:40:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic fixes for v6.2-rc, take2
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720576
  Lore link: https://lore.kernel.org/r/761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


