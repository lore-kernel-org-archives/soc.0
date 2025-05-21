Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236422BD03E
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863016; cv=none; b=W1JLssluJRjXkqu6Bu5G/pxmygKvuoRapckEBgFW3f8jZvFhVzSGSPFYhxkCmbj5QAEbDtq0QOxa7YeJjVOIIEIs9RTAIwnZVMXbvXH+UNbdEUIUBGV3oq7pFlxt2Icqk9TRk2cR9zEZe//B7N1MXsKk+6MwZwD/muYxS9VQ0nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863016; c=relaxed/simple;
	bh=UTwvyoEWkKStgSQ0oQxoZd94KHVAaCra6ADoCVCDMbM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UoI/f8ZD033VEzj057tcbhT4Vjj0ovg74DgjO/u1W2tR1ASQ8BlOR1Nmpk4zg2APM7QjYByhqWeLToBRcAP8vnN4xjjFoZMsEtJVxjRE/n03A9rPNHa/w9p5Xujty1OMxndI+XkvUfWAKCrcjNmdYmr1PL+AcMibmzujvxjAV2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcoK3QQq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcoK3QQq"
Received: by smtp.kernel.org (Postfix)
	id A5485C4CEEA; Wed, 21 May 2025 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD46C4CEE4;
	Wed, 21 May 2025 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863015;
	bh=UTwvyoEWkKStgSQ0oQxoZd94KHVAaCra6ADoCVCDMbM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IcoK3QQqB0Fdn8CcQQJT1hsNsujsl2FbdspChqi12mn0NeMd2m/TeO1qB5hrLVivk
	 XSACxlpKoATOhed4JNxKlfACyrVMyKDnRolEpNe5X/VLfE4EhuCrFlu1shIgilvGub
	 XLaRoTukdq8IJsXBx8a6BCdAa51rN93zdIQyjANGs2s3IHGOcVsdkRUsdw/1/TdX5w
	 lrWZ1hjm6zdeZb2geXNCDmcUuwXjCINCjPKEf0QKp7CtSAgtnfPkl/+s7XOZWXsxUZ
	 2zrc9XXS3YiE+9OqgqXBOvBNGOZssoPaWJ42+m3SR6nqvCNyypg/mUjVViZGJb9Ndf
	 j+17tseXZHUAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71072380CEEF;
	Wed, 21 May 2025 21:30:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.16, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786305124.2284637.16568099177218022452.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:51 +0000
References: <20250516082415.7871-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250516082415.7871-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 10:24:15 +0200 you wrote:
> Hi,
> 
> Second pull request with fixes for introduced driver in previous pull. On top
> of the previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.16, part two
    https://git.kernel.org/soc/soc/c/a65dc234cd69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


