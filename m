Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E7272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756547; cv=none; b=O7HJrTiQIg0N3TbbA+w49tqFcjWoKhB4h8Ogul1pI2qvaWCB0AEXM7JjdF5nBOIrNvw/yT7Xn6d9mlF6b5TzM+8sOgwytkqzebOuWnok3KO0hB1mH7TUIh9QoTZ4a0mwFsbt/cFUqBNEX6s2M2wTojcqt/DJBcgsHbP/xbt5qLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756547; c=relaxed/simple;
	bh=jN8Dd14Begc+Et0JIdiMLsbbB9JBMs7YsP7WQAL4WXI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=iP3l6APQ+hL22XzkUHTSHWox+EuwoJwfrhZIvBobJkhOfVyr3QaDuwk9MNkcBf3os08Bd8r7qScBEmAyUx5cGl44CuYRjfRQzU24FVNvW35ejzEPy7VBPZVfKNYi5EJmrW0s43yVwVTlCyPJ44HnIZBx+zU98AULR78Zfok0sFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUzHPMKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUzHPMKD"
Received: by smtp.kernel.org (Postfix)
	id C021CC113D0; Fri, 21 Nov 2025 20:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA274C4CEF1;
	Fri, 21 Nov 2025 20:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756547;
	bh=jN8Dd14Begc+Et0JIdiMLsbbB9JBMs7YsP7WQAL4WXI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AUzHPMKDkq2fLAbJIIvIWOVju4Vbqd18DNGA2eA4ZE7KZMt1yKUtQcQipVotF6FTy
	 aP8bC1McZcgIrmGL1juO1q086yRUW2inK/xctC5cXflG/GUd4h+Ic+GqwNcQA0KKUA
	 g2Z88KUErpZZQe2xD5pL/qOHN9mBZFoZotpvDcE8MTctq1iukn6Age9QHGmdy7zCQU
	 s9yKDZ4zM/wxioadr+QE0ewzKiBulR70tTGxnOtK+frtJkCk+eRfHiPiVtmKgiaN0/
	 3Y5QIBiUO7NnFrxqjVCdywnF3Q7VzpIli8ZAfoBe1DFV7d20ZOnSOgxwiMUANO5eRt
	 JgySHzj9dRmiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D043A78A68;
	Fri, 21 Nov 2025 20:21:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ti: K3 updates for v6.19 part2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651195.2571237.18342929678348209955.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:51 +0000
References: <7ad1ef51-e56f-44b2-acbf-70bc1f43dce9@ti.com>
In-Reply-To: <7ad1ef51-e56f-44b2-acbf-70bc1f43dce9@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 21 Nov 2025 22:06:36 +0530 you wrote:
> Hi
> 
> This follow on PR for TI K3 DT updates contains few late fixes mostly around unapplied overlays
> which now lead to build time warnings and couple of non urgent fixes.
> 
> The following changes since commit 00fb4c73b67d36783c5ab95a830f0cf0142b9fc3:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ti: K3 updates for v6.19 part2
    https://git.kernel.org/soc/soc/c/287df51938b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


