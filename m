Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312D3DDDDB
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106421; cv=none; b=WK1OJG28wEq6am2rUdaazBH3ZLkPT81Hb33yTSEl0xZzeT8BV1d5FIQ55XXKl43o3M5RugmksCiTnqB8tEytKWQy+a4a/sV1SlRVwRkZWdW1MLWP4Kt+13Z0P4D/jIphthtrBnLuXnQ/QOkBzIrClsyKgZJCS1WHULQVEO0Jp+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106421; c=relaxed/simple;
	bh=BEqMO/Fo5gSvXJsMrhA8nro3HqvaikeqmCPtiABIQqU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jzkFEfnKP0UPRDpHeWw4zYeAX2RQ/NBh6R3S1kkJZo+zlBMTCGQ5pKVwxYl26Ogc07SCHyvcoaoE6YgtiUqlhZGrYR4Jlo5J22+651Tos5LUKXRrMtrHqF6o8LDJprZEre1wHD6D25vj3EG+3B5ZcG7DqeANo/HkJZE03opSm1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzknLCit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzknLCit"
Received: by smtp.kernel.org (Postfix)
	id 987B01F000C5; Thu, 15 Oct 2026 23:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CC31F000C4;
	Thu, 15 Oct 2026 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106420;
	bh=8Fr+rcKN1+xurY++e62cef2BwUOoZleKrVRSEdnnTwk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HzknLCitP7kFw+oFt5fxelcfgzTHGifyh8F3FMD5NOZoReYVK7NG+0Yzr090ywMel
	 hnPhbGcjsHNPZTytjWjd+B5YcD1BZEmLVwl/neDwQWMGVjcKOy4boR8LyMnf3OmyxA
	 eDwLAxZbvjGrY4VwhMHpEaMs8qkGmesByYLrD7cWdcUZ4zthL9mFITyNlQAFj7qLRI
	 4PA7i5lz3Suv7omzE47A6L+XiHX3bIGAmFLp6wAimA5zVV4A3hc4w3Mj0FVWsGUOKO
	 a+RWsNcflIJMbPge2oQArXSerg+2IuwXCvZKFhEY6oDHA9I3yuhxp4hnydFbg9iVwZ
	 VG1hVvwEtBvxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 775183808209;
	Thu, 15 Oct 2026 23:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc: ti: Driver updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210641901.4150336.1740456623115162670.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:19 +0000
References: <20261005124915.e632elbacgr6nxgs@anyway>
In-Reply-To: <20261005124915.e632elbacgr6nxgs@anyway>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon, 5 Oct 2026 07:49:15 -0500 you wrote:
> Hi,
> 
> Please pull
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
    (no matching commit)
  - [GIT,PULL,2/5] arm64: defconfig: TI K3 config updates for v7.4
    (no matching commit)
  - [GIT,PULL,3/5] arm64: dts: ti: K3 updates for v7.4
    https://git.kernel.org/soc/soc/c/6df65b36e1ba
  - [GIT,PULL,4/5] MAINTAINERS: TI K3 updates for v7.4
    (no matching commit)
  - [GIT,PULL,5/5] ARM: dts: ti: keystone: Updates for v7.4
    https://git.kernel.org/soc/soc/c/4c2594be6ef3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


