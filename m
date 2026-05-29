Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69090377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094423; cv=none; b=gcwRrHzk9ACQK9B6RaO9jHZ6fgTS2Mim0ADu9COoCFESWakO8H4DMaSD/O5+hAlWYiU3EgH58cdUJl49GsEvtBUuYqlYLgeSyDpKXTcWxB6Hasz1ZAO49RikEjUtIGnoVg10TXMvBH6P9oaaxNIZOKbObDHSMcMsgI96Cp6Rl70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094423; c=relaxed/simple;
	bh=ZEDUSwNMajPItRbt/ry2Ir2xThP8I0MmAhB7uNJfD5I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qbfslpbSkFiul2PAISWEpjU90HgpDMikillz4ULZKGmNFxEylR6/ypQHdQ0wYv4htazvmKJBfNOWLMef2L0pSuXzE3zrnpsRET9mVWj9O0pY69egzyRYYceUBB+fPkPFZja3HxbjSSrfLoMOuUBQ7kxo5Hba1pXA8Gv6FTZkaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emQk2qb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emQk2qb2"
Received: by smtp.kernel.org (Postfix)
	id 1264C1F00898; Fri, 29 May 2026 22:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09511F00893;
	Fri, 29 May 2026 22:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094422;
	bh=ijbC6wcJyArbmI1cZCGCi7HrNf+0XGKuvnmhdQKgRF4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=emQk2qb2FJMVUUP6hVotv79Esk0+jrcYKtrKRIMyi5Eo6xY8Yw0d3PTCWOt3gFp44
	 FvYSjuizO0szbj+cv3C9Un2S4I+4mQ4AK7URhBGdpUovYSttzhZE1aiOmM5q0jF1aT
	 Ov+wzCVj/Zd+RwZLYG7PiMXeDhKhiQbXrhh2XkGXBCECZLRStBNoR8lorkGOfb6NIi
	 WIsan/zMBL+yjo+UI+wdNCLeO08zvjBWvS3AnHTYAHM0UN2CDr1AzPpCM6IoxQmL9X
	 WWreSWxirB9QqW9t5VEaJBxGWwKTGUgqP4/pGITtpojdWEN61aga1o7uNyewr8Gx0D
	 fvFrkdF1Xz4Nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C6839301A3;
	Fri, 29 May 2026 22:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009442538.1985625.4121755294624383138.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:25 +0000
References: <20260526152600.5555-1-andersson@kernel.org>
In-Reply-To: <20260526152600.5555-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 10:26:00 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v7.2
    https://git.kernel.org/soc/soc/c/b6a6fae6c542

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


