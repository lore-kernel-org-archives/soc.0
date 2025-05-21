Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B7136351
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866674; cv=none; b=MiG5m7c4tz+w7n3gUcj/vDJhalpzI2JEf7oKhLL+GZkMkW4r584gHdPQF3lBpONXZvg5oE4dS1DrbAu4fh85wraJIseOP+Vc8okFfVaIM24pWheJEDzJS/ysSJ3HzGhVgVTpi7M+JqSVSE1JqM1JTuhE02rlX/ILP4zAfp8OQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866674; c=relaxed/simple;
	bh=yqI8YQ2vLpn5jbiMUXB+Dz+rDTyYfPKZRG6FKhEcE1E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bgmW5BSFuuv4TYkfK9eRcX1snF9pV4hBqLOsnEWT2cQCX0x892HdPNwB7+51QHPBB8E1ES6XIMPnvyjyOVgWyt/2PE0QP0crg4eF6v+E+5aBH682isiYYYCpdEO2s2Ik3ALLiAEdatQUW0KPe1lRsqOyBGuRFmNmOYL/9LgjYWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+79Ji52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+79Ji52"
Received: by smtp.kernel.org (Postfix)
	id D9639C4CEEB; Wed, 21 May 2025 22:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4073C4CEE4;
	Wed, 21 May 2025 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866673;
	bh=yqI8YQ2vLpn5jbiMUXB+Dz+rDTyYfPKZRG6FKhEcE1E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j+79Ji52AmL2YmP47hytA6ZWS8VK1OoDCHHi0D2NAc4LDVPUYedQ0GVsx8YOn4nsT
	 v1rOVI6pjeSLT3zLQnzSCivB/clb0csgoySvV0dEEzUZU6VK0WyQ8AFcpL9au7DibZ
	 v1kqTQ2Int5c8nvqJ32mvXoSIFKLpdLJFcknBHB1b3Wg+nDvmAADWAWwGf3Z7lL/8B
	 sgYsU7EuCwehbr/exL/YCxIIxYkq8ebwPTMvk2bA4cpnFmR+5le+NhgZ1bdezFYu1w
	 gjIrrL9TUuU61qojkZw/1eEH3uXwUOLwzekpy3gdmOQMUe0L4D4J8T6l4wdwu5QHlm
	 Wtu3AReCdUutQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFCB380CEEF;
	Wed, 21 May 2025 22:31:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670948.2299459.12403321460401196270.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:49 +0000
References: <20250514044841-GYA524674@gentoo>
In-Reply-To: <20250514044841-GYA524674@gentoo>
To: Yixun Lan <dlan@gentoo.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 May 2025 04:48:41 +0000 you wrote:
> Hi Arnd,
> 
>   Please pull SpacemiT's device tree changes for v6.16, thanks
> 
>   Please note, there are clock dt-binding dependencies which also included
> in this PR, they are exactly same commits (same hash) which already queued
> at clock's tree[1].
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.16
    https://git.kernel.org/soc/soc/c/ba32d96e90c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


