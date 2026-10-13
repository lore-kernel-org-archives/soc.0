Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ED051DDEA
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907828; cv=none; b=bYsijavM47oJdqEB6Xbq3RNY8xDcSAHJ3Ea1Oz9Qoffi0d9edAiTNqdYSeoI4fJJQn4i9YalrvoouwRZzNkvOFco5Gs2tfVH7QfLeAbw5YL/USKXcz19JMycl3ZaVtv7b/vJHicjOcygQQCxWQHKDcimijQy3sYmsx+rKc1kCFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907828; c=relaxed/simple;
	bh=1kgExMgVZeqgJd4Js3sgqaGPGL/qLvV1UVtA8qyN7QA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WqJnp9pSsOA07QjwuO+nGyH607Y/EKT9Lcz1RcploMIuVnGjJiI0UWMApTGYymEE8evmU1zFU5maV6227woVe5FJ2NxbyyUlgtApbnPfinC1o7ZCAg2wPWUlNBhP4z1UHrEoiMIkgyi+MQAanRZxmgtjdABdF0mveXhc4YrQg0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOFG6Dzm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOFG6Dzm"
Received: by smtp.kernel.org (Postfix)
	id 390D21F00893; Tue, 13 Oct 2026 16:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231801F000FF;
	Tue, 13 Oct 2026 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907827;
	bh=CsIgR7iD/GLOASymTfY0vAhPtgkW8+Q9lIIzNrLmI7U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NOFG6DzmxeC+vnZJKtDNKqxrwVraCXiS9uo0yUJ+thIUddxuiN849Pwi+6dWcnKOl
	 iqBlce9ofNaIRoSIKqez1zFcxZSVcsJD7pfLn7joSKRRAbZzZaGF3HhqkIQ7cmcJ0e
	 bIAnOVQGqqm7/tLAWb6tfVu42t4Yl4gFwpIVv39d1/oB6ccXGeQHz0ZdZ7IOUcgJLS
	 pyZs6vmcMii5I6C+snx8caUFPeq3cKQvzMOeL7al9o/DebED9RM4PssReO7g/3YbTi
	 kglchNEw0eN/YVw8znugUvRKNlXfVEX3NFJBVtFX9Srw9j/fdXcbtMCkGMMeZWnNNS
	 zQb4TKv7RFBEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1AD4339D5FD8;
	Tue, 13 Oct 2026 16:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190782576.417156.12078227978640776752.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:25 +0000
References: <20261009061202.29652-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20261009061202.29652-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Oct 2026 09:12:02 +0300 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 SoC updates for v7.4
    https://git.kernel.org/soc/soc/c/6b2aacd2654c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


