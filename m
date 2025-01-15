Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636F1AB6CC
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961207; cv=none; b=RpGWOuRfcqt4D+YnBpmmQYtmDOvcDL7ewktbnSzSKtIpnl05NVgOmIvHKrk5xh77/YmcjweeVvj0WtKtl0EvlnKMMsHH03JS+WSuBdxTsghB9u/JIGnxdELVnWijNcMVUkN4Um0zvACTgmUgWsnoB93S61eXMgXubnODvHp73gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961207; c=relaxed/simple;
	bh=05RxVq+vo4zQXRPEWb0hOq30BkR59SIDqj7NXVej55U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZIE+i2FT64jmGB+9d2FJyx25gaPZiD9Gc8CePw2+Diaq2J3ViQDfCtDt7ETdcMxEajVTKEW3f1iUQBoq0+xVaiYopSiw53LWuk3Dt9wO6OrReJHuLHQrh+/ZmUvsmxNEST41uzwV7JhAeGFXt0Rohy0HvehYbxkMynujO7VHEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNMn3tOb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNMn3tOb"
Received: by smtp.kernel.org (Postfix)
	id 25300C4CEE5; Wed, 15 Jan 2025 17:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD45C4CEE1;
	Wed, 15 Jan 2025 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961207;
	bh=05RxVq+vo4zQXRPEWb0hOq30BkR59SIDqj7NXVej55U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hNMn3tObciJnJABKPPHeS1scglj0/8frg3gd6M5Cu/04y3JfERArN1Blyycpvpx4Z
	 4QNQ0eCNpQtDaqQCvlMSlPZBAM7PQRbE5QrfPb7u3rcfHqNpXCZzcEXWQCzfNi2hp6
	 U/o3ZqN6Z0f1G+hR6cEgEsQLjb9VjBLiaAhbHdd03/ouwb+aOrFI+XAyXG+AFptO1v
	 5JISLIsWP1m5aC3I9MH8x1WD7dAtmAqNJ/39Ozv4DNE9Lguqjxx2XG57q5lryQfDay
	 iaqk+on7yTrOPEE0DdrTMJ03G3+FDCXQn4L2+RXHvf3yLP/VeR56sPKh06KFd2zpXH
	 0dV6p1iunmo6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DCA380AA5F;
	Wed, 15 Jan 2025 17:13:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.14 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696122981.809051.5294930535305803565.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:49 +0000
References: <20250115170247.1303656-1-p.zabel@pengutronix.de>
In-Reply-To: <20250115170247.1303656-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Jan 2025 18:02:47 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 5ae1a43486fb3febd5ce78da13eb354f16d049e0:
> 
>   clk: amlogic: axg-audio: revert reset implementation (2024-12-02 17:21:03 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.14 (v2)
    https://git.kernel.org/soc/soc/c/f51df260e82b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


