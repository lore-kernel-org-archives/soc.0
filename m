Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1241FC7FF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424978; cv=none; b=DZ88GHBexJB8DLsR+LfEix0h9fb+4OTCvdUuHfnVXZ19lGKY+75xGEovGFmerL+7AYGoRz/FdDB+OeiCKFs+80FkeHi/yjX5KSYcze/6Ror8HVJ9QZW9F5uQMov7hvkRGLOmoJIVUXd4tuB2mcj0km+eNFkoTnJ8HKIWeCyffdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424978; c=relaxed/simple;
	bh=tWaeLkvOJG2bWR/oa961Zm09O9PxgWM/Sw94NtSvO5E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IbLqSgbAiVLqK0CTngprRyQG0MpfmQQN0ycPfjhPyfBCMAaQjq+U1fAySOxx4pCYQEv4bHmN9kRoPcsqOW81cA0cag5p22LR6STB/fSmFOy/DK9AxUEltiNnVOhC/bVOvvEv6nrz25f/iytARXHbpx/AVOEQk1GuG7l0XDa3D+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKjLMhIv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKjLMhIv"
Received: by smtp.kernel.org (Postfix)
	id DF8D4C4CED5; Tue, 12 Nov 2024 15:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9494C4CED0;
	Tue, 12 Nov 2024 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424977;
	bh=tWaeLkvOJG2bWR/oa961Zm09O9PxgWM/Sw94NtSvO5E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cKjLMhIvMOIPPSZyjlWYhajK4sJ9Od1SYP+XeX6ZqwDxaKNdACBy5FaFST/cYunad
	 AU3KH5Th4WtO3SwJ3iZ6VFuxs/fVu2vABCu3qEEqGLaKEEM7GEdvzrnw28HgGPogt9
	 P0gW0YEJrxJ45ESERRgTvcOfdPtYwCX9saR6TSWtWmM2mUe+TsQwEJGBHwQh+BjJEM
	 cXquNc2xXyv8xYu9PlM0Hnt+5zZ3JahaZVwIz7/fAtdWrda+/qpcwLJyt+MWd88G6d
	 o6seuUaUaR2HcQBgDnmrFjzVKJgvG53ACam0NUKK0B4ZYoyRwQji4N8dUmJYNzOsqd
	 MLhofyJ8KD0Gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 339D63809A80;
	Tue, 12 Nov 2024 15:23:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142498773.562452.18307259198187864708.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:07 +0000
References: <ZyuRCalH2vhHXm0Q@wens.tw>
In-Reply-To: <ZyuRCalH2vhHXm0Q@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 23:53:45 +0800 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.12
    https://git.kernel.org/soc/soc/c/d62c9c5c4cbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


