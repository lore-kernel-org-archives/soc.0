Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D53845A2
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080258; cv=none; b=nthsOakpLR8yw5jqBJhp/IXEBRj/2OoKeYq0gqCPwwbE0e13fYScKcbP2Q/JOGN7a1i29uMMbl4YartCQLKscjo6Nx3LHdHQbzWMscS23UYNaa5nb2Pq4+jg9eTVdFvNmq2wqSurjoNJTSQsX2eCpKXuuAbwMCIIaO4r7Kq6D38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080258; c=relaxed/simple;
	bh=VtgRGb8LVHpUyl3M1Z3HJjnlEr9cR5d9EByZ8D12FqE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VmzY4P8+Rl4doK1rDAoCEFxNjUVLEy0gFvrhLaGQZPEPYtFF/1/RTuua+s9W4KNvuQx+fH+YL2AZ/nW7MLcYNZjkw8Zays0vTHtEqzmXoTtEjrSqR/PIOfJf4y29IJx6MuMd2Dv8nxGlrr/vBGF4V049FDemPGeuN2p4LeaT+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwVfKOFC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwVfKOFC"
Received: by smtp.kernel.org (Postfix)
	id 0A0C0C2BC9E; Wed,  1 Apr 2026 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CDAC4CEF7;
	Wed,  1 Apr 2026 21:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080257;
	bh=VtgRGb8LVHpUyl3M1Z3HJjnlEr9cR5d9EByZ8D12FqE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cwVfKOFCEfaVNs1vYopuJgIYfavd4VjJw3NsruqzFtI0Jb+zZh9FhalKBUw8OAnbU
	 0a3dRsVdncFs2gAXiZqvIDcNRmK5WH6VSPAotENrao4Sgp2h24cxOGjXFFaXGpx0oH
	 /cPStCRESBnYuQkYXC7VOe3ZYHe6BgeLnsyugfd2xT69xklhDJNChWq5OFyXwQARS7
	 3jHwL/9mGBE57dd4W2Dv1QnCO4tNGPuRw/b+UkaGN3/GMCVN3coyDZayKXwjtlL5TN
	 TcH6SPWj/0Ry+qLNelMzgBOL5UAs0hRHezI4W7LcZFR6EN+ylzBBm70uSNcvvs+9RE
	 t4axz2RSXc6NA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C543808203;
	Wed,  1 Apr 2026 21:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Fixes for 7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508024053.3876275.5139918157194155803.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:40 +0000
References: <acktHkKlWDUbsE_a@home.wens.tw>
In-Reply-To: <acktHkKlWDUbsE_a@home.wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 29 Mar 2026 21:46:06 +0800 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-7.0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Fixes for 7.0
    https://git.kernel.org/soc/soc/c/14edf33d1b21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


