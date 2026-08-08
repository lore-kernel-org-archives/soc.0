Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19FD1A9F91
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220508; cv=none; b=f1V5+YNFfljF9PlT1y9Daeiw1qgkHcNwb96bQ4eH6W8oYpCZHhpcAtH5l6elfvAUVnHI1gFfpmRFuRhfdJRfWYRnckNGXpA50XOLWVfZn60OAtO/m7grpH7Cb4J+Vs+oifgWui6WrFi89I+LAsnNNmxjq1FLtWTy1uDgUgCTSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220508; c=relaxed/simple;
	bh=cfy8KmwvxlqXGXDQ+aZ2do1lbbqIlXJrXfN0mbgZI/c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oapdjpyq/9HczZMMD5ckBwFSQIkw7nff97LAr8LtwoPQ5M2nWU76xNbRA28sFilOY/KPBJf++NiX0+bdB2rhr5ysg7VjehhlXNGVDaal63nQMnuWJnrohj8nOAQhjoJ+TYJmE1b5CCSWwhY7pJEieDL9CeRe0a5KAA8zKAZju+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbk/XpQl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbk/XpQl"
Received: by smtp.kernel.org (Postfix)
	id 87C821F00A3A; Sat,  8 Aug 2026 20:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DEA1F000E9;
	Sat,  8 Aug 2026 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220507;
	bh=rG3E9dkfy6MDfGKlxK4ooI0A2dSEeal1M/dNkxRK15M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nbk/XpQlB1ncZ3Y2xu6CXVxHylCWFVQgIW6p6K0o41SrTYOb+LdR5nweo3nZ6EJE5
	 ObQCgh04kQKEI4qbkwzuC4daCPQvIKXWBOdvIo+TUv1SmkHHJCoFczwwWWABMRVUJ2
	 B4xMTmTRkxhiR87PSgmyvQ4hTFSJq7h7KjTk5qPVWI/nWyJorJrH7/jk8uWj7ZRmdy
	 yjnsCcnK7LsBYVJ7io49c+IdygUcz1fB465tDBFsFT0lljBOM2LpLkl83J9eCkPeE5
	 aUf4XhlZVH0JPQCsT0fONAhaS/NcYuO/UPTH4QGqWm9DIcJkhjGFVGHHv0YhOfFomz
	 bd269TNhnMq1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ACD380CFFA;
	Sat,  8 Aug 2026 20:21:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622046513.2748994.4813192419661025183.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:21:05 +0000
References: <20260730164337.177159-1-andersson@kernel.org>
In-Reply-To: <20260730164337.177159-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Thu, 30 Jul 2026 11:43:37 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v7.3
    https://git.kernel.org/soc/soc/c/7855656ffb8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


