Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A941DDA3D;
	Sat, 21 Dec 2024 23:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734824923; cv=none; b=EKIq3NJqQrMAhkkm1mHTiayWsVDE9H91Z/NUNq4lHcvdhWZpFObPPeror52X1Hw87anSoEt9Y3/YlMhuKk3y2KQh6LzICcfbejeM9ytKusqUkwUMelr2HfKiS7b4IMSVGOE8jcTJ0xHi+hwiEmOHrniFxsbnusaN5MgflPYlm2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734824923; c=relaxed/simple;
	bh=wmjD+hnEhQ8Zf8Qy1dbiQdFtZbeySQ9bgsTylbG5IIE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=GMsra5B9e6ILwKgzDKQ8qhEw3mkx4xMiAQyHssy14EYVZpkZ8zEcp020cQf7Mzz9yaAeyNkKyNp3pFUFnDDrKYmtPJMlNL7VkhRpeZElbXqFGkbTmBdHceyQrM8wC4moVSeUTzI+cW3MqQYfXonYMef5f7GJLhfQXieyP9dfSec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJOelDTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJOelDTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9CFC4CEDD;
	Sat, 21 Dec 2024 23:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734824921;
	bh=wmjD+hnEhQ8Zf8Qy1dbiQdFtZbeySQ9bgsTylbG5IIE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sJOelDTWjCJSz0Bd8jjlaqpG6f0fLhfcCCCMX0CdlKJi5v0c+0l/cHzkwE0GRED/a
	 3175yj5WzbXObWegk9gZS+lQaTZ+8cKlaWA6q9YOxrCRXTiKE9v2uU3ALznqIVvYpB
	 poEPBWJwdcWy6ZYGR4YLAZd2I3Azlrl7F4WYZ2/p997cuJRHQf8LZ8UGlpDJz8f0zF
	 zS5ZfE/cIPAiSCN+7ziLnq2RUUB8wITlHF2LLvoHcAwGWRy2DXjIfIWxu3rsZEiTo+
	 jd21wMQgrhEQXdvBJOxrxiZ4MIqEUljUMGcXdZEFPENVUyO6Bp+IKFNyxL4nDEwCAk
	 MaqXD3lWtsPTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE803806656;
	Sat, 21 Dec 2024 23:49:00 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
References: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-2
X-PR-Tracked-Commit-Id: a31ffd6ed5ee994e1c04dc794499a0c04618dc55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48f506ad0b683d3e7e794efa60c5785c4fdc86fa
Message-Id: <173482493956.3244160.10724298707654952402.pr-tracker-bot@kernel.org>
Date: Sat, 21 Dec 2024 23:48:59 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 21 Dec 2024 23:50:23 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48f506ad0b683d3e7e794efa60c5785c4fdc86fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
