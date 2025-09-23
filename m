Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02E9263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662451; cv=none; b=mxt1ljAg8+7UNR/bFqaxnodAhsNJ1vQs0DwKnQK4hXnuLfo5e7ldSfDHfXK7N+fOI6ehuK3BvcNPW+0WT1ObVk0haBCF0KQK5A7SrS36RFGRIVt4aM0DW80UymijHQHuQYXK2QtKIyNCJJoRDFrMxOam7Ga8CuOw0Hu4+SSPaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662451; c=relaxed/simple;
	bh=JNxA0400il0te07PN4GHMbKrXKfcgCsL8g25hADseso=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K04QQFBGrkR2VAKBvcET3WcWJkvN2gYyDgK6x5RTUtoLVbTd/OkoZDYYDhzNPgXje4BULdsygnciV8CWfglc6P4oz0/ig9xRAAvN3O6plwC/hgCVeuBwEzaQkpGPUkzBAfwnQ8w1jTXEnrr/r6cnQFllR9iO2MyhuR5uEDFDw+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeUgy8ql; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeUgy8ql"
Received: by smtp.kernel.org (Postfix)
	id 63549C113D0; Tue, 23 Sep 2025 21:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497E0C4CEF5;
	Tue, 23 Sep 2025 21:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662451;
	bh=JNxA0400il0te07PN4GHMbKrXKfcgCsL8g25hADseso=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XeUgy8qlyBxG3dnQI10JdNAhZNGrqQ62SB4EuibBgAD2mfpQAF1W70A9ubHeaJo1K
	 yudB46/InRzFZIAfVM3hl82sZLF/rOuL+GLylzi96FKZheSGj9LzyOB2QQvIMMtLoA
	 wvgkkwJsEtQb2p6uDbBYtHgpiPVBdmr1P/Ql9cXrbV4rCJuiUb//XjeX9mJfKlMNf5
	 F6YEijzo9GZVx3bubCyDrW7O17eYopXZBwgXoh0CstiYOlbauM8q+i0Mw9R7UoLEYX
	 4EzTJdwvslVWSi9uMG1K9w/trJ6VzH1F55TZ5VIESf+Ir/COn8xSxN2Ej80iCMgRE8
	 4yjRRTZYiLiPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CE039D0C20;
	Tue, 23 Sep 2025 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] CIX device tree changes for v6.18-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866244798.1926563.2218125005711861846.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:47 +0000
References: <aNIyhPSV6lJaZIvR@nchen-desktop>
In-Reply-To: <aNIyhPSV6lJaZIvR@nchen-desktop>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 23 Sep 2025 13:39:16 +0800 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v6.18-rc1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] CIX device tree changes for v6.18-rc1
    https://git.kernel.org/soc/soc/c/0d4495122a5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


