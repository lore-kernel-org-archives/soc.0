Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72C1D5151
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866678; cv=none; b=PLvF/5z9ksdjiWANUBd5Sn75X3QQdQRMFx9hAqvtJZtzY+TIe+AcAYKGwPC6EdmuX1myDBAwCRDGnRQn0pVq4I+fmD8bjQkEac2SoyQnllL5PNnAY5zxABOKuW/1zEsrsoPIVj0oor8+LNwwRUoJWCHL3ljR5dZ4dhZ+28c5mxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866678; c=relaxed/simple;
	bh=zyHGZtGosIBRCtDW0iIlGXT/DgWTNFmKODvCL/b21+Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ksp3gLGY6HCoiajIl8v9W43D9ROjp1VN2eF+4PyAv6HIyxfPxlGfHwoYId1GAk3bOIJseyvIKGb/tMcIVI9vqQ9Z730t/qLpX9JM2YIbC5xDqg4gP8xAOpacTo4ER2o/WUww9lC4tbCj/GFfr6efMBl7dfZ2cxNCnZI4l4vF0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2uhAjqV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2uhAjqV"
Received: by smtp.kernel.org (Postfix)
	id 22200C4CEEB; Wed, 21 May 2025 22:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDDFC4CEEA;
	Wed, 21 May 2025 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866678;
	bh=zyHGZtGosIBRCtDW0iIlGXT/DgWTNFmKODvCL/b21+Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H2uhAjqVSoj6v1mGjwZ10PDglB/hmgoPgetVhdMHbZVtZdLKPxVt1WmRVlnCWCUYf
	 i3jkx2tXq9opF61jflcPVat0jdfA78Kk/CgUE50QmQvkkPU92hNkPHppycn0FZaj2X
	 F6eduI1ZRUlGXIUfjNW3GsVo1tWQQBYQfxEpEfAovJGNp0SDM7DLdDD3LFGpCV+9Vg
	 CkmXewNKCOCvpROhG1HU+/fGj9n3ccJrJNBpP7aVLrdKnGAQ60858j/w133t2RMmWO
	 TvQKdmy9ZZ6mW7fJF8P8PRdTnHLPePg+uizaKnJnFfzVshV5aITilB5t7lSDH4l2oz
	 xAlCF4vzrfFoA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAB80380CEEF;
	Wed, 21 May 2025 22:31:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 DT updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786671348.2299459.6074981573628757235.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:53 +0000
References: <20250516055330.10852-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250516055330.10852-1-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 08:53:30 +0300 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 DT updates for v6.16
    https://git.kernel.org/soc/soc/c/ea15963b2653

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


