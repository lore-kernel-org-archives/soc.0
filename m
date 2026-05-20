Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30434678E
	for <soc@lists.linux.dev>; Wed, 20 May 2026 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309000; cv=none; b=pkgpMV12lpPxDSaGo7ZG1m53aGWASSXGddPt4Pikf48KgmfUcTrWdqx4nEzMjZJCPaL0XKAYZMCYcttVLmfjTMbU8WALPdlDUPkpHGm/LNFJLQCkypuaJyecEANEykxZYvOSJ9rvJSpYYcpt3RJwf9dRtnZnz43Bnqxe6e/v4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309000; c=relaxed/simple;
	bh=6ssq82qmoRD8T4A3lkd/9kUbRIjFDKkCZW3TNkMIbwE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r09zqCtMJ5kw07z/P1sKkGGJum50kN8VVPtofJaWBI/Yi/CJNBE4KJmwmXP3KOi0fCzdC9482VCZmwqC6RzToDlFoutxvVyzFuMasrme07JW5xblRE3wGoDuNx0LfHZOHVGMc4Ztru39hbaKbgNGcOQX+aMNOTFyT/j04en7aAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6qk1jed; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6qk1jed"
Received: by smtp.kernel.org (Postfix)
	id 236781F00A3A; Wed, 20 May 2026 20:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB731F000E9;
	Wed, 20 May 2026 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308999;
	bh=aRimEwabt4hFr/TWiv4QFKE0J1QSBWELXzp5SThCZug=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=W6qk1jedlJc/xL/7Llden/pPVG34r4pgfShwipFm5bq0TwcvPxNkWXgi5EVaymLME
	 e9iJO00iAfbtr0HShQg7XNW56ww+h+tbfPuPsv7JBcU+2UDcfUDVtg0vzeUSg5XM96
	 0Ku52BFX0M5TZeZeFJqucSrMUkFvqcEpPDkIuD5aSflFjOvNXltOtIKCSCdG6zJbQq
	 SpozHHp4x2WkSG6SFWRNnstvolpTy868kE/+3ntBJnvZNseTjEuq+6Gk/wSkaalpQi
	 Ctnri1WFyCsuG+PjPKLNRl71FWzH1Bwrn/Jd4t3GvP6dv7CZOq06QBOq8Bu6AjxPSf
	 Mqjq75UipNLiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 991FF3930BB7;
	Wed, 20 May 2026 20:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: zte: Add zx297520v3 platform support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177930900952.3744642.15319778564835310380.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 20:30:09 +0000
References: <2114249.usQuhbGJ8B@strix>
In-Reply-To: <2114249.usQuhbGJ8B@strix>
To: =?utf-8?q?Stefan_D=C3=B6singer_=3Cstefandoesinger=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 May 2026 00:19:49 +0300 you wrote:
> Dear SoC maintainers,
> 
> Here is my pull request for adding initial support for ZTE's zx297520v3 SoC.
> The code has been reviewed on the linux-arm-kernel mailing list. My ultimate
> goal is to run OpenWRT on these devices.
> 
> This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
> and sold by ISPs themselves. They are widespread in Africa, China,
> Russia and Eastern Europe.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: zte: Add zx297520v3 platform support
    https://git.kernel.org/soc/soc/c/b4e49a4a38fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


