Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3D50B428
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907855; cv=none; b=CbD/NGN0obEiyOlJHNqhXSbQrmWvSvzbjGj+M0+W8K8O7TaK9ruA0RzIQ5rJQ8Fz6AzYVXgtTipRrPl/1blqTl1uZmyC9VfLjG1wadbjCRWbmA4JeI9nJkzsvmHrKZ5xhYjzznVEhhCEHpNvmMQGqRctpUyVCSchh8vlgyR89+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907855; c=relaxed/simple;
	bh=gu0HeCRkRgjtzx7E+Z1+LzSVZbNyn6r28m8rzJHCl2Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pQ2v7eIGm3E4ONeXJHBB6CF6JAGBurENhGsf85VmbNsmcGq2cm6gi08jRf+7zTLxppzKSmwwIJsz/OO1gnpsaJ4japzvJHqGxM8bhrBHK+7hwtR8hskqru7firnKLSyDm/A3idlXPj3UFGUVgJP3U8vD902Ycp7KJQ/VUa3hluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3AOPKOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3AOPKOU"
Received: by smtp.kernel.org (Postfix)
	id 59E921F00893; Tue, 13 Oct 2026 16:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4467B1F000FF;
	Tue, 13 Oct 2026 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907854;
	bh=ee+usj1R+9MjmOG2U8a/l8GP8WiQwjlkL/GzUfxe25M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=h3AOPKOUIeljNsYCma4p0XW+3I9mQFBOBIJ63iQiWB8EBVfhrpajnvS2wyQfcl8iq
	 WOvvWqb1iVZvgjZGOv853Lhdyyg3PyrNMITLKEi2iLpGNMX3vKWUylHORFOZe89E2G
	 AVWOvpTPuKn8R0gMeZFgMc9Y8jEnkQUG9cF/yO7Xdy067769vGQk7nk4ehEcxrfcQ3
	 1a4UG6BnHyboCnBKGxl3JpPZ8GeEhiPqsqD8TAM3BVboRhbvpZoqs9PlaeXBKycGlJ
	 3HRpH9X764L+kubglVwAlxwu35osiCbcSpT8tNcK85oUasNP8sFF7mAt1U2ykDRWqJ
	 Elsq5FS2I7+eA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A50D39D5FD8;
	Tue, 13 Oct 2026 16:10:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Visconti5 SoC Changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190785276.417156.4461900085106687677.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:52 +0000
References: 
 <TY7PR01MB14818E7E9984CE8F0B260CC73CD8A2@TY7PR01MB14818.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY7PR01MB14818E7E9984CE8F0B260CC73CD8A2@TY7PR01MB14818.jpnprd01.prod.outlook.com>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 1 Oct 2026 01:50:33 +0000 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-soc-7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Visconti5 SoC Changes for v7.4
    https://git.kernel.org/soc/soc/c/7932d636e635

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


