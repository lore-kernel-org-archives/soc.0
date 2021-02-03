Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A6FC433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7A7564F9A; Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9004964F84
	for <soc@kernel.org>; Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612356006;
	bh=DXS7CkglIB/SYxUt/y/DYTyfDtxRcyEXyDB/ccsIQys=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aqb5D5Q3kjodPnT9i9+Bn2SRECvv+erUgj0QqDPN7Eo4WTrf1QlkqJ9ywACNN8JKf
	 +Kai2piqutcam/fiKQ5LJaMZobDxmvQfY9y46LxXMDJeQZ31xJtwS7HeM8M+HeGOAS
	 aWjPIbC3ah/4NJz7GiUk7k13GIEOguvYmw90v0+dA5ceGtUvEqxsKm8sEKcHpj7Io4
	 +/v+R684mtjUOjBTnCRWAsK+O1JUOcww5TKPbUUPqbd3LbqvCIo3UmA8rWqiDTmR/4
	 iqPwfIWUhqLvDuGwHTWSc2A3vMijltMMWVcQ0hovAqPaaiftHCWv9ysdIpOhfgrM1r
	 swR/DbyLMYjyw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 774FA609E3;
	Wed,  3 Feb 2021 12:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161235600643.28451.12339715646861103294.git-patchwork-summary@kernel.org>
Date: Wed, 03 Feb 2021 12:40:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] OP-TEE fix for v5.12
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=427041
  Lore link: https://lore.kernel.org/r/20210203120953.GB3624453@jade
Patch: [GIT,PULL] TEE housekeeping for v5.12
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=427039
  Lore link: https://lore.kernel.org/r/20210203120742.GA3624453@jade

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


