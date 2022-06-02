Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2F0C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 22:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04693C341C0; Thu,  2 Jun 2022 22:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D84B5C3411F;
	Thu,  2 Jun 2022 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654209368;
	bh=Dy6i18x64uWD/Tn7Y4oyj/OHrnNpc8jE3/Hf1AW5AgE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=BBPv+ttkmH/Yjv8k3Q/Jm4sXyGMVDEm5TLUYNIttKDgFmOI91xxnS1ApS6IRzzkSL
	 pvkF7cJ1lc6yperGuiHT4hQUgiiYpiin0Rv2gtz/EGgoPbNaKyrdDInaUl1AsBnI4O
	 tIM04jDlgj4e6FhX5vzkUR4SHa3tUWr+LOLAvV0aS06lAJJGC111iQOjycAO8oRIN+
	 cL3yA6C2VjOW+jLfz4k71Gu+BOMD43njVgGuMtxioWS4I5jvmCvyzwdvVCor6Pb1zl
	 wHQ1w8J3+g7Qp37ufevxf5cpJ3ndnIT8/j+geWbChrFNQRqgbrfNFiMiX/k49lb1zr
	 /hnLiJP2pnVGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1E88F0394E;
	Thu,  2 Jun 2022 22:36:08 +0000 (UTC)
Subject: Re: [GIT PULL 2/2] ARM: SoC changes, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0sR64MTxVBGBsUputmjbeUJmia6oieCTXoJ4Hb3-rt4w@mail.gmail.com>
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com> <CAK8P3a0sR64MTxVBGBsUputmjbeUJmia6oieCTXoJ4Hb3-rt4w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0sR64MTxVBGBsUputmjbeUJmia6oieCTXoJ4Hb3-rt4w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-late-5.19
X-PR-Tracked-Commit-Id: 9c76d723edd4f4d7d10b33e7e56f72ecbe6cee34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09a018176ba246f00d6b6b526047d38dcd2955d3
Message-Id: <165420936878.5886.15094054659813587112.pr-tracker-bot@kernel.org>
Date: Thu, 02 Jun 2022 22:36:08 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>

The pull request you sent on Thu, 2 Jun 2022 23:35:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-late-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09a018176ba246f00d6b6b526047d38dcd2955d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
