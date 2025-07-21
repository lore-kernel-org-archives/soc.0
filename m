Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8D9DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111908; cv=none; b=SK4z1x5YAqQl4Kj9gTX7llDIyV8/No1xLE480VttsJDgIPohB8rQEvJdmQbIo3yQHvfkvT45Rs+p3VaM2wdGvVuL/kt0kd1meVtypt259wWO4yfXTY5n00r6ieUMDX6QWkZgPg5E1gUTIfJe9Yz4K3lxqhmSPai/33g0J4Rl7Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111908; c=relaxed/simple;
	bh=xdDYucUIqdguHM+AnajlQd+NnEt7BRw5ApW3IADqTOw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VJddozm1Ls6ODcctaILIIUUDfuOeUfY1LjS7/q9r/gPceDlWkxNxqNsZOP+UWNr/Il/+mKAFZ68FomlscEJ1Ckwffgvs81IXs5sLkCOZNKVHjIng9nG+4kI4DagkrJjhZy77NzaJw8RZA5QCG4gEFGOD278WWWsBY58Y757hK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3GLRxt0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3GLRxt0"
Received: by smtp.kernel.org (Postfix)
	id 3EEA8C4CEF6; Mon, 21 Jul 2025 15:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A63C4CEED;
	Mon, 21 Jul 2025 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111908;
	bh=xdDYucUIqdguHM+AnajlQd+NnEt7BRw5ApW3IADqTOw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o3GLRxt0yO9RuqNVA1ZE5auWLqVaxjV0DMWxffdkce+7vCugqo3/hYEiLCEsH9I8J
	 i6crNJmVuS8j5tLO6ZOh7mz0CiUMMhqmVmX5i0u+QfoyRHBud748YlCMwp+LF3fIiW
	 UB1sqCyZRX5O77Gp/Evlkb4HIVFTdoPw80qgVwec39FCXuUnMiJz3b4a79Oswb/eSY
	 QZQq1lxRnsKgAYB6gRaKazfTMYOwmf9SbIvHi9qzn7yoMzde2T/ghlyne0LSw0hhoc
	 RV/L/Flx29umlJttumqU+RyolXpWEBdl5yI/Q4Z6CuNuO3VQ+GFhYm2XTbYUFLVstq
	 TL3vcgpXD456g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E0A383B266;
	Mon, 21 Jul 2025 15:32:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192699.94241.7102202056789167321.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:06 +0000
References: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250711083656.33538-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Jul 2025 10:36:45 +0200 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-arm32-for-v6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] MediaTek arm32 updates for v6.17
    (no matching commit)
  - [GIT,PULL,2/4] MediaTek ARM32 DTS updates for v6.17
    https://git.kernel.org/soc/soc/c/a6942926a3fa
  - [GIT,PULL,3/4] MediaTek ARM64 DTS updates for v6.17
    https://git.kernel.org/soc/soc/c/d436d1d5edb3
  - [GIT,PULL,4/4] MediaTek driver updates for v6.17
    https://git.kernel.org/soc/soc/c/983f3a8831ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


