Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FCC383C9D;
	Thu, 23 Apr 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776961138; cv=none; b=NefcaQ9Z+etViWnXYqJhB9e5GM9gD/2S2SYuikBj3X7D7qu2NmGGoePKIE+hjH58BfqrD4JGwHk3vWErI3+n4lXbK4MjB9HoQMs5H60oWDhDOVDJ8WjYbN3C47lSdxDeTUUoGqLFUM9V/C3WXxDHYhCE4kvSVSfDxidAC+m9DeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776961138; c=relaxed/simple;
	bh=9eVOvXWSKO9Mwpv08p5pQZbtG7HtNaejExq3zx6fma8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FS6xJ8GmaY37AJWjO2wLaDxc9n4R3clwc/xirPTUWLHhXGMIeVuEmyXdLp9e+XwzJ7VuTxJxS3Ehzyr3pCv5w6lwnGdTB0OPXogj2YYnDtnSHPpNBPjeO3gEV/IUoVpCY8kxZEJHnrF6mJ28a5fYcSfFLszQXufFTzw33Jn/SVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDtEi5iM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDtEi5iM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17270C2BCB3;
	Thu, 23 Apr 2026 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776961138;
	bh=9eVOvXWSKO9Mwpv08p5pQZbtG7HtNaejExq3zx6fma8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IDtEi5iM2fBWVk3l2mt5Mjf/3KLuLJmXLdRuVI5RXXXXPC4uyJa/6zPlH6WSSZvYU
	 kUSCb+pZaBa2zjbqKMSChei4swNJI8bGGjUAXQoSFgaLItoCXKVfJw6gRjLgNfH/7I
	 mvms7go0EnxzqzOLnaK35m2oq0blzW61Onq77c/1lDSpGNKTOv0iqFFLyhMlWrDYW4
	 3J9m9LuP1/4CfuQ8bpVWx/iRsz+78tdbVAP5R0ocELwamiQyl2fToeh5fKQFkJdQSS
	 0xvkhgSgmIUNBotOi3NDxacnYFmHdHJ/oamQt/aY0aXp0zl84otDw9OTFZgAIGSEuQ
	 MZPGGvndMf/NA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F4038111CE;
	Thu, 23 Apr 2026 16:18:20 +0000 (UTC)
Subject: Re: [GIT PULL] soc: late changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
References: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-late-7.1
X-PR-Tracked-Commit-Id: dd5dc1917473f398949b95f6b77c60d4d8eb1d97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 507bd4b66c85d5b65696150cc16d31ac0b2ab151
Message-Id: <177696109949.655676.11999537219261091094.pr-tracker-bot@kernel.org>
Date: Thu, 23 Apr 2026 16:18:19 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 23 Apr 2026 14:00:43 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-late-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/507bd4b66c85d5b65696150cc16d31ac0b2ab151

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
