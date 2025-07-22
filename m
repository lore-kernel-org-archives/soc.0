Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F0271454
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217435; cv=none; b=KiYPGfqjRLa02E4DHIKNADrFO6NFkhF5ayZOQ/Gur05fOJsnupQj68GucnJHl+sdM94yFKf5Ph/Q1PB72es9Gm42pGbG5Xx+K6LY5+VrxDqVnXf67Ebk2XpVfmKPotb8k5ASO60/9miIvxZq9KgezOffoXw2soT+Unbqol/jE3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217435; c=relaxed/simple;
	bh=wqruv5WefaU9z2Gq0HDpQKLhEiijbzyhy02Cx4UunS0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IISXxHfZYuhxZVqs8sKWTvCs80WWcevro9WgOFcjo2VHK2varcfDxLViUOis1k88H4cNZdVmwuEUc3UHlSsqgLi0UkTlFU6tsoHjupQyEVZ+OLi83wwMXYB1o7YtxTNGx12m/O7yi6cjekCuFkxuQP3IAfoQ/VdoQ1SjFiVf4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBV2td20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBV2td20"
Received: by smtp.kernel.org (Postfix)
	id CF23EC4CEF6; Tue, 22 Jul 2025 20:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B969FC4CEEB;
	Tue, 22 Jul 2025 20:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217434;
	bh=wqruv5WefaU9z2Gq0HDpQKLhEiijbzyhy02Cx4UunS0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MBV2td20PKQGSz5udWJJzraSzJQTOHPoIrcPquD/xUydB4V/rQ2hgqrt+JE6mTJZC
	 3GdqighBzcEu9jioep5G1OSRb1Sb92LadJQlcA/p0tggdujuH1TP/qIcr3yKwOoYey
	 FHHPBx6waTj4/8ncznvFUcDTJr8HjZf5A5yzfbRXI5+pXcA7DkOTK1os1b5W6kzJ36
	 t5uu7E4OyKSfmK8SjjMZc/uo5N+HVxhMqSXuE+kYXaSmcWbPc1H/u13QnTBKIwBEAC
	 6PhjpslfTOQMsW8kMsELc+TvW8Zvur0U2VUYsYYA9Nby/TxTI0vsuFdAjrwmqjbAO/
	 ZL37iulEMQ/jA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BCC383BF5D;
	Tue, 22 Jul 2025 20:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL RESEND] RISC-V SpacemiT Devicetrees for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321745291.949540.16857189443571665641.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:52 +0000
References: <20250715014214-GYA540030@gentoo>
In-Reply-To: <20250715014214-GYA540030@gentoo>
To: Yixun Lan <dlan@gentoo.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 15 Jul 2025 01:42:14 +0000 you wrote:
> Hi Arnd,
> 
>   Please pull SpacemiT's device tree changes for v6.17,
> Note, I've included an immutable shared tag of reset-binding
> in this PR.
> 
>   Sorry, I've missed the email title in previous PR, so resend
> to fix this ..
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,RESEND] RISC-V SpacemiT Devicetrees for v6.17
    https://git.kernel.org/soc/soc/c/4ec8959278a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


