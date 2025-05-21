Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2C5221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848029; cv=none; b=SqrSfy+dicOzqemoMqr8bE5m+okecL23pTPzZeuUHPlz3ZfVafhFV88tkxWPxt6K8BdHAL/Sl6/QhoXwQfaYOG4rqquW9pm7mdZrEu3UQr+X8uDehT55JcMgbJw3TrxEWB26TvVko6EMTVLX22bfLqQLyx6NljM8CFC9uBE7tNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848029; c=relaxed/simple;
	bh=xdpt9fpxBkWS1Puyg37bqVk0y7m1AlfKqACNf/SrCUQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZIn+dBM6DjokdCE/SanmV0Ncdv30ieoIExm5B4Y9NWaf/1WpyoSM/RaWPbOF8vrsGE1qyFM5r0dMSqjPSxtnnp6bxkhXY+1q6c8BzImVjvqeM0wEM257kKZxb2Zj3WRU8qq+ahYeTdFamJMbos08Mqe/q4CawNquJIdryf7Ipm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiAu8RhI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiAu8RhI"
Received: by smtp.kernel.org (Postfix)
	id 8EFE6C4CEEF; Wed, 21 May 2025 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E48C4CEE7;
	Wed, 21 May 2025 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848029;
	bh=xdpt9fpxBkWS1Puyg37bqVk0y7m1AlfKqACNf/SrCUQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RiAu8RhIUR86IXYsX+MrzK04MemhdtGSrM9fWm1iw3MbPXzDpZDPz2OanAjUPOBsa
	 wPe9YdYftMY0m5j+ibjmhZZA9vxCEJbwXmzYfkN2rJQvRRu3H4maZgvvN94T3LaO5G
	 y8ULMZGMTZMgOeZoPAgdwPsJcLRBJpcq3Vffl8C6PDwltI9obnlnGGsH5RFnxBKi7L
	 VoS9Qtmk0sgZ2xMwV2caz+glT/jYmd5O80rUhSXdr9xptJ5cULRYhbxSow6ua4rZbK
	 Y+toRTqFJjuMMRADhOIbguyBTES1BnWAYL2T0g8Hhj9VimEDPt/f51S4CdaOjSoZQS
	 lcxg2ZuEs9HZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7137F380CEEF;
	Wed, 21 May 2025 17:21:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc: ti: Driver updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806499.2163178.13635287223308680859.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:04 +0000
References: <20250512144719.mpkyw2jbyzslb5hy@yearly>
In-Reply-To: <20250512144719.mpkyw2jbyzslb5hy@yearly>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 May 2025 09:47:19 -0500 you wrote:
> Hi,
> 
> This PR has a couple of minor checkpatch warnings on 75 characters,
> which I have opted to ignore due to breaking URL or warning message.
> 
> Please pull:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc: ti: Driver updates for v6.16
    https://git.kernel.org/soc/soc/c/50c77033bced
  - [GIT,PULL,2/3] arm64: defconfig: Updates for TI K3 platforms for v6.16
    https://git.kernel.org/soc/soc/c/e87c7478a31b
  - [GIT,PULL,3/3] arm64: dts: ti: K3 devicetree updates for v6.16
    https://git.kernel.org/soc/soc/c/179fa6e8c2b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


