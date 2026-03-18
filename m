Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592F63128B6;
	Wed, 18 Mar 2026 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853212; cv=none; b=dLANbvjYWUWf2VqQa61o1kpYh3349vb/FPTBJpioxJnG3VWuFZXk86u5WAzl53hFTXtTw3BLoKELvXB2F44MP7jkWqRKcQY7ZpQmPOObGaStxg0ZYx+JyY4eXRVhNYuyuJb6vNKaIuRA8cEDGKZwUy/SfbBQpAzH+lKhcYBmEWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853212; c=relaxed/simple;
	bh=i760mwqkf7XS8UNOJTlA5EsOif4zkSFiCYeRZB3e4dw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=j2VjOG6KcmRzpG/Bs2nFdBk6u+9qnzxZkigecYMs4zK0Seu49qs2gx+gkTBfovlYzKEeIMlsjPT1ygxTLrQVR4UAgLuqfHzK8N9wR+8I8ZsdFhHFrtpnxGauISWKiPLM/98nfdd6EKRwFZpa8fGku6b42JxpVEQVLLoIStQDY80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcgZOoRh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcgZOoRh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0546EC19421;
	Wed, 18 Mar 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773853212;
	bh=i760mwqkf7XS8UNOJTlA5EsOif4zkSFiCYeRZB3e4dw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YcgZOoRh0A8V7CbduwA7VxDYz6or0Mjo4F17+OGeD/Lq/Tp6nV9g4kO8rZrbn2MRn
	 MCneI3Fg0Le1MFiI+OOQR9jg2TUC/LZOQf6GUO2ex0TOyi/VhytD4EE6n9x+GygvnS
	 iQJoUz4MR8Hj5h7OXxnNxjcpKs8H6oT9EZpiBzY1sMDPRv3661sB6lariujwjKeHu1
	 saRZhAjtP4aDKs8SpjdINcHmv30YJ8y93n8ZVzOWd5xtaOwDR3gCLTwOSKGQXcKFCQ
	 qDO2bGZAVozZzMtRfWQ+RcUp9U5jQ/ZmSK08riIuVs9+QoS9qRGNfxI1PY8wuVqPTq
	 NHNRmRZhR3jxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCCCA3808200;
	Wed, 18 Mar 2026 17:00:04 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
References: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0
X-PR-Tracked-Commit-Id: df3ef89d7ef8185fa719812e2d175b83112aa315
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04a9f1766954687f0a1b7a0f7184dc4f86edcb30
Message-Id: <177385320353.796867.6088168841099407408.pr-tracker-bot@kernel.org>
Date: Wed, 18 Mar 2026 17:00:03 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Wed, 18 Mar 2026 15:41:48 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04a9f1766954687f0a1b7a0f7184dc4f86edcb30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
