Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0F0C433ED
	for <soc@archiver.kernel.org>; Tue, 18 May 2021 13:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78F77610E9; Tue, 18 May 2021 13:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 636FA6105A
	for <soc@kernel.org>; Tue, 18 May 2021 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621345209;
	bh=wmv9rM/G4sEB68Pl14cZuID274vVjv79LESYtL+kWts=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZK3UaNDje3hv/sCvxbBphEVwEtAU97SLddf2XPbvBJ9HeMdi7fKmN0FOyg8MGZ1Ty
	 hJ+gW4ORHZaG3YWfBInOJZC1TVOZXq2GxOrJ14l5rsb/pvhehDDCquGEFvlL2k/zxg
	 20zY2Hkm+k0wVXhitvdzJ0nkI5dZUy346XTmA5+X7EaBkt/YAFJKkTSc9K+j8Zyep0
	 BcbpB2Cbjq/I8ZvMOdqQIyvzlRuOFyfS457jfMfIepI2DdNuynX2RzizTY1hu8SVs1
	 7jmM3R/OeKplXuOXlHYSLFXKRbUyZn2Fl+QjulFe0kyXjWElYrj+Hydu+XcHiDUBpD
	 aumke+8/iuVlQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 52085608FE;
	Tue, 18 May 2021 13:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162134520927.27929.16527889830007908947.git-patchwork-summary@kernel.org>
Date: Tue, 18 May 2021 13:40:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: ARM: npcm: wpcm450: select interrupt controller driver
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=484051
  Lore link: https://lore.kernel.org/r/20210518071514.604492-1-joel@jms.id.au

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


