Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E6148094E
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398679; cv=none; b=WSdxQcvXPXoFgCFbiSPxwsPhxEIQXt2NNGWYBhIQPOV54PM+VHuAvT5NgV0EsuoHuU083O3p/MxsR8HmLIynm7q2a+5rbzU4mYEtblB71FipSSqRgD+6+VxvsMqj30bU69HTkO/xLfeP89QX+251nGyHysjM2kkpoXtTugPEf1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398679; c=relaxed/simple;
	bh=2BpiAGrQwD2wRh7Tn9dbeOTShTVS9DihgdlIqzRo3rg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D4XjjNTPWNkwMnZ5B/LgwP1eL/DNfo4mC76C5gDu5j64oJlea8Upx/GFDMbkvzpJTCd2GQ5BaBMlUGarNse3t6p6QAOplfpEW5xgTwuAUMqWk8DDwWiiaImMUOQIvQ/YPKSDNm6hyuuUY0t5GICsoDMSFHEc4dAiDCBY8cVhCg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDauckfX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDauckfX"
Received: by smtp.kernel.org (Postfix)
	id 849991F00899; Mon, 14 Sep 2026 15:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7A21F00898;
	Mon, 14 Sep 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398678;
	bh=aujSgdcu96TFOV+AqdNZb+XtJBGW4zhsiNKg/7qRGqY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WDauckfX/XA55JKyNGMVxHlTi3yBBdSwW4kbSGXxdIXPOT1z5algsHcI/3oGtvY1k
	 PjptDI2ENBWY1M/b6cCDDLW839TcrhZIUa3NPyZnjEvGVXeGjdAnEeVHWAs3/i4V4V
	 mpkZ3AI96wHHdXHaJ6G5OPgd3zTw5IYqo2uzdU6wwWE/8JcZspz6BGoFsLFgJX690z
	 ceQW/u/93/kEfqpMGhc05DcgM2XR4bo2w2NAk9ZHi4QE4osi8xADoZfD71dfA5T72D
	 brnlcrSr26V3qlADDsLc/URui8aK1xPycSqDqTKiW/kkQBy1tM/3waWatZaZr+6mjG
	 6qmyVszruJKFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A573924A6F;
	Mon, 14 Sep 2026 15:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939861337.630437.1229680940995089376.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:13 +0000
References: <20260907161952.1148669-1-dinguyen@kernel.org>
In-Reply-To: <20260907161952.1148669-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Sep 2026 11:19:52 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
    https://git.kernel.org/soc/soc/c/8c8a0cac6ff0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


