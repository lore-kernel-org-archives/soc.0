Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E77D200B84
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424990; cv=none; b=oXzixYJDkIJO3v6iA0BnfMjlBPOpJBSIXRNS1Nwqlh0J9swT9XpQvnOxVAVArRkwVzzmA+geK8nLAsLLyOWnyaQndS1BbsPGh5FxwWgP4yCrUI4ymcgW5M3478kt6k9+ZucGOD0255vSH1V935GRX2i7KS8pCpUQ5lgJED7wi0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424990; c=relaxed/simple;
	bh=Oz5Zzgs8SnPsAQzHL1FDn6/ta/KSl0k6i5Qvabd7dJc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ctok7GnnGeF6nw9OR2lWf7PGJaMW3rZ12j9chm2GMF+3HJonb+dPTHHTumeCK3ctlgiz1mjOOi+iCil5jFxWRFT/C2YzTmCguKx+L6SFzxhQtbbOSAEnH1l3wXn/BZ3Ncrzy33/8xmaU3qFDjvG+ss2DZGAF7y8K762EEP5y3ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCqu8EkS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCqu8EkS"
Received: by smtp.kernel.org (Postfix)
	id 58EC5C4CED5; Tue, 12 Nov 2024 15:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4330DC4CECD;
	Tue, 12 Nov 2024 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424990;
	bh=Oz5Zzgs8SnPsAQzHL1FDn6/ta/KSl0k6i5Qvabd7dJc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CCqu8EkSkQ41qNWu9WOlBy018D8pwT4ubrW6Tp6usGyIy45NS2mUyJ8Xx4nJK8PIn
	 W3Ix7dR8AnD5lUmQ8CshCxaGRwZIiSgTPNHhvD8YZx3nO29ikV8YCcmGOfWOgJYrV6
	 +CTXaakuQTgZuVUbdzqqYfP9XGebHEi7ftE7dXOUWGS3ZrqeuVI07yGofwidkdwe00
	 tGw2e4o3LwggLYibG3WrIUKxL1tLgvPX4HxBtLFWGEhYUZJQjUOBDnOGV2aYE/6a/A
	 KB0fCPH8xd9cZe0O3mW0H+6k3HOGzsNomK/cz6tTyo+Vz64BUBxW61hX2gqv86dVGl
	 JhGHV8pMQZMHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD583809A80;
	Tue, 12 Nov 2024 15:23:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142500023.562452.8980040554892484636.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:20 +0000
References: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  4 Nov 2024 12:26:20 +0100 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
    (no matching commit)
  - [GIT,PULL,2/2] MediaTek driver updates for v6.13
    https://git.kernel.org/soc/soc/c/b8600cba23c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


