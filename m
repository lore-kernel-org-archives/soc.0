Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846AD3CE4B5
	for <soc@lists.linux.dev>; Wed, 15 Jul 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784149233; cv=none; b=e+WiCsRhRAzQ2NaCarEAn8kLDk8RM4fcOARjDtLjEe5GesiXMLFHRQaNV0Tq3pKm+VxMUhE9uBJjaQgnw6mjtFNm/5Gi0j8n++gHNO1AVy6Rgh2TjCDkYE2K8LRJvt1AKrTDEXANHzbfi9jSkc6hVwZ2FHhNcmlbh79o9ucYgBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784149233; c=relaxed/simple;
	bh=oGbVOsU5DA9Areq9CzE6+Vl6EtSs36LqjZRyyVUrVuk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NUi39rVy7y+2+LP9vaLyYl/6wZ6DcH5jmuys8VWFYGR4bH5fS4Bmdcttd0VQX1w29AZgOsMJPOK52PywTMxMVqZqn0mJRtWeIZGJ6tO54MWdC3u2/MddbtdDBz/fP1iR853pc0bwjdsCfNfVyZpmMwt9ZBXqgAj3UQjftLZvdxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYX1zALs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYX1zALs"
Received: by smtp.kernel.org (Postfix)
	id 459B21F00AC4; Wed, 15 Jul 2026 21:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7E81F000E9;
	Wed, 15 Jul 2026 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784149232;
	bh=rnirPEBQ3Mq7ozyGlKlnxErYFaw9v48v32iZgvEFn3g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=nYX1zALsFgu973V3CvJW7OatcEV6f5e6+Qlx7rxinyCPSiqkQ2jAYhb1dyK2A6Y8p
	 9Z4iUlPGkF/s17L5VvtI69lOQ/KUiNIGMthPAuDeH2j/28KMaPgZl+xR6u0+qp3DuX
	 HX6dcvpw15lTpdRN0in4wDPc4V9i3rQjW5k1ErwUXpVhdFdVkP/lmQIErMuoYJP6Ju
	 6UbKG0Eo79mqY6mADrOLcLJaLW9Lj8JnRt4dyEbI+9UFdKGh6nf90ygse5iBdMTFBm
	 n0jO1SFH8WQZtFjo+w1kT4rfifWOuZRI0sSWprWAHQi68jxWJd0CkVFuIWELfpRGfc
	 EU1v2hyVx/hQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19ACE393AFB9;
	Wed, 15 Jul 2026 21:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi/arm_ffa: Fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178414920564.496106.8379717025139245262.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jul 2026 21:00:05 +0000
References: <20260713110538.1819713-1-sudeep.holla@kernel.org>
In-Reply-To: <20260713110538.1819713-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 13 Jul 2026 12:05:36 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi/arm_ffa: Fixes for v7.2
    https://git.kernel.org/soc/soc/c/add11ea55f2d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


