Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D624085D
	for <soc@lists.linux.dev>; Fri, 24 Jan 2025 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725407; cv=none; b=akJo3SN7u+nnm7gzd3pTJ4h1Wtwi3j68on7mhJpePd51Fe8vk2Z48sjju9TvDZEz6XWKqZ2JT8AVbSB+tVBJYMGSskORBnvLAYnw6XX2Do+db32VObW4mnVBp6f58EDayGjFu7YnRx+oo189PKmfQx4yntUo8xgvO3ZWhuIJhLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725407; c=relaxed/simple;
	bh=vBJtY1tuE3ebPSI3Yo62wA+lE2iuEGU5P/Ek7gzUisM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sRen1FLPQkpNBYxytdsS9SG8bUKKGHloPqbY2opX6thoD29TC8XE2759Umg3n6cW7EUumz9Evz7kUPHgJhtl6MwWit23iFo1l1JV5s4l+nCd2p8X6izD0eC8j4/qZDAc/KPs0hxD+hKjlg0ovdZqwjscC4fop/Nz5sGhtzGl44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2ZOmPzt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2ZOmPzt"
Received: by smtp.kernel.org (Postfix)
	id B61F3C4CEE3; Fri, 24 Jan 2025 13:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB79C4CEDD;
	Fri, 24 Jan 2025 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737725407;
	bh=vBJtY1tuE3ebPSI3Yo62wA+lE2iuEGU5P/Ek7gzUisM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B2ZOmPztJk/uL+8ZT9Ij7aHr2/virkbVaC1sFCgPv1ao+vnMg8LuFP1V5KTKY3iNC
	 8Yuso41RPGpkTKbYIPFeky+ecqCA7X4Kb6KVkgl7PEOPcJRACD67+9SLhblaza+nBF
	 4Qj/Btew25KNUHScRdYUeIvVoTQCTQZu6DS7B/qXIUy5NdI+W9TXLDKKCx4y4CAOr3
	 4WKEXbgMDhoXZLdvIGX3wtvdUcPMbNc362DzutxBQpPY2mdNZmp1R4hQ+Cmig6Mbc8
	 aYzRIRyaCGPcSMYt8WjHs3/4fZy5pkMJtsqdXrA4wgVbqpG3dJINNG/WaAzvSLj2yq
	 eX9DSYylvpy3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE250380AA79;
	Fri, 24 Jan 2025 13:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Broadcom defconfig-arm64 changes for 6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173772543249.2032962.4304500111800518256.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jan 2025 13:30:32 +0000
References: <20250123203302.1491843-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250123203302.1491843-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Jan 2025 12:33:02 -0800 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Broadcom defconfig-arm64 changes for 6.14
    https://git.kernel.org/soc/soc/c/309f64469cd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


