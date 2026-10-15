Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3A53C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106430; cv=none; b=Opx8nhpN9MXcbkEF5eLgXcJZEcTwHjQROFw2Gbm+mBNSwxSL8C7QXAEhtKdC/MW6+FKHViQRDWFyC26b7m9CHn9e5DxN2n2AhQm5KsdZx0X9+VUNqvISi5n4KkJEUrWVRi9R+xeMVjbwibdhrguzEEAO1zc4fGk920lB+57vC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106430; c=relaxed/simple;
	bh=PXQT/osKEPhjIbcOLwTjB7h896wrB6ndqvaZymLmVs8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mCBhIqoklWATTHXCNse7d1cuyptPJzqARPFfVUnoiyfC7pYSmUHDrqXTTkyAD7mLqEjgp1v9yo+7nL4wvH8tbn3pTOv+pLV6ssxWMqoO5Oo1s7xT/Y5LN/QSf1LNBb6XF6dv0W0QaBPKUHbaZLH5j+RTw2Q0FojWS1pGdrYXvto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2GT1QGC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2GT1QGC"
Received: by smtp.kernel.org (Postfix)
	id 979911F000C5; Thu, 15 Oct 2026 23:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8196F1F000C4;
	Thu, 15 Oct 2026 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106429;
	bh=GM15orZNrw0uP93TURuhVs16Jfsr748g8KEpYDeNxJI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Y2GT1QGCVlkp/v2L2AKKVNugy2OixVPWBwhMbDXK8TZpKi8bUY90GMMgy9tqC1Sai
	 RA+pixPMUITja15Gf1GKq6rTYpm2NjDL5SuT+QuxHh7qh70WQyH3ttS4Zn89b888Mp
	 5jV0V3HQyCSgIsnf7bxofWhjUK2ArJfJ0aHENs4BO6SEj68x7E5NHDuC1543OeaLcp
	 Tm7/WPHhbnIUE0nChNmylHkm1IEKqF5O6jbn2oSLQ/ZwuEXMwye1pNGSXIhgJ8aAQF
	 hcSN17/VRopM4C2VC71W1sVLq7DL7shHWEwbGmQvOLjK6ZIXVs9xGIsxT44VjCRTtN
	 EWVWXYL/cM9PA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773513808209;
	Thu, 15 Oct 2026 23:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 device tree updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210642801.4150336.16843294961219074727.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:28 +0000
References: <20261009061323.29781-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20261009061323.29781-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri,  9 Oct 2026 09:13:23 +0300 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 device tree updates for v7.4
    https://git.kernel.org/soc/soc/c/50b3a2fb236e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


