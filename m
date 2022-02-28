Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38463C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 20:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3530C340F2; Mon, 28 Feb 2022 20:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC523C340F1;
	Mon, 28 Feb 2022 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646081620;
	bh=c2wRbqBmRaIgKhwGHTND50dxR9g6Vu3+NGpRojMAAbU=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=M0NdHdH+Jw/Tt7UfmlnC7pl/xpyXL/gqPBoDBwCWh6isVZnmr159F0BJ4zuxbAhBh
	 /L7q68Mgv22+QNztP1mD4mvrrTUF9SHa2DAVuLAYfymYU3vsQ2APMrt3kcm2LIXZfI
	 OlX6jUQGBK1T679/qKMagVYBN0jBjLIEe3ufr00vcn0lNBwasZtWLxvRAWX+QvxbDV
	 gfJlcRj4nR3w88A7S9rrBaGrl46WGwyNBWEK5ZGVwLxfW3SaPYzZGOIndrriuW7D/9
	 yq3v+jSeJnauT+h75Bx1rbMGWwnCbX/ZE0bVLjpPlpkn+RLBlgkPevWVWM2PmW+SdL
	 pIn7qLN5H2bwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C0471E6D4BB;
	Mon, 28 Feb 2022 20:53:40 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.17, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2JGXOYJWWMga0bYbWA=x1yb5EpBUC4v+onpj0U=4e2pQ@mail.gmail.com>
References: <CAK8P3a2JGXOYJWWMga0bYbWA=x1yb5EpBUC4v+onpj0U=4e2pQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2JGXOYJWWMga0bYbWA=x1yb5EpBUC4v+onpj0U=4e2pQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-5.17-2
X-PR-Tracked-Commit-Id: c253bf70c657b407286a6139d85c42fb41f3fcfd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 719fce7539cd3e186598e2aed36325fe892150cf
Message-Id: <164608162077.1515.11038062287944624532.pr-tracker-bot@kernel.org>
Date: Mon, 28 Feb 2022 20:53:40 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Mon, 28 Feb 2022 17:40:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-5.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/719fce7539cd3e186598e2aed36325fe892150cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
