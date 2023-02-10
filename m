Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54FDC05027
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 17:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A273C433EF; Fri, 10 Feb 2023 17:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77B7DC433D2;
	Fri, 10 Feb 2023 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676051568;
	bh=UOUAVsi2uZfIblIVsbUb2Gh+Qm1ICcRMyV/Rjgx5N1o=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=EtP68sYSQ8eiEpBrEAhK8Mc6KZUBR+mhd51rcpj/xFqb3A2T24TsHZ4keJpUPFcBh
	 yjvkGHUKQ6ll0OWtGzoZAkWdwC2Ywgk5Apx2sv0af2jDz5bLnzCUrFUG6tNUY+74Cm
	 /vejeytOLuVlopElXjhsUHdaX4wSxwin2abp6LSwoWl5wJLE+h+sleVm/udzI4AiUf
	 lHGmr15eaFCLGp1rea14Jx9b0NdaVr7Cs2JSJwkUA43UelwoBv16TALA8dvhS3zKbn
	 zqdUnUfW5bT9nOmXBBxb7q15vtxb2ZUaBtCUFnOAixluj/MHW5yvAY4BnmoO0R5PlW
	 pTJSsub3ahzpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 679F2E55F00;
	Fri, 10 Feb 2023 17:52:48 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.2, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <d3a3546d-cf8b-407b-bf8d-d8666e2b9c98@app.fastmail.com>
References: <d3a3546d-cf8b-407b-bf8d-d8666e2b9c98@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <d3a3546d-cf8b-407b-bf8d-d8666e2b9c98@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2-4
X-PR-Tracked-Commit-Id: bc6772bbab9af6034f918624a40ac5c962df2bac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4f72a263e162938de26866b862ed6015f5725946
Message-Id: <167605156841.13061.901058571077647507.pr-tracker-bot@kernel.org>
Date: Fri, 10 Feb 2023 17:52:48 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 10 Feb 2023 17:25:44 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4f72a263e162938de26866b862ed6015f5725946

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
