Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C22F690B
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760711743; cv=none; b=kPRL2zi8uhTZpzSFonBBtz3hWcpp9tHRlMUoeVrSar/fRBlxjiwGD79QYFAowaZuDXq+72zyG8iQtnwPLnE9zCDuLwX84oKeplP3Kcf7N507tsvy8K/ayCmHO1hC8EvJRiLiA5ymc9FEMbbvaiY4jCynt3gFv/cU2tdKdLiiFDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760711743; c=relaxed/simple;
	bh=0eXn1WPLiqhKW8y776MGhxQsSVCdwE3mGYcnDjSYnPw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RyPzvMifSrdcE90nMKpYUGOhnUnHsrDXt77l+Fw/hYAljIZzA/T8yDbi2R+flsWwDQorY4UFSUur4ofJ/lcRVv5xD0jJ+YMgb6/YHM96TcRJYRzIQL8wBKxidEJWoQL5YHpNhfWPcSrc7qPGGrFoNPSXBz2aajhrkPXAV/Ca5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUIiF3uY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUIiF3uY"
Received: by smtp.kernel.org (Postfix)
	id 090F4C4CEFE; Fri, 17 Oct 2025 14:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6204C4CEE7;
	Fri, 17 Oct 2025 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760711742;
	bh=0eXn1WPLiqhKW8y776MGhxQsSVCdwE3mGYcnDjSYnPw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZUIiF3uYe4GvFMYNS2vTDpoPhrN5/96HDsWHitl2wJMFlmOksxPScZi6oqn/RC+I8
	 JUlvJhfof7jq3prWC65rsKlCnVJTV/Z8XvAVU4U5frmeJAX5qcPIowP+uBG0dxYgrP
	 ZHtMVqgTWG9/bxa/+uvssOwom1spVlJO4rT4tTA5aW/XOb4epn+bwKyXgrj7mcF7yy
	 w8bPMCbBvuFljFlmbPiyr3n9Oy2xBEtkFHP3xireLUw/Mj4pEgoVdTNpTYUGId5AKX
	 /iDvyjO/u2i4t8Gw+uf0z+9XSa39nk2+7kytut8eDUEF1VyXsChwTW+EgjmyhfhbAi
	 dzIUQD+X+vGdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD3139EF976;
	Fri, 17 Oct 2025 14:35:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176071172650.2229063.6456454583384693146.git-patchwork-notify@kernel.org>
Date: Fri, 17 Oct 2025 14:35:26 +0000
References: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Oct 2025 10:35:42 -0700 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree fixes for 6.18
    https://git.kernel.org/soc/soc/c/d2dc8a386a90
  - [GIT,PULL,2/2] Broadcom devicetree-arm64 fixes for 6.18
    https://git.kernel.org/soc/soc/c/2f3471cc5d41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


