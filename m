Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A451DAFC
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907822; cv=none; b=pGE/T7lStlHmLdbxGzT6DAx3X4482uTd8nKC9NcirZ/FESZvrZYK22FUlk5mwhn2ZEG0uq7PvMnsOOHqcgEaXJKyxUDcMPk4Upc/ist54CUNs87nsenzfsq+vYiI4a1lOFlG4k6OKxDsmbUVEz6qS+L4qtJxYYQZ+KopbsgBGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907822; c=relaxed/simple;
	bh=pJvj9Mjia77RBA7e0SKZiac7Po/LTakqANkKmOqmk5A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RRPEM/3J0FT/xGkrtd0IdsBhF5YsenBfG9CxZxtqcj0/drePsEw1PgWfGRyf/KWU8HToRGTu1MPIlYaGQYVSvJIBakZn/plY6LD6m4m3g3MMc8hYpUWi/D/PVcyNtSRr5cKxed2YKOK/3zvkc3OmyaxrU221llmblijvf6IM+Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaF43zyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaF43zyM"
Received: by smtp.kernel.org (Postfix)
	id 5B2E61F00899; Tue, 13 Oct 2026 16:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EE11F00893;
	Tue, 13 Oct 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907821;
	bh=VgqRolFY72/f7Wb+0lpdKwt9HfFt3uQtRLEE+nW7nLE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=EaF43zyMIWQTvPHdvpT9OE4X1hPH+T6Yc77zamGfGOc2LbZRs54i2VbTG9xawkWkM
	 5hYaRwZNlkuzjc2x5JhdPK9fIFjODGDyH07gHjALvY18kA2tHzuFEdzjdQDBHxqAz+
	 yZbZhkI2YInf7oI+xMF8ZLn2y+4uuXf5EiClaIhvPc6G1/uckYH9nbIM3QftGVmF0c
	 Q8QfGp7Esnj7QcyKyejobAdsmtZaKWeCIV6qLLcrLplZmLm8F0lLKNuBOq1X8724AN
	 u3Hgu8kEMrBaUhrNIa5WkV5XHL1fdqOViArUf1kE/AX3vD5AJ01E61vcQPKuK4zxs3
	 0xF7j9UgJ+nIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A5CC39D5FD8;
	Tue, 13 Oct 2026 16:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190781976.417156.12817552651950072896.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:19 +0000
References: <20261012190332.10322-1-andersson@kernel.org>
In-Reply-To: <20261012190332.10322-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Oct 2026 14:03:31 -0500 you wrote:
> The following changes since commit 87802d4dc4850bf27b3955ee9162b1e52c99da1a:
> 
>   firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA) (2026-10-05 09:10:43 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.4-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v7.4
    https://git.kernel.org/soc/soc/c/e506cdf06e93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


