Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D383D6485
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 07:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249410; cv=none; b=fdAFNeIPnCXD7NBzcgRZos0JHVcK6ffTdBpa+H96f2LGlYClhCABLus7bJG5UWmfVsN4FYofvksE+/NgeQMeSPHgScmK7GmKOLmcOSkmQ/5WmlNSFp3PwaPcwxwoucym/ieLikVK1MpNKZoaeWxgonZwEb+u39lAYGqRRTK9cfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249410; c=relaxed/simple;
	bh=x8tJwTjuZsaY0YeI+3YIbnHXcDiw/9VnlU4u2sRQ6Og=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J+BKBDEIJorLuMuvPzlJ2AqXqsNE9iqHoSNBkW28cV8ept6AQ1LhlcrBXjsW42vVFGzROqcTGkcJVesQPieCZv+x8CwjxNFldxeQyeTleZarB8hqB1BoxsAicTzr9Xa4FG2PGwVbFw7tuRoEU8+W2lMEEwZh2cYX52yLEEfOyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWR9FRg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWR9FRg3"
Received: by smtp.kernel.org (Postfix)
	id B41011F00A3A; Fri, 12 Jun 2026 07:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB911F000E9;
	Fri, 12 Jun 2026 07:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781249409;
	bh=ybck/KaVumAXzToJ8F1yHlWPF3xZ6NCci7Rmb9DYzEg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WWR9FRg33Z4E4sZc+Tp8ZYR7p5NsXKJg9ntLJ8WhtZb+CrPu/7rseO/tElCj21N/P
	 Khp4zmVwnAeNs0u6b2U5QTaZC0cEY0QYaePZtzPgzIfNjSE5O2HwARQPKJsEJ8f8jR
	 RG0L8M+7RAzeyCqnAv+yWsyAkvvQfqc5/6TqYEFnUWlwETJ+vrgH3GesBDTRQimok6
	 MMO811RsUuTSQ1KsQ/B464n6xt8ont3JZiG56FCC/TxXINOCLs51KdDI+kdQ0GT4oS
	 oLXcYGwEdUI2kHL3IpCwHXV9U+922QL3PN8zadIdZNxbFm/56eWnDBRr0zCHM+Dzhx
	 IXj105RMTCw9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09673931000;
	Fri, 12 Jun 2026 07:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: enable BST SDHCI controller
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178124940638.526649.13580455091347718245.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jun 2026 07:30:06 +0000
References: <178123038058.455092.2553110009023696912@bst.ai>
In-Reply-To: <178123038058.455092.2553110009023696912@bst.ai>
To: None <gordon.ge@bst.ai>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Gordon Ge <gordon.ge@bst.ai>:

On Fri, 12 Jun 2026 08:42:49 +0800 you wrote:
> Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame
> Technologies C1200 boards.
> 
> Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
> Acked-by: Gordon Ge <gordon.ge@bst.ai>
> Signed-off-by: Gordon Ge <gordon.ge@bst.ai>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: enable BST SDHCI controller
    https://git.kernel.org/soc/soc/c/22ca5df7c9d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


