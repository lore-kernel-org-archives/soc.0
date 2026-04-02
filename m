Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C1346E7F
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 22:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169056; cv=none; b=UleS/w3b7J9REUYv4Vg0dJuLAJpwLAV0ihzZe6KnHNMgvRQqfWWLpTepdvS2qrV0Bt5xwH8hoFYWJlzgRIVsAi0aXnsYeLf83n+Zo+vAonBT9ZytwGFp7zS51rvnyoZCvCJxy2W7NgXfGLAAV+6nTyS0rLOEDjAFRC8kuxyiPS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169056; c=relaxed/simple;
	bh=OtG7MaKSTb7vSWdmSiHziK0ZD+QH3m5S+MWYRCQbe+I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Zcwd9guEJWWKYKxEmnOueiLwReGQFtxVpSUvHvDdDFxM6Ec/bvDAgE4Qsms/9M7rbkrWFgVOBwzlvFK/NHdm4xTH8UPTN0XkzS+YUeA4E7BVZhpCcBLD44QFkkE+Ba4jE63SauSJQCpTXca/sGudEek3Q4CGzCD9N3PtyARUCTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS4vApZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS4vApZV"
Received: by smtp.kernel.org (Postfix)
	id 389B0C2BCAF; Thu,  2 Apr 2026 22:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232EAC116C6;
	Thu,  2 Apr 2026 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775169056;
	bh=OtG7MaKSTb7vSWdmSiHziK0ZD+QH3m5S+MWYRCQbe+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JS4vApZVs0fEu/DDkw6S/nLqjT19DqFb5DEX1DWn/W/AJP1NX2IpwdCCfxLyhQiPK
	 H1cLNLV82F4Yyp62xnE9xNf/WXuOG10xzOAwfk8xdk4G2wyWPX7pA5NX2iRNnZjxDq
	 WbsA6Npq3UwOuCntlcSH6+UAh0TKuHze78Chh+aYxBr0/Yu1fnvTbAXeUiWi9LdquJ
	 J8z7DoAVJpuJVRRCOwJFf3GuwI6xc03+3AEKQkQL+/vHSw9aR0tJ7e7PkotZk4rhzB
	 eX4a0UEzq05UVyY8ocIlTHJEMYaGdIqWBMZfD3wAg8HPyCH4J97V5/x71VC2yhVU7t
	 pGPdyHyJAYfSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF513809A09;
	Thu,  2 Apr 2026 22:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516903830.642994.17201519222528359133.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 22:30:38 +0000
References: <20260401142242.1068620-1-andersson@kernel.org>
In-Reply-To: <20260401142242.1068620-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  1 Apr 2026 09:22:42 -0500 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v7.1
    https://git.kernel.org/soc/soc/c/8366b60cbea2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


