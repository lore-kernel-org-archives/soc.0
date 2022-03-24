Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C15C433EF
	for <soc@archiver.kernel.org>; Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEE5EC36AE5; Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94B07C36AE2;
	Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648087497;
	bh=Sa6Ok0L8gEGNnT9zBSw/ugEcM5E+VqmcQPKIX6q14Oo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=g8LBpKyuKdB4Tinbna8B5NmAUKLqisMuyIN3d7crjHwM3zIHeBgKxd+V63VTx9Q0O
	 /W5jfHcXN6DFGWUlgwMXE88RZprWI1IskJB68L0TBgvdCCCb1H2iUncfwb8mt4OL+E
	 f9yPw/aOJmnBL1sziTpOG4dS4jqzuYqG4VolwQeltdlPquo0iQ+f6/i8DPeILzBeYq
	 zd3IFKfGwLGYyRKOwBsLHMJPf4h3KhtmXsG2Mhi/SIul/nZyxLjPUUq0UYVNqMgehU
	 DquPJE7/MYFh8NO3QGnciQENTngxNKQw2SN/vrIS4+3Ha0QBeG8ZkQr6/aJVO5qSfq
	 RwoETSUTXC8dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 82C95E7BB0B;
	Thu, 24 Mar 2022 02:04:57 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC updates for 5.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3_ykZD8sRQc=y_bfViDxmakXFpgWNL3bAz0Y6bHsV1wQ@mail.gmail.com>
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
 <CAK8P3a182FVbZ5QfVhMr20nxQN31fK29Csr_GRp_WpFoBFEPzQ@mail.gmail.com> <CAK8P3a3_ykZD8sRQc=y_bfViDxmakXFpgWNL3bAz0Y6bHsV1wQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a3_ykZD8sRQc=y_bfViDxmakXFpgWNL3bAz0Y6bHsV1wQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.18
X-PR-Tracked-Commit-Id: 2f618d5ef5dd05e2380ee627814de90d5a33c3f2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: baaa68a9796ef2cadfe5caaf4c730412eda0f31c
Message-Id: <164808749753.29083.13107146893194874323.pr-tracker-bot@kernel.org>
Date: Thu, 24 Mar 2022 02:04:57 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Thu, 24 Mar 2022 00:09:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/baaa68a9796ef2cadfe5caaf4c730412eda0f31c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
