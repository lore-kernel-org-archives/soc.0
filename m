Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39D1EA7C9
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944269; cv=none; b=ozo8OcYFoACFb8Vod7oAfPjUfgimnL2DM7lCP93TrqFNmHkYlnxzbKtGV6VFd7mr7+c9I2o6VwSPdNoen8C3u5hPIc3bgdxSoYpbzIxXvCr0BBt09ATMsNdZamojkpe+kycc7mW37i3aooVWbQrRi3/K5B13ZKEgHM+a5kRU6jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944269; c=relaxed/simple;
	bh=mQdX2zUhE7asnfffj51RTEntHlgIvYrTHPRgzYKG/wk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Of/is3GZNP4wHlpMDFZ1ye6xKptpfhi/t1qFbjhrL3WcqlWfVpQ0xIjA9CgWcLWq3JaHShf3i+SbMIwM3V5RXSE/qEamIpMflZAvrFuPAcZGuNOTUbwmehUzZDN3qCyOxVtJuTccvay2hUUjmow0QOmCbFXHafnk6cY+9aWlQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+XZOMrc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+XZOMrc"
Received: by smtp.kernel.org (Postfix)
	id D6B3FC4CEF7; Mon, 15 Sep 2025 13:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1576C4CEF1;
	Mon, 15 Sep 2025 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944269;
	bh=mQdX2zUhE7asnfffj51RTEntHlgIvYrTHPRgzYKG/wk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T+XZOMrcx0msUhPDGiL+czPfg/eSEsnJitgB0z4ZLJUQqYSNZVN2O/uU0yAQaQPDj
	 7JWxuDVxWNo99kfX4aCW6sFUedfMvKUMHuUwOm6x9Aoh1c9PG0RCX6qRgSpgguMWSr
	 RX5hG/unxi/WPFZi/lGmj7wg8YXGolzx+VtagjhJMCCMdA+wh6K5dqHCfzdkLaflrV
	 rMvGlqUYUpFyQyD8ntNbYfogS76grVCCuMec4YcESPsPpCp0RGFt+6+R8rguRnQ7X9
	 uFubbADiTJnK2MFriFn6POqiRk6YI3HspQ4s1+tVdcp91U0fzmPa0r4xSvin+/mwn5
	 NVzg9OyHGgVwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 88E1139D0C18;
	Mon, 15 Sep 2025 13:51:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: agilex5: updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794427123.4179625.7118937036263355570.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:11 +0000
References: <20250908040718.187857-1-dinguyen@kernel.org>
In-Reply-To: <20250908040718.187857-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  7 Sep 2025 23:07:18 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: agilex5: updates for v6.18
    https://git.kernel.org/soc/soc/c/b1161065094f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


