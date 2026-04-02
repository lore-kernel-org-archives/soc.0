Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC63612F8
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165445; cv=none; b=jjsd4Gm7Ir4Bof+ZlknJ7oY5Q0jxBBVG0JHOoiX329qcte4loonZPBtVEHonePakdcU4T60kci+9TiDyQLgdrgHnZvR9aVzIXlMjoq2Rn5n0yGe/v43tVIkoPqcFFlWIBciceJ+2miwEh5FECLS37rHykcLtsk2XZSDx9Y+lF1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165445; c=relaxed/simple;
	bh=eFyGLqu4P+jCcInr1l3BzbQeUB3q4eZz+EITBRCk7Ts=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dIWRZIDC1D0BRwXzNZWmHj7b9UBQmPx1nS5ZCxN61PwSVyNGEq2YBFPCfvc4soNB1bi67Bhm9PkOLRnzSIretgGzhBF5y5dCK075Ay9V8oEEU+RJV3IZauxlsj1IRY+w0sC2vQCpsPyDOyz76RRo27bdFhbMOPnOY3qUISO8m+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fxbn/PcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fxbn/PcT"
Received: by smtp.kernel.org (Postfix)
	id DD0E1C2BCAF; Thu,  2 Apr 2026 21:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C789BC116C6;
	Thu,  2 Apr 2026 21:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165444;
	bh=eFyGLqu4P+jCcInr1l3BzbQeUB3q4eZz+EITBRCk7Ts=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fxbn/PcTnZvNl0gnvxevdlUPbnW0ugHnoMrRAGiFXs0JSjspxbshHRdcen29GGSJ7
	 O+4zQZ3wr5GUFZspvus6zsb9UYmzKlZzBVrg8RjAsA9Rkmhc+MfQzonDf/R6iHKPsl
	 mzoNbyvh7DIkBYcTmMzHHFuEFSaHhDASnI7ZJoglK0HYfR3dyOUtN9m0eodWLQysl2
	 /vGox3XlBzalFBifO97d/8mEpdZic2TwYqPnAb9gAIlIYwTr5dEDEOEaqU0zJb1INS
	 0sdfqHmc4F3XItvMY7yv9Mulw2rDP8SOTsTa6wjBbsHGU/YpxCk9Azo6jCWuAZMjI2
	 2Zc2gGiEEemCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400283809A09;
	Thu,  2 Apr 2026 21:30:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 3/4] i.MX dt binding changes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516542678.623252.16814265080122687219.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:26 +0000
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
In-Reply-To: <20260330141444.3789193-1-Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Mar 2026 10:14:36 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] i.MX dt binding changes for v7.1
    https://git.kernel.org/soc/soc/c/62513d2213a6
  - [GIT,PULL,1/4] i.MX arm64 dts changes for v7.1
    (no matching commit)
  - [GIT,PULL,2/4] i.MX arm dts changes for v7.1
    (no matching commit)
  - [GIT,PULL,4/4] i.MX drivers/soc changes for v7.1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


