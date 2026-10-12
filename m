Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9681244C664
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 08:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794409; cv=none; b=HTC/maVazy8gFjRu1AnOiDfo3+LdbI0UbIe++zgdQhHTsL8l6HWW2knqVQk546sIUWpHBWc9b4NxWoG4KeZk8yW2rbZwVvtsJ19lcSyGNLgettpzhIzOknDs0Rh/6TWIaO+I3Vsi4LH8xGpKYLY1BUoCku/KULlstoKRWemf+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794409; c=relaxed/simple;
	bh=021CLJtPZrQFDVVNSqXTevEP6zbYh2riPf1CWOFVofU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TirG7NHY/4uLQuJPSMsnEBItV0OQcVG9sEmCf4VfLVbnXWUyxk3EZY8ODwdwf5JsJn2bTR0dxI4elU2Joqvb3j7Da930x8ixVbW3sIUnqMn/cJQYa78J6A1wb4gzC6pGYt0Nx2D/rvtQqwQIyRWjZ6aGqzVulKVcqLfov4ey4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kV+x1A1V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kV+x1A1V"
Received: by smtp.kernel.org (Postfix)
	id 583881F0089C; Mon, 12 Oct 2026 08:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420711F0089B;
	Mon, 12 Oct 2026 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794408;
	bh=RtIVADCrzRMH30ltqQdiQpslbSX6fxb6LQwV+f4R+ew=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kV+x1A1Vyh1R5turVRtEZiBnh0GFAw9/mMj9WcJoFvMMUn+iKEJgpAVzS8cnn+qdf
	 QfDDCfMIfesFgMENhfetDemW9WHO1/1HmRbqtrV3flYYCf1hAvMJUl5OcauNEDpwLP
	 +fhHa16hU6+ksl8LFKnF6Pso8Ct3F84jdy4/G6XTzPXSBb5//KByDzOAUoOWZ9SLv7
	 BPZ0w8/2r+l4jWGmbg1EEK5uXXyUvfvzKPDfnF+y5hvUWnNmYYyuy0Oy8D+1GHfK68
	 m9etN61afH5uVpvjiLIibBiQIfHd+eIIhDd+8gRbvGN1qqb672Smx9G3sRy2eYVm6k
	 zflGywT89SSzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2453811A4C;
	Mon, 12 Oct 2026 08:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179179440676.3278488.17600917656238311164.git-patchwork-notify@kernel.org>
Date: Mon, 12 Oct 2026 08:40:06 +0000
References: <20261009061034.29475-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20261009061034.29475-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Oct 2026 09:10:34 +0300 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 fixes for v7.3
    https://git.kernel.org/soc/soc/c/59f522f5a0ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


