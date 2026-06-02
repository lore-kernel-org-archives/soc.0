Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F93CC334
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391414; cv=none; b=OfzpVgItqIDl4u7YbkRzDJ3RIN25/LZtb+ZPHCXrmVHHkZeEHfwNDARV8yCoARG8BBEMLZugNLaSnHiYny9JUbqnsl0wvdcciMGQBGpS+J3nx6v2yyVG3F2I22sPuwe/YBZJuBljXwdoPtXgBAEkC5Sjy05DQOQ5OW6qNbW6Bwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391414; c=relaxed/simple;
	bh=WQNnbk+uro4YQRMmdl4v+apWQ1ubeKJGeZ3P3os6NF8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=T9YDGTF18KI7BcZUdtfg/pjs4Rj4DwQL40Twp9eGPOqlTyAZK/SBzEmzGCv6LhO49vNVbZwB6JMFo9frNyeF4mk2QP87IYvKMBPnT9PdnMvNx55hZrH2E5UoG32kU+IxCquJHK1wtxZvxJ4c7rOxktJh01/5EhF4P6l69vInts0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJUgYgt2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJUgYgt2"
Received: by smtp.kernel.org (Postfix)
	id D98AA1F00893; Tue,  2 Jun 2026 09:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C375A1F00898;
	Tue,  2 Jun 2026 09:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391412;
	bh=YySemAv6djY7sxvwfhCmc7H+g7Gtchf8BjkV7CGx+kw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aJUgYgt2heh+m6Esomzc92MNGTGEnC5yhSSp8hoHzkNkHyicTQd42G4eYrHxeBS5b
	 L3S2n/9tOqu5N+olFTsJUfI9le9WV2XSPP4tculEpxZ2UugHGbgrWi0ftbZmLFrDJj
	 ZGROlSfJOMhTgfx5nwK2NvqgqQp0qklKm1MZcVv3Orfnw/ZCtGubZ6EIdLjRfzkCNB
	 t2lt7a1cprmCfVH8wRiZA6ESa7Kgcuu+44p5C9FQ3U6PojIWlBt+sTFh76G9NqhqlK
	 fEUrPSXQLG6nN7W5tal2xqybsDZUE4xIxE6TfBoENUerc3q/Us1cYBW7ynyGGD6xfq
	 0kIAh0dgXVTgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198C03811A49;
	Tue,  2 Jun 2026 09:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178039141465.340640.17072190480410370427.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 09:10:14 +0000
References: <20260526165735.17848-1-andersson@kernel.org>
In-Reply-To: <20260526165735.17848-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Walleij <linusw@kernel.org>:

On Tue, 26 May 2026 11:57:35 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v7.2
    https://git.kernel.org/soc/soc/c/6a469016b88e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


