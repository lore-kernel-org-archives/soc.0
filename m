Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EF13F4DFB
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345808; cv=none; b=WKBtocaN0pMtDf+Pdd7RR1qG5HQCybPu3YWw+DWLrDQXic9vyDKw8Wm4jLAIK21xu7sUsqTIxlGaA4wj+vBYAargLMB1Zh4FIlnfUJGuMuGhzjMooLaJjXsoKOfLSlsE39oND8cPIm99F804OUT3RTTRzizHN+SQHkdhe0OBmIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345808; c=relaxed/simple;
	bh=0dlSHXKu5tnCtwJvFr3Df3pOpqn74o9g6Z2KQp/hero=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cN5o16G0hC/XRbcx5rO9SmJWqP7Fa8LyZ6SnMW1H/OjElxv2hpkyj98XSgee7AY8fbofShC/XFzeJ/ky9KPL/+LWuSMI2bxrxkUqepzn/8+kpTZ4J7Iy29gspVVvifGNifMYwxEfr2cd9qA8GNSt5tFdHWwWo5KA/p0EMcJ41S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvTvPTaj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvTvPTaj"
Received: by smtp.kernel.org (Postfix)
	id 1DEB91F00898; Mon,  1 Jun 2026 20:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067A91F00893;
	Mon,  1 Jun 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780345807;
	bh=ZzFzA7Acaevzcxf9b2Y8+ENg5dOiZWAk53lABkAB7a4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gvTvPTajL8PmNJrHJ0VzMbWuvFYJ6HirC/rPvslGnYDflu2e7/EXLsOxP/RfpTNBn
	 t2N6typ2oFXjj58/GAKjY8EplCF6/qVE1wTPqGnv0af910KWQH46mnThNoGVxGvVAx
	 Qh9zWoLENbkDDjJJt39kUEoOPUQMnrgdzPr84hjAJEOJNqSP01Df05HRCloQRVooNi
	 Ex+tBcxY5GOcIb/gTZNdKRnsqPF2PnZ9MZQ28mGlaopWkrWESs+UdLF+zR/IM4I6ry
	 KNJay5RJxgU/YXp9W39960CfIC85e3kaaUmsSdxXJYKyYuGKKkTpv1qnvozHY5dJXc
	 GelPp6FzInIIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9394B38119F4;
	Mon,  1 Jun 2026 20:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] CIX dts changes for v7.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178034580913.84967.13923698244200189133.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 20:30:09 +0000
References: <ag/Lo+ss9sSnBSLU@nchen-desktop>
In-Reply-To: <ag/Lo+ss9sSnBSLU@nchen-desktop>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Fri, 22 May 2026 11:21:07 +0800 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v7.2-rc1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] CIX dts changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/9bca2a5bbe20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


