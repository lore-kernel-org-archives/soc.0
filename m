Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE5313261
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011216; cv=none; b=QWtn6PG7aWxPn/nzpwWq6GLbioMD26Zge1Nv9rW5AWBhH0WnIEJmYoXCryw+k/lSrikI4aZTm1e+kL/NTEVaKh/H3RG9zj0A58/kPR2A4GF4BlB7rEsjmcFqVBJdec2C15CF3j5FdAglBQysrcaDTSsSxzM2P7H7cNMVewpF/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011216; c=relaxed/simple;
	bh=kYKDIjb9u/C31RJD/vmU8QIcFVUlzSdsEMJfEQt6Obk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hR6vsKxBBRkAA99JNHIiEBM4G4fF69QRIXYNbgJpE8PqgZoR/Rvy5XmzW5wsTY4ov06TxkPd6EjSsJ4BZ3jrzuZxcCxbKBOsatVSkq+A3pPMavNHDTaxAc5Ak+PcaBSUnYiX8M64c6PlEJtd9phBCUGh7XkkPx9gJBmvwEbGhoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZYI8/10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZYI8/10"
Received: by smtp.kernel.org (Postfix)
	id 90C82C19421; Wed, 21 Jan 2026 16:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76031C4CEF1;
	Wed, 21 Jan 2026 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011215;
	bh=kYKDIjb9u/C31RJD/vmU8QIcFVUlzSdsEMJfEQt6Obk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PZYI8/10iPBJwY/x9OR0olPoXhUQK9zLxFSkYo9OjfSPSmsyyu7sPSuvdUjz1iExf
	 N95pt0I9mbaZgFQjiE39ua7l5q+lyuFTAaCfeDZoxIf8BgnUKxOAAMcr7/LKWGRKak
	 HyI0jNnPVAhQ+JjcQurMBn/lUFHUU9nkVzSFveTZnOlchA8/zvbb1lhN2OEUex/xqC
	 PdDpUzBqHkSgtPO0OzTlGk60fLyXeO3SMQ1SptQVpeGERns3wIAVRs6/uuImLwYDbA
	 931VZN8SiEULuzuxJIMp/S+F8jzz72dH+Xw2mnVt7qw5ihfm40W3t+XjVI0Ue7Uyf2
	 pdj+NheNEDa6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8D633808200;
	Wed, 21 Jan 2026 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v6.20/v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901121261.951664.1704860853756414619.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:12 +0000
References: <20260112115021.2551442-3-sudeep.holla@arm.com>
In-Reply-To: <20260112115021.2551442-3-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jan 2026 11:50:18 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v6.20/v7.0
    https://git.kernel.org/soc/soc/c/34f60ff256e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


