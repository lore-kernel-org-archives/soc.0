Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3236074F;
	Fri, 17 Apr 2026 04:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399071; cv=none; b=F1KeWZciWYGYBdiOy+aX1sSgslkoQBIdnS8zkV/3F2esAd+dWaM44Np1Q6ZtlVkrKIU2RgUwFSsjSICNFBcoa6w4AbJ0I3wZhhCv97MRywCr74mlFqkuEAYwDVcdVY+Auzss7eEKayKoS5KXVshNJ7IehrJUU0DiaflQhAoNk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399071; c=relaxed/simple;
	bh=wBsWp+q2qLfKF9ch+An8C9swcLcFbybwvqPigX5cED0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SDF/7wePajDDesfWqihh7y0WSJcr6K+l1sJS+hl4oqMEaoVxPfYLo9WUF41SbG2iL680lLNob9MiguM7mOUX0eNLgiESzb0SOKn9BAMTGAtS1xWWOW+bMdOGeyhSGzeD2eL9xeIzzM0ESUnp7UtxRfretH45VnARsibb7HdAIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8144UW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8144UW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA82C2BCB5;
	Fri, 17 Apr 2026 04:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399071;
	bh=wBsWp+q2qLfKF9ch+An8C9swcLcFbybwvqPigX5cED0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=b8144UW+nMKbTMYFG78W6uAtq8cqYWfyhwpjcRGKoEJZuMOvxh0nPvx1Fcl0BMQ+8
	 Z+oF26jwMf9NZTkdSPhp5iOb594Q05WTW5sBCGikI49aUNclstr9mn/am+G3k9PJfO
	 rwi+VRCbMdjSIxLLTbwU9MnLPuKybTHCJc/jETwUeMF09RT9VRMVSrFsYdlVQfP1ji
	 T3AUdDOocH+VixveFk2sib+XEB+MK0pldPKpTrSrS/iarkZXeZY367Y62MCDLgMsa+
	 MyYwfYiD+YNb7zm7SQOiGr/QOorrYh+L2vYJ7rQPFOVKPFpNClHFM26zXyZXNVFst5
	 7YvPA+uneyNtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BAC53380AA7D;
	Fri, 17 Apr 2026 04:10:40 +0000 (UTC)
Subject: Re: Re: [GIT PULL 2/4] soc: drivers for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d80b4370-3d20-4d7c-b91f-455797c52b39@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.1
X-PR-Tracked-Commit-Id: 33a20cdaf41d08a66581cc01a60c1a3d596ba9cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31b43c079f9aa55754c20404a42bca9a49e01f60
Message-Id: <177639903950.3519243.13927766925600356582.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:39 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 17 Apr 2026 00:28:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31b43c079f9aa55754c20404a42bca9a49e01f60

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
