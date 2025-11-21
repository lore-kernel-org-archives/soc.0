Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179E272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756556; cv=none; b=NPDnVrK3A/tYsKlnI0KTsu+2eVaVrHMogoOafBZI1g8X0TyfUdHGRgzvtHWow6WJ2H2Tm1Pq0g+o6doIhb+U+KpTzrlWQ82iY7VfKorFYuYj339RAVxMAIIjTc2Kl5Sw1BayyOiqBZ09JPCNSpsTNwLkO0k4AJwDBEBwJOQw2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756556; c=relaxed/simple;
	bh=a/Jc7R/O2gPHUssP8UTdFB5xY5JASwNwstMQV2VBnIY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n5HPwoLeXV07jdKrAwv8QSiD49+9s3Izqm/zl0RV16ZNulxTz8PTi87ZwtJhcpAIy5n+TFo7WkIL8nANMrLCBKgKnOnUPQK7S5FkH8MWPqke7G/jCR4Ax/FKORN5tis8+WHWS2X8+uBMR0V/VLAYlvIfzG7Dv0YGm13ImMm2wAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaJtky1I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaJtky1I"
Received: by smtp.kernel.org (Postfix)
	id 2E5D2C116C6; Fri, 21 Nov 2025 20:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A2BC4CEF1;
	Fri, 21 Nov 2025 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756556;
	bh=a/Jc7R/O2gPHUssP8UTdFB5xY5JASwNwstMQV2VBnIY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BaJtky1IdK1ROW8PkW3P58CLiaY/gRBl+d0k4iXpb9cHF320M7HIfaTLaADPmw9io
	 ZuN4KNQe0IRkbTGpeZbNRyTwYiB/HuMO1yp+eCG8bdzWmU7X4Lhd0DOKTKE1Jt3RTY
	 5uVr4XG5gXeHh1G8SXSI57xHXyzxnO0PWs6AM9gXpxkHvuDMPU7WIFTaaYV3250V76
	 fzOkVu+MTVqNqqoERGkf5+VHtS18uR+Vd3FNxNQSpWbqKXxEVvYevtzsfrsqkhK3SS
	 Cl09tnCnphzg7gLi4AsOVwadw0ZQsAYj8iYU0KMLTJaWcPqBA55OtfnMP9I1yrP1hz
	 rUMPG43ISKlLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACCE3A78A68;
	Fri, 21 Nov 2025 20:22:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 device tree updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652049.2571237.9019663629063732205.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:00 +0000
References: <20251117163533.209608-2-claudiu.beznea@tuxon.dev>
In-Reply-To: <20251117163533.209608-2-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 18:35:33 +0200 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 device tree updates for v6.19
    https://git.kernel.org/soc/soc/c/4033cc098ca8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


