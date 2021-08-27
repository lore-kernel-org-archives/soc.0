Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143C5C432BE
	for <soc@archiver.kernel.org>; Fri, 27 Aug 2021 22:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DBE1560FE7; Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C580560FD8
	for <soc@kernel.org>; Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630102208;
	bh=ilHv9TOzqKN0LDQZDCTFoe0K5SErn3JYN4TFP6Cp680=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=szrG1b7/mbm0uxMFg4r6wtFbL7rJ42uREaZKMrK4aj6g/uU7ilJ4CRYeB8Rprrtuy
	 rwQtcq10x0xA4Wobv+13lJkH616B+heqxQiGwCwctKbkPtDk9VdhiVh5kFO1qx6cY4
	 VoIlxcmbvTcC3JqWdaK2D3CsgqaUwQrfIZm57wgUJOUnOq/R1mRRlTztPsX3fktovA
	 mWBA5AuDbbex9owsSpGX4rqq9fcvj/hXgGdJ/GCLemM2iLB47OkeQZ8A/uxBfWvrus
	 NxELvVspHldhNOZsy7x8SqMZc22MueYu+bFxz77+D42Zx1784I7fB9Y2bELTMkCicb
	 Vhx9KK7KDk0tQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AC31660A14;
	Fri, 27 Aug 2021 22:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163010220864.19400.4423592109344236397.git-patchwork-summary@kernel.org>
Date: Fri, 27 Aug 2021 22:10:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.15
  Submitter: Michal Simek <monstr@monstr.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=537835
  Lore link: https://lore.kernel.org/r/cec98151-d7a9-3fdb-ba5c-dc1fd182c2c4@monstr.eu
Patch: [GIT,PULL] Rockchip dts64 changes for 5.15
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=535453
  Lore link: https://lore.kernel.org/r/4327460.usQuhbGJ8B@phil
Patch: [GIT,PULL] Rockchip dts64 changes for 5.15 - #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=536067
  Lore link: https://lore.kernel.org/r/6569432.ejJDZkT8p0@phil

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


