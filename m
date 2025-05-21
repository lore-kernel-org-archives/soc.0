Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCFF21D5B0
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848036; cv=none; b=TFAQPLGZ3VJEsLYTC8n9XYbnEkiP7YN5StXH7mJYXug1EZpHZfmWCcmxV8KBq2NUBNKQh4lH+qI1cuapeU5mGywFkaBM7TJNW9v0rI9e+4R7hZPq8RuWlCxkOmbFsPLTu6meLdQkkx2VBFg7n4qnTZDdtU0Dphu8IzOLmtCBYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848036; c=relaxed/simple;
	bh=2WReXTVQEdocXHU7IWQO6JZJYBj56QPIanKwjXbHMho=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nxVOZzTDAiTWkDVKag/kxTtUGzE1Dx1nYLxch8P1k8uOk/NksCaUPdg1qNu21cI0dbHZGvg6EMYKEjUOwypNQ8+qElWmseQC6Gfigu1V6ImyDdIj2mRnMMsEg4GEKhu5UjUapKc3b9uQXP5Ovchoqr+9syAEOPztgs3d6MSju9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQvNFekc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQvNFekc"
Received: by smtp.kernel.org (Postfix)
	id D132AC4CEEB; Wed, 21 May 2025 17:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEAFC4CEE4;
	Wed, 21 May 2025 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848036;
	bh=2WReXTVQEdocXHU7IWQO6JZJYBj56QPIanKwjXbHMho=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QQvNFekctjOYXRyhQC5LNp2Gj/pT/WM/Y3XAUYtx+D12cV6CEv3kb7m6TRlhPL1Gj
	 n169m2DistPVJerAOhU/lxcAWmdchboQppR6dt1/B2VADVpob8h8a+k3KnyLeSRddq
	 1JqB1HaiqZ+NAu7mY9W5hz85cENQ5+0h2Pm5YjScUVEQpmzB4zlDkXHLhwRqE4BvCb
	 u90pQEt7W+dISK+zwv9K4R05rWUZlud260P9GuaxPGY11mfKg3iupPz+dLogUIbYou
	 K01e9I/d1w6FxGg3X6NmiZJgQeh1UQ9vVJzCL2gaXsS02xJ0dt1WhDubu+TZ7hg1Xm
	 2LZJV9sM2VOYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF88380CEEF;
	Wed, 21 May 2025 17:21:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM DT updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784807224.2163178.10990834869970252735.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:12 +0000
References: <838c5305-5c5b-4232-b7fe-86598dc50ace@linaro.org>
In-Reply-To: <838c5305-5c5b-4232-b7fe-86598dc50ace@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:12:13 +0200 you wrote:
> Hi,
> 
> Here's ARM Dt changes for Amlogic SoCs, setting pull-up for UART RX/TX lines by
> default for avoid issues with debug connectors, and introducing the Meson8 based
> TCU Fernsehfee 3.0 board.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM DT updates for v6.16
    https://git.kernel.org/soc/soc/c/709c8afa1506

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


