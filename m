Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572779;
	b=1Yki0kUpoINeuTsVzYD1D+pPSTWXHxOaFWafT5MhROtul7EZx1ei0CNQ5eTaQDB333A9
	 Vj55qVUS6p2CTO9FODEaCDsJpUALLoRaYIN3i+6h5q4BTuo6kfueplCUwzXPJwih9CysL
	 ADz7sKivHIcjptBoqDhsI9NsXn5UKd4kUrsNGwAjsZZyD9aQHiktQ/aGhicMQsVHWT5dG
	 53c4byfB+M5LkzrmNjD8BJfp3rGfUwMVWTASDSY7A/8ah1ZNZPN3AUFyKqsaWpDNukRtp
	 4oRCv4c/bp70Ff6an/eduD3duNw4ON/thMKIQqdC3L7fsvx5RRA1Ineke0wDQReZQAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572779;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=DRQRIRQarXTnNZOzq36UNa3LsErU7BTljNQ23y9A7r0=;
	b=wQePgP+jR1mwcUJkHQwaX9YfZN+elc+H/FIGcr4qkPLOCDF+pXTeXuKm9WTEH3Gakzlf
	 Af1ld2vtcKIqV+lNR7UHbdWDXc1Xp5VWxI5kFUl8LnceK7iciG1sJSN8IZBW2evq6Gpi1
	 uybbPHG9dsFpPTDHAb0Q1374AfvlOgQgt+pH0LourgH/fC5MoJXYldUViPXucIsdS0ynR
	 71JJ2Hxs7FsdDRYkmguxynb3fa4w99SX7KT29z097tsVX8GmLxKX2WzFEh9JjDLyIm7c5
	 kkgjaOD4j+/Gn7Q0tkIgZvk5f0H4mAClVy2Iu2jtvvyDraOPSjDEEK7LBXtmEEfuL7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NMPhMg7/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F10D606A334
	for <soc@lists.linux.dev>; Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NMPhMg7/
Received: by smtp.kernel.org (Postfix)
	id DF6901F00A17; Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C614E1F00A15;
	Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572778;
	bh=DRQRIRQarXTnNZOzq36UNa3LsErU7BTljNQ23y9A7r0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NMPhMg7/LznAP1qKPdQhcyzfkoRnuRkq7vWZjqAO6yYDMCI3+mTSy00GNoTykPN/l
	 I+GcNSBWN/4lKNE6BrbqMKRcw2/+bmGiav7aSTicXO36taBJC5NZH18IU5+Coi0wDA
	 gdR+edr+EYORtPTeI3PIdccVm00zUB6RTLyHFT1po3Dthbd/+/AQoelHGin4MWU/kH
	 uoyu3FyWLf+cXi9OWPgdTyEABrwXLQsIAJPmb66RPyboOjS6jYP2HlbHO9F5enDPf3
	 gg8XEGofYWsoGjADLkrLrV//hLH/EIbWNPvi1BLJ2/pR3iSrs8Q6hADfijvq8CV2e9
	 aclo/6XUh1New==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA314391AF9C;
	Sun,  1 Nov 2026 22:39:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357277729.2624073.16276179294842565397.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:39:37 +0000
References: <20261013-defame-busload-7eeb111f35ce@spud>
In-Reply-To: <20261013-defame-busload-7eeb111f35ce@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 13 Oct 2026 16:14:18 +0100 you wrote:
> Hey folks,
> 
> Might be my last mini PR here, since the RISC-V SSE driver is coming via
> the actual RISC-V tree, so there'll almost certainly be a much increased
> activity here going forwards.
> 
> I'm a bit late PR wise (sorry) but I blame conferences and a busy week
> beforehand for that...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
    https://git.kernel.org/riscv/c/7c2871861461
  - [GIT,PULL,2/4] RISC-V misc. devicetrees for v7.4
    https://git.kernel.org/riscv/c/928fdc6ff69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


