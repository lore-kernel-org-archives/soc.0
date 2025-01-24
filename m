Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7081E990F;
	Fri, 24 Jan 2025 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737760203; cv=none; b=QiSHaop/WakF2LpUzNa0jcWwX63TE7UdMhbJ/M+GPekGHUgX3BRJgURGlDPy08e8wZVOpcZdChwPo+y7XGlnfTW56qvL2YKpA35lXKw9GCjpQcf2pZsdLTv0ymmkhSBc9Lesv6jipj5n0PeROZRC0EgkMJ79i102ryY9mFws57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737760203; c=relaxed/simple;
	bh=TmabQ/nYOhh/0sNyLrazFQXwRk6ZYd/GuwkO+kxpGhg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=X/QE/BJ0RQKTTcNdVDPBBbOa3O/UN3OEzLhOqKhlLOQNTV6VzlueUgegnXQbeZ2990oSo6AmQkknnm85UXCOKrmEEwmqeOlzr2BqpFUFrkGEa2G+rX7n+qERWouufb2oKnG9+jqI5HUMp9SdUfaZ0HFdoZgMc2U3dsm1J1bXuHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrB5neY2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrB5neY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0130FC4CEDF;
	Fri, 24 Jan 2025 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760203;
	bh=TmabQ/nYOhh/0sNyLrazFQXwRk6ZYd/GuwkO+kxpGhg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JrB5neY2r1xenP9R4yb1XZiVbxh5DNXN3pHbjJDHbg1o+cTpsJPWDbQw6tB6eedHa
	 obNb08+dEQOb79ROVDPIaKsKq9yf/SEF0qh/tmBqplWzuuBGzdw1Z/719jx58z1UR3
	 w+kgb22BOAS6ho3nhFUIGqR7YaJjv06ZorERQ16Z1XHtXAZUoF1jUnA6RLWrlwuf3U
	 p0l1D/Lz+ShRADzlxlIEfHHCxAJqHDQlFaNHbhQr/hxgTj6z/uOqioLLMN95dTzrzj
	 djti7DF1o00Tj0FgF2g+5IjhXl343LZSE0DTdN3rMDqiJ495tI2/4HwDA4RWw6Xo2+
	 lltWGvbwcr3NQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342AD380AA79;
	Fri, 24 Jan 2025 23:10:29 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] soc: new SoC support for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-new-6.14
X-PR-Tracked-Commit-Id: 0bcf3ac14626f1c174c262834656603769579497
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e517a6acdc40d61076ead4244b980c276af9b6e
Message-Id: <173776022795.2196000.4549627470445239715.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:27 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Jan 2025 16:03:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-new-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e517a6acdc40d61076ead4244b980c276af9b6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
