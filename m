Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D11F4713;
	Fri, 24 Jan 2025 23:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737760208; cv=none; b=ZEL+Iixz1AcO31I4gWD23UbzBaWO8KsAbtMfC9oqq3FDCPQp+ocKa9rUIOlItIQvD0i1CTDOEi1doTK+Xi8xS7UZGzWxdva1II4fDBRSU9+tal5ecyH4UVCp8xYbC6btRhxrB+T0YL18MR27zLHdDUlxXNnU9YMCCIoNj2/IETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737760208; c=relaxed/simple;
	bh=qzeVMbWdTSH3KrRvdyrA2/KRO/xdldCi2D9vpkpksxw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dYoqfjjxxo3jh+nU/UfEthZRKl/AGb8+TVpxDte9FsGSYz4f0HHAAEF0LDHWMJU5GGI1hZV1Nad7SUHZcDqyVKTsuwwklOA23RTasl5xxAUhPq0nC3/m0ptMXUeKMYX/P11qE9DjlxR/8PVyjnzH3/Nx2DyU3Bw4GagQUgRGLP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apa81IbR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apa81IbR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D07C4CED2;
	Fri, 24 Jan 2025 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760208;
	bh=qzeVMbWdTSH3KrRvdyrA2/KRO/xdldCi2D9vpkpksxw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=apa81IbRgHYWSIWCkU4grWP0m1XRBxwo85yOlRo4mMHv2WgS7DJBqMNkayan/VKV5
	 U+tNnFjmFasA/kM2deH39zvG+fPBpWZA8Kpr0n9nyM7bxULCS8WsUdj8aZL568qQcN
	 gr56AYJojeAf7IT2ANFFWNYpqC0LovJbe5wXsGuBT4GGt21CutNN/Ac30NNcjZTI4D
	 RqYJNmHtZymjUL/VeUaW5V9GRfnAa2ypf8LtMhqRK8NzCQOB1zmATX7MwOwoJfQoOW
	 6rgjACWuGrgev43RcZ+szBABtQDZdadW7UYVuHlmWoIMU1L29l6fa/jUDTNZn77yWq
	 drnXBKaHDCy4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AFB26380AA7A;
	Fri, 24 Jan 2025 23:10:34 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] soc: defconfig updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.14
X-PR-Tracked-Commit-Id: 309f64469cd5d09d5f1207e57d42f2eff9bd9311
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 71088146704efcd13ab85ae00345c98526ccc87d
Message-Id: <173776023363.2196000.700620592758688434.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

The pull request you sent on Fri, 24 Jan 2025 16:08:59 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/71088146704efcd13ab85ae00345c98526ccc87d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
