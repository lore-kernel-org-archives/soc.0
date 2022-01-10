Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18853C43217
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA882C36AF8; Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47BEC36AF6;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641839282;
	bh=UbjYnu5stB9sk7nJoauKlXWXE/KzWeHReWrxKMR9VDU=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GqkRXe0/dyjkCIBytyy4w1bWS+dazfWX+PNs6YkZi16WaEIAYBx1ZZ4oWo9HlEN2T
	 oiXPa2BxWRKkLOOPSDrcr1XhZNP5r78Egwna63codyEGJcKkKgl9EAw5sjnWTRdAQw
	 jv1NZ8Q/ctESE7t5mUCMr16fneLNgXwlf4B7NECVWX/z6c3F1sy7HgA46FcSsjvcna
	 va6NTofNv4M8QSxA9Wc1bISjSgDtkMT0IdkIaSPlkYuRNcDgSA86mlVYKiigRXGMZh
	 U05YRu/nn7s/nU8FjekmEftfmyjpsg+4TNEd2rk4glqVIPufxh73OYQ4EekJQUWNNN
	 ZEEiki0te2acw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B3DABF6078C;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] ARM: defconfig updates for 5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3cvBGO9e=34S9o0ConOTHJ_rLsRcGa0J0k0-PGChmJwA@mail.gmail.com>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com> <CAK8P3a3cvBGO9e=34S9o0ConOTHJ_rLsRcGa0J0k0-PGChmJwA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a3cvBGO9e=34S9o0ConOTHJ_rLsRcGa0J0k0-PGChmJwA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.17
X-PR-Tracked-Commit-Id: 0d2589aa5ca99821486be8b7ff9c747665b9c2c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0dca3c5e017ab81ebe21eb9096f657c45a6b17a4
Message-Id: <164183928273.9673.11458523125742457099.pr-tracker-bot@kernel.org>
Date: Mon, 10 Jan 2022 18:28:02 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 23 Dec 2021 22:33:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0dca3c5e017ab81ebe21eb9096f657c45a6b17a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
