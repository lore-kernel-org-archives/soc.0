Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019413;
	b=J2+ts8ZDG1WS1DoMiuf7A5g6CiwOgq/g1kXueNzLAONBuuMnTwMtkDr0FSJoNlI4yj9g
	 ld9c4zax7Iu9ACRJ8ubcpxP43lCLDzE7ydkYVxBKCD8ETQHM5KnA1RhKuKibsSO8rMBjN
	 2bh4lxHoGwPrQk1D28OO/zKEhN2BbSbpmVoj34ki/0k/ZjILwtY6viJawjNxd0ilJV+bS
	 U0daegFvIhBWtdpJeoRdASV/uhBk8KYMOQ1h77qWls8qmzuhNgw4j+v/sINAzQgH3c3il
	 QpXGEwo8airbO3Z7TYsXva0HYVPhNSVK6K0gjt2OyMQ8dSF94EcRHsXboO1W0+nzgnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019413;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=nCM+og5j/qgEuvXAZarwW3kBrdPzgv0R3MOkNbzUFcY=;
	b=E7+DBHSzsx/ZnwvcpS3qPs5HkGe6bgCC4rOsfOOoznwX5mJ06bzwu8D2Gx17khQDzKbQ
	 uz0XdIlOQcf5FzUSzCMGQF2hwfvPbAWMeHE93ssR5v3Zfq5kXEwQJMTOOp9kUW/iaB7dy
	 wwk9p7nHMrx2vSbE7AkyFvKpxCZVJKHSlxjuDMy444PAmujXRoX1R23pAyD2GH6ppH3Qa
	 cTACF9gS5L4hisoq1H3jAlREDv/esT0Phore8kLoHTMN82H8rk7AGdxVoP1n8UsCiNWo3
	 Zcg9HjNGye8l1uXISpdcXwGq9rvsyLkNRAM0x4FLRZ5y0nxbb7tfVFn/d0pZTYeLKtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdAKNtpQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E360A2605
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdAKNtpQ
Received: by smtp.kernel.org (Postfix)
	id 1F92F1F000CE; Wed, 18 Nov 2026 16:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B371F00AE3;
	Wed, 18 Nov 2026 16:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019413;
	bh=nCM+og5j/qgEuvXAZarwW3kBrdPzgv0R3MOkNbzUFcY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VdAKNtpQ7xSKSbwMuoXClFnVv49rJej0k+oyVy0jmwM/pZtCD/EXRQ4x4HpfuMoHs
	 URnZTGEU3CqWjeTYbWVx2XIsQF8WhyuSrULunYBvvEi4HO38GFKMb54G42MZ5eCSZY
	 cIb0EplQXxunCp5CJEFaNkI5k5yaxrXVUnKRo2Xk3FcNzUtzoRv78QHC/ChJOeL6k5
	 /gaB87R+8MhGv+4Fpz5z6ryQQ8MesrHRMZdcR2961TXTBwxuy7m6kfrLz8Gbix+hia
	 +QkZNC6794Q8qZu90afnBBsNKJB2EKzH8WudCd2EoTBt/MUaVv6tHjgYAH2X7AP1Vj
	 CcJJaZa156IzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13E23808210;
	Wed, 18 Nov 2026 16:30:12 +0000 (UTC)
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
Subject: Re: [GIT PULL] configs: TEO cpuidle governor defconfig for ARM32
 multi_v5/7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501941177.1837438.12192628234455902086.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:30:11 +0000
References: 
 <CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com>
In-Reply-To: 
 <CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 8 Nov 2026 16:15:29 +0100 you wrote:
> Hi SoC maintainers,
> 
> this selecte the TEO cpuidle governor in the defconfigs for multi_v5 and
> multi_v7.
> 
> In this pull request I have squashed the two individual patches to not create
> too many individual changes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] configs: TEO cpuidle governor defconfig for ARM32 multi_v5/7
    https://git.kernel.org/soc/soc/c/84af494361e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


