Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27333EC
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 15:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085843; cv=none; b=sDIFVFW9eyXNmrG3E7p19taO5d3zcY2xFOQvBeaMZ3piZ56vFJ1M3+EFnUG2k9zNMW6wcXZqXazCCD7IslbFbgcnykMT3h3P2fd6hJ/ca7i/0++mYN6s8/G0faM4xi/8hEjZcHYVKLgGHr1F8WvXaNJwDdyfUQoXyvOy9C3VPH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085843; c=relaxed/simple;
	bh=uO925aaz3fdnPab1IiOABvMW4Z72mkegZ1iBZFs5ohQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KVKc6wgRJ6iKj3mPBxbrFMt9DpITzUuvAzUIYOBPkLzU4D/Do4stJrkrJpGRjXc4C5qh1V/qieC87MeGFi3oxMsZTFNnUaFe1sVrKWWhW8VVZfIyd5H1TBWRzcmLv/OsyfhNKLhtCDEuvXfMCUUGqvCyMTjSv+Zjbb0tB0w2418=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lms152OI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lms152OI"
Received: by smtp.kernel.org (Postfix)
	id 599D8C116C6; Tue, 25 Nov 2025 15:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A6EC4CEF1;
	Tue, 25 Nov 2025 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085843;
	bh=uO925aaz3fdnPab1IiOABvMW4Z72mkegZ1iBZFs5ohQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Lms152OIjKnpXk1WU3IXp/c/E0N5d/2sUpjr+z01fDdnHB9jy38dxsFXyDwvEbRQa
	 KJH2T9pMhxnL7AMr44bcqFsbFtVFBOGqrGijRKiwE2QH2eOqv3ngKaBT49HnzaIm0h
	 TF5P7sJgj+kQcTYpYSdYbxg9AeuiiZuXQ6LCMcvpRSXTjI4OJc9gm5f7it22zfJIqo
	 db5II8lp0KMOZ6ZcsFeLcpa6gQuDI76CjUFPGLaVkjdS4PRQsby3G/yq8MscgnkkjX
	 c2aJxtVJDM9xz6OYOWpL2H/ll5bC5xKRQsYVnw3jaUZ5qvUnSymi5BBvaKWc+dEoHh
	 VpgK5lHQc7pMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7D7380A944;
	Tue, 25 Nov 2025 15:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176408580576.815192.9547309635985702664.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 15:50:05 +0000
References: <aSW6QyCvqM_DChbG@wens.tw>
In-Reply-To: <aSW6QyCvqM_DChbG@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Nov 2025 22:16:35 +0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.18
    https://git.kernel.org/soc/soc/c/e9191383d28d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


