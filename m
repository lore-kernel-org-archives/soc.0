Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287213A5433;
	Fri, 12 Jun 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279739; cv=none; b=oTQvoeijwySXxQqqsSrJeDMOG6/NGrw66qbU8PYfBErAXgus6Uikqgyugh89IkeRVcSchnYUKXLLE4pHLrFbK3lEG8yIrtUXYSiv+Qn7QnHpuJnOpxV6qcSoe1wfBLDm3EWRCVTjsW6pRjm9rP7omhxqhuD/eA99U5eNRKQ5AKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279739; c=relaxed/simple;
	bh=4liKyY7DfVl27aOI+1HFZv4LPHv4NOTQB7kweylDcow=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Qa4WO4AN4xZ2uxnX+RePjtdsgFpFh1jVAumB83N2Ka9H/YjbWYJmJAqAnXkbfb3l+ngwD98fUzpUN2y8GHSJ8uTOyTeWWCQfBpIJ5FaUOY53uaQ7Fc6nisEa9TBGrns4iuvL46RspGa7j2PfMws0jYHN7L67vxvJkqBqjtIqvnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeQbcUIn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeQbcUIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102031F000E9;
	Fri, 12 Jun 2026 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279738;
	bh=f5uniVr+Csx8wdFNe6bLYx8ViVeOY+AikkN+adblB3Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MeQbcUInBj9ldOpAE89uP2NUsvXp7UMXox7dWXQjNvg5gMbFsiZx9UHB/27m/N2zp
	 Hzy69kgZJ1Outb1YhqSRQI2OWnClRQHtiIa8zgLOysoinydd8UgmS2+n2PUTkYcylv
	 UROkRBsMAw0qZX93nuzxHQL7duu2gebbUEmx1niUHX98Lt++u8SDLoLW6IDTr5aulH
	 qbuWr3GZZYImgKmoGG/Xdx71hGuecHRmLNWxQ2fDSKqqKposNJxbgE0sWdrwFitBaW
	 3JFpDQSkTlxDklDO0pkr4JojXJqi/LFil88tirkcldrxhwTA5RC4xxJxrBP9x281EC
	 QKb3JpBmcZXlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E03931092;
	Fri, 12 Jun 2026 15:55:36 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
References: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-3
X-PR-Tracked-Commit-Id: 9c648f3554920721d8878807cd794fe2d7f989e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd41dc46db5eecf21c9d53fe034a731a2767030a
Message-Id: <178127973459.723498.3822504448921341481.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2026 15:55:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 12 Jun 2026 09:23:32 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd41dc46db5eecf21c9d53fe034a731a2767030a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
