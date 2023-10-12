Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB988CDB483
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 21:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CA56C433CB; Thu, 12 Oct 2023 21:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09DADC433C9;
	Thu, 12 Oct 2023 21:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697145665;
	bh=gJgOxqZKU2S5nykfkjBui5vDAW1QIh5cKDaXm7LuTxw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=HBy12xk2ZnRYys04Gpczn8X9wxUDs4LYhRrXG94p7CaWsFzBUpHS7ayKOnaisGkgm
	 hGQfR6iBXdez6+Qm9MSdFCCqHTrIZcT7C0iG3EVICCDp+bf/eD7nWpYMo7elHqOw9F
	 UuTBH4lGctm7EWTUBgJEw/OxxXALr7fbl62CanKyA77ypImyOCseB2JbTzCfd14qn8
	 9AMTk/NiFBx8vDQgMNoPmlB9j9ChaF3/U9dxhSRRd13jTfrOogKZFrz8JuwG8sF/aX
	 FXuzNU9RxlOKOIpmTmxpV2mpuVYOM7vhCBYWidaEOksjJMNMmXNFghw6apyYUeYbsr
	 enl9npicbgVGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E4EFAC595C3;
	Thu, 12 Oct 2023 21:21:04 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.6-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231012135638.52674-1-ulf.hansson@linaro.org>
References: <20231012135638.52674-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20231012135638.52674-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.6-rc1-2
X-PR-Tracked-Commit-Id: 767881c470b3140c33795031c4e4d65572731c1c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b1ad4ba57688ae8eb0d3bbe63c13dbd9854357a
Message-Id: <169714566493.14457.17990229865901671660.pr-tracker-bot@kernel.org>
Date: Thu, 12 Oct 2023 21:21:04 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Ulf Hansson <ulf.hansson@linaro.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 12 Oct 2023 15:56:38 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.6-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b1ad4ba57688ae8eb0d3bbe63c13dbd9854357a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
