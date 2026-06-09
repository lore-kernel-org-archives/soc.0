Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB33B19CA
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023242; cv=none; b=U416Us9TTkY6kcUTOCBOpdqF27SWwXNG1tWrOX/w3810bSDNgm9Ke5AQxBrWiw50Ok0984l8FVy5Ujlk4bcNeuaaK00snxNAAk2GJzAMmDMDHluMnNPJo256RSyRCOUWPWsES+u2XR9QhOugicnMqkNjpaYMStz6pgLSOnuE7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023242; c=relaxed/simple;
	bh=KE4aqOOGLjLSq3CVZgrabjAjXWgk32H/al9DnlXauD8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HXhriLN+6HS0bUvfryyryERu+hbTcdoNvUv3QtOdAL7A4lPtmRwhd+9voxeRdgEtAVgfMZuZMSVuTlBN5GJE660fdqNPYh5D/w5ETl3rdcOVnb/dfjZGV09U6bLDZAhYta5ZeuUIpDE/7R9D8/+t+OHEOAzWq5myJIkh0xTc17s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRw3N0Ca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRw3N0Ca"
Received: by smtp.kernel.org (Postfix)
	id 98F741F00898; Tue,  9 Jun 2026 16:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BC41F00893;
	Tue,  9 Jun 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023241;
	bh=DgpnrKTCgPX7m+3U5ZW+xtwioIUio8k/BJQtEwekOrE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZRw3N0CaXDNII9dq5NUqK3NdkcMIcO+dtSVXAJSoG4oHuTll7twho21le8e+JA6zq
	 z/SNoOQZqvWZUk+B3S28e1lpjXAHWQch3bbmpHiAxFnV17nBTgQZL9hqmhncFgqRPP
	 yus70AXTQ9n24RZQrKEergXiA1HkR1/KNBGQLb66YgOIe3ld8Xtw+UNeLfPmjsku7J
	 OAz1K7V4GupNZQGBrdTIp2zOD5KZDHsHd170Xoil47SW/FU3YppJxHluf/BV8ToWZZ
	 FcvmJ8nWcm90P+AM5NX3GxXTUUKdu/iKPAZOC66Q+SNYTUe5DRtijpXxtpP95ErUpk
	 gKS8wgBIF9QIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198B63930989;
	Tue,  9 Jun 2026 16:40:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers firmware for v7.2 (also for thermal)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323964.2135346.17529440959749334290.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:39 +0000
References: <20260531115713.19388-2-krzk@kernel.org>
In-Reply-To: <20260531115713.19388-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 31 May 2026 13:57:13 +0200 you wrote:
> Hi Arnd and SoC folks, and Rafael+Daniel+Zhang+Lukasz,
> 
> This is pull with firmware drivers built on top of my previous firmware fixes:
> tags/samsung-drivers-fixes-7.1-2.
> 
> The code here will be also necessary for thermal tree for implementing actual
> TMU driver.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers firmware for v7.2 (also for thermal)
    https://git.kernel.org/soc/soc/c/c711f432e209

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


