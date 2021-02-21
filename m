Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD34C433E0
	for <soc@archiver.kernel.org>; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 33E4064EF5; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 11DA764EF6;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613876251;
	bh=J51+N3yYee7ChZbIsvdrIPbUbDp4Qi9Bh9CEHd/1LsI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Rxez1YcykW4AAOeNgKN7DLbaFwb/J/LledKQ28zCXoNsjJxYgoRP+DSYgisSAN9en
	 FnoC0HQPIT4NqzQsAzFkmXlp1yNJEatVUAdGU8sLWC10cxxpLUyyLJSIJIgjJ5VmVV
	 qrJ9HjyTYdfjVfhIYtWUMuiDJLRbaLx8nVOBwKEnnXnlyCrwWhfwHW7ORYIyr+TVkp
	 /UdZ0mLGmSCGNcF1QNkn32dwXq/CiRtzdmJo6joZBtNPXFA12+B04cIJ0nZatVC8Vw
	 hbiZ5oReOJxRipXEmdV9NOMU0g5cZiif1Ghs3ozA8FGFe0d2ATbNqAT1V02YKySvON
	 +nKLpDadTz2YQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 05A1E60A56;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Subject: Re: [GIT PULL 2/6] ARM SoC platform removal for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com> <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a28_WrRo_gdgotYmexseB6ivUfGJyaF6VMF_04EEmGpxw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-platform-removal-v5.12
X-PR-Tracked-Commit-Id: ce1380c9f4bc48f6e6133ef9fc24dc9f3df500ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 584ce3c9b408a89fe5b7ac5b5b246b85c78defed
Message-Id: <161387625101.20427.2403785209981932774.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 14 Feb 2021 23:42:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-platform-removal-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/584ce3c9b408a89fe5b7ac5b5b246b85c78defed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
