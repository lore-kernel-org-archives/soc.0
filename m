Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF8257825
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011224; cv=none; b=AZzHO2ly2Fh0++lyfx/AKbH7X25MpqbcevJq9PCiNou5m7ztVKFFaCIMKt9Hghdq13rR5oq5lT3Lbi3oWqwcoHQzkbLrnMoD6ESU47rIgbVPCfK1kPs5UReWoqd7SLMhwlMwUaj7FQZXTFpQ8QFkXnJX1vLyL1RpqAPHJDlNlw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011224; c=relaxed/simple;
	bh=8+OjrXVPIc5m97ftpB3h+WHMKuj0t84SWegHe5qQLwE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XohHUP+UOSGUuD135p+WVHwyrIFk9OXsx7uL8R6IMXQjqxT/4kB4wb5ZX6nUbVUuv2Z+J/7+tsrqAJHpoD/mTEtxekYr+lER8dlMXQUg3m6vKErYwdgaRWQv2Iq8FVqDHAdl1Pfb28Zk06BfyuzCQTAiu2KA1MKk33aSpgaR8uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJz0U0JF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJz0U0JF"
Received: by smtp.kernel.org (Postfix)
	id 22711C19424; Wed, 21 Jan 2026 16:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE0BC4CEF1;
	Wed, 21 Jan 2026 16:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011224;
	bh=8+OjrXVPIc5m97ftpB3h+WHMKuj0t84SWegHe5qQLwE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TJz0U0JFvqv5dB707R+hiUUwQ4oP/xeiQTkKTLITJy5ow34Gj6K/yQBGzA9KVilCn
	 J6ImL0c+oCmy6SImWNOLMQlMS5/4EjrmRdIOwtKPHa2rnw5VMKOUt4+a69iPnQxYgS
	 mB665ABUzRW6c7f8eG4GwaLJSrIajsHKz21plqqUPIkBD5oZzdVa4R/azpRQJPhenX
	 7AcTqBaOb+UKUbTL4dgUtYVt3Dm/BHH/odptglMhVon2mIqSA5r09ETAGyUjredhs4
	 J6ji5Bq3UUABWDm/MrVpabpttZmnVsWQJO/DitP+0cQ7OSR4sN9DQ35+MzWk40+vdJ
	 rjZ29cC209R5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ECB03808200;
	Wed, 21 Jan 2026 16:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc: ti: Driver updates for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122084.951664.10617166981233009159.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:20 +0000
References: <20260121121353.5yip2gf4bxljosjr@thrill>
In-Reply-To: <20260121121353.5yip2gf4bxljosjr@thrill>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Jan 2026 06:13:53 -0600 you wrote:
> Hi,
> 
> Please pull:
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc: ti: Driver updates for v6.20
    https://git.kernel.org/soc/soc/c/599efa093ffc
  - [GIT,PULL,2/3] arm64: defconfig: TI K3 updates for v6.20
    (no matching commit)
  - [GIT,PULL,3/3] arm64: dts: ti: K3 updates for v6.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


