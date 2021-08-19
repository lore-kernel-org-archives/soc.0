Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A39AC4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5957761101; Thu, 19 Aug 2021 15:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 42FF26108F
	for <soc@kernel.org>; Thu, 19 Aug 2021 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629388205;
	bh=HDSg2GWUXQmxprQArVREIND9hy/1vz4EvB7ADjuR7NI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pQBKiIzTjCcQMurwW3Uve0HT/2euMLxk28SqctICQ9YXhaJDh86fRm3tvfbranv58
	 SgOjsDSoRojI2ftDbD8o1Uj0kde4Kl/vaQbXW+2IDzPq6bDMumJ/Ye+k/K38EgeYXR
	 0SISRUhMHe05kL2YHc40a9x90VUIsMFaWFZmjqtNAOPHADaXfYBc/V00OQ6038y/s9
	 QCXf/EVmlbh+tbJTdmsezIGtvaocK7nLEDYyjhgjdpRihuhAZxbYyZhYxxtFLquM4r
	 Vy0laPChdUAhylz8bDUVOYL/64Jo73ma47xPqPTvFivglpUeyTKlByTJwR05yo4xDk
	 GkDjzsswTnU0g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3000060997;
	Thu, 19 Aug 2021 15:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162938820514.21569.16381455781671344394.git-patchwork-summary@kernel.org>
Date: Thu, 19 Aug 2021 15:50:05 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] ARM: aspeed: soc changes for 5.15
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=533889
  Lore link: https://lore.kernel.org/r/CACPK8XdyT0rCkoeE7x2EQyvFy1Z7ZwFNdm1SQfCG9yC_Z7UbxA@mail.gmail.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


