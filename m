Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689FD3537FF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977810; cv=none; b=ajJD+zGuabYdi6KQbHVLibDHuimen9Lg9ZkPY5VNqrLACybzBAUUeyEqhXiA8siQUU7OHefueL15r0Ccsh0wrEqdKpXA39r5BsLIgBdUvfEC665U3yXzkMjzIe3mGfUFG9k9RsdqSOxXXbBspxbngtOPGtOr2ue2qGyOg0WgNq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977810; c=relaxed/simple;
	bh=tEOmwhbT9L/g1ASmn9msxfXdjOSJ5aluM/WIB/EhPVQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=P5ZuuB+kmn/fDKhFdFtZTWXHHby9V+HShgx8lUxJzeNoQhr5DSlb3xXgwIHBvbPK+kMRLY3kQJXf+igwpXT6ZqmHAU8USZVGHiGDXCvE5o0FUp6pIxfcUPDOrnNqAFJy+kbX9yU8uXdCsP3eEstYeOoGNlhd4FdN1UU0Y9CUkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7t1VLtW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7t1VLtW"
Received: by smtp.kernel.org (Postfix)
	id 251141F00893; Fri,  2 Oct 2026 21:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3BF1F000FF;
	Fri,  2 Oct 2026 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977809;
	bh=60aeWq4SCgaKHbQAvZOca62mviNWvOq+6HSZyUfLojY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=m7t1VLtW0ke3C45QMwulGqXVBpne/OnJ1He0Jg384Cxljm80mOSTDFUQxiOpZrigd
	 q2FDsAhgZD07th0D189JnQmI+yG0cccSRY8kerUiqWZM3zyvzBGVO6LYcl1eH0vVoL
	 L2hqjNJ/pR+YgADP+92hTQjKPX/BaN0sup32ArxpVwjz8eQyCxuQfr1q7AHe2b3c+j
	 8qn59Y262jjCz9JoBQDEE7QvyKeL1ZlgIJ+I41ubgBlH5Ayi9dzMYxCZcKd57/7piG
	 p4bRAmKFS8r0UKlO3C8ZS8zXlyfnSXPsNMKbrxOU1SquaJmKsz2g0bNwaHc/DKGzVm
	 0jX7Ns4/hZwpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15BE3811A72;
	Fri,  2 Oct 2026 21:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097780752.3602058.293893482163641599.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:07 +0000
References: <20260922132018.358932-1-andersson@kernel.org>
In-Reply-To: <20260922132018.358932-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 08:20:18 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fix for v7.3
    https://git.kernel.org/soc/soc/c/26fb480bee21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


