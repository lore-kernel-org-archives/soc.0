Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3030F92E
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006207; cv=none; b=NsxpwFcMwC35PunHMq7BAdK0VS5dlCVq/RIk1VO4PtDBTD+MLXg8ddGoguJBOZM55EN/C3Yh2iF02tnz52uBf2yEhEW9a3AsvjtAicE2VMAeeo0pU/oEQTVZsmL4afnEAN+wQ4bpxIqm+G3R2sc/AtHwDv/mSEP+ihEw0p+nL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006207; c=relaxed/simple;
	bh=FJLFkadySjn7LnKj73/O8erLG78ijoXI7a5bDe54ogI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K426IqxKKhZU3oorusDDxlHehHO0QFfHvYwoKx3uxjSWxPrQCs0mTR+nR7wvnF3zDqLDzl8Dm8U7O2WcEvbRGHnrkK56OSekCK+cBhr8z4zSD0NEsnIpCdre0h45zVBaVqkKCBGXkNVfCwAROiE+Gipf3w/3YTlIzpr1XqfSIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdVUAgS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdVUAgS7"
Received: by smtp.kernel.org (Postfix)
	id BA72F1F00A3A; Thu, 28 May 2026 22:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BCF1F000E9;
	Thu, 28 May 2026 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006206;
	bh=ZytWWCNl0kB6IezB6lzV/WRW4aNEkaYuzx41g0T7LeY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IdVUAgS7WiGkjnHDru5whv8sg/XNba7MUJg37jk+t8qPS9UFP3UUQJixXJMxdtPbG
	 nlYaMvo6Hr9QCyIfqWGUEE+szejW5Kj7MfPpEeTY5kQpRn7D78K7Kd3uaayLQJKPZe
	 JmZmuyJPga8Z3bWVruOgnMnqhNKrTxKGWcets9p85T/+nMw4rjDW33X8tZ2/ftHohE
	 1vGoG+ermUTnn1iCzJs2BdUJioj6PtRZQI2Es7CMVcx1+Pgo0iTnFwsVD58Lwdtgem
	 Qnf3sa0JVGpUS1Lf07AtL6AoujXy0uhIhBtSJw5gpbgX/ks9Ge0LvFFnOPk9uKAYTh
	 BMhfz3r7sslYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1974E3811977;
	Thu, 28 May 2026 22:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000621063.1533055.16737197790365391731.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:10 +0000
References: <20260521140219.GA1707515@rayden>
In-Reply-To: <20260521140219.GA1707515@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 May 2026 16:02:19 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull these small fixes for the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fixes for v7.1
    https://git.kernel.org/soc/soc/c/9193ffe5b478

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


