Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C3136351
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866666; cv=none; b=l6KFACRA//hWFiO2JA+DL8CfcYAjTEGHn/blLGZV2dpQCZRwLUg11Amf00wBqaDVknS1kPwLBjGWTvU6yoLZUFDGLx3T4PSAxmOKvKsRFNIvtmUJDiu9HjT1r47uf9yGvb09litTH35SrRmDv0EdB9DeuaVGaI/asx4OvmxvrNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866666; c=relaxed/simple;
	bh=7GMdwywqejpaZK0mikbW4bBYmTZFYE0nP+OaMahujis=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PBGJyoLXLbkW4PtHatXRc9Dpk7HOw/ryjH/KwwjVSuXF35blOw3m4SyKDvKu1GoEZ9bKVZj1MHYMNsluYewLPNQLuBPTwZoh0jW3w/zHZStWZtEoR//8HLgaqcrIcq8e6bLTwbxsUwoM1kAW+iXL2FzIN7+njREVHWZZBdgnbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8RW0YCR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8RW0YCR"
Received: by smtp.kernel.org (Postfix)
	id E8C52C4CEEB; Wed, 21 May 2025 22:31:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36A5C4CEE4;
	Wed, 21 May 2025 22:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866665;
	bh=7GMdwywqejpaZK0mikbW4bBYmTZFYE0nP+OaMahujis=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o8RW0YCR+BTFVfgOjI1RZevlr+36NCJyqIDXCZskKt95xp0VUvMjvaT+vJdYWgr7y
	 ncG6DGhkS89MFoAwivxRcuzUuaU/hJ9uKq43txg5Ulm4EfI0Tl6XBWmTn0Mtj0ctvu
	 G92jZt2Akwhv5irH+0HhdaW5jqAGnjvDE13bW9PbF9iR+vt92x8GFbtlNnzS1orpYE
	 AQjq5J/LTw/YYsgx3A+NpomHD0umans7ENLGmZAvVb7TKmjOMdF5+9rpraTOVrFt/5
	 /7cvurhzrch97hd7YV9heGocxfGHOnZHyj0SMGSOY79ftQWqFj5/AiH1A6knxib/tM
	 BaO4Vj5h5bpaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE070380CEEF;
	Wed, 21 May 2025 22:31:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 DT updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670130.2299459.620595887879362534.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:41 +0000
References: <20250516055607.11248-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250516055607.11248-1-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 08:56:07 +0300 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 DT updates for v6.16
    https://git.kernel.org/soc/soc/c/ced334a21c58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


