Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3B48AE04
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874879; cv=none; b=XIdpBW1wr8+Oze2XUyyj++VP9WJV6ulV+I78FednEhkNuki1gq25Rj27eEjr1wXlhFqFGTudzJmvbZisYEUV5HFSzFfaeJBw+Z+KTtvALkZEisq772azBTYQZLIGAn3BYGHqyx0BAsjmti11SCotYf8ZWx4TrcwM0xv9Xb3vuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874879; c=relaxed/simple;
	bh=Shr4Cqqv4XnUtYgp7XxuTZ9psN1AhLJRPhomAnFjSRE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fr1PKNZEgSNWYFT1DQhKZ2hY1mcnXoCjGopY8CIGONM/sud/2obmY4iLc+cdBVgfkc64PZiW1sQddNU4lR7K2aj8fM8edo1VREfOW8CB5IdQzJhgaoaf8GMlKWAV+FoihjP/c+XT+cgvOk788uja42J/pSs97uhhC8RjdXTL5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmrIuWCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmrIuWCd"
Received: by smtp.kernel.org (Postfix)
	id 4340D1F00A3A; Tue,  4 Aug 2026 20:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5091F000E9;
	Tue,  4 Aug 2026 20:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874874;
	bh=t38pabGGIRIgxVbxDbmwALVem65QASn9Y9qjcMsxESo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OmrIuWCdjUsOc+yGTfMXPTYQpXhyu6qGOmA7HX7Nwyc1Lmmm/ite3vZ5dA8fO0MVn
	 5Q4YgY8M4idwjTKvu2p+/l36WPfyyRDBwBs5aUsbdxQydb72JwGsaC+TgxaEAm8sPj
	 Ylu1jwIwWUwB4G9+5DFGfEM4Yg+FQi/ULJJpef4jsSrzrd/VhSdiE7n6nakNjkPJj2
	 3YhsS88k0kKT4r83wHIs61sDPNp0k/vluTJ0enGJgCF+BjZJfyV9gRKMH0jBCRAJwu
	 KXWn5vDfsWY6qaSshsLfqZmszIZWpEIv1DCbBncq7GI1L1KD5liRy+FTb5gRcQPGFE
	 abTLK6hmJ5yzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D090339263B9;
	Tue,  4 Aug 2026 20:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: First batch of ARM arch fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587483438.3769923.3531179485263291183.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:34 +0000
References: 
 <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
In-Reply-To: 
 <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 04 Aug 2026 16:33:08 +0930 you wrote:
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
  - [GIT,PULL] nuvoton: First batch of ARM arch fixes for 7.2
    https://git.kernel.org/soc/soc/c/c73d40a1e700

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


