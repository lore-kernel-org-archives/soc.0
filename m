Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276A2FE581
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662456; cv=none; b=DadefUDpGqhQyKASmns5kF2tPlnbLaD2QH/iIjouDrL0sLzW4b8JLa2Uu5K8XLEMHqfnLADRYA4spLYbqWhBbxrl6Th30Q9NrMkHs4vnTXADkin/Sys300cwMOXStYG7J6ROOqqKBX5BdPiWbcoWh5laVMLWc6BI4ybmczgHMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662456; c=relaxed/simple;
	bh=Gl2Qx5qr18vbNh2Q4r/9w+fxkqo3cIlScdJu60Ed3FQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BaaRJJQV94ieuTSC0nAE5L3I0qQerrcffGurejyVcI+u9v70tz/SHGt8ovzQdgOlkGLSg2hsY8lPSQqGPgv0I98NNUyCviqhaQsvwNhW7/9yiYmVB7TVCGwmNabtPp1Ot+1PPxjOEMqR1intGZ50xK7pRmqYp1gPdH+LgMLWneg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ro6K0C1Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ro6K0C1Q"
Received: by smtp.kernel.org (Postfix)
	id C8F7CC4CEF5; Tue, 23 Sep 2025 21:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D8AC4CEF7;
	Tue, 23 Sep 2025 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662455;
	bh=Gl2Qx5qr18vbNh2Q4r/9w+fxkqo3cIlScdJu60Ed3FQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ro6K0C1QOueXF0CRUAzp4bke9rft2b2JRyFuz+bErnO3eMzKHpxFZ+8l6quPuxRMY
	 W0+sWtIGhhn5MRfOLjHP9maib3KFvj21IUvrcSMDKBACfDMULItRA0i6Pkzobn1XnQ
	 UkX//ZNQllhC8hEyiFPrsfOGQ1qU+ZJEMQbLAfKSnTcLIsXAsoY0nGDdCCAb1EHjiL
	 uVaRpBzJweioeTW8XarxFgd3C76Xs8m1y/pcbCXgm7Ho5uKC2D3YPGuEvfsM3/FXLg
	 iKYohJgufo+NCO00RtRwmNKIeIABPZt6eB2WX6PRXgYYtGVcpQtxTX3I3tAtwB/7rY
	 1IrMedK96ivSg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADD739D0C20;
	Tue, 23 Sep 2025 21:20:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: ti: K3 updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245274.1926563.5285691567952801377.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:52 +0000
References: <20250916175349.pxg6gxd4vg5vfmhx@overvalue>
In-Reply-To: <20250916175349.pxg6gxd4vg5vfmhx@overvalue>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 Sep 2025 12:53:49 -0500 you wrote:
> Hi,
> 
> Please pull the following - PS, my updated keys are available in [1]
> if that is needed.
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: ti: K3 updates for v6.18
    https://git.kernel.org/soc/soc/c/57cff2159b4a
  - [GIT,PULL,2/3] ARM: dts: ti: keystone: Updates for v6.18
    https://git.kernel.org/soc/soc/c/21a98498ae6e
  - [GIT,PULL,3/3] soc: ti: Driver updates for v6.18
    https://git.kernel.org/soc/soc/c/be6d26368076

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


