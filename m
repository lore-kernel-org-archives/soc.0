Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958D81FC7FF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424975; cv=none; b=pdQDRKagEFE7dF1kuklPSKlqNNlznh39d/6x93flq0WyupoWs44/P2y8T44TxPA45+Q/OfgpsDxtRHR9Pt/cl7puiw+8/O23wGlPFIhtc4Ll3pmbkCpno7UYngiRXAH3PD17b3Impr7y4HQtiLzrtmCu11C94zYL/IGv8kTbb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424975; c=relaxed/simple;
	bh=+3Kl3hH2ibQwDtbHfta/52eCqLWL+qewUktJCiXYGTs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uJxb1MGL481l4kn+0GeHHTFu2+hBdnJTgBIe6fxzKxkWxMhnZ9ZqyaHVk37+qjeexkuxXc64mIduXGGU1eG162XKrWk6GusepOqtzU/SnLW5g0PrR+s4F+v1fMyyyC7m2rd+qEepI6FxGVJIaIVhWL5Mgr0R6rg5k3qsyHzWyS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFz7y4Cf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFz7y4Cf"
Received: by smtp.kernel.org (Postfix)
	id 2F3C3C4CED5; Tue, 12 Nov 2024 15:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193D7C4CECD;
	Tue, 12 Nov 2024 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424975;
	bh=+3Kl3hH2ibQwDtbHfta/52eCqLWL+qewUktJCiXYGTs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JFz7y4Cf+4+RPEVF931spIldCzVEsIh07WB0hTNN6JVD7DrVHI5oFE4pSUxU36rIS
	 54kfnJNq3Hv4zDKRfx/hPjLZIA3fcrrW8FniLgFtBN+I6xT37RW1P2dLyylxEg6Fhb
	 gBxuQLy0twUN/W0fLIT7OwLaxcbJX58hsbi0KC3H+KFkTWUuieKuhYLwJ/f1oz4/2Y
	 D9BvG4wlk48LxRxmHrHooz+qiW+AXG7+t1g38ML/t/ZBVIgo2wRfipZerMf8InaMEh
	 e0y1WvpSrpOJSyp6ZojBtcPErIIil83VVxTujF+DF/9PGGLMFHQM1Vm4IviDxmLHL5
	 41f02cFehjdFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 721BA3809A80;
	Tue, 12 Nov 2024 15:23:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: ti: Driver updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142498498.562452.1417986378102765122.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:04 +0000
References: <20241106121708.rso5wvc7wbhfi6xk@maverick>
In-Reply-To: <20241106121708.rso5wvc7wbhfi6xk@maverick>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 06:17:08 -0600 you wrote:
> Hi,
> 
> Please pull
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: ti: Driver updates for v6.13
    https://git.kernel.org/soc/soc/c/ffca677936ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


