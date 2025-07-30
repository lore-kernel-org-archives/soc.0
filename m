Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE67262D
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858636; cv=none; b=Vt8cG3p+lPq9LdnjM2LQkgHEDTjeit78E4aL+tbZstd1O1Ym6wgTbUlczN23DoMqjMi9dZkRzrsiLAUIF+qXfIBTmp/YnjoAofWGs6BzeXltVCKUdT+Z6fHpK75Uj47/xsKT4AMt0AtleGBoLgcaJzZyVZh3t6cKFoeIAmGbHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858636; c=relaxed/simple;
	bh=tBpm8L3WeHy7UnxYrIp1FkbDO8QNvtvyvAoLGDWOqUg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WZyBMcZaytffb3Gr821xb8xwmqdWAOcF94m61oWM9fEbfmeDiY3Uf1zsAKfNoEzYXIPWiRaOd9yCoz/OfpkBem6bmhRC5X6CzLuN9yhWh7MoDVE/nRaJ/iuhgSwlbwxcf2gqS+i4RHmmBntmxQ1aOSrUs2SSxYlgVSUHoJiUYU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcx7qZeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcx7qZeh"
Received: by smtp.kernel.org (Postfix)
	id 7529CC4CEF6; Wed, 30 Jul 2025 06:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F332C4CEE7;
	Wed, 30 Jul 2025 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858636;
	bh=tBpm8L3WeHy7UnxYrIp1FkbDO8QNvtvyvAoLGDWOqUg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mcx7qZeh31BxzSWW32DV3+b0FeFfb/T2VpR/9/rZhplcyCjBu719tvTfYBu0lB3q5
	 zfNWKiwxsvxFxEUv6uzKdRL/SfQ0VEwbM4iRWbxsKFsAPNXkM/Ctxayjf/8mpKw0uZ
	 +TSU1OmjDEIm7IuQtPCSj1dENYoaZSjPd+J8euampKljmDLrcqlG9ddCH9weGvZWec
	 zsHcd+kmDo4Ukdb3XGJ2SPelCm5VVzxgMa1p57Y+2VCIGydzdbaN6KFe+izVv1WEFd
	 ZjS2VdqFRLdP5yJjFoTiPsC4VGYS8W4xqX4K6/vIHfRCULJ3YiKr7jsL6TGJwvm4NO
	 FJUzMcDptkA9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC71383BF5F;
	Wed, 30 Jul 2025 06:57:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175385865224.1808741.1738010659121808183.git-patchwork-notify@kernel.org>
Date: Wed, 30 Jul 2025 06:57:32 +0000
References: <20250715021454.14516-1-andersson@kernel.org>
In-Reply-To: <20250715021454.14516-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Jul 2025 21:14:53 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.17
    https://git.kernel.org/soc/soc/c/5b8141596b06

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


