Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B653EC2D1
	for <soc@lists.linux.dev>; Tue, 29 Apr 2025 16:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945000; cv=none; b=KyvLogrcDl2ZQzQZhVD4HImscnSlEOE6DAMBBxNOz/Rc0hSLVOyOu6xPMLjMsKHA/WxHqafYU8jWINjSuJYhPPF0/v1iLu28zWmkEsy5DJQrIAIh84yZc+KmGu2yFovbG7OrSa0Zq/k7a+HP6jbLHFIrY406SUwxaDDiGWnuxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945000; c=relaxed/simple;
	bh=1yHg9w98XpGtvJG5t90gyPd/Fz/oCib1QPtiIV6T2xc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=goblt2vRLRNtxyPIJuvv03ySPkAAwjfy/zyvU2nrEd0vUZxCTrpt7eCxaF4WP3z5DsF7apNNp/xM7BQrh1ZqfcYSFsoTxKTSF88LtSvP1oZgfyQMB1FOmrcc1r18LH24EwqL17OFx0K5SwpdlhixHkOHmyonil2Fz9vVZQQ7glM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6Dvp9nc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6Dvp9nc"
Received: by smtp.kernel.org (Postfix)
	id A1A4EC4CEED; Tue, 29 Apr 2025 16:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8765BC4CEE3;
	Tue, 29 Apr 2025 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945000;
	bh=1yHg9w98XpGtvJG5t90gyPd/Fz/oCib1QPtiIV6T2xc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q6Dvp9ncJ2WGuY2BZSI5+7cu6F99kZ3noM1xvdaM+gwNHBI21bnw7Oo0zHCA7GFkd
	 cEyqg7cYT2CnJjcgDTDBpVHTDfvd+1i1mhtVKQRuo3S4BEa0bdjpxNcKwvfJ/bBere
	 osovwmNP/JGM5YWZFpyfUK//hZXpCIFtH8esA8zyUp/GTZwUOXtr+cA9NyzDd40HtQ
	 nDpaa01EVkYABa5ALk8R3XG6MXqxAOwcUYYklEdHKaaWuKQuffRCKhxe8sD070oRMQ
	 u/EfdZuru7nPIvFvcjyYoC6dkBdXIoQ5Riohu4+PskjYvtUSNIii+CCRfYh+tDwZtU
	 rq1gg6GO+qJDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADB593806641;
	Tue, 29 Apr 2025 16:44:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] Fix interrupt controller node for STM32MP2 SoCs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174594503948.1672898.4183190588251155429.git-patchwork-notify@kernel.org>
Date: Tue, 29 Apr 2025 16:43:59 +0000
References: <20250428120703.1392456-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20250428120703.1392456-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Apr 2025 14:06:56 +0200 you wrote:
> Dear Arm maintainers,
> 
> Please consider this first round of STM32 DT fixes for v6.15.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [4/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp21 SoCs
    https://git.kernel.org/soc/soc/c/1bc229e9bb9c
  - [5/6] arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
    https://git.kernel.org/soc/soc/c/3a1e1082097b
  - [6/6] arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp23 SoCs
    https://git.kernel.org/soc/soc/c/2ef5c66cba61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


