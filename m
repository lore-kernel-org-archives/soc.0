Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E685923D7DA
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078677; cv=none; b=WexUzk70D5FAC2tzCp4PRSPAQ02f4jSz1ZYuemVXWe7Wzn30wz3VfvTNwlPQiZozhPQ2mGMnSd6dGvxkoSOU5gK6A0of+RIc0K9oSEnLCMFajo1aqHCab1g7+hdFepBTOeoVQadCfvDm+WdEkEQoYLnGORfxviadAzWwOZENZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078677; c=relaxed/simple;
	bh=tDUCiz0QzWMeOg+flh9O8ezBO5QbgqOowSSC77CiogM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pAE70Li4tthK4SgoKkU7EiA8Z0taWy6kZzJdcMiK9ga3mBhOXSq4TJOVjQdnYeFaTISQ0jB6IxgLBt43N7I7EovSO6EUJrQEeSVJY8GOrAK9RT6jNsaEvnvI+CZgwvkoU7eSZrK/laW1tlmLWyZY39EzVXKCCNOm+uLGPP3RYKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awDSE0xg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awDSE0xg"
Received: by smtp.kernel.org (Postfix)
	id 85387C116B1; Tue, 25 Nov 2025 13:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F479C4CEF1;
	Tue, 25 Nov 2025 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078676;
	bh=tDUCiz0QzWMeOg+flh9O8ezBO5QbgqOowSSC77CiogM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=awDSE0xgxwk24LicrTxzHTHlY1WqDMzRkCGS7Lj55sXWtiVvIOXAf3fFRkrnzPGAo
	 FWjV0Ut8uEMmbyajeyWsQDf0WOSMaGP5HijiQliQult4dYuUyc4KsMBKbzOFJ0QEC5
	 mKplPlvhjYKHAOmRZrhhQmUjOq8mVN0WK/B9o4XYL7EFFQgdSVcXOb+x3Suw1F+aMN
	 S7wYRXzMRajgeeUehkmQTLq+Lhe5CU+nDcXSh9j+33zCzfzztpRq3/6H40qbbFshs0
	 /CkVtJan7zQ2MoT1qyG8MYxhFCfd73/z5DUivBZ7tOLPBzBPPXkUDGofIPwrlF+uxS
	 bRmpn6j9i2Vgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C123A8D153;
	Tue, 25 Nov 2025 13:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407863881.736376.370658178653266018.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:38 +0000
References: <20251120095059.2787351-1-p.zabel@pengutronix.de>
In-Reply-To: <20251120095059.2787351-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 20 Nov 2025 10:50:59 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.19
    https://git.kernel.org/soc/soc/c/af058d5f32f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


