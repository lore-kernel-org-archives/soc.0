Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2C263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662454; cv=none; b=oqctKW25EExomePbxkOystTtdzU2kET8R7XTbncIz18KP4zW4TVEu8gGeUDon0L+ldyRhUG1t7Mq5f4VLKv/PDY/j6x036u0uhFd1coTCh5AkU4Taa3lhwscKXFZ3nUXIuMxearlZf2z9n6go3mBj9YBvO1RQa1AN+g5DMbCtmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662454; c=relaxed/simple;
	bh=pkbowgzjM9y4QqCSOEj8OAI8u7bLoG+wxpEJnfJYRkY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bsSDXWUHc7I3S05m4a1JCDJaaIR888Sj7VPuFk3W0nkuITw/d+lER6Q5iV/pJaEgsrpq9Tmsu1qBR12HkulTYCEd4E38X8TQ5G+jLs0I08cQXEOYYGnahGhy5nkbl9zpxgQsAIXowT4+Sx+v1MgZhjJOzl+vuBPNvfhNvGLS7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsOR3yhR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsOR3yhR"
Received: by smtp.kernel.org (Postfix)
	id 8E970C116B1; Tue, 23 Sep 2025 21:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794C3C4CEF7;
	Tue, 23 Sep 2025 21:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662454;
	bh=pkbowgzjM9y4QqCSOEj8OAI8u7bLoG+wxpEJnfJYRkY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dsOR3yhRUIp8t6YBU2T11mbo07SYuLIU6lZkB9cz8MwQ6brx55asf3HozQIwLQMh3
	 uft5mzMOsdcFFdpkNvvqeczfZoLoADB+QAFBCSYYRnO7dMYRy4QS5OnLKOi8nA/hXm
	 fzq5QhWxmIDiTweDbHXME1Xtw4eO4+2lNfAhNRX9GRWvmRIGBqDkam7KT9AqhUxOkA
	 U0KMvXC7bJ5pbOckVGjg9WE2ZIkU00WZJap/TJtihniOGaHaaYQX0qn40jgRKGFl5O
	 OUD1xvfLrLiPrRJoHp2DwQygv1L/iK8w03CXG68j3r9KuiKwGb/fbk131Ob7tr2EAc
	 6ClkIrCQ5jQrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE68D39D0C20;
	Tue, 23 Sep 2025 21:20:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245120.1926563.15900737080011142926.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:51 +0000
References: <20250912140030.204650-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250912140030.204650-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 16:00:31 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.18
    https://git.kernel.org/soc/soc/c/ebc5eb9ea01f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


