Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F02339863
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159589; cv=none; b=gDKNLEOgw7hp+t8dGRk9NapU3XORbLO/ODBSLxtly4L1Nqo5oGrgmTTqPtoCPOA6r+A6KGb5rMWvwZo53Wjkv8XhvhHhKIETA2z/7cvhb30gs0cohAz7tAYUGovDUP/ljXS3IVigRP0hC5KSusZQsPi2Z3Cs3nO54F2IhybTwyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159589; c=relaxed/simple;
	bh=KTqJPp8s3OYYoZ24RnSfCO8iU0wsNaD+4K4gaoJTWRs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=URVyhPUfZCFf1H0EXliinZ9E5g1t9v8nNYa9tU0/CQeroxn/TAr/bBwSPHVKaWhcOUJ0UhaCW1Ldt/mw6y3YAzux96asWW3xtQg8QMHhHWPYztNAnmLi4S2GSoxt39G4WRK75o7Syj+NQ74CrcD9rRlUDauQkwP9eiCvlG/O1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQagziqv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQagziqv"
Received: by smtp.kernel.org (Postfix)
	id 559E1C2BCC4; Thu,  7 May 2026 13:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E2EC2BCB8;
	Thu,  7 May 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159589;
	bh=KTqJPp8s3OYYoZ24RnSfCO8iU0wsNaD+4K4gaoJTWRs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IQagziqvzxxjqb8O3jeFAF4E7zViHQXqU2Jc7H3YoeiFC+UE1TTL5/hDn4P0uB5aZ
	 vIcGcfViR1tDAIEAiXDE4iHa43jzdOwL4WqKvq9pIBnYLUNFGuRtLaA4DsjLzbvS0W
	 NNVmy+D0M2+8daWcYivUOcLihJOxjxDTp8XcjDQJXeXX12oO4d8wvDMZvLU0tdwujK
	 L+BSMJ4V9dFyjWML0u8mwvLp2M9hKWlASMHbPuQVyqR1LBeMNGG3/dxiFq/lW+OStl
	 qcnux1MApNtm6UEOrNrF/geSepnRgsUjVO1gCQ2KDRPINQtlRJ/jxeInUykZBXncHX
	 jb+jguzQj4TCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E2D39308F7;
	Thu,  7 May 2026 13:12:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]  Renesas SoC fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815953854.3933061.16942922438863466126.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:18 +0000
References: <cover.1777899408.git.geert+renesas@glider.be>
In-Reply-To: <cover.1777899408.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 May 2026 15:00:09 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.1
    https://git.kernel.org/soc/soc/c/b94e0e37d1f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


