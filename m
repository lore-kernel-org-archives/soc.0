Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40054DAF7
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170617; cv=none; b=YRxODZR/yUC7X2JXarnFZq2U3a8PAGx3zUebv30ksl/p5Ne2vDMJsUeMu6J9iruwn/7a6Tb57d3sH2VoKrGFN+q8KUklqVTHDmSJf5zW6/wAWg6ugaUDQyNGFBi2dBXLLbdT8ZAnuDa5+h8lKnhY+tCCdGeFqVDm6IENc5JN6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170617; c=relaxed/simple;
	bh=tC6eBw7ibrumJlmfeI8oq53lJbbVj69sqrBtx6paBks=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qnL2+/Ez1N5It3hsWkIgWRQVjQFE971gwR3rZzAsp9A0asdTN7o62Pzq1yTBmcqo0Shg6FriHvvFWDivHX2FdeE+hJL2nUvj9x5+d2TtdNiQlIbIWtxZcXiy3KWjbjsQNAD2kC4qHcQHdUj8W5v5UF7aiqyuEDbCQbJTjV8/vG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQ6Xp7fN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQ6Xp7fN"
Received: by smtp.kernel.org (Postfix)
	id 1F3531F000C6; Fri, 16 Oct 2026 17:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CF91F000C5;
	Fri, 16 Oct 2026 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170615;
	bh=16nlePatvXIvnVolcgWqniNSZz7pOW8Jy85VzaDeUTw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IQ6Xp7fNIO/HPdaMTZpy9Cx/vi6wULTl4YqEwdzKehar03Nu4I6Di/NaFg1UjDgsf
	 SICMy/fvLXWGQPQtKfFIJtGSho6gLw+N8OzyOWORx4E0i9nDmvCLtJ2ELox1YP06pc
	 DuIGN3VplejnSrJPyswM5djOI59bZfwD+iheABPnPdaZqwDeqguvln0XwnUTIxm3hv
	 k07OqmExqPpmWoRMq7Nt1vwQnafYmJOrfiFbS0Yb157qBoSlP5xOZ5xUy+PA6PlelP
	 JoK9BhBTxvKcs2F3Oe6deZWfLZTwfjBs154gFTyRSw2Urca63LfG84sOPDK1plEw8b
	 SyqDM/o8dgCWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14B0380AA52;
	Fri, 16 Oct 2026 17:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/7] Device tree bindings changes for v7.4-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179217061365.880342.12359085004493100317.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 17:10:13 +0000
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
In-Reply-To: <20261003095924.1370238-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  3 Oct 2026 11:59:16 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Device tree bindings changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,2/7] ARM: Core changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,3/7] soc/tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,4/7] firmware/tegra: Changes for v7.4-rc1
    (no matching commit)
  - [GIT,PULL,5/7] ARM: tegra: Changes for v7.4-rc1
    https://git.kernel.org/soc/soc/c/9c61de56d347
  - [GIT,PULL,6/7] arm64: tegra: Changes for v7.4-rc1
    https://git.kernel.org/soc/soc/c/15644868ad52
  - [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v7.4-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


