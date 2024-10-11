Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146220FA9A
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644352; cv=none; b=EMLvbzhgqSg7b/ZVI6LBkuU/UIk4h3X4OxQcbsNq0OjQQ7r9A5cJIDCIWPBfmLGcXDZqyz7DUpJjLjGX64dLS9cQHrbZNBVY/5uHEcFXZ2oj62fEU7Rh8rSatFmKxN1FbRi0jCn0TFZ4YUo7rqVz6kiV/BfizoMGDGlLLcPKV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644352; c=relaxed/simple;
	bh=MdX+DhUIAe0u2ip7sFoKvW5zNKSm30aQ3GCPTdTxRhU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JENouXF0TRZNKT/UVTL5zPeROSbYdGRht8iKY4M0maqegH+XJs8bB/G8QxjAyQTaHXDWdqGzuFYIPB6e+YFIWu/J8eHC8gUWczdA0eYFiH3vJDwqmUT3vgQ9CmOd+60aiDfikBXrQyUjQPOQU8NVDRAMPWIGf2Lj6LWeS8OxCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY2V3hgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY2V3hgi"
Received: by smtp.kernel.org (Postfix)
	id BB7A1C4CECC; Fri, 11 Oct 2024 10:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B60C4CEC3;
	Fri, 11 Oct 2024 10:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644351;
	bh=MdX+DhUIAe0u2ip7sFoKvW5zNKSm30aQ3GCPTdTxRhU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bY2V3hgicBfaatrFskIIc1+8GieG9W9pavvDK5VBjBhANzfY1m0UtWJsJ76lhj2Gl
	 u/WmkWEROSGDE509xHj7DyrJ1Z9bpXkInIoAujUsCwjn0Bkv8YB44oOZBtuhsJMlKY
	 vGYoLsFaOuy2JQ6DYcWi0hVFzIjtw0vsLuPGSF4NDEhhC1QPvcxIP+d+3IVQXF842Y
	 XBLNYOmbBjaBH/I/N+5mGLOioTFPka1qZqPxKzEVtyFBs1TpFyhiwc5nqvcocUCUBZ
	 T0xcXJZu7Jm5IjbgluJvTS0ERib1n3cAzVM1SFWLbck7MGkCHjgWcUm0NzQGQ0juDg
	 BRjaj6X49PhIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B423822E4C;
	Fri, 11 Oct 2024 10:59:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] soc: ti: Driver updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864435598.2676212.14932773806557217709.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:15 +0000
References: <20240903155632.525twuumykwnfkiz@subtitle>
In-Reply-To: <20240903155632.525twuumykwnfkiz@subtitle>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 3 Sep 2024 10:56:32 -0500 you wrote:
> Hi,
> 
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] soc: ti: Driver updates for v6.12
    https://git.kernel.org/soc/soc/c/b1cd063981de
  - [GIT,PULL,2/3] arm64: defconfig: TI K3 platform updates for v6.12
    https://git.kernel.org/soc/soc/c/714dfb9556b4
  - [GIT,PULL,3/3] arm64: dts: ti: K3 devicetree updates for v6.12
    https://git.kernel.org/soc/soc/c/7b6eee4f0e31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


