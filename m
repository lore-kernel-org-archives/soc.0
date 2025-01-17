Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEB1F8AD3
	for <soc@lists.linux.dev>; Fri, 17 Jan 2025 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116413; cv=none; b=NrgWehN652qase3zP+nGj6AfihrAlA+NaMADBKFG3qo/8mKG7EOkEhg1/cb2MYknus2tVIIB6Ot18w7rPA98CvHNv6n01Uq2BB5RhPPoqblRyvzDrJso5LXxxiUWZnoFInlFaUML5wHh9VvpevZTFr1jM+uZyRTr9tJF0bBD/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116413; c=relaxed/simple;
	bh=MkbxKkPNE+rqw9VrD45YER6xxmDRvYytCs6RmG4Yklo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=S8recs2zU7u1uAFJE3eqRfwa/TC6Vb7RxZqX3GolW76OEFZAAEl0gbXMDcMEZMyHMkvFDk4bKJ8IFrB8c8ftDX5hWdlB1wRuyn0dx2QMq8kCUytf7qp8YlhPSk39GIrFyFQBd6Opg2hNwIPsw/l8HVEAX1VQt6QCBC2QnMifaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOxF/ADI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOxF/ADI"
Received: by smtp.kernel.org (Postfix)
	id C7D1EC4CEE3; Fri, 17 Jan 2025 12:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2832C4CEE2;
	Fri, 17 Jan 2025 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737116412;
	bh=MkbxKkPNE+rqw9VrD45YER6xxmDRvYytCs6RmG4Yklo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WOxF/ADIt6izmF4aDNxTal8BC9S+Ihw+s0UTlOiSWzIEEw3KoWUonXBAIN5z3m1+5
	 Irx+eAobYl3nDK0RwPJKhoy9HutkPvA53Hi41QZmSN54EyO1jvzuIqhTaO0bLURXra
	 8CwxnVl3F/JAZ4wJOF5K0kUYlW8PTRjHnsinSdDX0p6qHSrEp4Un5Tbt/aOAN+RIPO
	 aT6etlnosZ5kzOLwfsOK3Sh9PkIDDZaMHACVFeKWyTg0z0FTy6aPa1uxAUiMLgWwbI
	 FMQJUIm0fUzh7aKgsMqoFj6jxzxx/Z6vwyNkgRRqwoaG9PX9ClUWNkBnV9y38y5dTF
	 SZGKCPdSBY6HQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340DE380AA69;
	Fri, 17 Jan 2025 12:20:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173711643600.2108892.10661973407939094803.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jan 2025 12:20:36 +0000
References: <20250107081424.758980-3-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250107081424.758980-3-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Jan 2025 10:14:24 +0200 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 SoC updates for v6.14
    https://git.kernel.org/soc/soc/c/2fd7a3f27892

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


