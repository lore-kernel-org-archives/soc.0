Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233983C1D70;
	Wed, 19 Aug 2026 02:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108351; cv=none; b=p0mDUXgZ8+xq4eC8Jt0dVBOQJvWmqjhhg3H1ytOlUWUudDIC3XHaVb8ZrG7EBXQE5woPGL8zQlSqD9ySviqBNCl+tJcx+Bi5eN9NkSTxl8kGAdDLaGdFWboJjKYux7AwV9+CjCgofRbzeQqtQ+y4jjl+OCqFJ+o//uD4VtqeC+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108351; c=relaxed/simple;
	bh=yJT9r1MjGmW9JtX8ohH3mtO2m7rrNvF7nOaqIcmCulE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IXgkW6ZhcRos+to9dKJiPAe/C6N7uBY+krrk2d4uWAbYs4c6IZp+vkstEbNxIH2JoUCuTljDGuBozac06Tlpuw3nIfDslZni4cTBswy1ZlKpcbzG1eaYK7Xu7EUFpHe0ZOV91UmoLYR346kkYsbGzHlXj2VPLzFEe26BjYliR2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAHBC3me; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAHBC3me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A72A1F000E9;
	Wed, 19 Aug 2026 02:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108350;
	bh=UcbR36aFwlUt59gMHmMIGJ18qQODA59AX7GxDJAumkk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QAHBC3mexBM31sZmY9AYbpkIkbEI5o8WvU9lFvpGL1cfcFHUmZoKaJhDj5Q4/1Y7p
	 jWiFn94SKckCwg+RSBA91XyeWncHfZXltpFvwFkycXdQDsFbbYtIhNSJE0b/6cEq2J
	 vmT59BBvAhqHhWAGQ0eRDq0KR5zo876DXwTNy6kcMVFAmrEZfks6J68aS6/nd4lygi
	 taaQ4dPgljNETS0MhP+mJUnFMnOj/cPEyGzbziaSORxHMr+SDjhYAqhrP5+GyA7dk3
	 7csZcUmDxYAD7CT9RVwX/o+Nzg7Jzx04k2vvMFxB8Wu/kJ9P/h7Jr+NZuWkdr/jHXP
	 yUIeVAwBMeuJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8AD05392706C;
	Wed, 19 Aug 2026 02:58:22 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
References: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.3
X-PR-Tracked-Commit-Id: 373eab9eec316c315e884e9cb520c6d8c3236e0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6eb1ea5ff48d647deb67c58b7a0e97bbf4de088a
Message-Id: <178710830110.2816674.18324994998363899388.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:21 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 18 Aug 2026 23:15:19 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6eb1ea5ff48d647deb67c58b7a0e97bbf4de088a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
