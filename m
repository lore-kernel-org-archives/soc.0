Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C4E3C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106426; cv=none; b=MtCzc4E8v8Y/uH80avDVcuHwbA+mmbDhMmD9u+yd3BhY1tQ7ezJJR6RbyB4773dCLlkPfdnNvlZAYHIXpGnRMr+765ddwrtsQCvDAVMb1yaBGta7YiOk2welARjSyJScRmpYiFq6IJ4F9wG4J5wSHWOYLjh3D4jHUACU3gU19gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106426; c=relaxed/simple;
	bh=xdnz/DZ++iTjkybA0H8293yA8dkqHFby7+x6j7/w404=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WEuRv61hrm/TvK/svMlY2cDiKkKYOF8leIp+aT/2WC7WExb5ubGqCDW036b0h14DWjebfSbfRSq25nJebRGI/Nl9kIvtnxx1ppWjYJ6sgGLFzV++gTKexjcctpjxUcBRLybvX6PYM9WewhGCVTTU2YACc0oGmKoKz7Q7boWxTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA5irE8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA5irE8V"
Received: by smtp.kernel.org (Postfix)
	id 1E5121F000C5; Thu, 15 Oct 2026 23:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E101F000C4;
	Thu, 15 Oct 2026 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106425;
	bh=sQM0oM7qTtIySzVowfNnTBkGCaty/aCSvPmrVBHj/80=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BA5irE8Vevs8hFCdUoc06CPYLiW+9JH335Qrl5NoyAWYxJDRNravpZOzFAMB1+K2i
	 wvlNRFPIxAIRl1+I+BQ5HPt1cAFi/QecEsmCHrJzE7A1X0cmAFLY85NGXdgLv3/5lt
	 GiCowOROEkrw07TW9qkra/E9a8+nU+0krzNApq2rJ6U5ix47WylW2tnSVhrsTOuJWp
	 OK7fM561KwwUNZiRPYGyOcvIZ5FthDAGlFW3At5c/7lkLcRol5swtIpLVNEdNqZ5d3
	 On2pbdBvrv5tFLSkEsBHnhrnnbIZ+XKwxoVV9mvnoF2yaziBqUB4pavomUUxitWEBq
	 SLrVlL663qe9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14743808209;
	Thu, 15 Oct 2026 23:20:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for
 v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210642351.4150336.9497382307146020982.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:23 +0000
References: 
 <1a070f5c87b1e4e765a7e481b53f66242a9753ec.camel@codeconstruct.com.au>
In-Reply-To: 
 <1a070f5c87b1e4e765a7e481b53f66242a9753ec.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 09 Oct 2026 11:00:35 +1030 you wrote:
> Hello SoC maintainers,
> 
> I've been absorbed with efforts outside of the kernel recently so
> there's not much activity in the BMC tree this time around. This is the
> only PR I plan to send for v7.4. That said, there are are many patches
> on the list that need attention. I will get to them.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton: First batch of arm64 devicetree changes for v7.4
    https://git.kernel.org/soc/soc/c/09a421caff90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


