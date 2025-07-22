Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6897F28137E
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218609; cv=none; b=DmdAVfj6z2pYS4Vq8IgzniMoNoM03Y2Z2dCmiUY0hRuVHLKawLBU9vTk13mVwPRhoXTozeRmIrJ5gtMESIukc6wekFqj+uSQQvqgA36dqAhvtdxYf4EcUx7Mcu2MaNsE3g9JGRcLsitdd3e2/JvOM7mUuZ9sJpHG7WN3SwkXda0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218609; c=relaxed/simple;
	bh=RMCaIm8puuq3pgwQRTFbrq2GmXMd1rygkQEzdrKU9mI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q06SwLAncQeF12Ph4BUwoE5Dnd0Z6CEUUMMMCNc2IyMS6B8GZR5+BZLgp6WJBNv35i0hqRxxErBunToeaYQzh1QcUyGg51KN4ZT+GMtUMISP+eNpz0EGKlyj2HFCqtSmvyl3GYYP5ztjuNmnWHZvkIaHFopI8QuqJuoUVi5q7Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nm1QprfK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nm1QprfK"
Received: by smtp.kernel.org (Postfix)
	id 18D5DC4CEF4; Tue, 22 Jul 2025 21:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B48C4CEEB;
	Tue, 22 Jul 2025 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218609;
	bh=RMCaIm8puuq3pgwQRTFbrq2GmXMd1rygkQEzdrKU9mI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Nm1QprfKhawwOF+6JcMhURWlhLnsyZt0oKmJ4xp8wRiTEF97viyuDC/AHrWYUslBk
	 j8MjtkeAErPv5d5vKtxNh8Nt2CqEVGXMT/3fyBxcDN6lrJcT2c5vRtkYonPkBRxpyD
	 vEbsQtl/pRFquReWZ6e2H2p4PIy4fUb7GxF/0/7RRfqvPEIbzwqw3xhW1r0LcCwzDg
	 +CEjH6Wm1K1VhbOh7gDKKijuZ8kXcTNqv17SPgT0mfg+e3WuOLJjmfCR9A71J2pyA8
	 Rv4sJ46y323rx4jR2izuusCP9OKg9yTH8Y+nWzcU+X7kpVA0QXtLfx7j4U8P5FfSUz
	 tsDiRtxzMJXDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADAC9383BF5D;
	Tue, 22 Jul 2025 21:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321862749.955963.1146262034413282395.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:27 +0000
References: <20250715095315.59299-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250715095315.59299-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 15 Jul 2025 11:53:15 +0200 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.17
    https://git.kernel.org/soc/soc/c/9841d92754d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


