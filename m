Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63560265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662478; cv=none; b=QH1VKtrR4ZF9Ol1KwpTevIfgSK75ohND2sfSHTzRd/p491wcJ/iZjrK/CMEbPiOn0KjlbNMhH4Ux1KgpwBBcOaKHqF64+p9F3CQ9DgQnlXLOvEukAnwiveOlqDC2szZTTd4Up6gkXG8Czx+bgkrnbnL+OgxlhzOTxhfBLDS4YxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662478; c=relaxed/simple;
	bh=Ug0Mqp85Ru4lcZhBcbQzyjndUfo5gBXYSGI2RGACMM8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jJ9G+s2wy/Dg5uKjADf5TulzPoR+cMsF5ruFUj0nr0+nb8YfHcHL+Fvkeyt9kSbmlhjEBl/mv5HctFUvySyPTYdZCOGWwJbr7b4yXNAVvRZQA39wpka7xljq4e+Sg3bnbLdSxim99oF5JyZ4pCHeeA1P5T0lsS8zguuERjJfgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNs0kLOC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNs0kLOC"
Received: by smtp.kernel.org (Postfix)
	id 58E5EC116B1; Tue, 23 Sep 2025 21:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43210C4CEF7;
	Tue, 23 Sep 2025 21:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662478;
	bh=Ug0Mqp85Ru4lcZhBcbQzyjndUfo5gBXYSGI2RGACMM8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jNs0kLOCGqFjXA9KTbsWDz7zcXwYcTbKeoMot0soogXWyMjvVqTj8YOSXgrs/vHgd
	 YoTttfJOsUI+AMmobfsJ2CMCB1l8ooIscgRx2Xv+ZDAa2hJaTeRBjtW7kHvT43JjwI
	 GSIiMYsvyzJabDP2XmCfJiAnodSxxs8Zz8aHw1TC/cqNUkI7i9E/Byqr1ASx12VT9v
	 7bxGc4UPlziQtvpQ7R5REQro+9bpoG5rIME1AOBrT1vGCSTj7MnuWZ6lqLNjAQxNQg
	 E6ff3mwqK3SN+kzMCtUeS4ye9kRLtsRODsT6GZH9CVCRF23e7DQkMqQQQSfUkDO8a1
	 gwScEylbuIFGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7163539D0C20;
	Tue, 23 Sep 2025 21:21:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip soc32 changes for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866247523.1926563.11385121074229660296.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:15 +0000
References: <6025175.zQ0Gbyo6oJ@diego>
In-Reply-To: <6025175.zQ0Gbyo6oJ@diego>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 21 Sep 2025 23:02:07 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-arm32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip soc32 changes for 6.18 #1
    https://git.kernel.org/soc/soc/c/32cdf411b4f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


