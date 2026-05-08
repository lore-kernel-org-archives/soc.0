Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF23803DB
	for <soc@lists.linux.dev>; Fri,  8 May 2026 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247655; cv=none; b=abpwAa5jpMfUjxLEaNjSdhMyt00jJDuiyFUxHBHPZAV2TBfgZxXVESKt1tNWqKXDBAgjXt7dDahX2iLoAgJLevgO13zOW5Ft5ycAGPotYHMWafi6M391LNcb5Uk0bcjCFDs9We7xfwNcAHMZx0Cswk+iCoGDgfUb4fZHo3Vcpv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247655; c=relaxed/simple;
	bh=fN06/wOg3LlQ7yvxlRPUupYHXY3OYa3PE4qU5MNqWfI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=k8g1B1ocjpxVr4Qnc8JEr3EsLdzuL6259w8ul9iPOBae7/yx8Qn8QzW3LF1R3THKTgExnt3tDXjz7za9FZKDyhDw1SUSxBLUMwBl0jdQjeElJ1XKwGAeg/FeWNryhAxFzQ1D4uyeK+sbMFr9/5vC12WELkMg8AJD6hfzsIn3GMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q9VRVXu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q9VRVXu5"
Received: by smtp.kernel.org (Postfix)
	id B34AFC2BCB8; Fri,  8 May 2026 13:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D648C2BCB0;
	Fri,  8 May 2026 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247655;
	bh=fN06/wOg3LlQ7yvxlRPUupYHXY3OYa3PE4qU5MNqWfI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q9VRVXu5PlLwf6CzsW+lQPJTXsAC8rKr3rPY+kr4dxO9jG+zpNGqu17apKB3oMuTe
	 vTuhLPQrnOydTVrRyAtmvTUzp8KEHcAjKh6O8xyJbhmz/O9lgyqfH0IZtb9JxnNKKc
	 +A2PoD2uXUAOgrzRh6V8L93PYWOI2x2VtP+MwfJIsAzabZPfJLHe+bVDHHWV9Xg0s5
	 eoVqIkXwQ6G8ezO7CIGdZ9fkiEYhSOkQUo7PSJjyx65zfCcVj4agA+KzLBw11ZX87k
	 bH2RBfI3rwH0qooPXN4I+iEL/0FpcSWlwly4z1tD8lRnmyfRXpIhklxKPYNVdYYfU9
	 DbnqeNO2Vc2wA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEF5381195E;
	Fri,  8 May 2026 13:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V devicetrees fixes for v7.1-rc3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177824760405.686902.10450170551433942796.git-patchwork-notify@kernel.org>
Date: Fri, 08 May 2026 13:40:04 +0000
References: <20260507-blush-secluding-aae99d404f6f@spud>
In-Reply-To: <20260507-blush-secluding-aae99d404f6f@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 May 2026 18:54:08 +0100 you wrote:
> Hey folks,
> 
> Please pull two relatively minor fixes.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V devicetrees fixes for v7.1-rc3
    https://git.kernel.org/soc/soc/c/1fcf4149418e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


