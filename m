Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017613;
	b=4t1OPzZ5CxYzTJurw1OrksPP8lVYICVQRow/TkeoNMU7K6u81i8E8AqO46VoSZtmI5Hy
	 xV9OJd6JMANLW5pHr5dBhOxtMQgw9fGM6b7kz7R2wR3eCWAGcys663x1KLjcaIrRzHFCV
	 sNLTNBuZe5gT1VEoK//c0G8wHvaCljrIixWp7YsnLYtmKsE7dSrCoLbP0ViiYBP0NRP6l
	 rjN3qqxqfqcFq/1y6eppvb6MzxeAnDuDEHOaeRc8brQsT3ZpsleUFAH655R7Jr+/MQ3UV
	 woy3ir3pwHl8LQgTZ/OoOg3GXLCf7aVToQDUVXnNtpZ4ZmdNVYhtOVRT7yEi1ABLhug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017613;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=wbT5BXah9sU1HOkjkV8xoJV+0U1p2y7Kt8g1QcPAm0g=;
	b=PubvsZSM7MByedFbiAqYTJFwhvCnpZERhSAsWHDNsbcZIy7bIqTSRpL4hZl39mhkbLSI
	 phpN8bmdO6DoZTaUuiJgEg6JK6dtgBoupOjwVrm8lIEpu4dxW63SitvEzWGZZVkhA2L7N
	 A0GSjEZs+8ROmwO2pBsKuVwuy5KHSE/HPVTFrRlPVRj2dhVTbccBpnI0iMhFVB4Ki1XmB
	 vgXp0t/Tl0l4Cx6zN3pO4G65PO2V+kwVX3A+3wIx/3xpeBiw8rpW4rUM6i+Vaiom7OJBb
	 2P2PDsWaedyDR5yy4TualqZ00Mcs0RnewZhI6KkgG1/Lhcj/BJlUyMGY59l96EpmwvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCcQ5hNY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB01606A32A
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gCcQ5hNY
Received: by smtp.kernel.org (Postfix)
	id A053B1F000CF; Wed, 18 Nov 2026 16:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874041F000D0;
	Wed, 18 Nov 2026 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017613;
	bh=wbT5BXah9sU1HOkjkV8xoJV+0U1p2y7Kt8g1QcPAm0g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gCcQ5hNYgt7/joZXBZpc2FQL2VJEKP6o+g6P9Jk3kipvzZfJ/WeD2IRqki3iO6Jnk
	 dpDM9QC4L3UdaI8sgAAFfQlwl6oVn5NtqpWjKi3c7RvrMlpv3HxYozr+jKlGgKvyru
	 Rn5yA23V6cI3l9xlJtdG7fZ5jXqzXnfilJipFrsbQFrtGpvhz+ed2C6Uv8U91fVmZ2
	 II5ARuitnF4Q3kk9TV34LU1AFruqlUBCmGM1TqaycEhhDn15dDoQzvNFBj3IFdip8e
	 LyTcbUgyuo1pEx7/C96EXQ2JPoLMBG0nEJ474G9NfChJToeeX08a+asKTNMaVLLFTp
	 AGa9yBF9Kw5Rg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7742B3808210;
	Wed, 18 Nov 2026 16:00:13 +0000 (UTC)
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
Subject: Re: [GIT PULL] firmware: arm: Fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501761202.1802028.16433390312692946776.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:12 +0000
References: <20261102175440.1063545-1-sudeep.holla@kernel.org>
In-Reply-To: <20261102175440.1063545-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  2 Nov 2026 17:54:39 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> I have included one dts file fix in this, hope that is OK. Let me know
> if you prefer to keep DTS separate even for fixes.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm: Fixes for v7.4
    https://git.kernel.org/soc/soc/c/0cd364ac0a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


