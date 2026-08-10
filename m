Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255B42BE99
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380695; cv=none; b=tNIrwQ4ELJYRKB/8nZMLY5iGanJqVq/5Jj8zMfTev5SK48EId7vk/fFf12CchNVdXFVQGsMckWccWsA/eeFaz6FDmrBK1iTLKO0e1gX4d7lgtdPv5BrQI7lwtPsg5X//OecphK0A7mDCcMLk+Xe+u1eQ6fnkEP4vqgRI+eahmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380695; c=relaxed/simple;
	bh=E5rX43Om20uEgb8spSxLWaDA95l3T2CuqbkNDccn80U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LXNF4BJoa6nDS7Tp3gC9gXF/LI7CDXvJH2bKEhqOnYKcAmfcK91bNlqEbPHr4Gl4zhff2TCalr85rNIZovUhesFwmgsYewokkGugdzmeR8Y9c8zf9dlHrxN+t5DoicOrH4wp38rOYeY3stE5XYV5pdNKkIoGTHO+hNGYSVlj08s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJHWTjx3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJHWTjx3"
Received: by smtp.kernel.org (Postfix)
	id F2BA41F00A3D; Mon, 10 Aug 2026 16:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC141F000E9;
	Mon, 10 Aug 2026 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380693;
	bh=l42WR+sPyKOK94LjwdfnCnCRHps/biZ0sTsUgDWAb4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eJHWTjx3f2BZA2v1ttOgJDWDXsMPiQ4BjyGw3qRXpSMMRc2cFMBxrnqgXTuubsRDQ
	 zqGIulst0tSIbicdSBUEveiNfkyMXVz32jD83sTa/kBRSjySZEnupDXWoovKX6nr3j
	 qpFcvMmTBYt5ZtshmcIk4wmDvdngAa0pr7vv0fPfrfHs5lagit+KCGXYouEHlYwV7g
	 zJWO+nre2mHZYiQqFDZbB05F0UvC3QHZ82tgOcJ54cBQY78m8gR7Qe+8JDfwRS/u1z
	 wsbbwt6juFemSRZf3TARHmLBqpxScdK9yFyZwXRJOUFl+KbuooNP85CbNGWsTrRnIJ
	 NXerNrnRTMw/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D099739253F2;
	Mon, 10 Aug 2026 16:50:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: samsung: for v7.3, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638065038.3872609.3554797344599354293.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:50 +0000
References: <20260806081903.165005-4-krzk@kernel.org>
In-Reply-To: <20260806081903.165005-4-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  6 Aug 2026 10:19:01 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> On top of the previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: samsung: for v7.3, part two
    https://git.kernel.org/soc/soc/c/ae675a2963ff
  - [GIT,PULL,2/3] ARM: dts: samsung: dts for v7.3
    https://git.kernel.org/soc/soc/c/c20e8a003cf0
  - [GIT,PULL,3/3] ARM: samsung: mach for v7.3
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


