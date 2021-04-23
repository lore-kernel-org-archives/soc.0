Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4147C433B4
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 09:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACBFC6145A; Fri, 23 Apr 2021 09:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 96AF661350
	for <soc@kernel.org>; Fri, 23 Apr 2021 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619170208;
	bh=U9NYOllZjxMo3TDcwkOcr8iPMyrUbCOFGDewcvDxho4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=EyMMvZWWBc0zp1cB5CsZ68Nyu0mMOZdxnGWyk+Lo+aHI56rvH/XKgliUumSm2Fl8Z
	 V5tsoM9mIF3xqfStkKzC3vbkOvCniR0X5KKq0M1Ontll9m0OtOJjiiS9tK8bnNsdlj
	 jykTpP1Gp60i05HI3QY+qvSE/9UcYWHONazIMeA7xs6xfYBiAHFpB688QU2gVjS4ix
	 96XX+Wgky8Yub5Z0BV7B9NQyFyuP7CpNMuPGZq9fbN7v1AVqaPXFfyxoV9bFYghYoZ
	 JmHka1t04ttrJpHJLoL+nWvqjJb7Vzb4WLGpeyB9ZPo0NY98JRXDiXTtE3b6LC7kwl
	 GCM8t9aiJ0MGg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8A228608FB;
	Fri, 23 Apr 2021 09:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161917020850.11881.16340587870308635829.git-patchwork-summary@kernel.org>
Date: Fri, 23 Apr 2021 09:30:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: soc: aspeed: fix a ternary sign expansion bug
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=471873
  Lore link: https://lore.kernel.org/r/20210423000919.1249474-1-joel@jms.id.au

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


