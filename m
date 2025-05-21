Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5052134AC
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863001; cv=none; b=sylzNdn0Yk805L8ChNCRMy+8zJIOoX2L1cZYDeHRWL3j++zLmNkEReUKSwiw966AA4G8kxwx/yYkBndPqXxhe+Epcbzd8Y5a2cLaAcCss/i2ytYqMg3Iydy/lJYYi7HuKR/77OhMDnlTDVgnl3KFq41AQfDDGXkO7S11l56LGkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863001; c=relaxed/simple;
	bh=wa9c9BawbMhbtGC0KbeHj7b3nCBZ2GRM9kzmzJgpJJk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Yvxuhpc6l9pX2ACjtIk0HWs4lOWGJEasb5j4VEX9A+aOU8oFbnIjUl7PGvZ3bDPofE99FVaqNCWZoe2YChcEaHLQGFovlK0lhiePou74oJUn6Be8/NVyG56iL9bUCk6BtUAOWm4TrKGqQTn2d8uAR7oheWciHm8JZVyh5L9mU+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOag1wke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOag1wke"
Received: by smtp.kernel.org (Postfix)
	id 6B013C4CEE4; Wed, 21 May 2025 21:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55310C4CEEA;
	Wed, 21 May 2025 21:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863001;
	bh=wa9c9BawbMhbtGC0KbeHj7b3nCBZ2GRM9kzmzJgpJJk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HOag1wke4slEbUQ691N+v2VmgdWPhZZVBKlMx7JE7V0hJiHOsyrhDV2JmgFr8Q8pK
	 A1BL8ra5Es4Fv43JSGMWRunIld3HQxSXxveNa9JxplSz1p9WCbXZyivqBndNrLYDVo
	 KY926BH6lZcGdHG0/5wA5bjshFwkJYaHzPWp+BAMXC0JMrAdP0XcvQYCYyVuU+j9NR
	 UlZAuVZbYy+Y32/kpSxt9kLlJC9jkmuOvacAW1/G1eJuOKf2fP2EhAIk0ujRqLsBz1
	 fQI0QdgmYG0xbe/+PAUYxYGpcmiKcxvh7eBu7df9wyG9/ItWu2etXxD8ZIdxMbjmRa
	 MUYr9zSaVCzug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34018380CEEF;
	Wed, 21 May 2025 21:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786303701.2284637.14194397081057910776.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:37 +0000
References: <aCaeLgjZllV7bauX@wens.tw>
In-Reply-To: <aCaeLgjZllV7bauX@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 10:08:46 +0800 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.15
    https://git.kernel.org/soc/soc/c/4e3d2c4b7fb8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


