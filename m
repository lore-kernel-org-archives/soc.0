Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0306247C110
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907837; cv=none; b=VPdS+npxpwpCt4fUX1m23GE7oIv/uh1un+P5zqYj46o6gXgn6TXKxjbKR7IFNA+eJ6lqKUlwtwzhiw1sFT+Ny6bQg60lNAOZZhgibLzKL9b/ZUfDO9AULu4CvjVnWX+bLRhizKxG1syBhn1ZllvZqvhyt272RPg3ck0AK9Z7q98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907837; c=relaxed/simple;
	bh=1KKrVtxviSL3Cf0eXPoefuOWNtdMTscFrtL08nrEaJA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fQGsmcK9EkBZOH5GNzCaQcY0YDa7sqVvp0feu4O1/UqysdssY0J2TvO6yUyIuZRod3oB1I9H9V65oQW6Lg37uiPqOKUqja9IMV+5OcVMs1tFb8s2X2j3jptiz8psaDRyo+vYJNGlQ+r5vGPpbPse1sApMnIRglFdiYHn5mHr22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFbLfuZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFbLfuZP"
Received: by smtp.kernel.org (Postfix)
	id D15651F00893; Tue, 13 Oct 2026 16:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1A21F000FF;
	Tue, 13 Oct 2026 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907834;
	bh=qcmeazRaL8B0kMcSvB3oVsTw932dP9bNVXS4waa+n5w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=SFbLfuZPoWhTHQm2qrpd7DA+vp9UcNne9JXMCNLbAll4l2yKWuFha5Mv72RKmvckD
	 khG2iIxMEzyQ42vcE1ur59a7gUES4WlPC656yQ/8Y3G9/gVM7TjG4pS488SmRymrSI
	 W/gVS1Sm2FdY6yFJTzAxU0qX90rGPpTtxSsoq4eWLVQS2jqgwt95xx0fTdTpltFYXd
	 XwRPE2zNAY86X39uUF8lCROeNw5G6YDa0t3qJ49XswgNRfKBSzDS6aCSKpZInx9JbX
	 ADV1DaPDQ5MneqXJyPBzjAlBfhTnLGAxzZv7lE6hLazLgOXZS703miz2OL7UmFDmT8
	 WxUUSMIAEbhwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B434239D5FD8;
	Tue, 13 Oct 2026 16:10:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.4 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783326.417156.1663397262442818063.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:33 +0000
References: <cover.1790939711.git.geert+renesas@glider.be>
In-Reply-To: <cover.1790939711.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Oct 2026 13:28:38 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v7.4.
> 
> It consists of two parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas driver updates for v7.4 (take two)
    https://git.kernel.org/soc/soc/c/21b58b7b9610
  - [GIT,PULL,2/2] Renesas DTS updates for v7.4 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


