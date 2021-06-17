Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2BAC2B9F4
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 733E5613E1; Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5D8BA613B9
	for <soc@kernel.org>; Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623960603;
	bh=rHKW7YOI5wQpyvaNwbDxLWPDt2pLm5wGYNX/zBKC2e4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=dfywhhAhF+JyGXFikkjncAcW9nK9UoOVM9zJqEDiN47CVeFS16r0hrJfbhugWqhF0
	 Q4LqwST/2ImPLkYpwCJvI/e8w7TWQLNPQ2x3lpNTEPwgvFHkdl8XFut+Ge1La6/bpR
	 ulwIsxHZSmq9UlygTp1ni440Rt1WHzxWf7hHpELdtagZjzeuz1sbt0Tezoxem+6D5j
	 3Rp5tlvjxp+Zd5Pe04Wx+3xtuw9epQkoByIAutfp7shEiBHHR4Slt/FmQ8hGcTpMJn
	 ol1zgKkj5FnkmQNKH1dqwSIJKoiBoIMhsyrWD2xpVGpecAzSGz2usgAyg6CRP3kl9w
	 CfOX3QwPhziSw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4913C60A54;
	Thu, 17 Jun 2021 20:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162396060323.18016.9331836689050978070.git-patchwork-summary@kernel.org>
Date: Thu, 17 Jun 2021 20:10:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Reset controller updates for v5.14, part 2
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=502451
  Lore link: https://lore.kernel.org/r/14d33ac19b2a107e97ce1ab264987b707baa9ba7.camel@pengutronix.de

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


