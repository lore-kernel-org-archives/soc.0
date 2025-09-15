Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666EA30C357
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944248; cv=none; b=EuyY+DZsVGapKv3rgg0NjTrJdoQpl47p9GG2SRna9lJ+sd1S1AFBIqmiexJWJg2X69GXkZrJTuEsxNdba1HXZR1CDVLEYNgJoJu/5X51QaDOENZzZ+7sJazrtn5VuZV3DGekSxGOqoEatCVdLRJyuraOqqrYSv1iQ4huyTiQexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944248; c=relaxed/simple;
	bh=hlTYRlm3aFgG3aOVwauy5feAUA5gYiNn3P3xGsctCr8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=siDtkRGos1dcuLxrVUd2lYoA2R83T+skaUyCP6cmU1DSJ7ER37t2lMwpgXSOCLgr7/WwyL85JjuNqrpArcPZMJ67tw6x0zYicrH4LThYMnUwqr08Qt4s2CeA68y+EpcFhvGAqZg/d1GhFTYLS/IkgO0Up7OHO1GQqMx8TQsgiIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFNXfXEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFNXfXEu"
Received: by smtp.kernel.org (Postfix)
	id 4D1F0C4CEF5; Mon, 15 Sep 2025 13:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EE4C4CEF1;
	Mon, 15 Sep 2025 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944248;
	bh=hlTYRlm3aFgG3aOVwauy5feAUA5gYiNn3P3xGsctCr8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QFNXfXEue6ELc3DITKSfUc3hPxOZmkxryqdXMYoNY6YGBhTr5+Kw7rBcEcdhOGs/Z
	 yEy6t029QuHSUnhc/HS6RNHLGf2gUBRcqE9P64vetvifyh28g6GHda7xIA1sAc1mn/
	 hpdBnhgNYlhb1Df9t2CW1rK3AGRJ5J3uxwyuok9EjoV9iaBKdm5aSFkl9Krl/xdUPa
	 46ZGONYmJ9TZSTAA1vIuA0TRGRuZCLYe+YLEieeFV5piX4VjVggDJm1Oi2rxtdjQmu
	 dPJUUnTE5PIOlLAgnbcq9549hOgzZGMCxuyJ+T8O3PAbJl1q3hUYOhYeNjjRcMrp2N
	 KB81i0t1f4wdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE2539D0C18;
	Mon, 15 Sep 2025 13:50:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.18 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794424948.4179625.16837365734297796156.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:49 +0000
References: <12138356.VV5PYv0bhD@phil>
In-Reply-To: <12138356.VV5PYv0bhD@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 07 Sep 2025 18:48:00 +0200 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.18 #1
    https://git.kernel.org/soc/soc/c/839bef00712d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


