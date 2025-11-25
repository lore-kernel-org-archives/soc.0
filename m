Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE524C68B
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078669; cv=none; b=PxwKUnuyqoeTcbakolLwTpYq0mPaYjLcneTV1awSsXuDKaYpYs9yOjvkP16bBrh9TAPOeJrODQYZ0u4EmgcsIFE43/85N3Sc4r4h7MnLk/u8f47NkY7QOjLyciUa5fciocEFF7Ti4G8LeJCrFBo+gixyyiVU4M73lRx9S9ldmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078669; c=relaxed/simple;
	bh=13b9E1jnuuZ691J9NPCX4qN5e1teYWi7MfaILNyMAvY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HwhpK5hd+xJgkde/ymhVqRYJxE/Y5jvg4IPJQDXzcxTU2zCdSFKubY7pNBEfWwquwQ+I8MpVEr9f2gTur2HYJ/Nh1qe+rf+37PoZKTa5O+nPgn0bOIexr3i2i2OsoXUZIrpzqGoTqPAzHySgpi3y3Adc7IAB0Ne0P6h4JXHOv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P33ZOQm8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P33ZOQm8"
Received: by smtp.kernel.org (Postfix)
	id 800DBC19422; Tue, 25 Nov 2025 13:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697C1C116B1;
	Tue, 25 Nov 2025 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078667;
	bh=13b9E1jnuuZ691J9NPCX4qN5e1teYWi7MfaILNyMAvY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P33ZOQm8wd17pKbJt4idWF/LJrMscONDiUOgaz4w1jxayRd9axN5JQUO3f2c02+QD
	 zhA/5CqpwEmvr71BuLX3pneJ03malsWaa1zd1cgEB6U6WxZxqXIJzEzC0cPN086RbJ
	 urPDTCAiTGyTMIl6yn2pCbBWlI7xz4+d0HMLfxWJxU4me1RdL2IMUaKVuZSi2z7xYG
	 yIiu3PCsP76kUlIZlOhyq4Z+O3pIAiZ43F36ubQ2mmyEGA3lhMVrcbBLN3sFNPmP6e
	 NA/RN760ydAfZc/ZWg4vQud7ghdnjz1qWjaR/3qX/kUdQTgoBmCEBSlQzXaiaXgeFD
	 hdRjR85S62O2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342BC3A8D153;
	Tue, 25 Nov 2025 13:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Driver changes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407862974.736376.7767427945467500122.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:29 +0000
References: <aRmEosrxfxFVY9zH@wens.tw>
In-Reply-To: <aRmEosrxfxFVY9zH@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 16 Nov 2025 16:00:34 +0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Driver changes for 6.19
    https://git.kernel.org/soc/soc/c/e7ec4df2226a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


