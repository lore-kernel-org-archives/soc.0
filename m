Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892AEAC7
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724357; cv=none; b=ef5E7xNf05Gghg+RQCID8Ei01V0NGGPHfAKyITAiczikfc5LskXzOnabCEZyYDc0r41FrOaMYCSfCRiC6yIZWo/xSC3rwkwikA+pmUPaW+zbRrnE14HBUR9WNA+aNuuO+2uifY27IT6zHzcIQrcHxWVrf6Oaf7+cAiAkgh/ivrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724357; c=relaxed/simple;
	bh=SgXaR+6QbcEdYeEfMB3ABAdC5TMQiApBlOvZbjqa/EU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=B3DvXyrpSIn6zkpUlyj6wkp3gWDBTyMdAem7ZKwrdSSpsAWsfOJV5L2ReHv0J1vI4kEsrjvAKQOStSLh9qU9pu43r3rEfgcH2sA2QcUguz3Hpd7bR2yMgkhtdSQ/SnLih5CTMidTBKaZp5fe8OOYoHzdV8+E61MUON2UQY4keao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZDLdv8s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZDLdv8s"
Received: by smtp.kernel.org (Postfix)
	id 31DC9C4CEF9; Mon,  1 Sep 2025 10:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C19C4CEF0;
	Mon,  1 Sep 2025 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724357;
	bh=SgXaR+6QbcEdYeEfMB3ABAdC5TMQiApBlOvZbjqa/EU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QZDLdv8sV/RO6sixk8PXjtckxKd6GHu+Mj10CsegZkb6JCVmmWGOeKFTB+ij+gR5K
	 Mlj+HBahSoV+GgqK4QrWqRGZeR1+Pj+mmbYkih6E96WKQxmHbqF4DUqbjDfnjSAKvG
	 xWe8lugh18e/gW5Kit3cihU2Q1NU6Oh1kcNLXLvG1Qw+QFK8VD5uBxqDG1GjMhCpfx
	 Llcht/aYkgXmGrQ0JMxtPkrHtzLP35FDYC2nUAOztqmkDw21efwCjpIqjfqTa54wyJ
	 XII3UX3OUxKZsQQHUinm35Ncq7hqDEOinUm/XPV3OQ8I0xsVp7IiLbv7GFfVK6vnfz
	 ZYHF49igvw6og==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B09383BF4E;
	Mon,  1 Sep 2025 10:59:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: early driver changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672436298.3681523.2989579600813816684.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:59:22 +0000
References: 
 <2d122b5c4a19261148993b66e4b98371a684ba74.camel@codeconstruct.com.au>
In-Reply-To: 
 <2d122b5c4a19261148993b66e4b98371a684ba74.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Aug 2025 11:06:19 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: early driver changes for 6.18
    https://git.kernel.org/soc/soc/c/fa93213f4249

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


