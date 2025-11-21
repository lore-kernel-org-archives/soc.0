Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42F2F2603
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758250; cv=none; b=J4mlteflAndGfjwLf3NWe8qWDdg0hBuIxtBwo58KSbrAn8zJDF5B2+hg7oW8/z8SCuFmYPd7dOdWQuv12aJ3T9Rgtm0RfvZTjkSnthe2pHpR1zXoNrf1MCe3ygBzvMCcmXxeNrbVY4P8Y5GE0KdO8l7pDB/eqI5reM+7eYYJWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758250; c=relaxed/simple;
	bh=Fj+xSjaobos8z3oo6fsPndUr1fyBwiWyrSKlxQGogyo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=T6eTagP+EqRwsGzIFe8ykQluGhukMl2O7+6PVYn7J++L5GmYfroM1bfhCGFzCBcnDLu4hM1Wt1Cwa9slaznOr6apCXowZVlcblJ3SK88wPk1mdRw2BO6S/q9bR0tCs/6U79wmaJTCpB4/MPM4F17tJmQ7pJ0w0jmXIsQ0OMezy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ5MrxT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ5MrxT/"
Received: by smtp.kernel.org (Postfix)
	id 07072C113D0; Fri, 21 Nov 2025 20:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6097C4CEF1;
	Fri, 21 Nov 2025 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758249;
	bh=Fj+xSjaobos8z3oo6fsPndUr1fyBwiWyrSKlxQGogyo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WJ5MrxT/E/eZxHNyKxe38TPyWDoiBYblTF2wYXzlOXSra5NS4SLlRNFz5EQmp8CyR
	 UiUdVt2Kn3RUZg20nsYE6eQC3Rda1UKUbpFT25kxc8DJhjJfepL5Ux8Tc//Y48/IIQ
	 eR1SKzUb2ZCU6vfM7DqSZc5CfP4fIza7QFDELRr20yVwjv0FDPdXvyVTOQTGfdutNq
	 AKdGjcmL2AGQzKhHym8NBxqbJNUmtCzKoHNUwAfVx1pzXxtXxW0/rXhSFlabS5cnQw
	 D0vXfO+lkB8Lya7OYqPcXBx2wAcjhLUVed7KyEW4UGhiC1nLMDL4geD31LJXb3QNLJ
	 TgUfzGAYVkr3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD403A78A68;
	Fri, 21 Nov 2025 20:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers update for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375821449.2580769.10095811051142389584.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:14 +0000
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 20:33:47 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers update for 6.19
    (no matching commit)
  - [GIT,PULL,2/5] i.MX dt-bindings update for 6.19
    (no matching commit)
  - [GIT,PULL,3/5] i.MX ARM device tree changes for 6.19
    (no matching commit)
  - [GIT,PULL,4/5] i.MX arm64 device tree changes for 6.19
    (no matching commit)
  - [GIT,PULL,5/5] i.MX defconfig changes for 6.19
    https://git.kernel.org/soc/soc/c/68bdc95066ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


