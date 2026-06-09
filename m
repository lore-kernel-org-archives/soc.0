Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444129B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023236; cv=none; b=PYL8xJ5CPBW47M2L2fKXWP0n+lVjp2stjTdRr6o9wZDFX7OvsvHfKYcgWDqttbAwzmYwOc2mW5Y2ntrWFguDEvwy66deFUoVK2exiAOLQNssMcVRbh4mIu+zHGwsVkyQWC/jMxxAxh2BjTo76VlZNEqNJSkGkoeP8no+sGKvvSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023236; c=relaxed/simple;
	bh=85Kr3xI8lGRBNBIRD3/DjlV5RhkGsPEU1POgY8R0zSM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=I6jBm1mpkTP/dMv6fzuvGVRcjh0MC1NYBbZz49iQsxomkaw0INgx6DnbPtKqKT0WvN7wDuwBy1cYb0SDXMWivJw/xGWbARyxujG2710lwmcJ83cB5I4FKJcVRhb/gr+mZQKpOQabvO9PRZtrBP/3lKUHc35Y+pYToFbJu3HWhA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9IspWrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9IspWrQ"
Received: by smtp.kernel.org (Postfix)
	id 99AE61F00898; Tue,  9 Jun 2026 16:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833ED1F00893;
	Tue,  9 Jun 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023235;
	bh=4DsTKOPOh7HXFv7Cn2PZIgdAS246wrypRzXqRJYaxyo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N9IspWrQqMyhGFpGBt25tqOOfpka/VGnIFwSiNmsRXuzaTWrIcxvmmvTZNKtGphNM
	 fR4Ebwp9L963RLhl4xDZZoSkHX9KEqVOjHc5fY89Gg65VHaPOVNFuDCsjWiJLF3v6j
	 ZKgiztzZkS2SBG0rW94U9tHydC1HNnxeSqXA8/XzZqSufdVr1AaXs2RXYAQrkXoxlJ
	 AFK00NU+/sBuEk2xETfDhKJk6jYGfd/f8yyt6vFjtX6+VC/ZTHTYSN6MBtfWop0N8X
	 l/uIB8ta6qMlSYUNLnMidX6jJ+H+Av29db5YwUrzZBx9hF5p9A2sSR5Vd0U/uQTnJ6
	 NBqZ+IYHv9BRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1983E3930989;
	Tue,  9 Jun 2026 16:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323363.2135346.12043775910593002727.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:33 +0000
References: <20260531121914.22421-2-krzk@kernel.org>
In-Reply-To: <20260531121914.22421-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 31 May 2026 14:19:15 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> On top of previous fixes tags/memory-controller-drv-fixes-7.1
> (which contains only one commit)
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v7.2
    https://git.kernel.org/soc/soc/c/8c3fb979f1b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


