Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EA9C433E0
	for <soc@archiver.kernel.org>; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F03F64D75; Tue, 26 Jan 2021 23:20:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E7E1361608
	for <soc@kernel.org>; Tue, 26 Jan 2021 23:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611703210;
	bh=C5I/uY+oL0MN8RyACVg0v2sol+DhOHS384briAwGcvM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=g5JYnzkL4NLk0HZYtUzngDEByxhLoABZ01lEAA+UU+UCx2goBCScHs7ceus1QAeah
	 qAgwxgMs7KCBGc2NgPzIgUGahTBruqAlDkPmILFcXa+NdLRfBkFvjU/HpEuM46bCiL
	 +ezUGVwAm+AfcwWLuoYsCjasClA+URhbRtFDr3nBLO/y4HRbIhf4PuxF5U9w59hqbx
	 JZp2SgaCIZf/gtB0z3ZNLO0ObxhVNqX9tg3GM2rLxmLi+45R9bLAWk/MA7F58Z3Rbb
	 Z9uuhmJeilfngKufv7saKKid+mVDCenxN8/8x+8NZ1iTEKMykzJct5nLtxJ4AUBAsa
	 WL5Djqv433Kxg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D12F761E3F;
	Tue, 26 Jan 2021 23:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161170321077.26028.7809257102293625712.git-patchwork-summary@kernel.org>
Date: Tue, 26 Jan 2021 23:20:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] STM32 DT fixes for v5.11 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=421179
  Lore link: https://lore.kernel.org/r/b7379980-857e-736a-85d8-58e2bd300141@foss.st.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


