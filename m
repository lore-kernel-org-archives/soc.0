Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3DCE748F1
	for <soc@archiver.kernel.org>; Sun,  1 Oct 2023 01:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42972C433C9; Sun,  1 Oct 2023 01:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13989C433C7;
	Sun,  1 Oct 2023 01:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696124897;
	bh=va/7PLPEEr/ryhUAq2mNc+uDBTYVDTRBl1CB2FimyxY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=SeqiNcz+CLJyBIcFDHEISL6sOIrx+oqdBCg0zxuV3nVjkpEBFQdGdwF46wV55NyHu
	 3yHvjT2B9ELZcDt6j334OT9sE3mgk8Xn2y7oV9qbY+vVwL+SFy2HsADHd7aYFXramc
	 +hXFgsjm/S7v3nRqsVYOv5zsNXAbAzlzwIVfh5cKhOPMi1Vj5Ql4gTQvLaNn/vsXnX
	 hcBgWR4FJmtoODSREFvyrNO2vdk+P0i74TDbyk9X2XpHwB1GRcCt2AZaauPlwHIiqn
	 9y8mnjxi2pTmyWqar3AqpqrWP80j8Wh64xo16kcWOFRaMMFCPty3mCzLK8RpF3gjgX
	 EV1b/NSULn+7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 019B0C43158;
	Sun,  1 Oct 2023 01:48:17 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <6425892a-8503-4f70-be45-e545cda59854@app.fastmail.com>
References: <6425892a-8503-4f70-be45-e545cda59854@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <6425892a-8503-4f70-be45-e545cda59854@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.6
X-PR-Tracked-Commit-Id: b0b88a585c27834223d2daf47faa57ca06dd9414
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e402b08634b398e9feb94902c7adcf05bb8ba47d
Message-Id: <169612489699.20680.11496399785961864415.pr-tracker-bot@kernel.org>
Date: Sun, 01 Oct 2023 01:48:16 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Sat, 30 Sep 2023 17:26:59 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e402b08634b398e9feb94902c7adcf05bb8ba47d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
