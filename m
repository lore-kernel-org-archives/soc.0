Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ECA51DDE7
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907825; cv=none; b=N8YjBZm/k8GIW+IQ0IYGjt0X7qZ/Cxw2+1wyv5zQIna6LT9z3QjckuYgkGoFD45SgLgmOqQroLa73NW3kSetA2lYYt79Vir+cAqgiKsW9nB+5BEEZ+8EbEvEDSRKj5hvp7NfWcerQiXa6xd3kPEFGzrGjyfMk+pgZn7waSU0k54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907825; c=relaxed/simple;
	bh=RN12lXHWV2iVJDx415PTwc/5GWZNj+E8nhisDV33Aoc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oYEp9c96suXtptj4krsPNwpjKZz6Vg+kAQxNc0QZTpusaPSicuuq5h/DvU4Kz6z86dOuPpIFOYGiSK8YzpzqIsN/oQaV9KoM1+vLjEp7gQa9FIbE4WsysdzgbTcTaln6gREFNFPx/QdYQlFYe8EL21vxkQBSvIF2W5aLd4kdqWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofSyCUuh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofSyCUuh"
Received: by smtp.kernel.org (Postfix)
	id D49281F00893; Tue, 13 Oct 2026 16:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE27B1F000FF;
	Tue, 13 Oct 2026 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907822;
	bh=G/+P2CST9Nptxc5xa+ox8cO+IC4vTZos9tQ2Kl/1zU0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ofSyCUuhStBYFjCYssnqBZT0cpKo06o9upIygz3KngB7ST2F9lig/att/lJrbR4eI
	 CzlLIAPd8yvPxlPTbLhbp8KUUWP/mtrf1vXJV7ebn4ViMj47bYn5ogmtGPVUKRT3eB
	 kSZH7Co5QQbHM3QHZNyHskZ5o2A7ZgCJpGxvqXh3n3RPhKVJqQpjtNY09Sfnp2ipZd
	 zLVhzL5GCNr1WyIK5YckyZapvQaIUgKFJLyAamYaUKWsVhyMe9J9NK+Zhc0BDBXnHt
	 jjad9K5tfhH5egi8fz6nZ9yqqcwdcCLX+TKJE4MkUCBaLshRGXuomHTMuJ3Ae/D4C4
	 iXVetWHMBdSiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B447439D5FD8;
	Tue, 13 Oct 2026 16:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC driver changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190782126.417156.4515496092442939198.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:21 +0000
References: <20261002190958.8205-1-sven@kernel.org>
In-Reply-To: <20261002190958.8205-1-sven@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Oct 2026 21:09:57 +0200 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC driver changes for v7.4
    https://git.kernel.org/soc/soc/c/be72934da8f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


