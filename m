Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE1266579
	for <soc@lists.linux.dev>; Fri, 14 Feb 2025 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545803; cv=none; b=nExCzJ1sj8JkVmgE2QcD+4+GEOoYMW0usFcZd1FCP+Jq/VwFW7hlEUP81i9bOcYOuQJZAqmPar9PF2tNZaoqR79RIY4vdxEpQJN6oEA+qT2vY6HG20u+G6TN+96ePYTwuCikk+RTQcdONlWomp0fUanHOavotUeTrFQvrziSoe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545803; c=relaxed/simple;
	bh=wt/pHxaZ4KXygpT2jILvlPsiBDITB9cAQbr8yS4BAfg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Sn4Ljm4DMy0ls8Kr6OBp7hctEdQuCCLiZfXBZ2vFDpGPUQWmQ8zo1paoApSTiyJ8qB8DPGHbikKObfyHajUqzPtagnWJXBl02aELzOML/HNVqrQisIpWh1EzgPH4GADqUvzuesPJKtoX/5D+jmize9ZcWP3dZe94P1mUJQJ/8Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qkuzqo0t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qkuzqo0t"
Received: by smtp.kernel.org (Postfix)
	id E1E02C4CEDF; Fri, 14 Feb 2025 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7206C4CED1;
	Fri, 14 Feb 2025 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545802;
	bh=wt/pHxaZ4KXygpT2jILvlPsiBDITB9cAQbr8yS4BAfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qkuzqo0t+5ELw6stKohIYc2uicaTY84roOHA+9ShBQz9gjBjt0svB0+JY12Z/XQ2m
	 0S82BW77E01It0n8r+mUqfnd2DHmFecKcEiRhIOfO80nk0w6JcY9fmeZiDy3D7U9s9
	 WvvHPjTjuQF5FFJQHDQSWcUmf4FTP/erZjTo77WFl3rx6MgRODkqOTAGQ0dkqFXo3x
	 edgTlXKGQD5EccqhXKFoBnxm3DKh6VdedQyt+pxJ0X24zsoWTtGkTPD18IEs8WqBog
	 zysk52wHmlFeWCqYo9b89HzlinMadvFlWB1SjOAHpEbPRIBKGw1WlVWQqZQRQNh+gF
	 mPr9PkO9ELFUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7138E380CEE8;
	Fri, 14 Feb 2025 15:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173954583199.1980112.14166027612629421937.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 15:10:31 +0000
References: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
In-Reply-To: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 03 Feb 2025 13:26:31 +1030 you wrote:
> From discussion in [1] and in-person with Joel, flip my entry from R:
> to M:.
> 
> Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: soc@lists.linux.dev
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
    https://git.kernel.org/soc/soc/c/5755eb0a8168

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


