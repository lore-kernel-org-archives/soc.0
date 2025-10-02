Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288514B977;
	Thu,  2 Oct 2025 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367437; cv=none; b=EyjxpSxtn18aAVwlNd612vKmmI7h9VnHI5mWrOxrEEiy08fEF5ycGO7UVs8142J2JDhc+NNlmAfayE4omiPzi590i2liq6JPAnw9qEMXp4BcYbhdVJtJtsOZQ7NYkCP3SRMP3cqYOD409tjZh9xSLn0NYcZ2toVKzxf44MkLoHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367437; c=relaxed/simple;
	bh=Qj+VqYmLCoDLwNZ3CD8VSc0unj0X6rcyDf2HT00XNm0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KamFCKI52H2lGq+9T/CqS1NRkUpyBY1Nu52Hnl/sVmDdjPxdAjBQmsXxBOWx/6X9iTCM+DkW3TTyvPtY4WklarVrSkOR/nLzycPnM3e3PQyYTIoKLJQ2ugcJcg4bbQutVwdxlj8G7XtRDkXD1ySXVrp6YNcqGKbeNJ6U/v0n3D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m28vmC2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m28vmC2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F6AC4CEFC;
	Thu,  2 Oct 2025 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367437;
	bh=Qj+VqYmLCoDLwNZ3CD8VSc0unj0X6rcyDf2HT00XNm0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m28vmC2Bou8PAh4D5RlCAZdNfwK0ZRCxXTvi88D1Hq7xvFDLBnDUV+lM9KaGJKRon
	 7RDURdyEIS4od8vCJJwrrqS+jooNqrcVPj5M4pk1Oda6oktkAIgUHBq71KxHW9jUgi
	 3BuXVGaQR7WTrvTfqalR58iLdAQczYh9VTXKH7ykxAy1qaV2ZbQVF8VauW6I0MmxmX
	 zst83EEse5f02ANnGPOaOcHSMikuIM1b2B8zSDgQD302c4AGzV5OTy12MnXUv2bkps
	 1VTm1SzOnK/A+gXSSstAgAAyxN7j/+BqnAxGL706tDb3itUQZTRTsJw2bQxlQdrmk5
	 Pe1DjhMkFRXWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0F39EE03D;
	Thu,  2 Oct 2025 01:10:30 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] ARM: soc updates for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.18
X-PR-Tracked-Commit-Id: 65d2419f931c08ead6722fbb9d4bd8cecb25a7e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42cbaeec987b9fb91045060f2e7ce3152458ead9
Message-Id: <175936742943.2689671.17186609638314051553.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 01:10:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 02 Oct 2025 00:28:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42cbaeec987b9fb91045060f2e7ce3152458ead9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
