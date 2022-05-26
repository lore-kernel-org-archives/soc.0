Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0A0C4332F
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F77CC36AF2; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2875AC36AEF;
	Thu, 26 May 2022 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653589210;
	bh=TLaozXy3rMADFMNr7ISsASGJvQ5hy+oQovgHNQqJoog=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=tFUx+5W8Z/A3Pfhb0QpLtIpho8fUyFyp4zIvn15He0RN1xb7nfh7bBrHhkDXs6wGi
	 IYTk7NB2ukVO8hWJvW2geLds0/xuK+fOZECYX4a2oxmaeThN0l6j4w+M64qIuyJR5W
	 qyrc+/Bs/S+0srQ22+P/Yd1PWaQSfowQs2uuUDrLia0ZohpMdV5vTv3HSdxbBVoZ0T
	 aes90YnDsVyqZ6MWe/H0XTrz+Q+q9fp0gKDSygJoP7nxki1xCu6og0qh4dELuZZ32a
	 t4ZQGQLRDsMFSYz654sFTroVmCeeNDgAfNtvjRozPbt/LLiwak8031fgzXo3Q9yUXG
	 GHkZaDKgIGnUw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0BDC1F03944;
	Thu, 26 May 2022 18:20:10 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] ARM: driver changes for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1jTC_x1DKcyE80C7JmOtkVKkKOTE85SO_4_OU7NihPzg@mail.gmail.com>
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com> <CAK8P3a1jTC_x1DKcyE80C7JmOtkVKkKOTE85SO_4_OU7NihPzg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1jTC_x1DKcyE80C7JmOtkVKkKOTE85SO_4_OU7NihPzg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.19
X-PR-Tracked-Commit-Id: d4a3b442335b0a9476248c5d6dc07f6f8580a9ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc3c470ae4ad758b8ddad825ab199f7eaa8b0a9e
Message-Id: <165358921004.17369.13246567845302808968.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 18:20:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 26 May 2022 16:49:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc3c470ae4ad758b8ddad825ab199f7eaa8b0a9e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
