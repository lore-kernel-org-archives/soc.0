Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2A2F8BE7
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724360; cv=none; b=nb1odmH8rFLBXFRkX8oq9rAyntz1NUy4/oG74ojbFsZr3JIiiDeftj5Ik123cIS21I1d6BLFk3uKDZL0kREuxYdQFI93y7u/42JsjScOSYa9fX7zvUpCUQMAXP/72VmpoTLfjN+9OPnGQxwcMsxNMsRXbZqyIAWdQeeolfvc8jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724360; c=relaxed/simple;
	bh=NFWUK27eqcZhSFXqwM2mPABMksL1paEhCfy2NxgiJgg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GhtjNW8wJI48vc/XFklVh9ZZIUhWT6/Voi0Fz4uixtie4XPBV7FzVXk7XAt41BKMdaZHFrC5zoFzzCsIYqWowT46vNgboo4jrwyWpfO+ggS8Zd0T0NGw18G4pz4mnwQNe5WFXGXkKazL6rw0bAGRVbbwIo+xTn0Z+RwNDaAs5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXHTW9yz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXHTW9yz"
Received: by smtp.kernel.org (Postfix)
	id 32E3FC4CEF4; Mon,  1 Sep 2025 10:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D679C4CEF0;
	Mon,  1 Sep 2025 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724360;
	bh=NFWUK27eqcZhSFXqwM2mPABMksL1paEhCfy2NxgiJgg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RXHTW9yzaeJXuomkU2tOaU0cj5+DFnEiS+QOYlx//u6Kfz8FumjG5VdwmszxzH8Gi
	 lEMk5VlIfGrXLd3lC/I9hhUSZfiyRQV59L/q0aKriwM8AItmzVKkmpOToj/wHmohpk
	 pYQD65I3A27HwrVz2qf2EQRriP7RW1d84ajmYq9L1lI4cGpM0bVFJEqA2dGjR1nDcE
	 Rx6dXhMeHl5+IjLkKqAdwg1L5u7RHslc5sOG4fUdsE6OvwtH8JTFCetyWG+kCH9aw+
	 kkdp30qweAWTPKZbnDuVAfQMWi8KK63M1VDLBrMYBefO6zOrdq8Aa4wANg3Mgzjcwt
	 3HnB28wEbGBsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B70383BF4E;
	Mon,  1 Sep 2025 10:59:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DTS changes for v6.18, part 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672436573.3681523.4570141780571082375.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:59:25 +0000
References: <20250816171501.31944-1-sven@kernel.org>
In-Reply-To: <20250816171501.31944-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 16 Aug 2025 19:15:01 +0200 you wrote:
> Hi Arnd,
> 
> Here's our first very early pull request for the 6.18 merge window.
> All of these changes could've been part of the 6.17 window but the dt-binding
> changes were only picked up after I had already sent out my pull request which
> was already very late.
> These have been part -next for about a week now.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DTS changes for v6.18, part 1
    https://git.kernel.org/soc/soc/c/c861d0b4fe47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


