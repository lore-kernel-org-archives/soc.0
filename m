Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF83DDDB9
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249413; cv=none; b=KMnE2N6YhyVz4VW4Ze91cKqEAP/sBBpTkLsnO8cE1pAoULUobORvT2OQCGrmeC2yYwduXSAn94FRwqyMRrwlHWJC8cgTGGJnLMWdz0UCeRIbUviVVI+yQ0peoZt0SWUlClriIEJX8DTFb4aCST5NQq/fwnh6IA35wKskXfCuPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249413; c=relaxed/simple;
	bh=IGoQ/9wXlqfggvONg7y+KPZgdnCj2TzBq8bcEI402b8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QzwgbWPx/V3DiiV6r1cr2/sUjfwtUmvdG89HQwoH4iUU9bbmwi6o7aDrc9e+DCv+cSpWyosIssFPcOuJ5Jc0BLISJyx6OH7nfO0IYbsUJjgrTdYhgYHawqUeUK/gPZ/Th5lo2+vSYDG+DZmOnzlBbgyYqNak38DfSqCKrGaG9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBXkaXpn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBXkaXpn"
Received: by smtp.kernel.org (Postfix)
	id B51321F00A3A; Fri, 12 Jun 2026 07:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E83F1F000E9;
	Fri, 12 Jun 2026 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781249412;
	bh=ikVPPlcg2W5zbW3m2NfHn0eptIeEBoIXJRajU3+8loo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lBXkaXpn7P/FPl6ggWFsog0DPrh2GEYtzSnflP/VEtDQF48D01p4wBzKVX60LPIbt
	 TJ1BIQNQnxjtQnMWMIk/iEBKNd8CCCEDON3YCTH5TOQSSYu30PyZ7DVoxqTn7bGMmF
	 oxKLixVRQZkIjeqExMmPiMZrRz75Z21uWmc32f8n2fRGkNVBjRUMFvdN0N014CiaHb
	 RGUluf0ujSTOwJAP9K81Xj3WCAZoga1eye5p6UNDEIl9D2oy37Gr9lGJkyVaNncmjr
	 7AF7m0bdcLw97JOc0RPCBB/Zd9LiyKxvih5epKA+E6u0BPYVvmNORH1Dxw8Ps89kvf
	 z9W7H9h/W0Gsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D08523931000;
	Fri, 12 Jun 2026 07:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]arm64: BST C1200 eMMC defconfig for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178124940938.526649.16225907801233128596.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jun 2026 07:30:09 +0000
References: <178124682783.542254.4976938369452006836@bst.ai>
In-Reply-To: <178124682783.542254.4976938369452006836@bst.ai>
To: None <gordon.ge@bst.ai>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Jun 2026 06:47:07 +0000 you wrote:
> Hi Arnd, Thank you for pointing out the mistake.
> 
> ---
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: BST C1200 eMMC defconfig for v7.2
    https://git.kernel.org/soc/soc/c/cccde8de2c72

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


