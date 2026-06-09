Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81329B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023233; cv=none; b=YVshDJ4oQm2vO87WY0iYGVI99lSoeXK8ixXRgpCbIKfZ40kugNNqCzo15pHJelv/Ai4UMUvvZQuOIzXhWWT/+YEeqxbSdM5mO0NvJfAjADeNDBUCBMQv301M0ELlqoJjyikkqd7swcznbX+Ju7uofaVznaI3qpNBHBVV4WM1f3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023233; c=relaxed/simple;
	bh=Co9h6Xnt1uXDf0J6TT4FUSYDyOryyVDnoqRrTT9g+eo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lUnyGa7c6y3wFNjHvCCbGqkD4h0I5BCg4vScksA8CtPEe1XJbGnh+eXqXsHqmCWwTDOC8hIQGnaD+C6MHKME/bEvuFsLmF8O/eZCp037G27a2Cx9o7rVpgZWSesb7L6//FsE1wrhcb4MK3R55w8UIah/i2zUvqtUEjAIY39EkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEQn8u/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEQn8u/r"
Received: by smtp.kernel.org (Postfix)
	id 989CD1F00898; Tue,  9 Jun 2026 16:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B641F00893;
	Tue,  9 Jun 2026 16:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023232;
	bh=mYfbuVRNXGoOsV7YKHyaMsUp9iikstYvtljzOp28uqw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CEQn8u/rRvgsLHkOWVEgT3VYlmyFz1mRbaneicGuYR3RAuvCOFsALqsKGNpeIkXzD
	 qE399NpCturQdVxezb2F1VWtRuw+d5OsRfI4xReRxQ4m+PYVVWT5ECFDpdVGf730Ra
	 lCapMN/IqlMd5YvvxPqrfHMESyiTo+0KJsQWt5SwDLOMmNXAKN6lb2Afqj0d/ug7CC
	 RckgjLfWnosBWce0Q8PcOo6AcBiHUERlk46EivMmsk8FXhbKSkUqEneVstSyOVKhQo
	 nxcY373I8o+538SxYdZ9rwyzEd/jpacgqLvaUzgZ/ZGksG/XuWVQLYK9ORCESozrl7
	 93BP7Sz5gj0Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E33930989;
	Tue,  9 Jun 2026 16:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] dt-bindings: Changes for v7.2-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323063.2135346.7022522069915966165.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:30 +0000
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 31 May 2026 08:08:18 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] dt-bindings: Changes for v7.2-rc1
    (no matching commit)
  - [GIT,PULL,2/6] soc/tegra: Changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/aa75b5370d8e
  - [GIT,PULL,3/6] soc/tegra: pmc: Changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/c731ec167781
  - [GIT,PULL,4/6] firmware: tegra: Changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/0d519d755c16
  - [GIT,PULL,5/6] ARM: tegra: Device tree changes for v7.2-rc1
    (no matching commit)
  - [GIT,PULL,6/6] arm64: tegra: Changes for v7.2-rc1
    https://git.kernel.org/soc/soc/c/47be56c13c02

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


