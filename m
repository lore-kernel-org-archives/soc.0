Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E920899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422292; cv=none; b=HU+nkNd1YV7/N4YsNR6M7Mn9XUVzUVYH30mSrfEoE/WrarbCwYz2XvQs/bvi1ycDsLh9d+bFAEIvf+p4aIw55x2mEnsfgB+ogL8+s2K0rpEEBLyLtg1sAcpa55Edqel0rp3t2dOmPCFcc4SWN59mG9KD1iIRHDdPu0T+ZtRLY8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422292; c=relaxed/simple;
	bh=4YDTnu/vb5+S6yCmGfoZOCGb4NTGo8V8SAxIkNnYZL0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QPg75/89SYwH2kZFCxqrKFm1rqWnxJSExE+grcixvIPu1qh6HQq6vmE+LqoFcPIZy7bMfEP4T1rK3hNGA4bxTNDSr/TqyUmo/52yVxCoQcpGpBvM4XfFAFC/IlHKlo1CoXqxXChavdQbCOny8ubuLuCTHmq496LZL3dfPGjPYt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0yoqSq/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0yoqSq/"
Received: by smtp.kernel.org (Postfix)
	id D6F08C4CEEA; Wed, 19 Mar 2025 22:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C145BC4CEE4;
	Wed, 19 Mar 2025 22:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422291;
	bh=4YDTnu/vb5+S6yCmGfoZOCGb4NTGo8V8SAxIkNnYZL0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h0yoqSq/tTExj6HusfEKwPQbQHzZdsD9xq/S1mqtXJXPm2e2oCKgUecozj3ess3VL
	 NLvUa8/2UW5Fy8gYnj4TP7q750C8ST7j5ER32fc9jcxg8k1e5XxcXmnxZxN80WKxUh
	 FUNZtlOpKef8kfDqK/3s0aMpREnTBb1ZdmHfbrQFp0pZSd1vbNzfzENkjeS6zHdSx7
	 CmjVUi/ih8+x8qv/t+cjQb7JZkCB/BoQ3ZWt3KAWw/mtBBaUawWRL6Oovfy/tkzZJ3
	 uk0KldlawNonSi33YK/0+THkMdJBZ44Xk4DVdX8QExAl5f+Q8MlidLGbYT1kZXwDLP
	 dVhLyxZVAS1RA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1C33806654;
	Wed, 19 Mar 2025 22:12:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242232725.1211847.16519687552219777344.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:07 +0000
References: <20250318-favorite-presuming-bf2fcf55bf6a@spud>
In-Reply-To: <20250318-favorite-presuming-bf2fcf55bf6a@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Mar 2025 11:57:31 +0000 you wrote:
> Hey Arnd,
> 
> Not too much this window, was hoping to get the k230 (canaan soc) this
> time around, but the clock side of things was not ready.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.15
    https://git.kernel.org/soc/soc/c/519df17cb03e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


