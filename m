Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8782F261B
	for <soc@lists.linux.dev>; Wed,  8 Oct 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921074; cv=none; b=YIkPUVzqVhjYun1fBhQU08NhjKUQQzkU7ab7/VBeV7mWqzjoVsBpGNhXQnmhA/UQAftxXBqfhBHqxhBLd4LvUI5eyPLthXDk+B/+I7/I3q+gHd9BPy1shSw0YRTuvc3wOqHK+LMfmKaYPAmo8WedJpMcc6ylYIRj5MnXz9AAI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921074; c=relaxed/simple;
	bh=KPerbbVtOzXCIY7Epg9x0yioPhpm6EQz50NQZUPGR/I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XNVNR/eeESdyO4vdHqZ0tTplAX/tgzNtMGNd4V0qRzOvR5Ndz23kSBTeQbRkpIUwvH4WhZTeE8SE8koWZLWeBUHjiAUYJCUESrOj6Iw/bKx5xO1Wq6/2fVw10vlpIQPeIc7BIqzV+zl4ds8a6Qvm1NorzW9WlcLavQ9lLt1o1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0xVDv5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0xVDv5I"
Received: by smtp.kernel.org (Postfix)
	id CD35CC4CEFF; Wed,  8 Oct 2025 10:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AC4C4CEF4;
	Wed,  8 Oct 2025 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759921073;
	bh=KPerbbVtOzXCIY7Epg9x0yioPhpm6EQz50NQZUPGR/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N0xVDv5I+epHapQ0KBookQ66GBnE4AR8v5XJgAsmyaRGeH65BS6tEZJ6+xBmbHGsn
	 tszE5wqq60JQnlavLGRJeKT0mN8TA664nq5q3BYAwpuvVajcO+TV2kJwOLp3ybzWeP
	 xK434ADiJZ3hl2y1XtHdJFNaxQzzB6Fh/CerobYmGSit4P4N0P5Q9Txp69j8r/Rj4O
	 OC8JdymS1fItmxaefsUfStS3SVyKUB/K1KIVsNg/Esg0s6S3tAXQhq8GU3aQpxDepH
	 1ZmnCA/2mrHjg41/5j2KrdtZ7ljfQYZ5NET4LKLn9U3LXDU2slEDgg083mtMGVN3y3
	 uxgyGJcmMKYOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF22B3A40FEE;
	Wed,  8 Oct 2025 10:57:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: ZynqMP SOC changes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175992106249.3011254.11882138553911432316.git-patchwork-notify@kernel.org>
Date: Wed, 08 Oct 2025 10:57:42 +0000
References: 
 <CAHTX3d+aQHxzkGSseB5e7m8fr5YTKQL4CMoFZF_yXgR_CdATLQ@mail.gmail.com>
In-Reply-To: 
 <CAHTX3d+aQHxzkGSseB5e7m8fr5YTKQL4CMoFZF_yXgR_CdATLQ@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 13:31:59 +0200 you wrote:
> Hi,
> 
> please pull these 4 firmware patches.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: ZynqMP SOC changes for v6.18
    https://git.kernel.org/soc/soc/c/58e368daf2d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


