Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FD360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165440; cv=none; b=E1ef5cmvrTpuyWbdJMOTNflpCCNp38oQlNAWUSpCjMBHvAEtXJKJc5sr1LQbKdgVB1XnD9cmkU6BgxJsd+8sy6A7gjMyZ8BkVgyv/fUC5mWY1jwrBqaC1i+NDBLN4G2Tm9kyXNX01oiN6t+VPKqpQs8MKwapTB4Xpydf/gxr7dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165440; c=relaxed/simple;
	bh=ASc1wJ3zepy5tesvKp4PAeDkVpFa+fRYxZZW946RVH4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sC1USQm/Lbd09QCzW5frxZBMpuYf/7fc9i/J65vSdhHQbtx/ZhHZJ2BLxBDyF7DJPVbVXPV+ksoBe+IjqzzV1VMIaNnHyD+jlPed/Sg4SmQ6pVDp+Rv6K9J1P3+P3CMk74sg8h8Coc/O382gilfUXVyLMqmRKba28fYKlWnDrfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISRDQSoB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISRDQSoB"
Received: by smtp.kernel.org (Postfix)
	id A3DC7C2BCAF; Thu,  2 Apr 2026 21:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8C2C19424;
	Thu,  2 Apr 2026 21:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165440;
	bh=ASc1wJ3zepy5tesvKp4PAeDkVpFa+fRYxZZW946RVH4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ISRDQSoBodOkPWDrTeo86JPO8e1fhJ8gVgrjajil3oAYaF8OrhVOdgmoUnHmUdenD
	 nzH7xeRmRXmE8CS1GMMCLMSonpUhhX9XGVF6rVFP1abNEHGfVVppiW7XY+TZTEf2XS
	 Gt1dTsEpeG4ZWni/sMTt1bCpKRxyBdNTRjE2OH23n7J+CO6qK/pORdQDZoLiSHj45c
	 VzNjolnT4rMtZVRAWnRTYA9zLIlUl0w6QAu4mb80wweAKUa0tOxHQfacseL5X8AVQj
	 dZycdnAXFBleCJibB3U7djfKif3NDeFEjCGbyyZmX3p+NLkIMNt51L/bJ6+22Y8GBJ
	 QE3tqi7Vqy9Lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CAD3809A09;
	Thu,  2 Apr 2026 21:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: OMAP defconfig updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516542253.623252.12857884963463635648.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:22 +0000
References: <7hv7eatlnk.fsf@baylibre.com>
In-Reply-To: <7hv7eatlnk.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 01 Apr 2026 14:29:03 -0700 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/defconfig-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: OMAP defconfig updates for v7.1
    https://git.kernel.org/soc/soc/c/feb46c1b19c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


