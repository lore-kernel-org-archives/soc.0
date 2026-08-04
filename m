Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6A542AFB9
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874867; cv=none; b=D1gaIGIxdXFj1LhOTyNdHwCIsaY/MrVnHQs9c2+6KcOj3U69yjrEsFTkVebxPMc8j6vpnaXOcWFiK9E+qOCPdxN2wfuT7aYcbZU05/D5/Bn0vhN80OQ8225bY/u/40CR/hStV54A4xpZnTZIjuFxhz/pHISHVTBLzfJePs3kMDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874867; c=relaxed/simple;
	bh=eiXbh4JhLcN9w1/d8CNYmzTThEOIlMb4kHFPiHs9ueo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JxvgyxdpU0xxuCPUAZiaEEZ6D7g6If8tEqp6YEwafkAVthABslWk4bFNmTRKkZi8dJmK3aKBZtHdstL1F57qDUMxYs9oQdCm+bbLkRhvEPzcAPMGnb8As9JxJ+VZj/eePkx0R4aTv5GiuKWE4wIU2XW0DcpGJakDEXe2tMENTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJvrrrCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJvrrrCC"
Received: by smtp.kernel.org (Postfix)
	id 439161F00A3A; Tue,  4 Aug 2026 20:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB751F000E9;
	Tue,  4 Aug 2026 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874865;
	bh=hjvCDEOZnB+alYVyYW8lDKs83pdCjf4V14JWSScJW9E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZJvrrrCCA2sxXLEwIHgEdH1PQBBADDP9XUhMSPEVPXcu88HdomvoKFULd1dslkLhv
	 BEzVjyr5o1WLju83AZVKpXfE5c/UHtOl+cGJQ/D0UpJZxtQv6qWUCHvqBUd5AtH1Wb
	 AiG5zTJOkagR80VR7h9D2vX+AazN2tJ4pv5T2vMeAwsAZmATVnNtYPz+4Lx/lbWCxU
	 QFk64dU+RzlKnpQOtFDld2gOwt2zM48h+AtocLD9ZzCAgLjkEjFxK+Uu9ZnDRR7VLM
	 qbtZs5pqEv20h/bk2MGe4ulNh250EOtFTrVYUqgQoz/+JNuTKQe4KEEu7StSIQIRV2
	 7Xu9uofCRaZKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D089E39263B9;
	Tue,  4 Aug 2026 20:20:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of driver changes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482538.3769923.5698922872760029284.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:25 +0000
References: 
 <7028fd175c1cab44bc7696b5cb92282180e1f0dc.camel@codeconstruct.com.au>
In-Reply-To: 
 <7028fd175c1cab44bc7696b5cb92282180e1f0dc.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 15:46:05 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of driver changes for 7.3
    https://git.kernel.org/soc/soc/c/295c00af8e0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


