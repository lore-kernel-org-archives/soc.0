Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93283702EE
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502643; cv=none; b=GiWBMfRf4zelyhoe5DnGwY7Pb+F8OIYo01y+ffx86BW25Cr1ExcR03eAxpuEvOIbPCig1IOU6YX+XMHXK3t+YpaWHS6z3FmOsJ+RysoqpL1KQDL9QVLIQsC3OXRPWqrWCWIz7qdf6K6L8kDQ71eReLAYWqh1mJGiDXTpBmvJFFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502643; c=relaxed/simple;
	bh=NzVILqHvUykbv+8NLzAlm7ZteBvx+6q1I4xg3fC9h/Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KW4mZXkUjpYCSe11NSwF3mgHMT55eVWY7wLEKlqIzEI7ZTlopjI8ETi0EzJGUJgAX9MZ3EvL0W9Q6pE4gky1yhqPz6/8BzlY1h24YTv/bduZfh349+bz6x/I57uKxTVkKC1DfKw2c2mZ5aufTI/fNxBOUHpz08Jgf6tb3YnUpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAjCwrK0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAjCwrK0"
Received: by smtp.kernel.org (Postfix)
	id 6651EC2BCB6; Tue, 18 Nov 2025 21:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287BDC2BCB3;
	Tue, 18 Nov 2025 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763502643;
	bh=NzVILqHvUykbv+8NLzAlm7ZteBvx+6q1I4xg3fC9h/Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LAjCwrK0vkz/FTMdkiavDKBC4IAXKZDhS1eYAsiJGuy3A0QweMs7x4fvbAAemCrTl
	 20UcOXl5DuM3J3VTNyBBaeplGowOHomLDHiTrKVsvSbowexLvdTPHIjCyGP3Cvs9Za
	 iOdgr8TF8HH2poNmzOOix22IkPVrBXWrN4PxuzLdQhu/arF7ubGk5apGnt4lf+r+5C
	 qYsCGjZadHKPAonxeUqWkVH6uhSqBjXWkaFsSpQyJo+ydsaVVoFWPGOhfjT5FNg6t1
	 BsUlYzREKKN3leq52juF6DRndSAvmqwUMVKjcCCSdYC1DRBA2pqqdxP1zAwB+nESzT
	 cEREvs/q0y+uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB02A380A948;
	Tue, 18 Nov 2025 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176350260849.116847.2636228050753200237.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 21:50:08 +0000
References: <20251118192652.316198-1-khilman@baylibre.com>
In-Reply-To: <20251118192652.316198-1-khilman@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Nov 2025 11:26:52 -0800 you wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Both used to go through Tony's branches, so lets keep things together.
> This was missed at the time when Co-Maintainers were added.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
> Link: https://patch.msgid.link/20240915195321.1071967-1-andreas@kemnade.info
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: sync omap devicetree maintainers with omap platform
    https://git.kernel.org/soc/soc/c/7a601324ac98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


