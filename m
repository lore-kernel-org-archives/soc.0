Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE05E1F237D;
	Fri, 24 Jan 2025 23:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737760207; cv=none; b=oCR6CYpKqUBXhWCVtyrP2zaiiZGlneRkGxQLeuJjLNRhhqtis4436OYcbSqI+ObXh9/EuJUx8QzI54z35XwC49W+xrEm2b7kjfLrYaDjo8MAY0DHXCHaQlbyogkjSOg1ZCSs5mPSWVb+Q3cSQ5vHQK8i0bRTwG9jDLYlZMV+P2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737760207; c=relaxed/simple;
	bh=BIdeLtKrLRzGwo55g51dujzaGmw+3Or8JCQLb0x2AA4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AJNRnUZZtjncMcP+D2m8puH4K0t3KiWsK6rK2IFRuyexlWeCXnvf6aG5hGSk6RBasoNHOOCqtL9pCTA8we5IRUq3726gkJ7jG3qn1GpgqBUrZia8Z4YggefKP9f6enwlE8aMe/4gziseEaHP+nzGZsGe6lRiaZjq2D2bsKrPSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rq4yRq/I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rq4yRq/I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F3FC4CED2;
	Fri, 24 Jan 2025 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760206;
	bh=BIdeLtKrLRzGwo55g51dujzaGmw+3Or8JCQLb0x2AA4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rq4yRq/I/nq5GosbDOgFBQVjDEOcOg2m3X/u/0+FwLvzehq8E0GZUFoVsXLnB2U0p
	 yXgiFJhDXaIxegp4To+G3igyPm2P1DiTGt2Ms+wsaq4xmZuitOz2N3AaMAMedgYPV1
	 8s42VGoOuFsY1MTNfVt/edOWvaJ6CCvszFhmqIrZwa0Kjk/lwUAvmnkPGDuuglkLbj
	 UTo4je9YKZZ9f6MBG3f25SMbEg6rcROcGrFA0lHsNCn++pZ8MK+JwTTDqzWX6n8FlP
	 dNOJRLzKVbXE9QgDCCtAaUCMBNRDdOePhiELKCKYWtr7vYCcJCNveRa/4xIH/qYTT7
	 x0JPAPv99/Vig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA0380AA79;
	Fri, 24 Jan 2025 23:10:32 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] soc: driver updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.14
X-PR-Tracked-Commit-Id: 9ec80025030b0492512e01e2e667f4111c583b46
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f2ad904e923f70a80f478febf001f88dfd65a64c
Message-Id: <173776023157.2196000.2578971423206596128.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:31 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Jan 2025 16:08:27 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f2ad904e923f70a80f478febf001f88dfd65a64c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
