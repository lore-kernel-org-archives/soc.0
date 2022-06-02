Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AEEC43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 22:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1474C3411C; Thu,  2 Jun 2022 22:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2BD5C385A5;
	Thu,  2 Jun 2022 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654209368;
	bh=6VchP07iIA4+3y9X4Hii8+s8tMao8koIZnG4W2WlIvQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=oQkVqLFBRJtHQFXzL5Q3Aj+MvsAiSWCmkniWMEAct5JO8F0Daz5dd+N81Yaokw9pX
	 DRdI2eNfCHodRTKaqsgn9Qu+fuZEQQ6pFCXAAhpnB75RGD7+ztyLhTAu6X7jGQ1Fuu
	 0bs+52Cbah4ZvdJjaGQnQYOveHQ2kq7s2a1nwZxkqeQH5H5FqRfLxmpG8xn5GG0rjo
	 B+AwO05rW3wUVVICGEj5zNHN/0Q8rcGGH/gxvsnm6wjvlwThAZrRPYBpW8X6i8je1h
	 sJeIu/rqLvCxc2bEOiu7RY+Ck/uaYbT2tD5nSxxvIbRK+CnPlRW3lTPTiJPKfKgK04
	 AbIWpcdfs/Xng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0FC2EAC09C;
	Thu,  2 Jun 2022 22:36:08 +0000 (UTC)
Subject: Re: [GIT PULL 1/2] ARM: multiplatform changes, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-multiplatform-5.19-2
X-PR-Tracked-Commit-Id: 3d76c9f5e0ee842ad42e482669d7fd63d4b67867
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96479c09803b21d195c95fd4b145cd3a5a591ba0
Message-Id: <165420936865.5886.2539511662338670243.pr-tracker-bot@kernel.org>
Date: Thu, 02 Jun 2022 22:36:08 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>

The pull request you sent on Thu, 2 Jun 2022 23:34:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-multiplatform-5.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96479c09803b21d195c95fd4b145cd3a5a591ba0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
