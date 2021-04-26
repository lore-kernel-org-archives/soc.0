Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E79FC43461
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DD005613BB; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C53A960FDA;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619466152;
	bh=FW6NQhAUMSDDa+whpicVU1qrC7PbgWBfJZLN0JZ2+yU=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=HUwNs9uysYdVOgSFJVkNyxM5Tr1J4rNhm2002WBQXsCg3Eck83dr/Lpj7AeIZSLy/
	 KVydt8NivSOWbJImOHFHM3AsLoM9BC74yLnyi2kzssmpR+K60WliRFbwGfVgDeEF91
	 j19C5EZm2tORO/ZypCjKH27vum/9yPcuwZYamM3zHvaqygRiu0/Lj7RGpqasQTQ46A
	 DlZIJxG8vS9CH3hFKSFSI0voe3IkivpOPXKkzu4Uq1hmRLgcp1flxKVgDjh5TsfYs6
	 VDKkw/tw+ShnTFgXpcSHbpe4lt0Ts35XN5ksJDa6YsFxZnhvjVhhWdZVW9CukS7Rvl
	 1XUKgcO+IavUA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BBD46609B0;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Subject: Re: [GIT PULL 5/6] ARM: platform support for Nuvoton WPCM450
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com> <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2apTEYei_w6+_dM5a6ZD+QCA65x9hDjVWe2ueVO2C_dw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc-5.13
X-PR-Tracked-Commit-Id: 39b95079f68cf17888a4cee93ad3c4acc3854b38
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b0fbc540c2fc34e55828ef9918cc61528071a01
Message-Id: <161946615276.4821.7651727399452852128.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Mon, 26 Apr 2021 18:00:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-newsoc-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b0fbc540c2fc34e55828ef9918cc61528071a01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
