Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C465C43600
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4902F60FEB; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 32BC761359
	for <soc@kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282810;
	bh=tVALQitNIVAoEOSDQQz0ledYH9fnTXKbkV/g/85H+UY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=skKylfVPBt+StPttunVa0iWcwHmJe8bu3ZxbyZ7nOwT/kvnh13hSJD7OviMcq2U8g
	 8IOmOBGpkcsug14Yyp8wLXR5AIiGGNTftEsVQW05XgUTS7KVjMakxuEF3VNs21FQ9G
	 2vjU6W9qpPxGPmZ3u/zLCp7BM68RRZslVwF7XehqP1G6ja41GpnkcR134lI5tnrOXY
	 lKJrJeyUPfLFhmCOp7xTDQ5yE3FXoIZxo+JJfzgBJc8iXq8hZqGb7B3IlACfdo7pJ/
	 q7rOyR0E/Nv1TYT2qODFX6/LmCPbj9udCmUNTPpEdKB/CHUg+xLmQ0TR6nFQIcptPV
	 tnc1JRIBMlehA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2D93460A0D;
	Mon, 17 May 2021 20:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128281018.19328.9473081949716172801.git-patchwork-summary@kernel.org>
Date: Mon, 17 May 2021 20:20:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.13
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=474415
  Lore link: https://lore.kernel.org/r/20210428093148.flrcowzr2dsj7byz@bogus
Patch: [GIT,PULL] Renesas ARM DT updates for v5.13 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=473857
  Lore link: https://lore.kernel.org/r/cover.1619522726.git.geert+renesas@glider.be
Patch: [GIT,PULL] AMD-TEE fix for v5.13
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=477245
  Lore link: https://lore.kernel.org/r/20210505110850.GA3434209@jade

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


