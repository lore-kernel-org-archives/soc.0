Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317D2F068E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758250; cv=none; b=HYrUA9Z93Dxxc5uKXh6Csax392fLfmfM/IfuGJyV1mBmALlexUBH3brb1OeC/UmLtmWxXeCxOpDuckbWzVhjc3lnWHpCnYZVbm+1SBB6cJvAhz7rCVhyf3O4hjvgj0ctbDTrUxaQAehtOjuNK4s5md9wfCR26FUCgo8zoJT1Cbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758250; c=relaxed/simple;
	bh=uEAa7k8yku8ihnueOQxExoagwX3Rdwxwj/eTp5Qws1Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KkVx+oj/+kKjOy3fTmlpkVrVRJ4to3ckf6eZP1xX1Rt8VjNsaMVoKp1+gB68oCym6BH4cIMD5ZOO8YHGD7pCUG21NRn8X68d4V+gp2TTB+kXkqw8Q9YtZ3c+ayoBgTdKmPemtf3+GSWaCb5dQBofvy2VYIwSFVewj9/NZg5Lars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSvTQ7Bu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSvTQ7Bu"
Received: by smtp.kernel.org (Postfix)
	id B5A86C16AAE; Fri, 21 Nov 2025 20:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0423C4CEF1;
	Fri, 21 Nov 2025 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758248;
	bh=uEAa7k8yku8ihnueOQxExoagwX3Rdwxwj/eTp5Qws1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oSvTQ7BurHMaVJN8vhebWlQdEkE7EF85ItpGcSdeU/zCtuT2uXzte1VjZ/Rsb0sql
	 Wg7waho72uz7ucG5cnYAvCh7bmPjQyOFF600b1EwCrbmRykqTVdSmd6MwhvOW22Mvi
	 gDcuMGAo4NHVRry318zH5LkyDTLWAlyQTjlpk2bddLvH8WU3ORMUSVjRS7kwY/Ut3+
	 VHRnlk5yckH/pMzfCgDNe0G7f8LpWAk/NvpxLaH9aH1pzEb08vJva/xowfB6+0mUdi
	 BL/G02aEqKgLIlucZpJt3BVRgZ9zH4F1bqDy/eZL0RKpuHBpJhhonRfmKTqX5bySyW
	 EFr8tW0E6E5cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC13A78A68;
	Fri, 21 Nov 2025 20:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375821324.2580769.10714452862044215615.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:13 +0000
References: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 18:35:32 +0200 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 defconfig updates for v6.19
    https://git.kernel.org/soc/soc/c/8283edc8baac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


