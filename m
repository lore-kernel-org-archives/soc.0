Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3291F8AD3
	for <soc@lists.linux.dev>; Fri, 17 Jan 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116415; cv=none; b=EPwCJar+fnKbTcpw+uLRcBDzW3InEiWq9dsAD22bSgPZgX1vEApE044I+o5QtJgKbgWp5MBcCHBM9mk78cAwPDudRiHNgb99strf17k3v1cdwmapVoRESwpg0yXEPJCBUuSbjQTHBRn9PinBjUKFSFkWiMjb5L2u6W5jBt4GRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116415; c=relaxed/simple;
	bh=+rKn5+5FTg96BYAhI2pUDTcS0TA4z1+fNjJw5yT1IZg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=M/lcBG6HAH18an67B1llz63t2ish9qSIEafc7yXzcbBBfgNfV4L8QEyfVm8CM+va/WQh42Hldacfp8QF+x5vNvkd9ns2IDkQcGMSrdkh2hyYY2xLo6qake1KIHUcY6/4ZsuKAkGCpgChQE203d/g+PmmMAJzH/Djrbrf0TC0uRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlgDEePG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlgDEePG"
Received: by smtp.kernel.org (Postfix)
	id 0C55DC4CEE2; Fri, 17 Jan 2025 12:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E11C4CEDD;
	Fri, 17 Jan 2025 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737116414;
	bh=+rKn5+5FTg96BYAhI2pUDTcS0TA4z1+fNjJw5yT1IZg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tlgDEePG5zCeoj2JQk3ta6618ewIcwIOmkeXwQTy1/le1hGTSQeLZ4gKdsnbZE/mV
	 msxDsAA+5WavbwkwyMgUaJJxROBivZXqDrWppHxAr1e+Ueegu+8KKl4r0Xo2MAbWMh
	 4G3RzaeFL1iubUjYT4xNQm5JC4BKvzn1jDFcaTrBEYHmrpUfTO7KT/uJarW+wE9SNF
	 R/MEsgDl5Vy0ps7QoB+UfjASXllUVy877dTxFOfDriHw4uguqw7WK4iH29gG+M2hlp
	 rMh7nDP01pAOTQnu8uQ0r/c0XfHnoRrrkMriIKwrQw2iLmsFsK4Dp/zt0q4wqqGpmn
	 AWkIpfiWgXmyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E06380AA69;
	Fri, 17 Jan 2025 12:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND/GIT PULL] RISC-V SpacemiT Devicetrees for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173711643724.2108892.8787220134294352191.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jan 2025 12:20:37 +0000
References: <20250117004911-GYA25021@gentoo>
In-Reply-To: <20250117004911-GYA25021@gentoo>
To: Yixun Lan <dlan@gentoo.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Jan 2025 00:49:11 +0000 you wrote:
> Hi Arnd,
> 
> Here is resend version of SpacemiT's device tree changes for 6.14 cycle.
> All patches have been merged in linux-next tree for testing.
> 
> In this PR, I've rebased to 6.13-rc2 along with dts aliases fixed.
> 
> [...]

Here is the summary with links:
  - [RESEND/GIT,PULL] RISC-V SpacemiT Devicetrees for v6.14
    https://git.kernel.org/soc/soc/c/f18b4f7b6666

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


