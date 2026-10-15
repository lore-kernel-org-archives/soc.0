Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAF237A834
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106435; cv=none; b=lUnykeOOBvIvdA7iiqVWT1tXwzTUmAlOW9J2KUbcMM1khUQF9zgcxYtYu+NuITKAxenUUIRW41WuoQibmqlenFvQre5g9rELPceCXKtvNNhbqCvA94FpvB3jxhWK2erBeHBP5zR28ka13uMnfFjWcgkfCxwDQx04/i1t9FNsB6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106435; c=relaxed/simple;
	bh=lM1W35Rpukhh7k4BSAgjj0vr4dGMZz/+YouA5s+dQZk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XTHhBTCNcOZY6Add6IiaqP+I2L2aFUex9/V7F5fb5GOInrRVAqYBabyNfbpTfBn1X2vTfnxCYX5gbepOfbZYMMNBg0FcxRynTvan+aLoe0ZcEtWkJjEx6npwYLI+rZ2X2fx8gkUNE457CgirUAIl79EpV83jq4iMqFNMkEbT8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bwwia1Ma; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bwwia1Ma"
Received: by smtp.kernel.org (Postfix)
	id 1E0831F000C5; Thu, 15 Oct 2026 23:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078361F000C4;
	Thu, 15 Oct 2026 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106434;
	bh=wV+VNNVCZbLL3DbvHjONRdLDwtb1SLxjioDmPI/RRs0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Bwwia1Ma0/Z8zeYk0ypyaX7S0QD/3b01LfeYoiea/Py+Ees15jhXqmKW75YEPt6N0
	 F2EIwpdkOJry21I/6KEvIGmgQAEVpWFJphyb8QSABRwThfxBgEd5lJjBsUM8zHEvhY
	 dAzqT3XFYC6U+RlvniADxSaE/8Nw9+AAv1jH/06e2A+5ZRRwBbx1fUdkBsq3Spe6/R
	 iG6aFSlvyIhytORQKEkOo6RSuFFhk1UOj/6PyqxttORklx3KdTZSq1oU8bT1BtqA+5
	 1r+0FEeicINOY/2gePjC5A9kl3rh8GsRBaRAZX6yIjgzLa01uSMbaHiintG6NeHCMx
	 HDjd5Un785AYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15A23808209;
	Thu, 15 Oct 2026 23:20:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DTS changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210643251.4150336.16274421268331023457.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:32 +0000
References: <20261002190232.6449-1-sven@kernel.org>
In-Reply-To: <20261002190232.6449-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri,  2 Oct 2026 21:02:30 +0200 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DTS changes for v7.4
    https://git.kernel.org/soc/soc/c/ac3c74e5a1fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


