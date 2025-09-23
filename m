Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7C265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662462; cv=none; b=jO7KayB1ui32dAMu2x4IptgVvqwyGvPNppdNoEl5eT8kQP6RZfh3eUyxsgN/+eAqerHjoVsrDutms/JnJapx5HmTg56H+L6rYD4aMzMVtAjns1oe+9d5afyyY0ajen/8J1TPCLuC//pMSwedPKFesKtsYakKh+2LhmdHcraiQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662462; c=relaxed/simple;
	bh=PePs9RP93ySfG6QPTkkpBreu7AIWmaDBi/biPvJeDg4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=A6EvavxbdggQ5TvwdGn7LLv44EMnsJBYldVuDL576AoHuyuuxALU1rXSVZrcUPbCg+9fTl3tlf2WJvll9zGuA5DLnKRqTqNPoBb9xgPSDNXU9vviQp3KkokX6I4zw8V1HwVVmGPkUTqYPTbPoheSZM10RM0A+R278FgCnjsNiHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4kUS6+6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4kUS6+6"
Received: by smtp.kernel.org (Postfix)
	id 55F79C4CEF7; Tue, 23 Sep 2025 21:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4086DC4CEF5;
	Tue, 23 Sep 2025 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662462;
	bh=PePs9RP93ySfG6QPTkkpBreu7AIWmaDBi/biPvJeDg4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S4kUS6+6FVXoKqfzHOOWVSsm805gYHI+hf1FjnflUoPnhm2vkG19gOYkZ/17Pu6VK
	 xyWo83w9E0bOV4Ow8K6MkUTLm7BSWxT1ZrzzeHcU9cuVEr1oa2Ga5awYmsBbBB8Xzq
	 HUx9IDfSK7ylXtV2Q0K/NKfc+gTKV8iBT2qzrk7H5MTVIW5J1Dfek8QKmVkbAxZnah
	 nstAKJ88Gc5vg10Z2OCK6GSxWtw4Ruxfmxvb/1AsNTMrmzSRAjp0agzW0ziJdWgyJf
	 ujxiQuQnPW0LYrGyX23Lzbg1c0PPOYmAFBGUvK6OTk1ILovMjusqImlPcF3UuaKubD
	 L2JUlcMYBdW4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70AD139D0C20;
	Tue, 23 Sep 2025 21:21:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: ti: omap updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245898.1926563.6385031398228627732.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:58 +0000
References: <7hbjn6p2bk.fsf@baylibre.com>
In-Reply-To: <7hbjn6p2bk.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 14:19:59 -0700 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/dt-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: ti: omap updates for v6.18
    https://git.kernel.org/soc/soc/c/26116b98d657

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


