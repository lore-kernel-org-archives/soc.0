Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB6E497B71
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163438; cv=none; b=dHAIRvvDlMJQ81BhLwIqoq0F6dn42/yNVA1RWxVMEJHVlbdJDtZMuuFUHdBfmyIYHQT01H22iBSQIxOmQKcgJEKxooDsA9jv/uefzB9kSDrLZqCRqtC0bizjdScicfLwfWQwvBNcy3IYvz8u0n6r356q1I0Z90/4rRv0NNcAgr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163438; c=relaxed/simple;
	bh=/8lKYrfShoOOH8AJISJ4CzInHSuaPdT6A1t/8PNjRT0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uInKevgpWLpALSofuIKf5KyY0ooADYUhuhR7iuALBulrKd6sWvMKbNgG9KORvjJwDaCKG0oTAfxy5Wz17HnZHOdyPglhOEJjUFkJw5ToO4dfEiJtIemZwdPnIq3AWN1vpYFUo5oZqZ9B3xeiualGHSbQW/TCNXnRfWa6iBh8E3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnnFpz0o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnnFpz0o"
Received: by smtp.kernel.org (Postfix)
	id 1D4A21F000C5; Fri, 16 Oct 2026 15:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075041F000C4;
	Fri, 16 Oct 2026 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163437;
	bh=XRoryDPbK5v649Roo0XwxhVh84iKEIH5ocaeZnzR29w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DnnFpz0oQ2bjIkgOQceDrLHMi7jLTRLk0lPHGqMcA5QKlkQsmFRSTmZ5hD48DKPMS
	 6jEx+2uy8eXcidavaQ+zw9tl5zSxM5JV98TEoXqV/fIxEr68CqET04RNZVSESg06aR
	 i+u5Ze57suU2hE6/kZpoYfwfCsLbxxXtnkEP/0erwvHSq2V24Jkpx1mKZgDd9mvcNZ
	 QuuhKdAN6X9+RUmGm+g2wXG8Zl5YoC2QKlVEduhkS5SXcGBX3sU4OuLVRjrI6hAlbb
	 gIIxwvaOIyxSGfGjUfnFXzOyenLaVPnJUKMr4lZH8btopvtMUe/wGPqjBxtNKogI+h
	 bmAVu7XCHUX8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13F0380A966;
	Fri, 16 Oct 2026 15:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216343551.806834.3745776880997643556.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:35 +0000
References: <20261012192102.12999-1-andersson@kernel.org>
In-Reply-To: <20261012192102.12999-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon, 12 Oct 2026 14:21:02 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v7.4
    https://git.kernel.org/soc/soc/c/e75d73180660

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


