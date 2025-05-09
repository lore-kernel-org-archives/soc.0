Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9A2609DA
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826220; cv=none; b=Dp341wPlEb1dBRYizAzqdQg5taOmvtypeb3nCDR6DU1dWCCeHgiyqiFhc4EJUkbXv/dDJilrQNSZokdMprEnTBHSBU0ooLii5YsKs7Tscq5Q3RSOaqBspe3aFMFeMmCyIA4onxUIslVtYi5STzDpzIhkaz9oo2A48zqnaK0elgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826220; c=relaxed/simple;
	bh=X2s+xph9LmYufi/ERnK9bjkB9CMuf5C+jdB/7/TY1ec=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q0HpStimwqknzgpuDrKHwhCop1ma0EJsheJVPjt4WJCOWV0SjHwinU4lAUpqLnosuKHrxlGOIdzKIYdphsBGjuln/AkudyRIpN3uTf8rla+je5YJDizP27yqt0ZTaQgDAEEk6rf7bA2JcuI4xJcjAKjAeLSzQ8VKxACTsr1Y/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQ2q006t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQ2q006t"
Received: by smtp.kernel.org (Postfix)
	id DC28DC4CEF1; Fri,  9 May 2025 21:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C491FC4CEEF;
	Fri,  9 May 2025 21:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826219;
	bh=X2s+xph9LmYufi/ERnK9bjkB9CMuf5C+jdB/7/TY1ec=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OQ2q006tiqTUVQtu+zHwp+1M8Tw6Ckz5U9s6PxpsfTQfZnUNqNCtTYkpHR91zOsFO
	 HD72pCmEhUJwS1AzPLbUqhrV6ItdfSihr4+nw5mvr4Q6i2GRmFUgCn9BSoduLqmWia
	 z1wFdrRFsB0XiPtYDlzGNfXsodD44wNkd16sa2ScTlE8Aif/R4COnvEIbz+yfKwC2j
	 vGmOTl//fb4cxAj8MC98IhLCvsl+ktCmT116BhRhGYPIE7nN5SGk9OCUWw5Yt/WDJQ
	 knJXwWrBXAeppNvE1uc0zayWINoyN6t5WflSUemRluTLpIChLK6eXDNDK5LVuXqIGF
	 k5mPKwdxMP8YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B1939D61FF;
	Fri,  9 May 2025 21:30:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers: renesas for v6.16 (for SPI and arm-soc)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682625824.3817276.3091076940305303655.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:30:58 +0000
References: <20250508090749.51379-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250508090749.51379-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  8 May 2025 11:07:48 +0200 you wrote:
> Hi Mark,
> 
> Feel free to pull stable tag with Renesas PRC IF memory controller driver
> changes exposing interface for the SPI driver:
> 
> https://lore.kernel.org/all/20250424090000.136804-8-biju.das.jz@bp.renesas.com/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers: renesas for v6.16 (for SPI and arm-soc)
    https://git.kernel.org/soc/soc/c/9a977b01fb56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


