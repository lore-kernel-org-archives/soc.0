Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E7330F7E0
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720703; cv=none; b=qhKnp63ggfotY8fI+0kCL0zGNy9bXh2pZGvoSsvAj4eIpbbXkcgFtGjeSnnerN9DVVCjeD8kisNnH0rGAto1ZgbMaaYDQK+E7lkJsFa/yYtHDGGCRdOb4/dRUwds2NfStv9fI79VCs/NKw+F9jcdFoCGbienHYvm6lLMYSghg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720703; c=relaxed/simple;
	bh=cjGsIoIs7t7yPk/G+EOtNJ1n8eDOmcmV44Y/xREdHEk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jgjBCmr26wy5p8MN5DrNl4PD6t76eH9Ql+M8zARkfzd/1v8bYDHNjJ1OqWCtyQ2lPgkSee3mFkEOJXsigLWh57vYGcamaDhqdS5Hlh3llhFB2L6ebSb+ujkUI4eTRcO4pttn1WxEK1siG6OOsf/FvBDylg5wOX8E5HncnAS0hGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6qdmS7p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6qdmS7p"
Received: by smtp.kernel.org (Postfix)
	id 1717BC4CEF7; Mon,  1 Sep 2025 09:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E294AC4CEF0;
	Mon,  1 Sep 2025 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756720702;
	bh=cjGsIoIs7t7yPk/G+EOtNJ1n8eDOmcmV44Y/xREdHEk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H6qdmS7pGoBn1vXQ7Qws8EslGDc/j3erENbKXbCMIvTE7mkZNVHRg+UlxUBrY3Yg2
	 RORwL/sePDkIBnXHO8rmqAQVH1cuPmpoBu51fTlz7y1NNn4UNHPhDvQnOatUjW1Qfz
	 Gf3kw6sh2aVGvGcNQw4pDVTyEr8IgZ0U+u4g9HJekWbDXmp8HMtIKG52zajcJSAa7w
	 7oHaJynsB2y0GxZDyGau9iJvGE0TkMgIVdDT3pSkxzn42fhEP6rmhQYWVnditBpdzE
	 r4Qi0hQlNjva0OPkcNtwascoK8AwDa2ABBkfAHao58qfpBFey+VIPV1n00KhJP1GRP
	 MEz6330p5JfEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA3383BF4E;
	Mon,  1 Sep 2025 09:58:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672070874.3637164.11511021099092293819.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 09:58:28 +0000
References: 
 <1756087556-25424-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
In-Reply-To: 
 <1756087556-25424-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Aug 2025 11:05:56 +0900 you wrote:
> The company's email address has been changed, so update my email
> address in MAINTAINERS and .mailmap files.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
> ---
> 
> v2:
>   Remove extra space.
> 
> [...]

Here is the summary with links:
  - [v2] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
    https://git.kernel.org/soc/soc/c/0aee6faf5b2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


