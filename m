Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31B1FE44B
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946622; cv=none; b=qSG74Ly+UeYYT2cfPb1rVZcpQo9NVFU5bTu5p4sdszlO3015a3xph1dhxDuSfPVoBcK+id8dl/P2Zck6HfoQluas3VjLSS2kENe+LsTm9F5cfxiLG7LkYXSqCP+l0R8JtilwUJLsoipK7gm2Y8UOzQnhuLCqgY16FycNeu4K4vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946622; c=relaxed/simple;
	bh=+paFr+9uwRk6K0BVBPbAkF5M/q5153ZBV4KlJICVaMk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=t2yZG9s1gQwMagSsJvUzrv/wD8qnPUlo4UzIe3lA7ZzKNvuII9+5uKG7SKdmO6Y61TXA0JNkZJMn8fkjJcTitl8WOoz7k4Z17ZTjzB0NRe58CWaxc9iG2azK9cGzC/aFMEadTWq4zYb3u8z0DOiFxoWKFrRt0IjBycrtnzaN264=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfHpmAaM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfHpmAaM"
Received: by smtp.kernel.org (Postfix)
	id 9057BC4CEF7; Mon, 15 Sep 2025 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD21C4CEF1;
	Mon, 15 Sep 2025 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946621;
	bh=+paFr+9uwRk6K0BVBPbAkF5M/q5153ZBV4KlJICVaMk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pfHpmAaMBA1M7zDYGGspFR7vVP1U7dwXS2GnZeKLSMJHM9kw/MxRtutzZTYsv7B1/
	 ocqPFaSgh/yC1eywSC6UByg09yB9MkUgfTpawDUXtXIQLaBHLIVaojWb96ak/SMIiT
	 X0hk2HNOeWI24Slhcc5JsvCksQi1SkHi7RlTktrSkD8gPPfEYDBwCHBHRrM82B5H9o
	 pYplLyU31IXfWt/CbKPLe8RUfaPe9gZ8H2419xLCqR/rDoZE1awbw4HI1jrjQBFw0R
	 1xkuaMHNWVxX5WdG+7h89fFNZ5F7eeoa9AsBCf0IGdDS6dHaJtZjR7hy+Hh+YzPK0Y
	 yRzRUH3EsCjig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B4839D0C18;
	Mon, 15 Sep 2025 14:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE protected DMA-bufs for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794662273.4799.14712774428352130491.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:22 +0000
References: <20250912101752.GA1453408@rayden>
In-Reply-To: <20250912101752.GA1453408@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 12:17:52 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this set of patches enabling protected DMA-bufs in the TEE
> subsystem. There's a brief desciption in the tag below. All patches but
> "dma-buf: dma-heap: export declared functions" are withing the TEE
> subsystem. The dma-heap maintainer, Sumit Semwal, has acked the dma-heap
> patch to be merged via my tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE protected DMA-bufs for v6.18
    https://git.kernel.org/soc/soc/c/820429d53bd7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


