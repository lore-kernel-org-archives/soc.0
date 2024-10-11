Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108C19F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644354; cv=none; b=ToozjoEOVB7CWzwn2jCdlOxC2dTmBZUmkBXwb6o4+lejBqsYCZtms2zpt9xCUNzRWcqbiDNZxCaxrDVF0gqyBilnoQEimMkZ1nPfMfBdYKBdjYtpRoKpkZVOC/kzu7bIp1igC7YDCcQ450IlotX6od8pZ8Fzq4mbNXtL9qzecyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644354; c=relaxed/simple;
	bh=hvNq6soXOP4nmRgkPRnLsJ+Lb/yIsDqqUESCzHmYOc4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pYKXv/a9FQkK0CM9ZIEOFXj4F4cE5in063P1/CsV1h8Mxrye2urLSABlLd/Pm3rv/k8Id+xzwiHTYbP0agoSvETIs/nqGMmmJrOrX4DYvQNb8fnG0EhGVhTJZy0fvWu2O1CvMztbreGNcSQRouyG98+sfyvqGCYzekzNQdWnbpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtlWZ3S/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtlWZ3S/"
Received: by smtp.kernel.org (Postfix)
	id BE728C4CECD; Fri, 11 Oct 2024 10:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A409BC4CECC;
	Fri, 11 Oct 2024 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644354;
	bh=hvNq6soXOP4nmRgkPRnLsJ+Lb/yIsDqqUESCzHmYOc4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HtlWZ3S/70FC28AzSAsG0zrN7XVXMIlybVYP/g1j+OOpMLOxNiIMKha3tTT2V6uO+
	 luTd6srf2B3nePjgzfckV+WDEBswZhjvUW3qoa2VTTjAFDdxLrPqGaVWEbKvqf8Gh+
	 RGw51ztDoCsCQYqQ7878z+sxh8RX3Ehu0vg6npQ7W2pwxIEuW5YZhaYzY2vFZdBZsr
	 8i9yZHr/ZfWNOEnQf0Cfce+WZGlQ+NMDotZdrWU2/fz3vGO6ooLYd3GpcwIyKZXsq8
	 o7Rb/Sc/zEqpFKHGmf5hqOU8kWg84DSD/4QbhLQhM9ONUSUlvJcq8Jv9qT+uRGt7UH
	 0b3GHYMPt/faQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713F73822E4C;
	Fri, 11 Oct 2024 10:59:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: cirrus: ERR_CAST() ioremap error
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864435898.2676212.16533373058048819894.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:18 +0000
References: <d4b542f1d678796fbf094ebcc77295af3617bca0.camel@gmail.com>
In-Reply-To: <d4b542f1d678796fbf094ebcc77295af3617bca0.camel@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 21 Sep 2024 00:39:49 +0200 you wrote:
> ep93xx_dma.c:1354:37: sparse: sparse: incorrect type in return expression
> 				      (different address spaces)
> ep93xx_dma.c:1354:37: sparse:     expected struct ep93xx_dma_engine *
> ep93xx_dma.c:1354:37: sparse:     got void [noderef] __iomem *regs
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409202250.fPlN2Erd-lkp@intel.com/
> Fixes: 4e8ad5ed845b ("dmaengine: cirrus: Convert to DT for Cirrus EP93xx")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> [...]

Here is the summary with links:
  - dmaengine: cirrus: ERR_CAST() ioremap error
    https://git.kernel.org/soc/soc/c/5b484feb7a26

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


