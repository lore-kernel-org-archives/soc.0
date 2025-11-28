Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2D1DE2AD;
	Fri, 28 Nov 2025 21:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764364679; cv=none; b=WqMcGEEsj7vv3lyeaHrdFiRqxrhvcoJHIFjFz/rkib70+jRnwjL6AD+dkDjAeWHLuedJpjAoOzOETh/HBMratQPtIg+QbDaLmSJ0Zkyr9UQc+L7RVxBarOzq6UBCJKxS9LwK8rle/MqvGey5HG7g7emBdkRPBnUb4Yt2DqqHD8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764364679; c=relaxed/simple;
	bh=Bo6HSNuvZuSa5hntSS7jZN1hJOuzIVUk56BB6nxZK8c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=i3tldLbuivwdSx+RJCMMk5RrMBCY3Ne0NMj8vFcYbvj33/R7qXSHXdQx1uy15UjkC+XqYDhaIOAeBCwWMdeGQD6pvXHs4H4YwDzz3XZYB5kslhImUv4dCPxeWRLQW4KUhL3GEib4nSv3guEEQ4SpzoHEID/odZ6KZvYCuhIj0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6jJaRBr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6jJaRBr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380EFC4CEF1;
	Fri, 28 Nov 2025 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764364679;
	bh=Bo6HSNuvZuSa5hntSS7jZN1hJOuzIVUk56BB6nxZK8c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=V6jJaRBrm/ukRZsEgiPwDxG1vbP7YL+auGSyPIq1D+ZtLmj4Wn3bn2cyI85BhDaQo
	 FNqfcQqRlfDxD9nBdCltTKf5TO6mj+bX4/990fV0ypO2sIjuer0FpiLja2cr2WSkRo
	 SIRd3kS3r/QiBugv+WikpAPdxoEukK7pebrSltibYvwrRTWwpqYxHaL59ajjtkUnz0
	 ORGGySr44d7QkCOqeIS7sJt8L4o+0KEk7RcfDGuAR/R5XdnMIobEAFnQoK4uLJaxa6
	 EhUwCnRE58po+9e/CZPLfOOugMTU6geWahuNDqHQmN5LXactKy0G7vIvX+YGJ8dUui
	 dOJfSLcmxWqFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BA56380692B;
	Fri, 28 Nov 2025 21:15:02 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.18, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
References: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.18-4
X-PR-Tracked-Commit-Id: 3ecfcf34f0992d11e5eb2458a2108b3320c61ba4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fa0d7744c28267142287a75134de58790999e72
Message-Id: <176436450076.799297.166330833698529282.pr-tracker-bot@kernel.org>
Date: Fri, 28 Nov 2025 21:15:00 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 28 Nov 2025 17:45:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.18-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fa0d7744c28267142287a75134de58790999e72

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
