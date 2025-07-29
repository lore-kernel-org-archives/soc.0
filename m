Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF0D246BA1;
	Tue, 29 Jul 2025 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753814412; cv=none; b=s2Xj3SrwUCvCjNVI4CL50emwmYJNFJbkP14RqCNoq0FeWDuduRebFHIOjKWpHMqxzFrJvIs84ZaZrlfRZJzSqhOV/ITIFw++4exd/tpB20If6dPr/WxngcguQMcGUQZc7yjf5cgFwllr1XHYfley0WdRx9o++//XXSbplaXRWzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753814412; c=relaxed/simple;
	bh=evXIhNwfoSdAgvghJsAnRiqCWO5j4bPeXDPhUZPO7qg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qcCFCuUY6/r5JxPYJgqdoXcfLqVrGYJnED+bpMFUR3UoBO0yS0Sa1Swg2F8xs3nKpumROGjHvxUiTUoOzcAMSN3VBczzGfUefGAp7q81oqPtL1V24dQMZqIcaRkSYTqJnNGVtQ+Q9NfoyyQCEqilZvJcqkPaJwJC04RHmzgWRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJM7ykPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJM7ykPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B86C4CEEF;
	Tue, 29 Jul 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753814412;
	bh=evXIhNwfoSdAgvghJsAnRiqCWO5j4bPeXDPhUZPO7qg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lJM7ykPZ7V2MnN/GxXuj2yWrHQH/qzmr80ECII/hu0oBso9r7pX39EBox6oZVTFg0
	 zbUsOvB+6zVWBS+ikoe9FVT/E1cK7Yff1MHStLpKr2puZd55ovDQ664oySRCInLOL3
	 bFOYj+5SV67tmg60qHel5bUbiQVI8+lI3KqbNtMyjQXGKmwbMnG1LxB/ig6KHj8t7t
	 TiGa6XaHN3QBdhpXFJwCcOktqH9Svly67bWj9o4TZv/1TD/3V4rO/qmNOTzE6TrbmV
	 eGpZexL3Ikt/QVeVu6ZRJxnCIxhRIwdeK+OoIKzgdllSFc5vypPWImGQEaeca1x+YG
	 n+hUWNDdbyiMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34446383BF5F;
	Tue, 29 Jul 2025 18:40:30 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: dt changes for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.17
X-PR-Tracked-Commit-Id: ac75da105eb38d7c48ee3421d116282d8c44b690
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 115e74a29b530d121891238e9551c4bcdf7b04b5
Message-Id: <175381442898.1585410.6262605657034973054.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 18:40:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 26 Jul 2025 12:27:05 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/115e74a29b530d121891238e9551c4bcdf7b04b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
