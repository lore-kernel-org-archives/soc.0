Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969727EFFA
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218605; cv=none; b=D0c59s8eqXRrdkvG1ocWsuAEOO/RZsEB6wPAWCn+ATaKdrGe063mnbEDNXPHr7G0K72CVr71sChdX8BjDoRWR51EsfQH73Ut1u31K+XIQ7Fdp5OhndRinbr2VSzYt6laJQyktV25YGpIYiz4mp9qPhU9RwWpjzt/fWid55ZcOlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218605; c=relaxed/simple;
	bh=T8xp69z+S+QPjJEFGQSxjXqb+35vcQQe1nmPeu5s2kU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=saE2+DYCBBf0sqnorjzUHiUkx0pGVFI4YkAufAxnx2fOdQJdj6il1aUgV2NjIK8LzZCLWk7DBDFKaKiFLGygzDMGn93eVNnHqw4V0ztqgtqRMk+rArLh8Gap6OFhX2VfjQXDi9K2D/ok18lSlj5MuUxYpQOYmSPlVIKCyMJO9Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hedW8eZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hedW8eZz"
Received: by smtp.kernel.org (Postfix)
	id A3513C4CEF4; Tue, 22 Jul 2025 21:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE2CC4CEEB;
	Tue, 22 Jul 2025 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218604;
	bh=T8xp69z+S+QPjJEFGQSxjXqb+35vcQQe1nmPeu5s2kU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hedW8eZz03/Rr/iKkI8kBnL5ztYSWl5hbH0YfBEstwUL+4YkjYNicGp+TyPLc/Wg4
	 eR3DlrrSGKP3XQsL+zqf1DyXS+oo2obgoKK25e07kDMvxhA8pDVAPNnbQIwNzm16dE
	 WV0lvwrVdmU4mHa+Kti2iRx0elc2c1poHHaKglgPzGfrBs9Y29zWN1qJYIbySJE7Pp
	 iXo1j9POswCmH850pCWHfbNuvR5yU1fQ3go0JDRduVCwkkcJj55t+ti85GUeuUTSpZ
	 dwZIvdAK/j7nkEfuInJ023u7WnM7I1Hr9CmwmUh7DId7k0TnzCB8ZcqvU+6gGK3qFm
	 kMl5khJL9iMWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BCC383BF5D;
	Tue, 22 Jul 2025 21:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: st: spear: Use generic "ethernet" as node name
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321862300.955963.12564081831445774401.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:23 +0000
References: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Jul 2025 16:22:46 +0200 you wrote:
> Common name for Ethernet controllers is "ethernet", not "eth", also
> recommended by Devicetree specification in "Generic Names
> Recommendation".  Verified lack of impact using dtx_diff.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1310-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear1310.dtsi    | 8 ++++----
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear13xx.dtsi    | 2 +-
>  arch/arm/boot/dts/st/spear300-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear310-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear320-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear3xx.dtsi     | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)

Here is the summary with links:
  - ARM: dts: st: spear: Use generic "ethernet" as node name
    https://git.kernel.org/soc/soc/c/dda1d84a0c74

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


