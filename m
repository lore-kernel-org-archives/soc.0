Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD4B265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662467; cv=none; b=sal6tu0hQIXf2Lbp4B2zqpYxJfCwuZIpd4pQr4fgIW0TNCB0H60PNZxSRteStyLMfLsLK0P3wX4yMOy7u/2du9Tq9WXxGK8dZTOppR2rfwrFHdhL1uQV9J8+ap9UD9eS9XbuIxnRjYfpHQuulyXIPapObnPhHSp0frrpfWO2dUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662467; c=relaxed/simple;
	bh=ISPOmDozPCvQiCWn+Z4S/zmDDVZ4XnyDTZQPT5GsdBE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iTeLUj5hgJ4lxF8G65n1f0fMjzdIL2um3SYJHgehglPwN7on+M7Kw/K2BHk/RJbboEcscxwP86ifX2CrexZTz/1xfS8b0EilZ60kx4Wmorm6WBz71SFfnaxn5vDknPj22wKJMhsCF/P/2vaOAPfBO07q4Is3aV+IlM9u35fjrwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRNktVmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRNktVmB"
Received: by smtp.kernel.org (Postfix)
	id C7EC1C4CEF7; Tue, 23 Sep 2025 21:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B234AC4CEF5;
	Tue, 23 Sep 2025 21:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662466;
	bh=ISPOmDozPCvQiCWn+Z4S/zmDDVZ4XnyDTZQPT5GsdBE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vRNktVmBaksTVYLTa6UIBE/I65E7lvNFdwwo8e2vLP3pW9E0Is+n/47f7v354GwOs
	 SVmVUKxJXgFjdPSHEWADnvxsnjUfMN2MKnGGQ3VHgDc8qb1NTifSnHReUyjBbM4QML
	 X1MJAIicpRtLtA6NaWBO01vN8DNUqNnRmOfwfFTgN8jPL8ALcRKlfb8E/OaEujTiZi
	 dVZJJljoyWHL7Aox5sHPmZVeYnCT0REs+ZYHaA+DkTfYG0A+/B0chpi1QquAZ33Zog
	 PFstYNDSXpndY0S9o47FmnNY6YsSUdaZEr3PYLrJFwDSHW9Vm0XfGXABFM3ruOkQ5U
	 m536x9mpRcGcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD7339D0C20;
	Tue, 23 Sep 2025 21:21:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner Driver changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246348.1926563.13184114832150844931.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:03 +0000
References: <aMrsfw-_v3IAiKH8@wens.tw>
In-Reply-To: <aMrsfw-_v3IAiKH8@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 18 Sep 2025 01:14:39 +0800 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner Driver changes for 6.18
    https://git.kernel.org/soc/soc/c/7150189b621b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


