Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8220FA99
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644361; cv=none; b=rWn6uHbl9d13klsdnSIvK+mPVebvjzg7JqlJJDT0LSqT1fvkROH5rAyilPuW7JojirXhvuYxw75cqrWGm+rTOlmv3Abnvo7Ut/5iqpam7jF3U9WwobgfX3Xd591y1ffI6vF8Q5zKUQPFdEMOAfh9i9oxA/eHVCOtzcdwg4dn14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644361; c=relaxed/simple;
	bh=kNhrxjd2DEQMEjnvxszfMzakYr00+6ZX4p01gl0w3hA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FyiYvMMb+D2XhdSp1HzVcZdGf/HvcUoLDGQVAQI2g9vZIT+0iImz5vnz/XAG1Izf6icmI9ZTak1I+kVpfdoYfvcT+x+ZjAHCok4CRKjh3rRz2IA1EUi+ij1CYHvcwGH95HpszalS0wER5MPUTmh+drT7LqpflDBXZxnd2TB8wBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pk3bfJhi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk3bfJhi"
Received: by smtp.kernel.org (Postfix)
	id 40DE9C4CECC; Fri, 11 Oct 2024 10:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B246C4CEC3;
	Fri, 11 Oct 2024 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644359;
	bh=kNhrxjd2DEQMEjnvxszfMzakYr00+6ZX4p01gl0w3hA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pk3bfJhiNTMx6U7g5OycWYLgY3NDQBKD2tU7De9QRAXBmqy1nLExENlnMUmUq1SSI
	 q49K0if4LzbhvTJBKUb2PImkF7hNwYW+4oTH2D/4/6pNZztkXipf/1vh+PODOVuWDg
	 1J9/RpGYc02PKbIs48Ijc0Dxl3C68J+HF/fVYxXF93w+cjCGD1dBDsyDGg+U3kZFSB
	 rHJ6LPaLra91gUqeoKNqmSF0G9jQ41+EHCiKuKsKSo++tB9sBkKo3ej4XfXQOxWt6n
	 8VcaWfymdS9bfYnPo86AEBOiDgu0jNJrpLO7E07QZ+J6em2qWFeDoJRHMvULT4bLCg
	 THEScfsR4rxDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACB13822E4C;
	Fri, 11 Oct 2024 10:59:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436348.2676212.4755189889072346615.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:23 +0000
References: <20240904194827.16766-1-andersson@kernel.org>
In-Reply-To: <20240904194827.16766-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Sep 2024 14:48:26 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.12
    https://git.kernel.org/soc/soc/c/e4a82810c685

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


