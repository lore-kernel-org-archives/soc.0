Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E13FB31
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660010; cv=none; b=SCCTrCiNsI4hpvGpTFF2oDshqgZIZZHtndClyMw7yUDlaAtV1iv+BYVYWcfARRtpPxdYraixtWkfcvb9mXmY4D8R7kN2k0fjjEBcqdCP5AOaEK2RIkdH6o8GTrGOm+2DWjSJghhGSH4WEL7QXbMI2uhDn/vZDwZqyAYQ18hDQzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660010; c=relaxed/simple;
	bh=IFxWsod9PmqL6nqirpjw7gKxyRhOeJb4mDjDtAOvjTQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ia+Y36bB+6fDV48Tlu8MWSQE0dubdVbnXb+fRtbyb2kSrDLocZMuKad5N7SY+Vy7v4MIZq4zi7tsarKd4AHPFsoKRifDcAYV8zz92N/3Kwq2peFhpFX4EvV/oK3v8Z0Eo3GIRS1pQl/DDbYdAxQEZBgfe776nUomEwy25HfBX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJPK5GFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJPK5GFB"
Received: by smtp.kernel.org (Postfix)
	id 1AF42C4CEF7; Tue, 23 Sep 2025 20:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B2BC4CEF5;
	Tue, 23 Sep 2025 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758660010;
	bh=IFxWsod9PmqL6nqirpjw7gKxyRhOeJb4mDjDtAOvjTQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JJPK5GFBGJhvBMaEPux45Px591fzIxLXD4TZtJoVMdOlZxf/OGoCaeXvB1V6PORaC
	 GuqiP13/ivRuK+Gf8MZ/zcVAGjZ9zbPRH5uAH1PrI2k0KwfId2hCGgqHZKP8zdwb8v
	 RenUthDwpYsi0WxSQ2jusjsR/Wi/xkLZpVbCMRFCrrvoFQ/Dz1ADRa5M8aCE7ZuwTD
	 e27TltLanSrjRIr1M36SpfuVFeNhKcLuH+e4nIBg8ovZ+W3auzSsGSFVxAchgA1RrH
	 W9vhIx5+sjMPRYoe0FY0iFgyANCbW3UXsahagLqxxxQ/WLszD0B6gxYqouQS74+M2Q
	 nyyK1bUfOCjVg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CA439D0C20;
	Tue, 23 Sep 2025 20:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.17 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866000698.1916197.13541689294110805432.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 20:40:06 +0000
References: <21709561.0c2gjJ1VT2@diego>
In-Reply-To: <21709561.0c2gjJ1VT2@diego>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 00:39:18 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below some more Rockchip fixes for the current 6.17 release-cycle.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.17 #2
    https://git.kernel.org/soc/soc/c/6866b7856660

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


