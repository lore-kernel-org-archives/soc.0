Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADDF3C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106424; cv=none; b=j3yZoBOvA/N84PHFqb+nK0JJKDAl3h9+meZJp6zJY2n0fWFnf41G9hnnux621FGFlPALe4wpi8ASTy6jY/uAhVMEY07LmAjMlfPVuWmWxplypo40v7rhewDS0ewVoBZDJzEyqp62imysvLQjNVum42gAURdLIFy8xfBWECawMnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106424; c=relaxed/simple;
	bh=GiiEUNvPpBfbn80c+VXPcQ+kgDTcFQxme2VGyuykOuc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gFB1I1/dZSVWIdnxZn6aHVQLn1HdAUQIfNSZrnxdT55xDXtaipiTdpwA/Q75oLQWf2fxNKbz+lmw/33fdvgG9Xl5Vr89DP4XaCg0FBfCNZSoJG+cJVca0hUv/QQddIZ3Rhly8sycjNtM+cHkP9H0AiiMwh5UaVtkLtNADRe6Brc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6dFxHN5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6dFxHN5"
Received: by smtp.kernel.org (Postfix)
	id 96A151F000C5; Thu, 15 Oct 2026 23:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8041C1F000C4;
	Thu, 15 Oct 2026 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106423;
	bh=KL2Y+dtSA5WFH3VDabU28panbJ79k2lxoYCv54jX+Js=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=J6dFxHN5U3SFf3VyyjoWg8cV40jsAD6u36QUdypS6saRZ9OPtUQViLeHzPM0H45rA
	 Q5+ZmzEMYjvHxcfcsPnkihD/+B3FA+PLHVOSUD74zTA7ONNsXeFadaqczsoV63jkF4
	 fe2Pu5pqsxxkASgrsK+u5zdaOn+Iq1k+/2yA3yMyS0WbMbbJt8JTigC6vAGr6OqNka
	 kHzUIIWEvlrWhLnbjTiUZoqRDA+jg8+cJoWAeMiU0c2aCuXUMjcXINZuY/x/B/H3yU
	 9E89fWAuFd1qj/QU42pZonNepRye7+eJFm4MV+6zX4zXUKUl5mwID3v75dtjbv1aJq
	 2GqKWaf0Z3deA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774053808209;
	Thu, 15 Oct 2026 23:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] late Ux500 DTS changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210642201.4150336.16462559533377657753.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:22 +0000
References: 
 <CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com>
In-Reply-To: 
 <CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 6 Oct 2026 00:22:44 +0200 you wrote:
> Hi SoC maintainers,
> 
> The prerequisite DTS and driver changes were applied to
> the power tree two days ago, and this goes along. I hope it's
> not too late for v7.4.
> 
> Please pull it in!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] late Ux500 DTS changes for v7.4
    https://git.kernel.org/soc/soc/c/0d563e86307b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


