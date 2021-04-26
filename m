Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC90C43460
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 63D5561396; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 48F506135D;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619466152;
	bh=cW1REbNcJTMmgBj3Aav6ZXR4VfJ1AxjSxHw5h8iKwGw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Gdrwxa/KwGtblx33drXCiN0HJ7btLnv8ywqPJzZ2gEYeZA7KqUniOToqPYgxX73lZ
	 KiPEu2bJv21BlWxMBvqPXEUDxsXFIh0XFhQKMaJEqpbUflFVnvtUXjONJLjWeM+QUc
	 WmQ/mLtPC7CffqfdQ0n4cI+JVKWg0Yg6vCEqlpL++udSSC4XJSCCZb3w4tLYTIOPHI
	 uTr6BFcm7HslgzKhYwx3TlCiC1N2SqbSywVRNXn64hoVUKSzw/kKCul/nshmy3pD0I
	 9ygYIzPeyQZzEs+CAklE7rHQF1fncGgqOUNVdj3DgKgt92t7wqiCavINTwz1SfJ60y
	 4SQ+AKi6PTAqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 421A5609B0;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Subject: Re: [GIT PULL 3/6] ARM: SoC drivers for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com> <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3uSjSyrRAq2BjR2fo6S7kCfOo+3szQ2cvBt8-D2KybwQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.13
X-PR-Tracked-Commit-Id: 5ffa828534036348fa90fb3079ccc0972d202c4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37f00ab4a003f371f81e0eae76cf372f06dec780
Message-Id: <161946615226.4821.9858108754030458185.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Mon, 26 Apr 2021 17:55:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/37f00ab4a003f371f81e0eae76cf372f06dec780

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
