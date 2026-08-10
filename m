Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD4361963
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380685; cv=none; b=nzhRrPlBIRU89fKivuMYKFh98/fR03XlnyQku/bHnsrfPCBw77Xa/6Oq/w22ANiKrhtIcfiRfWINWQ2NvJkbV2f2EEvNjvxaJqNMoIXxYDWDOVbnqvyw7MOr8PvMkA2Pd77gf+PuhhlWX62ftPgahkQdzEqX+PC83ye/Yc9zPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380685; c=relaxed/simple;
	bh=Lm2fuKmfkCg1iSFLfUD86AFI8jUTaP1BtVicY7H9Mw8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PKeAilQBz5rR4SF8J21x6PiS7hVjono27c6eay1g4yAOuvYSGhjmJ7JdhHW2JqdqE/5eABs+pHJlYPY8o1JVWBympf8dFTU9ewYcsrYZm4HSn1Fsdl6QM++WUsX0YsYwjCiaBLDyh2LwfpgcaIyOBgCgpL0w9Ohs0JQnSqY+v6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbmAdciR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbmAdciR"
Received: by smtp.kernel.org (Postfix)
	id 776A81F00A3D; Mon, 10 Aug 2026 16:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E191F000E9;
	Mon, 10 Aug 2026 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380684;
	bh=JyQtXlEE6Hrajn4PsEXc2TWyrhYjbCjJf/7yp+YNOLo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FbmAdciRRww2NYLSB/GLa2D378YqLWvuv38e5GbXSlifia7TmMQfocDUhWlng0Gao
	 uVL5eBIaPiQJtFoHXOuwikyM7cv3B+OR+H3UF6Gro3N5ezEYVNqKOQKF26ayP4Wv9a
	 1srgAUOoJESgjI6QveNHX2WpRgOUeUDzK1XYGYTWp2Rl1eE3j/yMWhCNnn81n136Ph
	 bnBLnoHQA+KxU/87EzMXxh4ZC8yJCAjpgADZUXglUaJ09ZW4KnvWvKtKHxN2cJ51Xw
	 jOhkcwzSGToVMWMTQWOzvjNwqZSPHOd9chLEn1Yf8U1TlLUkKj8snRBJPTiBnLr3B7
	 UlW1shM86d2NQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5691D39253F2;
	Mon, 10 Aug 2026 16:50:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: cleanups for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638064095.3872609.1421526669683102596.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:40 +0000
References: <20260806082549.349249-3-krzk@kernel.org>
In-Reply-To: <20260806082549.349249-3-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  6 Aug 2026 10:25:48 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> Various DTS cleanups touching several platforms
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: cleanups for v7.3
    https://git.kernel.org/soc/soc/c/658ed6d54e97
  - [GIT,PULL,2/2] ARM: dts: cleanups for v7.3
    https://git.kernel.org/soc/soc/c/334f983bb6b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


