Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44E1A2545;
	Sat, 10 Jan 2026 02:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768011506; cv=none; b=bAH3J+xZavRMvaVKw/amKxa0+ktRJ6f5qKB7KHbUhV3f7EPZJtl+EyFmCkedNY6dte2kuiG6zz0rmTKa/1sysG6Hq3By46lPWogqolWrXUUtTlYM3tiMlPgsfKtpLKtQMUP/WRaFqM7Vp4vJNJym+yYidpuCFJ47X+bmfyRwJDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768011506; c=relaxed/simple;
	bh=Pblp3QH78o3dQYj3vAQw8+AT+d1PjJBINN+xsQYU53k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mLxV4LNJD8w3fL15LPw2JPtbOcfMDJlzx+2bZaVVQhwi46i2oy9bQJSvdZffvVcBRmjvISsj6fQYDdZikih5R59I549yFHujnn8/VM1GL7C2uekKTLoLk+kuKxzFhpwyjQhvjuhkNdKZboIWYIR/EMATTf7eX5HO3AvA77+ooJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqOLMdKm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqOLMdKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E76CC4CEF1;
	Sat, 10 Jan 2026 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768011506;
	bh=Pblp3QH78o3dQYj3vAQw8+AT+d1PjJBINN+xsQYU53k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gqOLMdKmV2kELPzbXj69g4J9CZ80ZCO5qRzIxgDtVCeWxiFewBSKECm/1uz28hWjL
	 oR0utACLhEfs0hJR+OTC/RhftfX1z5Yq4bTcYeORax/JkXtOCwXmtsCx2/DXX91dJp
	 EYZLyThEmIDvPJJOJSmbCmNXnzC5mHC1jihAQiKEz8gEchWkN2+cG/y03v+uEnW3mW
	 /3k2jJyk4wId506jyCQ76kS1BmWg3+QiurPhXDGyuUOIT4WSjw9GYEqWsw+PFYCfWe
	 NpL+Urkp2uLZeOssiW+maQG9QCsp7AIfec2c6iz3ITaoiI/j1FGs+K5KoJs7yd3rIL
	 ndla8cWlt+yug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BC193AA9F46;
	Sat, 10 Jan 2026 02:15:03 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
References: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.19
X-PR-Tracked-Commit-Id: bf104037ebd5c1774fa736050a484c1f28cb2e6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e55feea3a03aa1eaf5abb22cc854208813865e04
Message-Id: <176801130195.452892.14399652915308807973.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jan 2026 02:15:01 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 09 Jan 2026 18:28:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e55feea3a03aa1eaf5abb22cc854208813865e04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
