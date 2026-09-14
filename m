Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA2496D3F
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398673; cv=none; b=rp31gPQoJGBoxt9HH2Jy5fQ/tpbDe+4v7k5GXS/whuzNx3J0jUoKN8TgFPiujUDzdiZZ0evfZoN9sfquWP59jCmysj3iLz6pVWDpMveYbNPkUcsuHsxjCB/O1Cj13xF7+zOZPwWM2U1oABWE/hEcLjOkdHQezAAFyhH+FlzH7AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398673; c=relaxed/simple;
	bh=zV6uTaF7TreKecWNfA1N7FokIdOE0nRzSWMytIXnhWU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ehMPEGPRLppX/BWsxUoKZnhHhF3HSI6kinASniZZZnRnrcOblA67w9OA1wnLJtnfCYGbfqeEiAmDfcIGEXCiM8a4aoFSy6+5LnLA1EDRWIzSlSgOnb0LhLDbmHKKvgdLxztbMK/S64Dml1Bv78P6z9xRgI7F/kThU7o/zYY0M54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5gf0jqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5gf0jqD"
Received: by smtp.kernel.org (Postfix)
	id C11461F00899; Mon, 14 Sep 2026 15:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4991F00898;
	Mon, 14 Sep 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398671;
	bh=lfQqsF7z436S2nYzzz5hEG19wYx55lLAJFBBPZ4IkUo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f5gf0jqDB3AzRRGH38JiXhVQC9Utu0uEquiWu0aA5PBSGalKfmRgpicgkR1qKEHsf
	 cv/A1DhwcQNyvOX6MVvLia924P0yIFY8NBxaO2vy7MmtS9RzRbNuhAzBcJ5bk6Fr8P
	 Cjpme98NDMPny6Y14L3gr0g87wfNsbgVtJEneVQQs+qpIc7cqDQmwI0dsN/TcNDJL5
	 C0W/JTqHSGFOJPRrVZOnO+u3hhINePYBuD+xlOJOLXecrjzvNrdlCsN29yLBbdIZl6
	 tkfCrnTuCPY7v4MjTsxEaw62WzL+IWJr66ytOW1vNbAnJTmhCvpQimDJcv2gw48xCP
	 JNjZxMB/Lmfzg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1973C3924A6F;
	Mon, 14 Sep 2026 15:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi/ffa: Fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939860663.630437.3540002810223637546.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:06 +0000
References: <20260908201216.2993544-1-sudeep.holla@kernel.org>
In-Reply-To: <20260908201216.2993544-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Sep 2026 21:12:14 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi/ffa: Fixes for v7.3
    https://git.kernel.org/soc/soc/c/869e97e66d3f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


