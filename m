Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C0FC4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E694C43470; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47110C433C1
	for <soc@kernel.org>; Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669206016;
	bh=wQrLYzN2092rpnkUC04N7OU01B5bk/I5W7fA42GRbkc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=WUV6Migcz6sjXKhHLnliStgOOLE9uwlfjI+PJSQ9ZVlAyO2cPuSOMpcTl1SWabB3b
	 C0ZLvZmZjiBIPIt5aUqq6gouCjx208J+qW5EC7Pq2HtSVDYlGuvmmSnsJD9tbzCwbM
	 nyKGNR0XI/wQpSP4N+5fN5/g4QTN6MSB19T4D86WgCxq4Oz9k0oBMwE4rhap2c+dFr
	 pxIiabm8F6fmtuM7MYyO1uWIP8xBl4oiqOR4HsS5KKd0Dsh6K5MEb076fjyhGNNaJh
	 W0gYiU/g/nmOuLKZMf0DO4/RxMpGV0zdVX3XFt6MyFpCGZ/FVQxywKHTWi7iRkJNhU
	 veB3JZRCf9vSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B26DC395ED;
	Wed, 23 Nov 2022 12:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920601603.19495.23657013287859292.git-patchwork-summary@kernel.org>
Date: Wed, 23 Nov 2022 12:20:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: None
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698251
  Lore link: https://lore.kernel.org/r/20221122223856.fwackjg7fbd5jcz7@wannabe

Series: [GIT,PULL,1/4] ARM: keystone: TI Updates for v6.2
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698202
  Lore link: https://lore.kernel.org/r/20221122185650.nrh7s2g5obndj5vj@dental
    Patches: [GIT,PULL,1/4] ARM: keystone: TI Updates for v6.2

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.2
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698149
  Lore link: https://lore.kernel.org/r/8faa1d3c-5a17-2c3f-92d1-f8fe3df74131@linaro.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


