Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D6D241CB7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758899; cv=none; b=UTuKWYIqy8KXaSf8/hYbRWmAaANQ88LX1LeUZdyAmuLk952SuRG9dp2fIcH2u7+SEk8VDRb7qf9vJb7xAW5syV1flcNJIKx7ORJvkb+JW2LEPFRE2OTXuyGQTDUL1aaLffPswN17BsgI0+Uu7nS8OP6GRPq0VQWfCILUVqUv3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758899; c=relaxed/simple;
	bh=qZCF4TRWz4JrLt5BLE7mYm1IitMVKbgh8GpkFKKHvu8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=okeVCvDjgC3aS2yhzV9eQZzxGWmFHQpXwFvXI0xosO87uskbUuZFbfOuxfxzrCZrrABzzaD+sfFHAOQeqMufGsLDfeZP1psVrosXWCsMpSSEIQ/51UqsBGqkKYfco31ZCfE//dZNhac+NHKOW6FrmQDng9FYSeyL+zO0CqXjds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mdef9WEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mdef9WEo"
Received: by smtp.kernel.org (Postfix)
	id 7CF20C113D0; Fri, 21 Nov 2025 21:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F596C4CEF1;
	Fri, 21 Nov 2025 21:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758898;
	bh=qZCF4TRWz4JrLt5BLE7mYm1IitMVKbgh8GpkFKKHvu8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Mdef9WEo8NjgDAwXd0dgIpORmFxmBNqszT+4ZTxuRbwXYRdoCnyqdI0JndNA7NBYV
	 nyIh48i68pEXh67kwgd5qLLUctovnM02bw7iovsWSO7UGKCnJA5NNBz5N/j1X9l4NF
	 nBdHsw/GSF+guigZ4L//HETdUujXArmpGjhYkXgEO/C+RZ1cU1Mi/idHeS+5k3UubF
	 zU+kMxLdYm+fRUyi4zPzjbe8VCrF5afP9/1uuWkDizlGmO3IsVTLnyND0OSKIfY10m
	 9aQstuVv5+JvWg7FesxgvcE70+YFX/koPLhIkHId0zni/VszRpXzTC8e75yYGRcbid
	 F9sU44bVKix6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33ED93A78A69;
	Fri, 21 Nov 2025 21:01:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.18, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375886300.2583629.2826662325281385402.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:01:03 +0000
References: <aRnQK0kiLvQZ9X-f@dragon>
In-Reply-To: <aRnQK0kiLvQZ9X-f@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 16 Nov 2025 21:22:51 +0800 you wrote:
> The following changes since commit 6504297872c7a5d0d06247970d32940eba26b8b3:
> 
>   arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.18, 2nd round
    https://git.kernel.org/soc/soc/c/65c4ba832d09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


