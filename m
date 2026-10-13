Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC264502767
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907850; cv=none; b=fEhdbEZ7D77fWVCtQf227R0bE7imVLhMldZiktxWmUBZIoi66AF5vzs3UuGiglCQWwqy/kBn8u0Iv9L4hRpOK6QlgtysmsW4gsxtlH1FgX46OGYpo4yg0DbSrmwATKKkkBWXHD+YIwWobH9rcru4X1VlVMebWcINE4CcM6nBXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907850; c=relaxed/simple;
	bh=VeQKiYGnWvuLMD2lGImGvd+3eC8n6cr02Kj5w3x9bRw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=os5qeVHArW+DPczZQdDtYfRNb9ZfUUGOse8A//VUb7EIyQnBJPPT+x7VgHPpHj5lUh6nL87UaLILBPF2F2g43NK5rRWOaIUJ6EpULGP1ZxQhTC+uXtpIJQ96d5dgWVzEJ+hcCoZlxdp0Og9tusQKER71reWNpVtK3YegBcfG1so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTvzpDqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTvzpDqc"
Received: by smtp.kernel.org (Postfix)
	id D1AAE1F00893; Tue, 13 Oct 2026 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB80D1F000FF;
	Tue, 13 Oct 2026 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907849;
	bh=tyt+ImsFvWlS/HAIsTPIzKju/g5za38Tgb8f5lVc3Kg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FTvzpDqc3Y2sLAuHQZtevJaemh4YByl30nwu7vSxg6c93gsFTCY0DuNrCGbenvXWI
	 nal5XQF2kxKPUHrnLDla+7pPyvFSxxeHpW53vfNTV4dvDsI4XPt4mzvLYWm4i2T6MR
	 UahwevOzqM3Yh3qnP8y92JJl+YqFGg9egWL4f8mflNKJGhIgtOuontJ+ZI8fhj1gsX
	 hTTRPJbplujNCicBRubUGvoULMJzR8l9dQE6HOq+ppEfSo2IlgyciUQduKYVIyse5t
	 u+VMmLvu4z5brynA2DuX/bNX8qLVXiphi80DjfjiR/4OI8BWuabs5+n0kFjTU5b+Zq
	 JiCwIcMQ6J0FQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43BE39D5FD8;
	Tue, 13 Oct 2026 16:10:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: defconfig: OMAP related updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784826.417156.7880838406851822239.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:48 +0000
References: <7htsn99sx1.fsf@baylibre.com>
In-Reply-To: <7htsn99sx1.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Sep 2026 10:39:38 -0700 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/defconfig-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: defconfig: OMAP related updates for v7.4
    https://git.kernel.org/soc/soc/c/ab355171d097

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


