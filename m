Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90714C19F28
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75E93C43145; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FEAFC43144;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659458347;
	bh=d0JqSRHXRu8vXtUMaRocrPskYi/YxzWyHsvq38b5IYw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GYZexCX+rGHiQ68zKoQp++bLkwWNzhHevzSvTyWG9XnzxaEjVyMbnklZTTCV9L6Ja
	 Br/0T52qcGOHkYb6xcD6QAJ4i4XDI+xEeqOuA61KUdz2fZWsPwmm3KiIPY3CVhkD0+
	 xNzF8+k7xC/8kR0QkJmvDZyLzEwxyjVx0OIN6cJnLDgx21G5AMb5fj/h7nJvge014h
	 fuiYrI0BETT5sDW6HwepDz84y9/LFQ7kSCG1/hTxCT/sfCFV0GZ/LYBxopRhxsicGA
	 A54RxKm2cn8agay/1cZyTY+EokspHtRgcCjCPP2dg+9HjLOUsbtjymVFcvZEk5kRGf
	 pBLflJeptw2vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 503EDC43142;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Subject: Re: [GIT PULL 6/6] ARM: boardfile deprecation for 5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0ht1tG2nVzh1Shm0v8orQTa0VWOVkhvX9daF4yu6u8Sg@mail.gmail.com>
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com> <CAK8P3a0ht1tG2nVzh1Shm0v8orQTa0VWOVkhvX9daF4yu6u8Sg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0ht1tG2nVzh1Shm0v8orQTa0VWOVkhvX9daF4yu6u8Sg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-boardfiles-5.20
X-PR-Tracked-Commit-Id: 1785ab769824b800d7dea83aecc88c90377a6a5d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1
Message-Id: <165945834732.26510.2669295610066684056.pr-tracker-bot@kernel.org>
Date: Tue, 02 Aug 2022 16:39:07 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 29 Jul 2022 00:36:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-boardfiles-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d0d3fa7339ed5a06d6608b7cde9f079eba62bb1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
