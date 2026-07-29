Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFE93E762A
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340847; cv=none; b=XIWomFaQKlXFSHAqyd3QkVTCvBFmlalJUlwtnsPJ3i9X9HS7mQjQfF4rvV3RIARRbp2Mr+Hu9zlJUPh8wUfZfIWbJnHg6qjKjdVi4EmNUZ3IdpfGn7pCYe1Vs0vvpR0DWrilXDhQcUURMw33K4Qcd4EPojaH/jS15+XzgYm1gx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340847; c=relaxed/simple;
	bh=TgBsRUqrKtA8RV00uc5s6NCrY0+/GHv5LQ1STrwuj0o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=psUirj/ZSD0ENe/ExDS67te0pkSFY1DFU0sU8eGhdU5jNqHnxEULYrbvBvB5GkDLL3sR7tySKuemaqFocN2xly5VTb3ntbkI+DAgUdmD/N2B87b1TR/zeEiI2DVa7reC6iie/b7M3m5esFOCbjygw4nCbS/Oxmr8wH45Xh0KfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i01uCl35; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i01uCl35"
Received: by smtp.kernel.org (Postfix)
	id 26FE71F00A3E; Wed, 29 Jul 2026 16:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDDE1F00A3D;
	Wed, 29 Jul 2026 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340846;
	bh=COgfMwRAbKcZW5bz9MtVXjAjSfzy2xbK9VyB+7/j77E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=i01uCl35GpY5yAmGlOUD9hM0+d6iC9xKrQFvwZY0r36WFrxOaeMGdJ2/8CfarhK38
	 UQYwqW0V2PZqOFctthjeLhzR5yqRWcPED09al1nLObBXXf2Fr2R/6ds4AtsjDrPEto
	 1+4NgNPK4WzY2cHyftbf7vCUj/HkRzER7b0raY9euIMP1FZZwjxvtsPYyxj1A0ADo7
	 ApUvsUpPRep0deNbUoo3wyhQ+6dkF82CdIagy5Q3s/LxBajzVpdUtDSL0FZg4XGMpM
	 Rvp5QzNHv21wqMXSvjdJmiOOrrnH8AcT51kfxP2aJzXcyAn+VnlglY0wlJCOTSdePa
	 IpAsmcFDfP1OQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6F00339253CF;
	Wed, 29 Jul 2026 16:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] samsung: drivers for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081014.3143403.10931592525244935701.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:10 +0000
References: <20260727190010.404981-3-krzk@kernel.org>
In-Reply-To: <20260727190010.404981-3-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 27 Jul 2026 21:00:09 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] samsung: drivers for v7.3
    https://git.kernel.org/soc/soc/c/ce9af94e6d07
  - [GIT,PULL,2/2] arm64: dts: samsung: for v7.3
    https://git.kernel.org/soc/soc/c/fcf7dd6d6ce4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


