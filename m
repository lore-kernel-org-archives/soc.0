Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327DF2003B7
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424985; cv=none; b=GRDTJmjc6LbwJL62qCPgV56F1DPCiBBUS0nE4xInvRbzmVI5L5OCdVacd5ob60OQOFcdCIbUogztwpAz2ecRuFE9th4EVAN2HvYHhqRpse2CbxoNKm9BzApTFLMg7Bwt8ds+nPrhFFT0MdHhijT5Zvbt7Gmu76oAji3NVl1v/MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424985; c=relaxed/simple;
	bh=4fbgalrOEeC+QDBHOKqj1EIZjqE6Od4X1w3rHXe1TDA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hyIESi+AFHqI8A6AXOzvqOxbicHPNKWAENz52BR7316d/WzQQ4cLzpXwjyAKlTsC4YFTsmitT4qN8PCM7qJZCH8MNE/E9xJVOYYge1jkwlcyIoOmsTrK6693VW7XqyW4EnDCSI+HTv5w4yhYVpCJw+A1Zp/dnplepQaaofjFfzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgOi4lch; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgOi4lch"
Received: by smtp.kernel.org (Postfix)
	id 25056C4CED6; Tue, 12 Nov 2024 15:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8F5C4CECD;
	Tue, 12 Nov 2024 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424985;
	bh=4fbgalrOEeC+QDBHOKqj1EIZjqE6Od4X1w3rHXe1TDA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KgOi4lchr6oJdWaYqbyMOwdyaUnngahdeDEBcnaPDOpclEkRunbmW00Y4eA5Gwuq6
	 Heu6fvwh+ILg6ag6ar79aEdApc9Ku2KGz0IBfo+NPJwJ5xv+7ql0NLpjYPV2wo2RFa
	 Clvs+WrIP48NcnPH8TAQ2grA3o70mPaZB/HSYXZjiHZTf65uWZLjXqgTP9boLqngfl
	 i0rdIn3vPxxzbdDFUC/cF7Wc4otTiQZdRvZOA3/qeTCB2wekGGlI+iT/RR9DTdUEk9
	 UuAlyk+iUxnDxhGKIa2b+0PYr57rCi3ErdOI4FhfLXA4ScPCk8MhHFV6DsZSpUoRUJ
	 BdaHivH9+PnEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B8F3809A80;
	Tue, 12 Nov 2024 15:23:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: Switch back to struct platform_driver::remove()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142499498.562452.17007419306467484535.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:14 +0000
References: <77ef3031ad2d27f4ae695245cf7f62b3f9dda859.1731397206.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <77ef3031ad2d27f4ae695245cf7f62b3f9dda859.1731397206.git.u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Nov 2024 09:35:19 +0100 you wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/bus to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Here is the summary with links:
  - bus: Switch back to struct platform_driver::remove()
    https://git.kernel.org/soc/soc/c/1fac9f8b7d28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


