Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2542342CBD
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948417; cv=none; b=smns8GPc6MZgRRf5m+cF7VCunLjxy+o+k/9q/0/ZPZ7b+1dX9Pl8IfLckq/SOselLpQ1A77eGauKnVWMR10IgNWltcdBAQzwSdzHFBrLTgJY0Ml0LAGpLh773QQ8pc8XnoQxy8ikCXPoBOvQv+ogGDG3f8kXmJqvp6Geb9Dvxds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948417; c=relaxed/simple;
	bh=9pGqQw65GInkqS5KD7einoJwkSnezFkZi7ipHcNrbhY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RSxgAIQRGrG93dbbpUMd0nyqUyzAZWQ0ZZ5DY9+sxS6s46Qo9w8r4tIuS+vHVPTzJL4cP9D+rU9PcLJ3Nazaq4Fpkd4jIQ4pARi4+4uhI1pNRdxrT4CsY0z8jutGpQk+TyPIZf/5nty2bkAQaCcx3QIsqcj2Kbyt3+IxE8X2ryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bd9Ir9SH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bd9Ir9SH"
Received: by smtp.kernel.org (Postfix)
	id 5483FC4CEFF; Mon, 15 Sep 2025 15:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EAB5C4CEFD;
	Mon, 15 Sep 2025 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948417;
	bh=9pGqQw65GInkqS5KD7einoJwkSnezFkZi7ipHcNrbhY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bd9Ir9SHuaXCfRMaTrhIs81rCtrC851Un5l+Bc877qA3IMKTsdh4WKzdZRFQ24bf5
	 ioaggBXcuwhSn3lIEMWCTvLijiMhFBtSmI1dXY3SIz5O7ZPuxs2mMUV01weqZlS/nZ
	 tMq2n+eBw8rEoCv+UFh2Yem2b1+DRxmV+2p7Qf/1s7Vsk6YxGb2CATIUjpFkpwGLCU
	 0LyP41Gj2XONxflakfghIFWu1L05prxL4GuixB9xq+qbEepNtQ74nfwdPsNZOy3yZU
	 6bm9SbQkLiSJh0B9sGL6L8WDO2VeUzXNyL1DJL0NTnJvwwt7ZxXAO+g8IjzRaW4dB5
	 Md9EFJvMSUrLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB75F39D0C18;
	Mon, 15 Sep 2025 15:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek soc driver updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794841873.17822.17111013286943654337.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 15:00:18 +0000
References: <87c8f50b-90a5-47ed-af60-99a4e075a266@gmail.com>
In-Reply-To: <87c8f50b-90a5-47ed-af60-99a4e075a266@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 17:06:25 +0200 you wrote:
> Hi Arnd,
> 
> Please have a look at the MediaTek drivers patches.
> 
> Thanks a lot,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek soc driver updates for v6.18
    https://git.kernel.org/soc/soc/c/9674bc8805cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


