Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83E7C5519F
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 20:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AF05121973; Fri, 27 Nov 2020 20:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606507807;
	bh=9yg8A18d9vQBNaSw0Xld+y8i/jteBG+T7uGcohCUufk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=fu/+84lZO+uDAHk782+sdd+ZBDYcNUeJDyOJ8GLoEQT7pnjMA5WaxK13gByfiYU8s
	 D1USU2z4cidATKb29XmCRUctJ9zJSGsIBEsY5qm+LZBdghwOWMuU9DqSb3kfLlJDSJ
	 Cl9ZKu6B6IYgjScXROrXXsVLolXpxwltaTOjYqdY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160650780746.32506.11451149630743743396.git-patchwork-summary@kernel.org>
Date: Fri, 27 Nov 2020 20:10:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v5.11
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=390213
  Lore link: https://lore.kernel.org/r/20201124122412.22386-1-sudeep.holla@arm.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


