Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10B2CCA473
	for <soc@archiver.kernel.org>; Fri,  3 Jun 2022 21:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 991ABC341C8; Fri,  3 Jun 2022 21:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B7BFC385A9;
	Fri,  3 Jun 2022 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654292960;
	bh=jpk3qSZrGK2+1+g5ch44UqjmgfI7NRRswOHip5Vua6E=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=IeFRUsEo6V/JLEI3ucgDYGc01njRNq31KuYucmzK+7VWoIavVijqV9AvufEAoyVzH
	 jq4fgOQuXIcvPOFZgc5Ruug3W9fP8haDxTh9TXicU4RlluXvWqabSvE41WYQeATgly
	 22WACS2LUXMTVKPDLpvFfDsRaTZCj1sBAi5ec1oN2c9bbMaLDcxG4Vsqh7MVuDNFUi
	 3uaPUz7V9qf/bvNz3eYL9IEfIPF33bBLRbW/iZOdXPd5rHL/XlKo8OYqT9T6ZJcg7H
	 ZGSCpbkB0t8AO0KZJBLkjGd4qqfqef8GFYt+fe50Xk/IRdQvGCo4WcHJ8isgcZEpn5
	 OjZi5FN/yNccA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6758FF0394E;
	Fri,  3 Jun 2022 21:49:20 +0000 (UTC)
Subject: Re: [GIT PULL, PATCH 0/2] ARM: multiplatform changes, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1Q2DbCrSUuu8Fui_W7ZydQZeza=s-2cgKFS8AL1geFZQ@mail.gmail.com>
References: <CAK8P3a1Q2DbCrSUuu8Fui_W7ZydQZeza=s-2cgKFS8AL1geFZQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1Q2DbCrSUuu8Fui_W7ZydQZeza=s-2cgKFS8AL1geFZQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-multiplatform-5.19-3
X-PR-Tracked-Commit-Id: 7036440eab3e2d47a775d4616909f8235488d714
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9af13088ab139ff1663e44e5746e152303cffbc7
Message-Id: <165429296041.7657.11790913027480298824.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jun 2022 21:49:20 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-omap <linux-omap@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Fri, 3 Jun 2022 20:57:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-multiplatform-5.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9af13088ab139ff1663e44e5746e152303cffbc7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
