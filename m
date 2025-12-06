Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EA267B89;
	Sat,  6 Dec 2025 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764986613; cv=none; b=fL/LPofJVzkpYQlPLy409v7wC1ClmCGIdLX3yKjloNh3AGbdMqVfEvwnusYQlVf6LWwzH9FOo1V7FMjjGHwTWVez6QPLBx5P8quDNbV9vHZ7CboGLKt7dplyjv5NiqffZO5xf3l5LYCa53J6RaDnnSl8NuapgBcy+VnFiW1wEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764986613; c=relaxed/simple;
	bh=0+aZ3LtoSl1V89ajEyz0w2XJEnn4ctPweK0oO6yJki0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CZ3JKvtaQ7sUjxwDZfj230pDR8QmBrrSqWbNjNBqXp93lVVGiGjHBN4XdCYqt31M+dKttwVlTvEBXMTj2QHWKb/JKAKgW9NmoSAhzi8LG5fh50ZTdqndr41MsPe90S+SsA7NjqxdiwBL+AGZ1rmYx1xp7ueW3oPbDjtjvWBJ+ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ0IDzhP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ0IDzhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505CDC116D0;
	Sat,  6 Dec 2025 02:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986613;
	bh=0+aZ3LtoSl1V89ajEyz0w2XJEnn4ctPweK0oO6yJki0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aJ0IDzhP9Z8J+LQKBhUGJ3UXbnDFTJk2LjyVn6D9Kl45JxM7tmrMK+4C+a2hj3C80
	 8CR6+uOLrJ/TMk8rAObkUR/vhcQCMySoXygmBLVXY057BcrIdSnRRWePYDhSduEryd
	 jKrW602stZt1IDjIKiVE1LEwg89rf8fzAN+Aease2zd0Kkhp1J3Vw6aB2jhJ10rxgk
	 wKhmktl3TB1Udp1ZOFeat+HriQgsRl2dJhT85SPuBQmbVVB4AbwOcuzcVOlNGSPALm
	 /NL/3brlh0eXcCyqXrdFrDTsYbcnYa2mlTkc5mMmMTPQNRsO+jl0xATqNbmcdOOmXC
	 CbueljGZ42pcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F28523808200;
	Sat,  6 Dec 2025 02:00:31 +0000 (UTC)
Subject: Re: [GIT PULL 2/6] soc: arm code changes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.19
X-PR-Tracked-Commit-Id: 3ce8f4a501f61edbb5cb3fe13520f09ffb33396e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09cab48db950b6fb8c114314a20c0fd5a80cf990
Message-Id: <176498643093.1925836.1399760157687412457.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:30 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 05 Dec 2025 19:27:20 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09cab48db950b6fb8c114314a20c0fd5a80cf990

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
