Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019406;
	b=tyveaSNce9g78HyoSSkVbHwRyL4hPEWGQ+6xwEvuXFvT2/e0LnpCEoqha3i8Nc+KoUbo
	 1pPoXSa7IvVnZW0eSiYFbQ1KkFZis9GQi0lwY7nt4sn5itx3SWS2bCJPl5XhhnQb3ZeKr
	 83E1rrKx6xhKTga3tkkG0+OTVjppAPAF6u2jkyC8xPDl0733o9WWh9q7J3bXxkK2YiDfX
	 /OGEwn9Fus1/GyTgog06OwWNYxXq2oVcryuR9yjaSX7DKwPgbBzZj4H9juFhukIEbuBzm
	 jdoUnZ2VIdVvkMn+fr9cnrmPNYLZPqUEJPqU6xI5jDjWQZD5tIH5AA5BP8WpxNcLIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019406;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=gxBkZosCFkkcggFGFbr5mPsWGFq/roc730xiimXMpW8=;
	b=03qrcFtwBGPWbl1M+7KE4ez6JzO42ewJSlcTsfzM435nQ2Rx6y7rWBN41VCeO+5d9a9u
	 AdOR9sSiOFkoVt6LD8yhf8PGYfO/cGt+tIUyf2TJYL7zCx/YraFe6/nibnLtfWFAnjnTw
	 X49Km/81wwAxitx4AHWy/fRhEr2PoObOikh38b5Tj/nVWsELBi6ikHCmYlmGAgLSIQhvA
	 STK6lPyfKvvRN44J8NXGJ/G0K70AT0ILcXOYY2SrM9duFNTGZ4OxgE3cnyAYBo5Lo4i7y
	 vgj3jfITXq8aTimPg/cWCVLPyt5KShzjk0KR0R3bnNV+U0e0Fp2F09fFAdy4uKq8L6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=offtAqxP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E96A60A3819
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=offtAqxP
Received: by smtp.kernel.org (Postfix)
	id 200B51F000CB; Wed, 18 Nov 2026 16:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092F01F000CA;
	Wed, 18 Nov 2026 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019406;
	bh=gxBkZosCFkkcggFGFbr5mPsWGFq/roc730xiimXMpW8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=offtAqxPhYK37o4Y7UaDuTBBZVNK4VYapQdkaNtlC/iZiv2UmORhD1I/FerfMwiBX
	 FBOHR+W0nsHr4qMRfAfb9sDG6FEvvu/pVqIQMlfDusZr3h699pe6xMEb2pLmkDy18p
	 0yhDDDrUiIKqOrzIF2GXDBsL8zsSfSVxzT04GaYvFvKNrkVaOW4V112BYszCLKMgAM
	 SkUY4zoV/avbNVhoYyCXXDiC60K+T07J32GUpeeAGNSwZz3H3gfl+jaCyfHzXYGmyc
	 6CuBboTxUEL7/pifYhCCP42Yf+sZEFdoX4xse3AO6v+bs0gfVkHO9ssnkQheplNPe2
	 aE9mE4OADQjgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14083808210;
	Wed, 18 Nov 2026 16:30:05 +0000 (UTC)
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
 <179501940479.1837438.10107900021833140545.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:30:04 +0000
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
    https://git.kernel.org/soc/soc/c/5b425110d843
  - [GIT,PULL,2/2] Broadcom maintainers fixes for 7.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


