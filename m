Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFA36D505
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761846; cv=none; b=kcXFZc6bw03GumbtMFTqi+XfukI8P7+kHff0D05S+zaFmCut6yjMjXs8ydqn06SFgqnrUIgB1fZEF2riOaFkjF9kKOaubwwa6/XBD0vDlN90XGfwqrKD31T9fWhIt6qUoQARhbSE04Q22BSPYA7tZL6gp6xeEr6x2En2Rpe9F84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761846; c=relaxed/simple;
	bh=ommaVHP9SbX8/HXmy74JoBmrjzbuTigqfPRWBkAApcc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=S6oPldQhGzpbpWNHaaDIftV5zqpna7yqLtdtV1DK44Cx8yOVbnMNft8U7EAvxD8aQaqs1sx8uHHkrRvMPVpizcc1mN/stoFwgA/KdIIby8+wsbsiYj2owrE6sIKFV/5wEX8gFe6xPPERdC4RHDPvoyBA6p104ZdyMdGvzIv8EAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/2LQ4Yz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/2LQ4Yz"
Received: by smtp.kernel.org (Postfix)
	id B1B4CC116C6; Fri, 21 Nov 2025 21:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6B5C4CEF1;
	Fri, 21 Nov 2025 21:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763761845;
	bh=ommaVHP9SbX8/HXmy74JoBmrjzbuTigqfPRWBkAApcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c/2LQ4YzrdhvSONfNwj2ZVGEVarFlY3Z/56owKsATuerLfyOEIILoK/ULCnKzJpL2
	 CFwwYHU7dx0QEwSP/lWH2iQgJEdz7ffJzR8fUOF4YbZLKPzOC1PI/gO9Oo68bz/v5c
	 NxfS9Nv1MCNTgZTqNEQtUW2GlG0EGFgQZZjc/SeQHcyFTvg4IVhMff4OTygnazE21n
	 mNjvSZ+BYFJ34Wu4H+KTj7k3Y/nH+Oppf7NQthaZV/Ya3kVt/+8BpUzac9oxofOGID
	 88UPJA025tSzb5o6M/41FQssc6Qr7QRmnP7YE8wvK5xOJ05NX/4Tq+9EoKm54rhbyC
	 I/zDVlKc/yn1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D353A78A72;
	Fri, 21 Nov 2025 21:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers update for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176376181024.2598359.1757506004654702538.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:50:10 +0000
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 20:33:47 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers update for 6.19
    (no matching commit)
  - [GIT,PULL,2/5] i.MX dt-bindings update for 6.19
    https://git.kernel.org/soc/soc/c/a60997452ac8
  - [GIT,PULL,3/5] i.MX ARM device tree changes for 6.19
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree changes for 6.19
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


