Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15D9377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094418; cv=none; b=d8VWyAks4jUJ9uNoXephVNEUOd1Sh1f+C9I4jRi3CiAdUyo1DPQOD0z5sX2MAC/p1OnhZ/sAxJHPSEZmbvvH+ap5JbnAM+esg2QUBzVMTpDam27AtOtQWItdpHZjPx4RRApoOMGZDsFd3s2dKmbSC0nIpK8RwYfEFthKNxgxtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094418; c=relaxed/simple;
	bh=SlDjnxc/ZG2E422srAtj/DP+lssW8zeqydEXvNc6Ses=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GpUMmabxCwlfrbp9hhm6A27smtvwH17Bq9SsWfnAwooy6VFlDDPqN5F8+xsqcPalABBbmbSaDGPajg5LhaPm1czqN6bckmH1tNIV4jpD0aUoxHuQh+Pv9YZE5dUIU5VSWq3Vl691qqCHbp8rBtlv3NB4SvGEbr9UiXd7gq9igQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG8rcid9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG8rcid9"
Received: by smtp.kernel.org (Postfix)
	id 8E9331F00898; Fri, 29 May 2026 22:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785D71F00893;
	Fri, 29 May 2026 22:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094417;
	bh=Q8s3NnydYQBMQcQcJw40XkWqXW55c9NfHpZjv9lhOt4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PG8rcid9gQueVPw4tdenXPv653aTqOeA6Te4TXEdCz9Wo0gpUMlD4noR8IOzzWuZz
	 xbG6Mwv3RYLCIuB5I9Hw0wadd+mZ1s8+qUDED8A8tGpeFcr1Esshm5xJND0HTqgorh
	 w2KhdmNce9qMbJsYSe+TSkZC71fdz2zkscC6/0XXORKn+nRdQKpSv98bmnzsnKsLSS
	 IZSj4xzolfIe5HJC04RyTIQe3HblwvkdEYHfARnr2BwvGSmFFRsb1J+cxMgGmVbhS6
	 ECzcYVpPXne4Ma5D1b79eOFfIoWaErwXtzmO1h+e5Z7ix/Efp6a/YIKtA1+RS2gVhX
	 mxCpDA8nhnQkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569C939301A3;
	Fri, 29 May 2026 22:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: fixes: driver fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009442088.1985625.16325466964247479226.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:20 +0000
References: <20260529071949.12520-2-krzk@kernel.org>
In-Reply-To: <20260529071949.12520-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 09:19:48 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> I completely missed I have a critical fix for v7.1, apologies for sending so
> late.  The actual issue was introduced in v7.0-rc1, but it causes the board to
> fail to boot.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: fixes: driver fixes for v7.1
    https://git.kernel.org/soc/soc/c/930c88202003

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


