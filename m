Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E7367B92
	for <soc@lists.linux.dev>; Thu, 30 Jul 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405069; cv=none; b=kBlKJIwWpimPUMEWXOMuZp7+RhcyYgu+/3Z/fiM0fSzHd45iqkqapHl9/1kFaqfKCQdCRGcLNE5mlXzNEtvRwSvbDiPGPOQHvobgzjFyOLqmCnQZHTbIxsPMQb4ODuaaDyNHkiG50lgWOu26Rv8fM8Qstqd1iuwNvQCK4G9oODE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405069; c=relaxed/simple;
	bh=hsoziDDwI81Nkv6X5xFUEv+hnMS2PiKjJOBmystmG1k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PJWKGa6zUFdVS4NhLd3GWzo9yamK6oPWDsMk4oLv99qt+dqQsOG9OxAgWn7yKVwy9m/hup6L9b9SMvzqNrRgtNlxdDEbruBD3XdsM7KwdOdKkWH/5xbuM4CaZ4EiX22HWzlzT4Z3qDBV/yUPEA2bXvLR1ZzzYpPYAKii7Lx+lBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVWZYlwE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVWZYlwE"
Received: by smtp.kernel.org (Postfix)
	id 7D1C31F000E9; Thu, 30 Jul 2026 09:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672E61F00A3A;
	Thu, 30 Jul 2026 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405067;
	bh=J5S63D2/9CSJ+O6iWunOU38iOME9xKnSXWbcg9KyE8I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PVWZYlwEf2o5+ZyN3DkrWB7Xb6m3UOVlaEYb0+VEGIcBad2v2RF+a2AM9nzqKJ3b/
	 gsSPgUjbcrSAwHtqNPopB5Ac1CyqGuHZbiVTHWuQuIQd8SBLhLXxqUnR6kBPu3Eyrh
	 sSzDrHCdbJ5HxTBFIJtL31e92wfHTO4Rj6HO8dtOI/6MwWVAIuNLUEkgv14KAgBPx1
	 MFf4dOTx6q81PTE17nESORygxkKVwGTc54opXN+c+VKE641gBcM9AROmEkoXzAqDm1
	 kVC7/CLftVw+hFZ4bb5GpYn5A7l5TTMqKiiCG3vkxY2MEwClLp2ZF9hhtmASnDq77G
	 E72+DfHV9AU2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5685B381195C;
	Thu, 30 Jul 2026 09:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178540503085.3469699.4558204863723551151.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jul 2026 09:50:30 +0000
References: <20260730020642.68595-1-andersson@kernel.org>
In-Reply-To: <20260730020642.68595-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Jul 2026 21:06:42 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for 7.2
    https://git.kernel.org/soc/soc/c/111b787c9e31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


