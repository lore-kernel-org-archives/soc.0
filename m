Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D17481A8C;
	Wed,  5 Aug 2026 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785945849; cv=none; b=XiVPsnMQVvvgsNPsy9QL1WWeHs2sDPMFpjqzH5sAuxQ2ZEg0mSd0wJer4/b+fOy4Hi545EYTGflRio4pP4ojjjWR3biF1Gqfewy1ivkqbtN4clYI7TMPjdQJPUN6zf0j1C2TPlUbwMuJue8wLUyqs7z+XsFumD0cpdc+ldpetnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785945849; c=relaxed/simple;
	bh=bkUp1QYPFFElD5+2cliMAle99KvE7EP0PC25YzMOjZ8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nj98eYSe7dA5jQGSKzDksV7ncTJNg53EKXiM3/TsaZobV1NcBNVrb4Rmcx7hk1bK+AUmTt0UT4l5iC/wxuru4JcJ2N+OL03KBLbwM9gEW9B3/mzxPp7jUx6Omv0xy3cixOlqm/LavuK+/kYxS2DETAnwW0X1laOTtoN+EdhSI2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT0Nl+by; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT0Nl+by"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C79E1F0155A;
	Wed,  5 Aug 2026 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785945831;
	bh=wrhxc0H/XGoYlJh8SlFmw2T34wZcGT9x+brFdbw5dOs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lT0Nl+by0YF29eQaK40raQuWlFYb9Cv2ovcAfhZQp2OUVNy72nxUu6ynhyHs4Jn+O
	 U8HakinMBYjKeBtfhXojQ4tnQA0oc3SvEZ1FGKnMOgtk7yDw7NAwXMBPG5zhTcIBND
	 ajJIMjohIeGPLD7PxEPuwNgZJrHmD6MZex8381k3QiAQg7WR+jQCxVoDxiaKMrtZRg
	 NqxgUzFTLbR2G2qH5lrQ9bXGqF4Z2dWehXhzm3cKhK8IMD5ihfxh/tbpMKZtWTzeJN
	 IdWG9HDCP4e9yWQAn/9+RE8UeJ3zN1ajF6K8mxuja7rULI2gsVL/BDwMc3PubAVBPK
	 Kow/TBd9zPvrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B81392EE0D;
	Wed,  5 Aug 2026 16:03:12 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 7.2, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
References: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-2
X-PR-Tracked-Commit-Id: c7a127371ce5dc3d073cc69ba70145c2c420d8e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d839570765118029aa8bf4a95444c6a11aacf85
Message-Id: <178594579126.427447.3027242150664486307.pr-tracker-bot@kernel.org>
Date: Wed, 05 Aug 2026 16:03:11 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 05 Aug 2026 10:03:52 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d839570765118029aa8bf4a95444c6a11aacf85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
