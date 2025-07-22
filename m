Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75ED225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217427; cv=none; b=AOFwZw2q6ka1LEdd1Ro88R+gV/x0WiyO5IR0PFUpBuPb8fgqTA0AQxq2bmUezDNqYheAFJBnFyZNMb+nHpPeWZaV8Zsu86zFpOOouICUc85XOaPfbTx0lazc/mUhdcwAvJUZM8bIJF7opxwXCUndBGRoBcE2B87mePMARov0JOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217427; c=relaxed/simple;
	bh=zMgFYSQW/d2aFyubhekJGIYnnbVHAWNrHj7UyG5m120=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XHDLirYWvNOzj0T1YQUiT8/X2MJD39b65RA4fvYLv44Fc0PKI06WyxmRUs32v+scgfBrokFbMWTZ3hM4dkasV3va3EZFury9MqlayK36D81NZyYbLaP7E2xdpdeJJ6SG3LPWwMYgXWB9k9oD36NxuewSoX8xa+1179skUAq1lxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/10kMyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/10kMyR"
Received: by smtp.kernel.org (Postfix)
	id 90E78C4CEF6; Tue, 22 Jul 2025 20:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6B9C4CEEB;
	Tue, 22 Jul 2025 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217427;
	bh=zMgFYSQW/d2aFyubhekJGIYnnbVHAWNrHj7UyG5m120=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=W/10kMyRK+ZbbQjsgf6JU36BUJhdut8W/QDxy8FjZEP6Z8vkFXJtKOj3obgya2RI2
	 6A9xp/JzJ2IKLwPWYtFrGo2oxTlA5L80lvvPh6VV2nRY5rLYSLMY39K8VbXAaT6onU
	 mTfbBrvsN5uH8cXwIl7ncE6fPiFnF38YqP0wbJKj/OZnP6MW0mw0H8zJPu9Qp9o7tO
	 xN8uMZDwP1BAfUeJNSDQvBvHav3lmUzn7fHEixceNOzUlnopnnogPaSgXHPKCw4Fgz
	 zsOrOYYuNCwlMHApHgdR0qeafrvUiuqgVxZs6O3cVB+pl1dgRrIn/eEqA5w6yrfrzK
	 y+dUrv8EsWNAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AE8383BF5D;
	Tue, 22 Jul 2025 20:50:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321744574.949540.18437406044983391454.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:45 +0000
References: <a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com>
In-Reply-To: <a0401460-8c67-4c29-a6cf-fa4bdf33bc7d@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 15 Jul 2025 20:40:39 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.17
    https://git.kernel.org/soc/soc/c/c522d00e1b4b
  - [GIT,PULL,2/2] arm64: Kconfig: Updates for v6.17 for TI K3 platforms
    https://git.kernel.org/soc/soc/c/b586f2891096

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


