Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6544DC433EF
	for <soc@archiver.kernel.org>; Fri, 11 Feb 2022 21:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27CCDC340ED; Fri, 11 Feb 2022 21:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10B4CC340E9;
	Fri, 11 Feb 2022 21:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644615866;
	bh=/dgif6PesOzg2sY0316rn/XGCRUjxdtO4DFyIr2sqYg=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ts68qVLl2WKx9+Ge+5qqYAHnowtbi8rP4f+JnJMkUUWhhBQSFq41GLbbQ7QmJMDfp
	 ojk1FGSwnIvAOMEHoYWr3ytPIjviDRSH50lmNmgGMY0M5gIsA4Fw3ZX22XgiXaL5kd
	 zLReT1KP+ogsFn2n0jMDmwuUaCSlACisSuBPBW98LmsD8oPnpzcFcBnWKIKl5ueUQt
	 SVRTWc76QxCLO/rgJz2FU+HtRj/+JTAyxP6z4vESmMprYlO8TSX+9KsdW9wXXHEn/D
	 e5VOJ4CqL8px2POBXCnvsi6qnGnBjPJrjYykwNBSnNx3nZNuu/SeOsELSwJlPYMa0r
	 yRTy+HcWj6z/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F1D2CE5CF96;
	Fri, 11 Feb 2022 21:44:25 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2kFbS_oDP1GLeuSF9zR-DX6wk3YSJGD=2LZyLr3eO65A@mail.gmail.com>
References: <CAK8P3a2kFbS_oDP1GLeuSF9zR-DX6wk3YSJGD=2LZyLr3eO65A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2kFbS_oDP1GLeuSF9zR-DX6wk3YSJGD=2LZyLr3eO65A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.17-1
X-PR-Tracked-Commit-Id: 5e5eddd94c8906472e3904cb11b4e3ccbb99d0d4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 83e396641110663d3c7bb25b9bc0c6a750359ecf
Message-Id: <164461586598.18198.4263049449395953204.pr-tracker-bot@kernel.org>
Date: Fri, 11 Feb 2022 21:44:25 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Fri, 11 Feb 2022 22:38:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/83e396641110663d3c7bb25b9bc0c6a750359ecf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
