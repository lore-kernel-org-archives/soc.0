Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C3F3B840F
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023248; cv=none; b=Q2j4fe2sS10e46FI6hsVfrXTntqkxZApKeADzFa7LSjsZkcqntZEAcYBvQymU8piTUUD0oKzTvMoA3ftTB6oGuugTGf9JP4pkODGP3taJJ+rq+diOObtFX/8gobUCINbbL6yak3BW63Wb2oBWjNjmxf2ufz0K+nbVzoPMao2RlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023248; c=relaxed/simple;
	bh=ImoyGMsyzBJ7f2xIT3Ncp5Jcy41O+NdrjwdUSJ+vJbA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DekMb6c5aJ6pOQR+jJXqxRX+ew83EfU8xRl2mg1C00w3CcQoKvXA/RvCqukNvUHudEaXKz7QppMNTh4DtBSnAROlFW6kT0zX9rLLYVrzRwbdaqOMGX5Pa9mzbSQnSZl9TkB+FUM4CL3Og0HA8QmDAtLNXw7ecw6+qQftm7aE+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlvemQZb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlvemQZb"
Received: by smtp.kernel.org (Postfix)
	id 974241F00898; Tue,  9 Jun 2026 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A6A1F00893;
	Tue,  9 Jun 2026 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023247;
	bh=VV0VLBQgHag12xhtFiik3FD/QlATs9gLTQkEvwyYz9I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=YlvemQZb5hMu2OKGn1HRzHK+VMM/NLWf/Ix+Fqk/xNa7NYxMllnumrEcMfrWE+VVu
	 XViasbLgqvQ3BUQJGRZ4X5YRxoQeCYZ2bcBLO6sev+Q+vLlUkNAIhBie15HaNpDIAG
	 xnjaizEIMUHzl8/3wB6+qsihnjDJE+EJbe+lnx59scFGV3uMGsE7mV491z+yd33Ytg
	 b3ujQQ56rv6mqJ4HMrV+OZ32k1HfxhGN/ATDZT7tETqHsmDvrkBf0OFWcGwb1ahUoc
	 B5ar7WFOSjAhf/jTt6FnMb2kfIgxtjsHeem8vdQ4wpZ0+iEtwG6fC5DlmohjBucBIL
	 /oBA2WfOHLL1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198333930989;
	Tue,  9 Jun 2026 16:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX ARM device tree changes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102324563.2135346.5350526922755929002.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:45 +0000
References: <20260604170234.1660270-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260604170234.1660270-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Jun 2026 13:02:32 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX ARM device tree changes for v7.2
    https://git.kernel.org/soc/soc/c/1c00051aa2a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


