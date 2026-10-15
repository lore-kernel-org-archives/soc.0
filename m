Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52F3C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106427; cv=none; b=X7icu3dX5VeXLHpJGSaImR1+ZOYQ3eIBEoC7wzj2SNcQV+gkldBsfZTMX4M2mgtnaFBYo88RH187/YZIjmHOCAerNTE0pjW/UM813hiFNan062b1Yyp24f+G1Vgvrtm2/SgZbeS8UHYrxCbAF6C009ZRl8gBbuCdUZtJz2xYxPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106427; c=relaxed/simple;
	bh=S2DqPCeB6uvxoZSWmu2ZeIVqTk1uV+NtLxkijBE9mCM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EOfdYbkB+MiNk73Ior4EE+t4srzQJE/4O2wBhuGKt5yJrZ2FbnaqVYVw15MruI7cNkdCHgGDFl0x+muhg/CTAhMZECDwdRjl5+ZLGZeTgLirBmYInqZqcx7qlxSK6ZeUEoZLaQj03Ml9ybB2WRV6GizIHP7ziAVMalwrbmhy68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrLmkX38; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrLmkX38"
Received: by smtp.kernel.org (Postfix)
	id 96E1B1F000C5; Thu, 15 Oct 2026 23:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CCB1F000C4;
	Thu, 15 Oct 2026 23:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106426;
	bh=d2wkmNKwaZQkYhp77b1AsHiDUZ9JDvTFzhQ+W6PQC5s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SrLmkX38ty6F2GKiaulAHSdKvuJ7qjmNinpbhOYJJciNfappjkXQh0k+GrunjDUux
	 7gu0bYlE2QW+HtXT+AVZr4lXZgzOQ/t/LK/6Bxp9pzChgeaku5CNql2399d2D18ZF1
	 3kswRAsr/i/E91CmKvYDHoiIwMT4hZ6DTmMbmphxg93HlSlRZ5s2r459OW2DZsHMgL
	 u/2pFNQhdbHM/mWQjJgo+In2vxNh4v+N0WpPVPPEYNsWsM5GxW3F6jMHuSdRKEhA9U
	 Pp5SIdBlyyi8xNwO/uIBjngaQTBVtodRofX/Qq0NOzZPVGsf9ftpNhH4MFjcrVzq09
	 +A+9YWS7TsbMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772EC3808209;
	Thu, 15 Oct 2026 23:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt for v7.4 (#2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210642501.4150336.14875412440043451086.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:25 +0000
References: <87v77b53qz.fsf@BLaptop.bootlin.com>
In-Reply-To: <87v77b53qz.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 09 Oct 2026 16:48:36 +0200 you wrote:
> Hi,
> 
> Here is the second version of the first pull request for dt for mvebu
> for v7.4.
> Compared to the first version I have just removed the patch introducing
> new warning because of a missing dt binding.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt for v7.4 (#2)
    https://git.kernel.org/soc/soc/c/946fdcc11334

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


