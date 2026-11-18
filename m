Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017631;
	b=aYDMXRHEdpE6ge87rCPT4v9379AOHBnEmqbToTnRgG7tQlCiDLRNsOEfN+mxeJD86bmm
	 ktMqSvUy3mehjS+ENbvgovR3DHqyWxu81i1Lo9aZagW2JsILb4yoh83ON73nrM/sk23qZ
	 G31WsZhOLV7iIDE3obkMiYmoD9RckUC14jg+t9yIi+3JLd7jNtRHKT+tHqZlNuyJSXj04
	 MJJ2Cc+1qJye2bc3TYWRPoYdeZbnA59+Uxdmi4laPZQH6Ac/FRsvShHeXQyq7dUmxCuKF
	 52lSRsPT2Os+TadmeM32covGMam2Hkvc1SAkn8FLwMdsqao/ARMVJbyVkJdwKuyJgUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017631;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=7ATgl9u8OKvN0QnbVIdfU7/eYKxg2sobQXRyvUSgNIA=;
	b=J5/XFvHYmak72AvkAEYhggoSA/5F4Bs9gU9pOUv074/2XSqwVREzOLgpOKCId5FrjxNd
	 v3CLJ3iv+62XmXNSs7Yl7PN2Qhewdq9uFlA+J/721nCi9Ehca8gwNjMKxm6tBW7EOzWy8
	 SNCki8vN7Wp97P+Ik1tKjj+DW3c8kJrYyTx2trp5acSKAgUbEcoyLQvfOcwSS/qKOifRC
	 6whrq7+SWJW5vgk0xjXv17+xjy1Z8BtbYXUq/IRBRkwCKrURGQfnD3ss7k2oI1ltZw1ih
	 gnXdCetSjmCqhGP08I2SvACkC5NkQNvfHN/gVl5J6vL2ix5IEuHOCS6tcM8JNpw+5yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYMQW6pb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D3C606A320
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYMQW6pb
Received: by smtp.kernel.org (Postfix)
	id D50D81F00926; Wed, 18 Nov 2026 16:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECFD1F0089E;
	Wed, 18 Nov 2026 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017630;
	bh=7ATgl9u8OKvN0QnbVIdfU7/eYKxg2sobQXRyvUSgNIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hYMQW6pb+d+HYhL8+ankXrPDeNjESoDHv/mt0LAT1E5ciloCIzdirZ0H6zNrwvAE/
	 pwECij0H9JQjTU7aI/qBUzYHFO4J9ACvC/s7Z+mGHg3Gc/hbVPB4xJ0UYf9gfm+k1j
	 jTY8oJfiT0nGWZQr+plnf6Q+yx4N/ESBCNdVyHLoxRoMnJGjBu/Wtq5po4mqVwnYSd
	 SIzIKHqqX7fjYzrxcX5PD/zKUew8/CeYHFRqQhUCBZuX4HR0kPqLTQcN6EkoPqkQmk
	 sSCSdEaB79tfE1qqWr2I6D7fPdi+I/F/+WNcD8imzVm1ntm354vgC9SUHvr/LnPeQy
	 5FNG76B+OnbzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B42E13808210;
	Wed, 18 Nov 2026 16:00:30 +0000 (UTC)
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
 <179501762924.1802028.12323919272170003059.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:29 +0000
References: <20261114034550.878760-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261114034550.878760-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


