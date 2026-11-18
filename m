Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017616;
	b=hj5pX5TfPzi59I84KEuW7UxhH4pn0lzseMj+9E/76CSqc20MJGUfySzQFX6zuYpn0rei
	 mAw1vh+mJUp1BuoG7bseMB4OKP+X7rtfgBHsRkJEfbQ0P2rRd74CeAwo7EOFSGSL2XEcN
	 6zKGlGCclqjSMDHavxOzMHpZXiHYv6etGf+WZ0UZCLggHTxUAJDVsmHdeV5+VKLITyRN9
	 GxYMwnnTF1lW6lRqTVvhlmPBRgl+ECnSgiBLH2MDHbGhL9Zcc3fEDL+l5YSxiFtqYrJYU
	 h4/CAM9ySN8iyJzUTK5zju/vgGPduY8KS2uVeLnU1GIH51s3dPQskxuaZG6hx1PFlZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017616;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=upNrv5lBLnBFXElOva3E1HMRnOMG8rhIh53B8T4E37k=;
	b=D9aWcLxm6tTyVqP39RNOM35Pl+77QmuokRT3Y4ARRPDAmPyQHmGMXCdK1e5pUgXm4tgi
	 FgQoDrU8co+1Q3prxJlXpjzJ5+7zy3mdoItCYcBXN21R7BqJJRmMSFjtLpaRxK1e6MNV+
	 Ewk5JxJTcCjcL/1pnWAwBtDCUymuQLL7KcXPtiniPZbDd2jegrxystccvaP90wFXtqox+
	 F4P51OK7CtBVxsf0hL+S/ir/DeeoF+G65uvYVOZEQHKyDqYcZgdE5yPiuiN/nnNrMcrk9
	 UIuWV03khb5qWkLjUhQ5K4dFSC/QFxXbyBYhx8VRGZOkDR+Xd4qt0GiurynZlCD9LfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K7gLAp+n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CCB606A32C
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K7gLAp+n
Received: by smtp.kernel.org (Postfix)
	id 9A6661F000D4; Wed, 18 Nov 2026 16:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834A61F000D3;
	Wed, 18 Nov 2026 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017616;
	bh=upNrv5lBLnBFXElOva3E1HMRnOMG8rhIh53B8T4E37k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=K7gLAp+n68FGymU34wM1dOtnDzfrQLakIHwcaYjgJ5SJGvNi4hlgLih7xQsJJAZwf
	 Twwk6okxeOgzd3X9X7X7dSqgokCsrceHHr9IUX3JiKr1uPjdEUgGY5tzxZvkMHVyh7
	 b2ybDITHJNl3qdcThubWu+kthCjoNAjIO9nEyZhGu+zbe4Mu3Gm/jnnRVqYmA6M7Hl
	 NJd9wgVbS8t0hi/4+h7cLT2fF0kwnwWHkBA1jMjMmmm6k5Oi64EUGkzakuG2rQh/Vb
	 7VnxV1kunN9Sof0dwaa/ecbBMHYhzuG1YfiGIZeH/tdSOJBF5DyyIi+d+8PdoXb0tk
	 9mIctr0JJmytQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774353808210;
	Wed, 18 Nov 2026 16:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom drivers fixes for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501761502.1802028.6043654563618286784.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:15 +0000
References: <20261114034550.878760-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261114034550.878760-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Nov 2026 19:45:49 -0800 you wrote:
> The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:
> 
>   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/drivers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
    (no matching commit)
  - [GIT,PULL,2/2] Broadcom maintainers fixes for 7.4
    https://git.kernel.org/soc/soc/c/0d131f80e45e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


