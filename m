Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F521D8A0D
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043315; cv=none; b=EOfKiVEKRIRezmec2JTzRroavjg7azrR9vm4A6UIpaINz63UyqaneAm7+JboCVrqfCYTe+vi9bCZaezkLu7DFGd1LCcemH4HeogdXC+EF5CJ1TjcLo57I8x7ZTe32lswyR5Wnm51FQOE3UWV58KWzLCCDh9QtifQoaaqG1q7e6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043315; c=relaxed/simple;
	bh=1be09/l+0ZDkqQVvWtZY/u+l6yqvQHO8XbGrv0PKstU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tdmKPt0MumdY7yviUIiIBBX+t3xSVtJqxa0U79QNsujckDae3Vu6sosxFhGoLMcb0TQfslzUD2ouR8VY/KnxszY68m+Yi4BuNTBJCpidMyIHPq3lflqhPDedy9prWO/mLDne+dsFyEh0Wvnag7k5SFKlQg2nlo+aLwc0qVYB/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uK4FYgDO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uK4FYgDO"
Received: by smtp.kernel.org (Postfix)
	id 6C5E0C4CEE1; Thu, 16 Jan 2025 16:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BA8C4CED6;
	Thu, 16 Jan 2025 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043315;
	bh=1be09/l+0ZDkqQVvWtZY/u+l6yqvQHO8XbGrv0PKstU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uK4FYgDOZ+KfWLqLuGW9bYwLa108g2NTXvSbkiSHs51hRnJ2M2ZbxPwNq8Ln5PDbP
	 C/xbocG1yi023LaMwN67h+ZxRwSWnWTDX+7KUPhTOUy2zVbJ+CSYQaKtwpofpdjtTO
	 baHRfEiwMNKUi6uolAcoiEqJndcPkGNBnSq2Wx00FiCuykzZP59GPpa0fsk3lflGF8
	 kKkrc7W+wLiarAyp4MuLSrDQt+vkrh/Ybgz0UuO97c7+RJPziw6vGP8iw2Cx/17ql3
	 i3yVxfhdp/5Vlu3XCMTEW28PWSXMvFui1PCtiEcftPT2XPaByMIrXhKZGeeBHeedzF
	 j9ycJImxs2BkQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDD1380AA63;
	Thu, 16 Jan 2025 16:02:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates fo v6.14 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704333824.1501791.4272993859342192774.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:18 +0000
References: <20250109164317.1154613-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250109164317.1154613-1-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  9 Jan 2025 18:43:17 +0200 you wrote:
> The following changes since commit f72aada7bee42c4b43a272ef58bc4c9e1caa53d4:
> 
>   ARM: dts: microchip: sam9x7: Add address/size to spi-controller nodes (2025-01-02 12:33:57 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.14-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates fo v6.14 #2
    https://git.kernel.org/soc/soc/c/f1a26476649a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


