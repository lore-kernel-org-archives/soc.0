Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B6A3BFAEF;
	Wed, 19 Aug 2026 02:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787108349; cv=none; b=eS2gKwPboX7ZWCY/tz1RvtP2KnP0CXxCQ/uYwi8lu6aXyNc85kAwp6vAXOoP38D1In08nm+WCFnQlBq4bQaZtxUic3+LPaRACryr46/7PWvKimGWOiyaMUi+5qJZDu0hhR3Z4lh15GYraxBOSHbEW/zqx9O1rTkH9ot7kGrs6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787108349; c=relaxed/simple;
	bh=axoXlssEAcD4F3avKYUhstk5cMMrG6B0VaE8LLpv/ns=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YTy0PJ8ZRpP6xGuP1bTbURT3IbeiZS4dSVko2UK+nuwWYEsN1oGh2qxr3w28Ee/6HO8F2GlGcN0MF9GacGOWNBKPWH+Zpf5M04TChVGI+pUajXx+4WIJo+LqbJo35tXciPhSrd0rfeaHKxXgxmXADSkMFVREq5NMpk7H0LcVYZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FR1mNt39; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FR1mNt39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF6B1F00ACA;
	Wed, 19 Aug 2026 02:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108348;
	bh=RkulwsWWotVBTlqqMWVaRL8Ifh1j+x/O3vL6MT09JMQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FR1mNt39LHlYiqqaMu/zUu7mkVqLVVJEogimA5K6Pn+qguwoLxpt1vLZ1C8kqnokd
	 ivFDkSzewC2sn+lXjwxJPrKtzrqOXbpRWiPwR8BFn+w9m0eJIa9yVscOSMEfcVeGax
	 IhjEqXuwYWc6qh+60J+q8iTHNySVpDl7wIYAOiE0iatGy0GqWyqZvYA0XW9GegVCAd
	 9CeOfsb2LuSS7runA3Krtc+Nw9Jvw9uVtpGD2adN5O2cywD9G2Z88PiCjkYLxEFbRW
	 +MzIM64mU1cIQZisKm5SuSvZqnvVvvtHiPi5zKGLj9iSYSpe01uPoUEAhJfLvabgQS
	 7d+2+tAAYiPBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AAC392706C;
	Wed, 19 Aug 2026 02:58:20 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
References: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.3
X-PR-Tracked-Commit-Id: aed89a05a736d2570a514f00c2ab83388662b271
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 368cf60c36a3a311474de08e52dc6314df3b06ce
Message-Id: <178710829967.2816674.1020193772523186333.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:19 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 18 Aug 2026 23:16:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/368cf60c36a3a311474de08e52dc6314df3b06ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
