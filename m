Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349E35CB61
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080250; cv=none; b=gVPDsYgz04STOJd0fuTkdvnomF8a9L/Sh/awtuWPn6XPq+B8wOCJVTZun46H9exniuwIKXEMRmvUv+/tjFhyCcpC0XSNdSqVewp1ofXY3Betj7dwXo/znXwKES60IP7KdRkltF6X/Hi9GWWqkbS1HwqwcPdsqcy5NUi9i4o0+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080250; c=relaxed/simple;
	bh=k/b6Ne0v/y9Cc9D7iDrXPhbQQLVLn62w66ARKdTUkW8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TBh2Jr4Ce+bWVHskJBMfyRQldiUjd6YvOqCiw9SPw+qx+vBX516uXuRss6YXJWlyvliX7Dl+McPA8a3/GzwodNG4FMyVMOHecLakpVuI4s502FvvNhSDEixiPfPv3/VDfkWQYvnrBCA7IHe0pjaHlPcYJ5rPPmbojhRhp0jgYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjZICCqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjZICCqt"
Received: by smtp.kernel.org (Postfix)
	id CA6CBC2BC9E; Wed,  1 Apr 2026 21:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A81C116C6;
	Wed,  1 Apr 2026 21:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080250;
	bh=k/b6Ne0v/y9Cc9D7iDrXPhbQQLVLn62w66ARKdTUkW8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JjZICCqtnCVRr5KWCIFIKPAbIv2U3gT0jeYPKIF/pE0u/lSlPMWgZZAigIHO7G2Jb
	 dgGkaaKhaTG6mQOb9eh8xDG6epVY/Gb0eDd5qAIUZGOmjlyheYpTwe720625SMcNO9
	 ODCpzlTIzINy5yE7bhLGmneeHuKmcjXJ2oh5RsjRuGRbfFOyn3Z+PdvBWXAQMWRYJs
	 EOKX7WvKDR0wkapkPY1y1O2e6bzWPwJVBMNzby4FaD2YiqBPMol5Wy5WyJW6WQoCwU
	 4IYBK7eo6oGnqSupLrkCFgzj3kK2bueS+KkSvUM7HO5QS/mTYty79gBqStPvyOqKTe
	 fWzabS3aKlbQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EAB3808203;
	Wed,  1 Apr 2026 21:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v7.1 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023328.3876275.15250846960970236737.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:33 +0000
References: <cover.1774606536.git.geert+renesas@glider.be>
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 28 Mar 2026 13:11:03 +0100 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v7.1.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM SoC updates for v7.1
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v7.1 (take two)
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v7.1 (take two)
    https://git.kernel.org/soc/soc/c/cce3c4db8644

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


