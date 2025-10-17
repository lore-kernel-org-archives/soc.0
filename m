Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1D3370FF
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712512; cv=none; b=ncVSI7d0QIgXHFyb5IVNysmsL6IyeJZK+m+jE2S8lbSFhf66lHZWjJH4JQb/zMtQBGm5WG4+F7VehIbPLUg3HKQP6wC+P1CyMD/zFXE0hl0SdyVuwRIRWj9zo80KEDocDHVWEnYIHxyGXL0Svyhz82i/X5B4MXjJ8LMZQaoptSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712512; c=relaxed/simple;
	bh=802fJXOSxUAqmuyLRdokeUoQfB6JfocNOi/qstyhMWM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DpTiLzZllkXSBdu/4+84QMq7YdF69MOo131tm3rK7dIsXkSkkD8goc9IMD6+v1o9J5/tWdNFpFkDejbXBNI8NJdC8Vr+26KpFMw4eqp4tmvtGoSPDQbAcyyjHLaIPj0lIpNbSlSKswLNO5n5AWaIBqwROn15CPbP+gR3Y8j4IEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrJGCa94; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrJGCa94"
Received: by smtp.kernel.org (Postfix)
	id DE100C4CEFE; Fri, 17 Oct 2025 14:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C440BC4CEF9;
	Fri, 17 Oct 2025 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760712511;
	bh=802fJXOSxUAqmuyLRdokeUoQfB6JfocNOi/qstyhMWM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DrJGCa94i2GPLyK089J3QQuI+FQK1DCCCCs5PAdWNpA5Ug5TEsbEL36ZciCZIzkPQ
	 mKmDhP5jzNpzDRCEkYBiuRLpeJRvNRNEGqTKYyfoF3D/qW70xF3WaSZhiiWSyziX66
	 Rr+3BVTz0ezHyanQar5VIMdd14cajsKsFN1EnW+gfHmBRMCGSjyXa1h1SECGSRzG4q
	 RNGW5jXEGr33g62RUXsBgUswIvUksfFFWnCZ7v+Go2B7DqJYE/Ynb1EygYGP4k15wh
	 KeeKsIHRvLP/8Ee0MfAeJ+xl/io0nAaG/zar4+F1fS/nZMzVUeaZQBUuwAuvvEGg1+
	 5xrmARRE02LZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF2D39EF976;
	Fri, 17 Oct 2025 14:48:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176071249550.2229063.3465386018855715039.git-patchwork-notify@kernel.org>
Date: Fri, 17 Oct 2025 14:48:15 +0000
References: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251013173543.2489346-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Oct 2025 10:35:42 -0700 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree fixes for 6.18
    https://git.kernel.org/soc/soc/c/d2dc8a386a90
  - [GIT,PULL,2/2] Broadcom devicetree-arm64 fixes for 6.18
    https://git.kernel.org/soc/soc/c/2f3471cc5d41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


