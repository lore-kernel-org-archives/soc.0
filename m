Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D43FB31
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 20:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660013; cv=none; b=FyLuL3MU/DKzTxSXYYnAaQH9ATs+KPTOMhQ33ZaQl2MXGxKyWklvtN4ftFMMj2YXIBQml06Xn73l1usvITtjs1u07s6Dyg24zO83SWjiUihfH3AvoFx+pysiAg0pxf6UWIvDBouRp2PBGX9fzIFeOwpMBDVcDSuKdufEt16P89Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660013; c=relaxed/simple;
	bh=SLUJeZF95w89+cuYwBUpd+4dn4PlpuxQ+KprofZwfpQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZLRQVngIPgSZkCsIOYMkc5Joodmir31jNeSJiqixARX19EmLoy7hGj//wLZmfcKAk4gJLhFEJf/Epoy1BTmw2fZlz10aHxpW1awWUWw/gM5tgKNiL+7W3fTRJPTT+f0YPwQ+CqFBm8JdrC5uv3c2aIUAQUhrDhNbdpIJt1cw4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8EJcdQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8EJcdQg"
Received: by smtp.kernel.org (Postfix)
	id 927F8C116B1; Tue, 23 Sep 2025 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C860C4CEF5;
	Tue, 23 Sep 2025 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758660012;
	bh=SLUJeZF95w89+cuYwBUpd+4dn4PlpuxQ+KprofZwfpQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H8EJcdQgZj8i2qjXeEekvtIkgHlPWljLtqTU9NVC7OHBDDyG7h0JdKTkKotSXmdBc
	 g14i0z73MQJdGheHy1gzTYp3pVfD5mqKhEOIDx1jtVoUj4k9QIeLjGPZRtSrsUss1u
	 8Zm7flNtXJutlz9u/v9YYxBGYPCwO4jclqfI/4yaOQordOiL1CLTiioH0Y/8U1xHDn
	 w55T6EXXCWyfsJhW9I8Wu1/z4mIaPutINghqmQxnTSwW+vBtWVVcMeBT9/OjiLwUxa
	 V5j/U+bg989bQ8/xZ7tFCDeDjfbXz8XvoWkRJFyz9R+TAfST85cKb1isz2nWz5fZnS
	 TdAvrJogYaSUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEAD39D0C20;
	Tue, 23 Sep 2025 20:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes changes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866000948.1916197.8492738756215686438.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 20:40:09 +0000
References: <aMrsUfkTWx8g3bJ7@wens.tw>
In-Reply-To: <aMrsUfkTWx8g3bJ7@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 18 Sep 2025 01:13:53 +0800 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes changes for 6.17
    https://git.kernel.org/soc/soc/c/5eba504bb2b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


