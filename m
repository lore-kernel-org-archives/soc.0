Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB3A20899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422306; cv=none; b=i+Pg3rjiwmFfMRg2Qplgo/FNmirPnqm2pBp+jBK7HB3jGFZiZJySGTn23hbT63LHIAyAojEno1PFWZkjV/c4dOEBwDUfawLj0y83NOPTKbcbMF0QIIE7T5I8FkS5LMaOofKKefXy9trADJvcz4z4AfAV6YXJJm3SKqMzoOdpFiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422306; c=relaxed/simple;
	bh=Q7KnWyvoQmLt1Wd9j5uacABUccqOL5sLV/Ne1YQNc+4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PTAVuyZ/TiVDwMvqcNg1hmBYHo9A2HWpoQS7XPMlC4541X9J/A9jt7fKK3V1qcGwzfLYA/Ptekvihd/LUXr9LVNM9K4ARxZwTspzbWKPPG+PqwkrgYrVEVMc+IMvCpOS6LXHgaXQCsIkvZxBUSinhRwcQKOZGkyBHmK4gioI3TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ijr+qnef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ijr+qnef"
Received: by smtp.kernel.org (Postfix)
	id 54EB2C4CEEA; Wed, 19 Mar 2025 22:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC46C4CEE4;
	Wed, 19 Mar 2025 22:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422306;
	bh=Q7KnWyvoQmLt1Wd9j5uacABUccqOL5sLV/Ne1YQNc+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ijr+qnefYyqGPwzQhNgfwh0QokTENhwffQfMzi6NUCEj99IH870gqmkhORYEuhRrI
	 4yFIsLDNGSsPQAENyeNsbm+Fv9emEAW1IFuA4R3/DojnK176YChgQsTkciI43ihTFj
	 xR5bsCemvDztyjT63Oqf7lS/qcuXzg3uUXRODI3gME63jSGcnuSJaajdg21C2idJA7
	 L+6ds4mhxviTPfqen+GStsvBSXUVg6BXrLUVUzd/AxPridsYLbysGlc9GooY6PBuIK
	 FGxVcbUwFqSRArJinix8N2gJ5ngk1fBx61Rhgd2Fv71nRnGYMym5wA2OgPAz3Bikse
	 w6vWDPo99A3rQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C203806654;
	Wed, 19 Mar 2025 22:12:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234175.1211847.12954588368104950064.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:21 +0000
References: <20250312173755.975074-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250312173755.975074-2-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Mar 2025 19:37:55 +0200 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 SoC updates for v6.15
    https://git.kernel.org/soc/soc/c/911a44cf6ddc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


