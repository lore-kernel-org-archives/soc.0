Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C221662E9;
	Fri, 24 Jan 2025 23:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737760201; cv=none; b=AvT8rCGRCxCtEXJL/NbSTIl2FOgGEmE/BbHgZKfecXHk4rxhsQ2EWzsQhA9T4zce+za8TOZ0rckT2JmcrnPxlFZZHuATtX2lLwrIfDR1e6m1Wl+Vjf0d4QBwZ4uZ5qv7zwP6BOuXwFJkbsZcqiSyAZE2NOfN7GiBfW8XwuOcz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737760201; c=relaxed/simple;
	bh=7VgfVJzS3JS/j15bcfH4pLHzKDDF98ESyq7FqeSmhTo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=HMz3DHKbhJ4Cy2qQiIYFyuywdx5hM6HB7CJlz9ScS49RUq0vF5AdeTuBHxfmknG4m+8CwNK1+xtIsaOZSrTNrjSA9iiPEvqak4g5rWDk3GqiN+sHyuvS4xbI6/9DGyx+UokH0c0tZH+l7VqFTs7iJt3XepMjZA+j06JifQh1DAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahORzODp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahORzODp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9E1C4CED2;
	Fri, 24 Jan 2025 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760201;
	bh=7VgfVJzS3JS/j15bcfH4pLHzKDDF98ESyq7FqeSmhTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ahORzODpfHCzeASrO36U8y+zMoWkcezFg/gDjrqA7DoG0BtM9wG2+AIMqBtHxy5fk
	 vDlf6+4Rn9v9PzXGhr8fnCVtoT61JvvW2CjVW2Mw2een3Ji2EVLDDwz4mWZ1XN2BJz
	 V4q3yLh39LjcFMH/YzesgiRiKQueuVrOpEu8cf0Y2wQlUt8YBuu65cli131tDpnZ5i
	 olOwLQjSuMAn6ZPiJ+sK+GKIyy0g8d1IzKSyPHbUCueaBChT5Fd8brd1cJkXog4ltW
	 C5Da5smU+53VWWPgJXryLwll0DBZav8qvr+oyPKYRD7b6tw7T+GuZr2IBC0ZmR94JH
	 lhxVVgzTN/lDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 35027380AA7A;
	Fri, 24 Jan 2025 23:10:27 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: arm platform code for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.14
X-PR-Tracked-Commit-Id: 2fd7a3f27892f1ca4fca24591a7a82fd0437e080
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e8f6db9eb1d88e2761d7e8498a06e9c4c0324b1
Message-Id: <173776022591.2196000.11789540028171292166.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:25 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Jan 2025 16:02:44 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e8f6db9eb1d88e2761d7e8498a06e9c4c0324b1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
