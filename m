Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62CE27703E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756532; cv=none; b=qxBJQdysrkOKDwLYjCeYfTN7dBbO5hhjdIKQW+eRQuz1FycUGxdLmsN955cqxEZFhRlcbjlOTk3XmPOe4985ROqg3Sbvo6eZOF1ki/+LeiDnTAjHfS0zZelrWDFajVcIeWZJwuQECBdvtz9Af4rRyedC1tPaehP3Oc0p7yBZihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756532; c=relaxed/simple;
	bh=y2dqdjDzhKyrcECPw8MU3PqH7MWqDZEExN50n7RbsRk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hD7W1I/3rY534p5ZpuyarKjzFBIJxxFeHJDUOfngIVbqcxk1YGAPjAX8wNeOac+VcOuGKndJDhdOSQbAubFIllbzM3uu4vaddCiiPnNr8crcL7dt2IpdTaWYoZaOZ5dw1Qi4dp1ENgGAaAYvd/CspXoAESHDhOLcpmqLt3ResCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J924LVgW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J924LVgW"
Received: by smtp.kernel.org (Postfix)
	id 77D7CC113D0; Fri, 21 Nov 2025 20:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FFAC4CEF1;
	Fri, 21 Nov 2025 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756532;
	bh=y2dqdjDzhKyrcECPw8MU3PqH7MWqDZEExN50n7RbsRk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J924LVgWC94BIUmhhe/p/BJnhdHd0JXnDOgV116JMeyNmMla4URHR8+wq/2dvpp5U
	 Aw4q45NdmNUOec+erCS0JB9Z0n1Yvxoh2IsCZeucRnppgJ/Yfi0a8lQJ0bMpCo4U/M
	 5DyUBs18rTT5qlsQZG/oTyLPzJWGLyF3AN5fhedai1LMtf4pr6dP4g75pJaClrbiSP
	 FSyFI5zd/M/DcPIQMUOlYJ1vYnHB00/1TLIKsd4NF51UY5Me0+PBaU+ccxzLxJhw41
	 7LTQosp7zldGF3hT/RWwv/qVEwYOyNGAblqKp01UwzLAGT0Bzx7ggmhTb+Mz+95n3X
	 xROygD0QmC93g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B4E3A78A68;
	Fri, 21 Nov 2025 20:21:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375649700.2571237.9344421368896513686.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:37 +0000
References: <20251117205824.3178198-1-andersson@kernel.org>
In-Reply-To: <20251117205824.3178198-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 14:58:23 -0600 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.19
    https://git.kernel.org/soc/soc/c/c02dce25bc66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


