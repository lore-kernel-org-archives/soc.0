Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A80C433B4
	for <soc@archiver.kernel.org>; Tue, 20 Apr 2021 09:53:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AAB46613AF; Tue, 20 Apr 2021 09:53:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 94DD061077
	for <soc@kernel.org>; Tue, 20 Apr 2021 09:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618912426;
	bh=MN9JSFHsSDMt0vgRTtZJyTGh4DkHEUHiDhXJyTIm8So=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=kW3e0FwpfG0ybZZlzgoLTXg+qkl+T93Yne/2KmpA8s7119/YJB291BOzdP14C6epK
	 Kq4ev+y3uxnRIxFTWj/eJMYcmr1HgyPHuyym1zM2w+pJ3J1PKvXsUpefb4QdP6Udo6
	 1r5QnAD91ptsAy38mSwHRczX4kgyNwO3TaGJ0q0RJ8RP2CcI1Hnh8rAmaeO2FfQHCW
	 WsvCwvDDPL6AMxoLxCBPYiiN40ZQwdUVn6/5P39ZsAthQlwzW3bAyGJvtfGSqq5xDJ
	 tOPoprhysh4IkHx6L+qBHYIeKwl0l7JVGEqgRX7e1ydq9En07lXzs2n4lf1xUO56d7
	 PrE9aDLWIjSCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8DCA460A37;
	Tue, 20 Apr 2021 09:53:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161891242657.23262.12826962544295269492.git-patchwork-summary@kernel.org>
Date: Tue, 20 Apr 2021 09:53:46 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [RESEND,GIT,PULL] ARM: bmc: devicetree changes for 5.13, v2
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=470013
  Lore link: https://lore.kernel.org/r/CACPK8XeJdHmxyJn43Ju5hmxJ7+rJgHmx=ANFaL17YUmp+gOtJg@mail.gmail.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


