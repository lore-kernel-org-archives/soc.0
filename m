Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8634F3A1A3C
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352490; cv=none; b=D26iXdklg/isCWr9ZgXqB3hhA5vXwD1/BptTlHZy/jqJu/L5eqGY1zuCAT6afUVhu4ZqU1VekIed+tbainNov/6Neu7SO+q58VwRK+7qVmeJme2MfPq4hrk3wkZaLehs2MNIIAEn4+5UMCIHtUBL1fvO4LxS8BMpacA2S/oaQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352490; c=relaxed/simple;
	bh=9AL9kQxR9qi8B9kQoWJKeYri90W6Ig30AnBfa0oEiJs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XNfXGxyxYGS6r4TUpAvK72nvcvgnMt6iB0BIu9Uu/it24zfZNNlxIe76a6JxIV6WUOJdJLWD86hGYRWzJcysJYIhJdPGYjrTuYGV3Kc7VcTMVxYv4avDrGzCBU6syCAb0bgZhkpK7dNTS0gpyB6GCNIAzZ3cZkV8gM8OauX5XTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEQFv9ts; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEQFv9ts"
Received: by smtp.kernel.org (Postfix)
	id 4A51C1F00A3E; Mon, 10 Aug 2026 09:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337591F00A3D;
	Mon, 10 Aug 2026 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352489;
	bh=K1N1CgE+IpV+EvxOSheWnZy5ujs2zu3I1FGnGlZXFuM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=MEQFv9tsSoStfo61j2E/ofowEhcWS8rX2IHMQ9+smcTKJYZUwhzZqlch/FF1S1ONA
	 IS2oA8FQEL/hveXtiXPJv4qx4OKIDXvyw7wFpUYkBfwO/b66eJt6g3O3KGeLdn4OX+
	 HKqFU2ViYmTFP183UuDe10CugFKEfyKgZQl80EEQ9PBQbgwT80gbpliloFUBI1+vNi
	 Yn24tLXaNxr4Ynile01lT1AxPxfPwZbC/w7jd5tjeHhzb3+Z+2IZXW5DgcORSQbg3f
	 copghuTWcEJxiPjFRUfnQBz1MXQSKcVfxSStP+OQESEMNJ92NbQTWvpLxEoBLYfA3V
	 LrppgF5yGGnDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569783924FC2;
	Mon, 10 Aug 2026 09:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635244588.3658557.2090815679446243451.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:45 +0000
References: <20260806131232.GA673420@rayden>
In-Reply-To: <20260806131232.GA673420@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Aug 2026 15:12:32 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small OP-TEE fix for the OP-TEE drivers.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v7.2
    https://git.kernel.org/soc/soc/c/42cf613e04c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


