Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908A22A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693420; cv=none; b=uB3ZFcjvnXk2zySicHYE9jMTEoJxo9JhbRMamXbI/n73ZjaSB5gvckcRohIgtsqSP+G/sOjTx7jYGelILfGIEAzVr70c8H6g8fzEBf3ItDRtzMhpw83L0mDhQClRTdy68YGJXXCZVI1OFkLBz1hmd5xcvMltzRH53d/RL2zpng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693420; c=relaxed/simple;
	bh=pIFMdSXl0Tbh1Y9UUzVkx7NB2kOG7GrDWnLaJqL1uYc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=L/eL+1yKb06NEqycbDYUIJ+q7I81IJXSzeG0tkVG/wtwyoAT3ysN0P03a++LDpunvqAN3O1RL2T39zThyXIia3wasPTw/k6q8/CpyHaDmCixAQCrF5mlojVrF0joRfhnVcD83a7eQjdv3q0vgVm86AbtlKizshDPOeacaeK1ww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRWcSsKY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRWcSsKY"
Received: by smtp.kernel.org (Postfix)
	id A6B6BC4CEF8; Fri, 12 Sep 2025 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91804C4CEF1;
	Fri, 12 Sep 2025 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693419;
	bh=pIFMdSXl0Tbh1Y9UUzVkx7NB2kOG7GrDWnLaJqL1uYc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tRWcSsKYmtqP1HvClQO24EgdqbJdVqVw3Vf9Yw5s82eXG7RCl14O4h9vWBtXkHR8z
	 vD9TbuMEQDaTPKh22ZPckhjx5r8gv5bALTCT92U+FfC2gsdibr7j7ZyoF4p1eCWd8P
	 aJ9zUj8t8luWoDMF3jNBWTQeX2XwrLj4oTH7ovWPTItWjCyDXdshxf88lbNHbIX5QF
	 ToMYccGnwzbMPV+H12JJ4np+t9ObWA7zMy1hweWJ1ineIRRvTCv4TPlqTJGyf8AcWr
	 3oq2qoMQ25vAOTYPN6Em8eo6QIFrkTyyo63vWAwOYigWxN2sT6NlL9l4mq7Ab7CgRw
	 nk8OIStXVjhXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D5B383BF4E;
	Fri, 12 Sep 2025 16:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.17, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769342173.2998972.7356632165234119779.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:21 +0000
References: <aMQs2zr4fYl2DYVr@dragon>
In-Reply-To: <aMQs2zr4fYl2DYVr@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 22:23:23 +0800 you wrote:
> The following changes since commit 37e5caa5571b5a60b0c835a0bc09ab1e53f57bfe:
> 
>   arm64: dts: imx95: Fix JPEG encoder node assigned clock (2025-08-22 17:45:30 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.17-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.17, round 2
    https://git.kernel.org/soc/soc/c/6865ed7ddc81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


