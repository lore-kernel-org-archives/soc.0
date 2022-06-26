Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C63C43334
	for <soc@archiver.kernel.org>; Sun, 26 Jun 2022 21:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06162C3411D; Sun, 26 Jun 2022 21:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D96CAC34114;
	Sun, 26 Jun 2022 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656278950;
	bh=jnLdnlL+k4hLwpvA5lcdfzbWxYQdSQb6ZMwz4JAOiJc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=UlAcV/H/QPUOHRpgI/b32fxQaut8FRUCtqG/oE/TTdRoGRap6egDsD9ai7qTENPAT
	 teCdLMqMJWGi8uXhQaO/JGX8UqrDMjYXFhOXAFCkJeCtAIp7OrgRZNQOX9e4n+tr7R
	 w5rihSDevkmCO/qp+V/6FSucTtnxGL9k2EPO+16MgmohViLYk1LZMuUVgL8NKA11uI
	 c8jt2VJfwNMH5Mob4aZWnNeCA7+4fZZ752re+lyO3xiHleGtULbIv4kb7CIiJrGcYI
	 yrmHtp4ucbd74hVDwmsRpqzjQSfRmi9XxeYutAj+VbrXayJZ/JHQq7DsMtlYU6kGm3
	 lvI4yzU8303pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD53CE7B9A9;
	Sun, 26 Jun 2022 21:29:10 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0htht-S_P-CpvvO+2Nbjp_ofUbchV8MWXrO09rnzRdjA@mail.gmail.com>
References: <CAK8P3a0htht-S_P-CpvvO+2Nbjp_ofUbchV8MWXrO09rnzRdjA@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0htht-S_P-CpvvO+2Nbjp_ofUbchV8MWXrO09rnzRdjA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.19
X-PR-Tracked-Commit-Id: 7f058112873e86ca760f2d2b0e1ccc2ab111f418
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1709b887397cb371ed149560a48d24b232c53ccd
Message-Id: <165627895077.16687.7592927949395157314.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jun 2022 21:29:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 26 Jun 2022 22:59:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1709b887397cb371ed149560a48d24b232c53ccd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
