Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63EE4446F0
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911257; cv=none; b=m3nWMGPq1OcbEu8rWoWhNR1n1EYjEQADM1ytP7JYsMAg9h8Q035yw6IU/UlLnYDtMRjdSDTwzb5WDLC52Dq4vyFSbVkupmzgjhj97GRRuFp4sFb80vhwwxKiMtJMEyNv39ecc0s+YpBngYlsjbh7TysGkApik6cL8BM2bUzFN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911257; c=relaxed/simple;
	bh=QxJD8d3IXBuqd1ZUrQdOjYeRAW36sXAIbqlPUC7prJw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lWYeJX3SGAGKivgIqXVk1Gwb/FiNjBHVww6SZKrma90g0CyRwcg8ziOLzwX0suUU+46L6aT/DpwVpGjdBF7OIeJhk0QmEAjlblYpTR4uNps3fO6lKDkpT96hfkLU5UVitaw7vOBZ1fZOrOqm4c7BQfy2scmOu3MFNr12gvLyIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGvyZ5T8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGvyZ5T8"
Received: by smtp.kernel.org (Postfix)
	id 624141F00A3A; Fri, 24 Jul 2026 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD121F000E9;
	Fri, 24 Jul 2026 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911255;
	bh=HaDNfT1HbbwdRYxqCnb5nEQOLK14F+UOe6IAf/iP7PA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kGvyZ5T8DkycohOW1jqgpiXTc67xs8GAnniPu5r11Gytld/mOhyKynZJ/taAU1nvZ
	 IONu81U/EPDSbfjUJGDJsgRNT/iYrniLTkWFoAblItW/R7r3pkqqk7/RwikPQVQHiV
	 SWpLX8xTBoJtsMn2kZrz4TcFtOJihj+62ihZyuLibx0vjoHApxe1Z5ec3FLArK9Wg4
	 Uq72GPZpJEOqCaBsxa8t8CyHl4fOTgPMgWUEjUG7O4B0dV2YaLHF8zFmCuwHi91Vy7
	 9EoaN+/2Q3UKpubWgzznu+3Qjf0u8TeIJVPlaNOYePVRvlDlkrc6m6vya7I7FZdmbG
	 9HfshX7SX9oBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A3A39263A5;
	Fri, 24 Jul 2026 16:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V devicetrees for v7.3 - Early Canaan k230
 material
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491122238.3229915.5266351534692676918.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:22 +0000
References: <20260710-purge-scarcity-942f27750ce1@spud>
In-Reply-To: <20260710-purge-scarcity-942f27750ce1@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Jul 2026 19:25:00 +0100 you wrote:
> Hey folks,
> 
> Please pull an early tag with the Canaan k230 support that I was too late
> with for the 7.2 merge window. Some of these patches date from 2024, so I
> have elected not to squash or have the submitters of the clock changes etc
> resubmit the original k230 series with their stuff squashed in so that
> the history of the initial bring-up is retained, particularly given
> Yangyu's detailed commit message in "riscv: dts: add initial canmv-k230
> and k230-evb dts" that covers the testing done and decisions made about
> supporting the standard Svpbmt extension or T-Head custom MAEE stuff etc.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V devicetrees for v7.3 - Early Canaan k230 material
    https://git.kernel.org/soc/soc/c/0bcfbb1f786d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


