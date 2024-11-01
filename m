Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D71D151F
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 20:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492427; cv=none; b=OzA0TI1Wx7B/dUqOvXWobsuZcw9hXX20hnaw+lFh9aOfZrozufgt+yhy2Md/aIldxZ/h9ng0XdzV3UZXsZM2N++bJKlyWGZHhJ+fDfVX6hxCvlUQQg0xccUV6x1uJawDcYTeLiELt/rNf2Nr4DhhETBybRby0RCJ/rqfKnUZ5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492427; c=relaxed/simple;
	bh=m9JRqY7pSwpC0jxyW+uwBKGFhSg6o9vMveSZEk8yeM0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ttgNRY9UzOemIvaPBK9ZAUwdoQb1MAv7A47P6UTzq9CZtkP/VUbesTRPYw7yqPxARNVQGAj714rPKZ1/ab1LchOx3KEp8zSU8g9evEm5EEsUHuYBuKe+lK32cwGmGXLSNImRvlja572fqtCxo+rb8u4S1j0ibt+sk4IhzaPoMcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCchTOsX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCchTOsX"
Received: by smtp.kernel.org (Postfix)
	id B2C57C4CED1; Fri,  1 Nov 2024 20:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D552C4CECD;
	Fri,  1 Nov 2024 20:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492427;
	bh=m9JRqY7pSwpC0jxyW+uwBKGFhSg6o9vMveSZEk8yeM0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lCchTOsXlRAdl/R9wGKG53fsQmBwEVTbyOBtRgMN77kOLu8E6CNrYPeW9EoBkVA5W
	 GZI+KHXtaoA1wyKiV568BoUVQOMwwEfitUeL0/lTvAZDRw/ZnRujtF1vH8vECL+tuj
	 8j1YulXP342P/6q3hvkgWoPX26oBYOS9SadIFshrqJHOsu9RGwUYDCInD7QL9WMBEK
	 pPHXIekhC05iaJOOhD9IjLikXg/88srhcUdlGBL7maanG0i2YW0yAK4MyC7ht+Oy+D
	 nIAvWoJB4Ilm9htQaIcyjQpgqGZAuFzrdfa7qUmOQEjzTUnHzzzf/cRM0/QFAu17BY
	 ZVWHklnCbMjjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBF843AB8A94;
	Fri,  1 Nov 2024 20:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173049243574.2836087.7261391410872614910.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 20:20:35 +0000
References: <20241101143206.738617-1-andersson@kernel.org>
In-Reply-To: <20241101143206.738617-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Nov 2024 09:32:05 -0500 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
    https://git.kernel.org/soc/soc/c/566064e57066

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


