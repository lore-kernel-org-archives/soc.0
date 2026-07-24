Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93A3B47D7
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911249; cv=none; b=JldOcVN9CjncRo+9mngmWEv5WgoL2gz7s/spPavH2tMcpPAkJI6EGoPDZTP+OmOfiwl1UyNhKtavbs8IsvkHqphMc7ZM1CCC3L09WK08tIOchxpA8j9xk4XwHOWFkWvFHWRMW55FN4YkUwQdQbm4q8QMJC0pcRsS2yeIGJ1q5Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911249; c=relaxed/simple;
	bh=qsk+Uj+czs5pFtXVBJKEgZT5K9xkp7gtiy70Gm9TSbA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mgy/cZCfQ0fbFgawpW6c2/3yA5bHvUCu+SLC2akqxv+G1CzRZdmc9VJS+snZtLKDC12jTSnm3/RCD7NFVtq+568jaKAgb/O+5TwmP9C7kHBgeLODZ/IS7YxQLK5SkwyyUto6NOMWL9P3a01JEQvys9+925ZptpsPs6hPxkyPQ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVxMwPjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVxMwPjx"
Received: by smtp.kernel.org (Postfix)
	id D8F3E1F00A3A; Fri, 24 Jul 2026 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25AA1F000E9;
	Fri, 24 Jul 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911247;
	bh=8nb6XusVJkV88gpJ941y4bFGoQbBt+4ilZqDrqUj6Tc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cVxMwPjxCB6jYbCbiIAZRg4JhKaXb6mDCk4V/r3asswGDGqE3/7Nr1hxWDzgq7A3V
	 AMJKV4rm5dJ8kkFjbv2ORQhETOyJNNpUU+CwFXGMCH7xer2JaPf9sVVrkEdwPUs78S
	 MjwmZdbyH6svk+2XbWNtdPI32Z6VPDNoGS9zrl3TJUBcEvjbOyvz5sV8gDoFGi6fvz
	 MZF1+yywVan+cnfn1SuIJ3Jp+UyBMnPSE5CA56pwggy4ZUSixvfP7QUZCCgroCIDbY
	 /n7BmukJJB7SgbE061pIh/zxfbrdszDu/RXTQ+qGV2bId9aRjoXG9RvbjB4fP+83w2
	 2nNb2vUmFOd4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 567AC39263A5;
	Fri, 24 Jul 2026 16:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491121488.3229915.8996532119967112203.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:14 +0000
References: <20260721170851.3581392-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260721170851.3581392-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Jul 2026 10:08:51 -0700 you wrote:
> The following changes since commit 1590cf0329716306e948a8fc29f1d3ee87d3989f:
> 
>   Linux 7.2-rc4 (2026-07-19 13:54:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 7.2
    https://git.kernel.org/soc/soc/c/1df696a7d18d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


