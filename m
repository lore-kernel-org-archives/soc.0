Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666303C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106429; cv=none; b=bCrMkU9OZI8HG+gS8dUWqDRS6Wla5BH6gNXoijr/297Wmg6OWURtMy4Sl714PiqkqkzA/ifPaxvjMFFbkbCphFfuapmLA6R9MQXgb5HCEqAJCLLnZMy6/j8p4512zSnvIZTTB+NjNR6a6ZhHKYaOoHvZ0wTT37L2X1XF39O5RpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106429; c=relaxed/simple;
	bh=lRLWHD1PlKLU/2wxs5geX5sXJgox9DnybaAVwuKx51s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=m91UnATgG25Bwe7szitnOh+DNehW49FaA4OE3k9VI/rUncg84ywbFW/FJ+/+RJ3PJHRgIPnSNijFCvkqOZsd6yo5m1eXbrYkNI9lRHI39bSYSeSgSkWz9arSNdvTXh0pwGYaSAfDVuYUw/E3At2DxnZQbhtnRvhCgfZ87yqvLYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2lCpJFT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2lCpJFT"
Received: by smtp.kernel.org (Postfix)
	id 1C9291F000C5; Thu, 15 Oct 2026 23:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0619F1F000C4;
	Thu, 15 Oct 2026 23:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106428;
	bh=wq5od0vUwOp+d2FPa00D+ebIe+wTN96aA2ZQdKxrJIU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=f2lCpJFTl/GETlUmXSxj+ork55sNgeqon7nHk4iVkpUTToEpW1LFJsqmSAJbOWX9C
	 1jwyrTfqDaVeHANcovOYFdXkMR2EVi1MWnegm4jbOIidLFytx29/4Z7qu/7uBXxbdf
	 ErpV1JIkLLuHVznRQcCn6yFtg22vuaENEwmKx2Sc7yYJ2D5wf5QW7Q0ISxu4qdCKMF
	 Dmkk7GApDYmpO4c5jNnczKMVy+uSJivij2EIpyrFJhJGlCWqrvEt6GJSDH1VUAGzSS
	 3sic0FH4maSYJ3Dv7p/9OqVIDLqP8I7SXYBv63tesR0tyzJCkyVTIBSfxmHOKHpw7a
	 TY2zDhIIv35Vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14123808209;
	Thu, 15 Oct 2026 23:20:27 +0000 (UTC)
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
 <179210642651.4150336.3624809629147739053.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:26 +0000
References: <cover.1790939711.git.geert+renesas@glider.be>
In-Reply-To: <cover.1790939711.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

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
    (no matching commit)
  - [GIT,PULL,2/2] Renesas DTS updates for v7.4 (take two)
    https://git.kernel.org/soc/soc/c/fd4bcf8d28e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


