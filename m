Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371DBEED8
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841814; cv=none; b=aZMPfjgDFNHoRBwOEIqt3NVUgMieg1TuHFT2hrAWrvPpYCOh/loyCc4N4Vymoa/JuCntffwK4vloUTv70QvnHnBqBolhUeo5nzncF8hM5H/AQuXB7huaNM2BfsBIqPClZw1tETRK3k4j+EGvrlLjDvPboMdetcm07Wc5PLa/HNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841814; c=relaxed/simple;
	bh=dnz+cFtFpcjhrkGJqsbf/OFexKUi8xjl0qY6BA4qp4s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q3aCrCg16U1ZF5C5itBG9/7KBzqvjB/UesFWfBb93+vLZZ9sDcI+02Ygla9PDeXoodGM/NWuDCG/Kj3Me+tJAHVpmgw/RUiGdgHDHXl85fjDY1I+COD9iqalCbXE3CggjbTCbj3pvcAOn55t/kIN39MpvosehFEWe9mXHC1NZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axeHuE+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axeHuE+T"
Received: by smtp.kernel.org (Postfix)
	id 2D6EFC2BC87; Wed, 18 Mar 2026 13:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179D5C19421;
	Wed, 18 Mar 2026 13:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841814;
	bh=dnz+cFtFpcjhrkGJqsbf/OFexKUi8xjl0qY6BA4qp4s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=axeHuE+T2oCO0DGWwRZPeUcL7TeNNIZuB5hdFelgni/dH7jL2yn2qeoRNMCpEnyHT
	 52aXSHgRFo/2SFoyYijMcMDWvLxhQnaK4Uw3IN6fYbZgzPeadlUSrgCk9miDNVLDeK
	 qWY4OmJWBIKRiCPtiJ6k3li58XzKDHMz8DMCnvcKhwkRIHfdgUwvU+XwQ5etDV//Op
	 9R76RrorYHdVJd5Dm4kRbHle8ohPhVdonwV7onjcYd9LKUUk3W9w4+RPnW5N5BeSe1
	 KRViWXh/JNxWnAGolw4BgSTWO9NBO4xKREK2JWDEK0tHgLhOusni+wWnzORay3nQdb
	 9XOGKxf+E69VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02C283808200;
	Wed, 18 Mar 2026 13:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177384180553.304324.1096687799908940840.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 13:50:05 +0000
References: <20260317101155.3873122-1-sudeep.holla@kernel.org>
In-Reply-To: <20260317101155.3873122-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Mar 2026 10:11:52 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v7.0
    https://git.kernel.org/soc/soc/c/df3ef89d7ef8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


