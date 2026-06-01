Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51488248B
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345804; cv=none; b=ZTT50KhNw/2TmkjkrSMGRLqmQFYNbKSmAwdfUZK/3AtTH9j2wpCCiJB07bpjDuXnUp+1VV+CJ3A9hFqd/yXHAq7GLQ7DfXi+Muqw+F/vDO3CP5NbjqzJFgCRtt0TemcCk1t1oHC2tQgI049z81CMVFay5rX7ijJH3aKZJcdOrn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345804; c=relaxed/simple;
	bh=6AzIT9wWb/JfBN6hwH9fZYPetI6Xzu3wUCjSd36tcJI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cardfsr6NlnZGJhHk7YCZQntX3Rh7URUA/Nr4gp43krkMdiXnlm2qRQtQmkvQdRrxMB6H3ON5uHdazsKXyLzi1OKzTf0cm7YxLnrJUEWvj1PPtfTIdFmp6eM0/FBF/rq0T0HhrmNVSk0pgBVJahBkwtS589paIi+pSMU742RoKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFMw5/tv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFMw5/tv"
Received: by smtp.kernel.org (Postfix)
	id A26591F00899; Mon,  1 Jun 2026 20:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889701F00893;
	Mon,  1 Jun 2026 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780345803;
	bh=eat0gisst7DuCSZsxP+0vx9JPr1Fr/m+ugwxCb8iKEU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nFMw5/tvPquwEfBkHIb6BJvibPgjnFSxgT2jFT9fF4JJk0qHxriJHo5CMtf/aWrR1
	 RNhbbu9vY+M4G9oaUqCE3mmaZCusZRwGMOJxYPGiX+YhbL7Tu97LR7oth6vhSLvFYO
	 gc50PryBt0jRN0/sDK2RO1PN4lQuMTdKBhlgUjSRWfES5bVHxqJiPX8qu0zjzGFNr7
	 jNLgxIdMhxC7kcYpvY6D4LRmP0UkPfU5eFuaJSZ4Neo/Tgu8rEtdVJMUqH1Nl8AUV/
	 tMZnemNX63Xsu6SRExT25YAPD4i5ZSbGJ+oOI5CZYJPBHlBXrEyOydjcx3QFtUCJk8
	 BY1azvsaVROGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1978F38119F4;
	Mon,  1 Jun 2026 20:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: fix for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178034580564.84967.14557046020208852154.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jun 2026 20:30:05 +0000
References: <20260530193213.158229-1-dinguyen@kernel.org>
In-Reply-To: <20260530193213.158229-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 30 May 2026 14:32:13 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: fix for v7.1
    https://git.kernel.org/soc/soc/c/fce4668a0122

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


