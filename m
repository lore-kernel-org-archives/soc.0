Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB91FAC42;
	Wed, 19 Nov 2025 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573957; cv=none; b=JJ57oq2Q+IdfBczsTyECWdo4krClWRdNm70fci8qTvoVU7YNNUTsUkxm/5yr/1muiOscqrb+Ecc61EsHcyCgm9WLb9A+GRHQ8WydvGbZ5T/WugJTqJDuzDE26EBwdckW8qd84p6ZAj4H0WCJh08zmG2bH9xm3+EPr9kCCTrLUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573957; c=relaxed/simple;
	bh=Jqs07eP6UB9i87JiQEg3vKSrqXNfka2QBSOHxYmkT3U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RVB0WcD9VcvxZEaTUtDkP6OnVFRjy3FYRWXwBqwr3mIo2yhMD8wrm2DanWlW8f2XsSimgxm876spjl7gcyZHY+cGoAcko4olkvKd91URolqoGAW0k7/dTU2D9syd2hhlwyIP08KOd5WbZKw7mFkeTRwM4d5jg4hXtYwiNigLWYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIMgDiB6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIMgDiB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D79C4CEF5;
	Wed, 19 Nov 2025 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763573955;
	bh=Jqs07eP6UB9i87JiQEg3vKSrqXNfka2QBSOHxYmkT3U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mIMgDiB6mjFVfNNi3ix3SenJ4xZdU1S/WtuScWhlIRbh97fb04+UhGmxhrHFaElmS
	 zf37sXcE0sIJ73YRG9v+KBis98CqkUHpkZUnDKH1ZMY/FZjHfd7SDB1zcDz0OUZNMj
	 gUT02nYNqOhKGULrHX2qep5UXh45DlAT6xFzdAFFXUuVFLMuIzRho4fYM6Ql6hY1rQ
	 eo9NPLYQs8f6fkwcVBWr59t0T3QQ0tD/2xNhX1yjYnwt/32GWfBCmNY+09pPKonUzA
	 COxx79INjuutN38sKSIayadbZpBoYywEK7Bh2I4ccJK31wumc5kiVnzG09uFgdHtPS
	 FvfGLMnV5WQlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0E439D0C22;
	Wed, 19 Nov 2025 17:38:41 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.18, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
References: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.18-3
X-PR-Tracked-Commit-Id: 7a601324ac9828468291151d220edb47a6a82449
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23cb64fb76257309e396ea4cec8396d4a1dbae68
Message-Id: <176357392060.896813.3808811333357737123.pr-tracker-bot@kernel.org>
Date: Wed, 19 Nov 2025 17:38:40 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 19 Nov 2025 16:52:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.18-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23cb64fb76257309e396ea4cec8396d4a1dbae68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
