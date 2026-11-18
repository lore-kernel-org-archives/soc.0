Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017618;
	b=a/2SUoHk7LbVh3hHRUY0YCdk55zGjKw9lhsirB5K2wCpNxT51Kr025x3nULxF2RySiwl
	 LIiu9TAzBPLbCP935KxZrLlno278kobGTYSc90NJspy9xXcCgn0ZN2w3N9QiPfnYHUBpM
	 m8LZDyS6lwl6MG6am/nxSiMvUKMdLgZyhtlyjvwR6dEe+UrGoXm6IeXIz1M0er8eZh1lF
	 czpcVBtUM1ElQ+u/adP3DgIjPhXDfxWXzo3Z2AkHg+0b1cj5sXqQt1Y7CLY1aCfYAfG/B
	 BgNIjftWzvZxrb+hm+ymfXk56a2wJ8NrmXpNENhd8auc+RltYfOgxl1SBO4FYqTp1Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017618;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=1kVZDCXwraNk7bCpyDw3a6y0mYkrCRcEUsJZU/p9W4E=;
	b=IuRNe2Pe3x9App7X3PKwAdxdJCgFenhw3VET6SpX9uwn+i/wEFPvD4jmcZ4Bet9envJV
	 Fem+Kny/6TdxW5Aroue5ABItgU1LMl77JLAIKFwtj4zw5DBo/H0toVL+xsO9r7Jp8pmDI
	 65cgQOlVv48busDneue6wYlftqSsS/9Nv0wO5+8x6fCqo4RU/EgK182+xHfLyofl/pNrA
	 etj4bjQUXqkzUNaKDuT2uJKKUqbwxxWveTLsI2+uGPNyA1KIP1sCGvPfgk2cQoi/EJzGR
	 7RryGsv5Cz6fLiacGxDEtyWbk5NINcNBm1vbxbgTMPq62Un461obETY6Xr7jjxuem7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5BOSTg4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EC606A33A
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D5BOSTg4
Received: by smtp.kernel.org (Postfix)
	id 1F8531F000C7; Wed, 18 Nov 2026 16:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082CA1F000C4;
	Wed, 18 Nov 2026 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017618;
	bh=1kVZDCXwraNk7bCpyDw3a6y0mYkrCRcEUsJZU/p9W4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=D5BOSTg4keZMfDtXD4XFr3MblXkCuSFhSm3HzAZYXf4KYBCjx9WqNZ+eerrKZF/Nw
	 7VdQJSPjyQgs64x1yN4Zj3kB/p6mzg90s7yvccNb6ajAzGfVC21pyHKSdHuuaAjHH1
	 GTJMKrXjhlDpBAFuawcKximD7rTZWdISUbfu+z9Q4+MZ3FhapQoLo4+XSQXETe48Ui
	 Aath2BGb9DMyPgTBb7NGjvf4uzgcNmculSMq4J08SJU/5pZ5aXI1POlk4fBIQ4IB5V
	 JehQcR/R2rDl13Od3tcoTaSNxW+IQl5NKUhBcwlESLOk/4Ivw2S665PxOMVxGMAiIA
	 nLazVZyNL36UA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13EE3808210;
	Wed, 18 Nov 2026 16:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: driver fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501761652.1802028.3167472900669478574.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:16 +0000
References: <20261113073632.34241-2-krzk@kernel.org>
In-Reply-To: <20261113073632.34241-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Nov 2026 08:36:32 +0100 you wrote:
> Hi Arnd and SoC folks,
> 
> A few less and more important fixes.  Sashiko as usually exaggerates and calls
> some of these "Critical" but exploitation likely requires already root
> privileges, e.g. through device unbind.  Cannot rule out chaining
> vulnerabilities these days, thus sending these as fixes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: driver fixes for v7.4
    https://git.kernel.org/soc/soc/c/7d86269a128a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


