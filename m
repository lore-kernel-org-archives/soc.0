Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E013C3F4A
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911259; cv=none; b=Ahb8qyk4ArGAxFevd1zq+Y/raNOfFOi61VGXdqlWGYRplruCxzPBRhgeblVoJ8qvrmBv/35cxXoJnCzs8MCG35zk6auyDS3oRtt5l0n+aHaWoq2UtMzKLPR9jWwBSEXPVYzMrMTIWAb+8X3T+4/W9qphi6Do0Bn/xlAOM3ALpyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911259; c=relaxed/simple;
	bh=MibykcvDVh/LTGs7z+JU41y+erxfsUBIJa+/PyegoPk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aZGHVymjlGkaRGKKJVd2g71HhRB2MgQW7zwjDmHcaAYzQAraRomnTt0Fy+2pQoVEV6S2jxMKkiOWgbe/7Jwy3OuAPbERzkh58bfhBtPscBBVQK8hw/0ZeeAmnRlFtChRARFCjzxfH2PJR4/aGe41TQ4LXqbUQYcDojNroNk7MT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsNeGPG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsNeGPG8"
Received: by smtp.kernel.org (Postfix)
	id 62D841F00A3A; Fri, 24 Jul 2026 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2FD1F000E9;
	Fri, 24 Jul 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911258;
	bh=IikDLSSMjAPsjX/G5Rtd1RAFUxHbgaVuow3wZ+6tKIE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dsNeGPG82wfs3ctON65pOykNhkzkDuQJEdSviqnE8NhPhi77nmkPaWJXcnl0jNFuN
	 UF/7+L1KaZ/t81Ia/pYxLd9KInTrU3jisZvn4StJ0teChpXGTHPs6nkto3TFSNWFIy
	 sYBLNojNcFSziitdNdrVL/Uw/7DiMe7x7g0YV9t8mRW5MY47a+xGVBJ2jsF0UmVyEU
	 3niSKDGpUCYESsEbemk+5b5koUrZnI/4ZmJZLoWH0viN2RCD4NUZyYUm8BWX3eIZkh
	 sAJeGczpr9LZmMy/lZTjFa+sNsr+z8jFHRiRblgH5QX21QNQzZ8Dy/4ZyS14zFdjuT
	 SgTRHwvJVYjug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D098739263A5;
	Fri, 24 Jul 2026 16:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ixp4xx: Drop the reg-offset hack
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491122538.3229915.13791260146832520528.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:25 +0000
References: <20260724-ixp4xx-dts-fix-v1-1-09bf7111e94e@kernel.org>
In-Reply-To: <20260724-ixp4xx-dts-fix-v1-1-09bf7111e94e@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jul 2026 09:50:04 +0200 you wrote:
> The reg-offset hack only works when the IXP4xx platform is
> running in big endian mode, and it is there to byte-offset
> the byte where the serial registers appear in the BE config.
> 
> This is clearly wrong, workarounds need to be in the
> drivers. Drop the reg-offset.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ixp4xx: Drop the reg-offset hack
    https://git.kernel.org/soc/soc/c/8a78168e98a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


