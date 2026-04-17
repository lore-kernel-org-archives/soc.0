Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E4361DB5;
	Fri, 17 Apr 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399073; cv=none; b=T9pzOjb0SeYUUrNhZj4LnHazTOdZpqW6fUYAWsYKGDancyX9CdPNtlcobXh6TOE4VaPYPgVdmJiQdxbEhpyv64m1Gh7FZsBgjZMdCXOL56lHc+tXbmoWXzCPZ00vV4LL5Rg5LxsEzYCkSW6NgzbWYlT0Db0DBtW6cN0ybgAUqvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399073; c=relaxed/simple;
	bh=h6jmDROY2K9iGN3Uwvf6K761XnTCt9jT4kJ0JvVcoTA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KUNjI5d7EtVzFd4czpLQfxLCc/d76fc/vAECOqYNWzaOI7TuHQM2rLC1ejROkOzSo6YfzkY5/JGySAFuUJ/Sp5sUU7h0+ArSaWoCqgtQs/7+FLsFueiD3hMMHKD3Fj4jBVhdMmbyHEeKC5i4xvUn7jkbAZsRXOlgkUOiI7hxNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDrePJoR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDrePJoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A46BC2BCB0;
	Fri, 17 Apr 2026 04:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399073;
	bh=h6jmDROY2K9iGN3Uwvf6K761XnTCt9jT4kJ0JvVcoTA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VDrePJoR9eTziZiU25wzWLUC9y4j5pW8WBWA2bpAxw3wGr4jPn+a1sXGgZBhyGaAV
	 juNfpH4lScuayhandU6SjjUxEAljDCMV6V8D2IbL2FvsSD31Qm6pdhpfH6roozUK6T
	 qeEnMDN15REpBe5HrneDViEK5d91qfCZV5/dSKcQFWvJUZCXCy8mIIjDbUcJqdpopp
	 Wcp8SeAUbMykIFX4uqJU6hqXSsXROKq5azHHKbq9s4Ox9dWsbTaEBudcVa745X1vuC
	 Yucs/GX9edt8Xj5dyA1u0+W+vFtlr2Rcg1L8lBtGA8c1mu3eqeBXu9KGT+QAh5Xm+B
	 POh/9ULBeJeWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD6F380AA7D;
	Fri, 17 Apr 2026 04:10:42 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.1
X-PR-Tracked-Commit-Id: 07e1a498ee9a9e715208c06b39edd8f7d22f3b50
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 231d703058b2e2ee59884c8531e02c60a2a109ab
Message-Id: <177639904125.3519243.144554696309829561.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:41 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 17 Apr 2026 00:30:16 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/231d703058b2e2ee59884c8531e02c60a2a109ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
