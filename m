Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A360378838
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007010; cv=none; b=DjKw6sT6In390hJm2voGH8JxZFtX1fY/49MB5qMyif0D9XVftKz9zt6YWAPAUnSBpjXepEFRRRknmkKYE17nReUthFOSxhOJPQh8KvUqVGYK50A5OHFySaMMh4baoHQ0LLZBOK+8xzMgwhe8gPPWzv+bn7ySogBx5BcH07wxE4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007010; c=relaxed/simple;
	bh=Ee0Wevv7qe+of1kakVgbuEllQzu9dCE+Qi6ngp+ieUM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m1j+vmmR3BVeaUNZL2pcgW02c01FkhktPeLm4E5ZOPgX1Bo56wMGoUaBUzdKdtNkAVAMj9r7xm+VbmKkKaXaB2scs9ND+P4D7mYbQHmTZVYqgFpVCKvf9nimH2m+Dj27dyJ1MyLLjm4+RhdoagnaVy9Hh37RTE/zNqYtu74PoSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4XhXkD0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4XhXkD0"
Received: by smtp.kernel.org (Postfix)
	id 81AD11F00899; Tue,  9 Jun 2026 12:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8A21F00898;
	Tue,  9 Jun 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007009;
	bh=Ep/PtDbzbuZ6BEPTWV2qayodAPn6ZZrHfDckHosED58=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E4XhXkD0GPpVtFOLfgOqqC2CLM9creDDbr2hggvWRKzbGpArBWKq9LeLTKYcEE1It
	 z+1pSXPpVUBss9/LPZb1txWwHuIs2QHia44CPts76kvCe4KQqLZNFjCphmzk/6n8qB
	 y3r4oSIO50OaDD6lYHcT4hIEm39rP8PWicYHDgg1iM+pI/YrlnHTo3eDLDzng6vW8y
	 WmwrL7fqkqmDAkyASQNw4eFOVWi3aupK3IC9ILSG7vQkpVgSoVd9k/TFR91sodpU4B
	 qHypg1Wg2BMtb+74EF9Zx9yMGk+oqHUUEIqdtVi3uJTc4F2MHGeR7nnqC+jSlU5ZwJ
	 zp4kL7YOfiNbg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198A939308CA;
	Tue,  9 Jun 2026 12:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178100700763.1991839.17654660827597266064.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 12:10:07 +0000
References: <20260609073904.813405-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20260609073904.813405-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jun 2026 10:39:04 +0300 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 defconfig updates for v7.2
    https://git.kernel.org/soc/soc/c/5087338ea434

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


