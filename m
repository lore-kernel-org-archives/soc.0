Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA81DFFD
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688432; cv=none; b=mENYKVD5K2j7p3tfGjbS/qIsby/yRBMRgK3pbFyeCCxiVh3sPIdiBBUZ+acYpM2pXTUfP/fjocVhZUSEkqj+FcmX1a5QpUVvNp+Eah+pmmGC57orxL5bCzrnOsG2zaLeOcUFhqkfn+flWDnJBUbMsJvHmsIbWNJTgKlXeRbYBtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688432; c=relaxed/simple;
	bh=+Ez34gU31nSYliPs3yzyqXZwHPYJne6BcU40+JoH/vY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=omQ+vrkKNERUVB+1eGbZ76i91ezcHMGfupKn2gItjq0BQURI1BmRcFB5cT5tDRWnCpMvTanVXKgO40CqJCdZl8OEJd+IMQwYFVnwlWhPjuwiQ2O9Mv1o2Qe+WFGzqrVp9qWuRWr4YhnMmR3A/9piVUQsCbZ3hA/2W/dIFOwlEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ejmwjg8J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ejmwjg8J"
Received: by smtp.kernel.org (Postfix)
	id 58AA91F00A3A; Fri, 10 Jul 2026 13:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428601F000E9;
	Fri, 10 Jul 2026 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688431;
	bh=tGWMho8Bil8bCrQVQxIoIwnn8e7uhEBbTBcQqiaqRw8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ejmwjg8J0sBkNWr5vm/eoJke212vEOsTKws0h4N9Z6TGwkEhxd7V3BhHpcdJA57aF
	 KUofX3NHhz3LgQo5vbVFBj7ni75qzedzapf6ky+T+0alGGUS2U/i3ZEyqKm1HlCffC
	 BQiAovCvffIaus/hv8OfajHZN1Ujawu8VRB+rWO5Ic6fbk76ibdYzU1tVNb+3ydZNK
	 lMujtZAnLXRyuO1+4hLi08AEWHp+8j82rDJ+JgGoeM77UbnF3biKiJws6cMergHdZi
	 0qBXXWvAFz8PA4o5x2zrXc4EhlPBGbW9RHET/IjHUDaUhS8XSQdz0Xes8ncRbhmusu
	 YpR1kupp++z0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568233924F93;
	Fri, 10 Jul 2026 13:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE update for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178368840905.229479.4750621121055903648.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 13:00:09 +0000
References: <20260622133513.GA2789405@rayden>
In-Reply-To: <20260622133513.GA2789405@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Jun 2026 15:35:13 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small patch updating my email address to a @kernel.org
> address. I lose access to my Linaro address next week.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE update for v7.2
    https://git.kernel.org/soc/soc/c/f470efb87bd6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


