Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D8446BF5
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911261; cv=none; b=LN2ewN5UIJaVQfzh4v9OWtM/0u9dPcm7nHrgN1s9KBPh3u9i/9XoaJzo3N0k7FPllZi6B3hSNtTFXbU66hgYfWJXEu04L/HzUFO0QJ+uqVw+tolLBkv+erkEHYLmYfN7L54O9+PV0Xt7YtIonj96vMC1FFcLLF23gKikq9SCQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911261; c=relaxed/simple;
	bh=d2xakjA4gVEWU4XuNo7uYaoD+GDSOtdiVzgpTfC9rK8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EoRjXXCoxoejqig6dr/f4g8JJ26hRM/2sU2F2XzDdSA2M/KiZGViiEGIjZrtHZ3+c3vkYIBARS9wtCW7k6ye3OTQ1Q1QhQxDWMEOT20VLh5fYaAm01n8nKkEu7IFDxXMg6CYe6GuHyu6B9PFMCQMVjrByD9olcWr6PkL54lc8UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fdt4Do8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fdt4Do8b"
Received: by smtp.kernel.org (Postfix)
	id DB2A21F00A3A; Fri, 24 Jul 2026 16:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EE71F000E9;
	Fri, 24 Jul 2026 16:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911259;
	bh=Vo7J5KoHApIZOS0WBCgZjcoJHdT26pu5zwsmTwlYocc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Fdt4Do8b2r+asfXTi9/vUYk+Z4W2rmWzc/p4BIl64GpQ/pLrpdcJq/5Jf9R4TsIKq
	 14yQfcnYBYK1IVLoXtnlG/uCqvu7GcQ9VWouuoQRoutx05rLqXn3ooKnDPUMjseSvz
	 ryKen/zuqkw7wgO9VTsPWkJrxAZoh4jgrNf5CKIndcpSXaXSVF9IDDPnBXRWsi1yNV
	 wWt2Q09iWfog8YDm5XGXTXqxzOFr4PnyfI7MYpdYGcXbrfa8bZ0W6qDCTmTRnufauP
	 tBXmo3j/AzByAIErwHCJ51v38CaXaEQ3JacgxXVUzg9UUyLfSkfuvYaxG1ET5RoBgH
	 00cUoxuvZ+4Ow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5695439263A5;
	Fri, 24 Jul 2026 16:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx SoC driver updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491122688.3229915.9992044243133483023.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:26 +0000
References: 
 <CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com>
In-Reply-To: 
 <CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jul 2026 10:10:51 +0200 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
> tags/ixp4xx-soc-v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx SoC driver updates for v7.3
    https://git.kernel.org/soc/soc/c/4d513573182a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


