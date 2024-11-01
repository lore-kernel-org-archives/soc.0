Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51621D279D
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 20:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492425; cv=none; b=Xw4lLBVlzu7lNDikAWY1QEsgoqoKnAFtH1araSA+MNdqaq6xy5DdZVwcvl2BsdQ6GVKGtKuDwUCcrGoG6X8XwpMXfkG36pp8Ggs62R+YgCmdZsOuqOnKM356MPco485IXrGeu3rd93gTO+8ev2KKyexvJnu493SDp+k+yo/f040=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492425; c=relaxed/simple;
	bh=qafWBDsPcnaddiN77pahyevNymc7BHzh4E8Haaxkg3E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=knZumnXweE6cru6cuQ5Z7c1rLc3gF/Bh5QFSYT8dO/WRtlAIWszuqefqSyKAxKcGD4moJgz66AI0CblD8VdDCHosHkfR7znqynQPaCV423twRA54/zqrLFR7LFofEOub6X0EpVsqCYZUe8yozDfmBIPbAC3fozHipzilonYuJKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNWQYbve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNWQYbve"
Received: by smtp.kernel.org (Postfix)
	id 56956C4CED1; Fri,  1 Nov 2024 20:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416F8C4CECD
	for <soc@kernel.org>; Fri,  1 Nov 2024 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492425;
	bh=qafWBDsPcnaddiN77pahyevNymc7BHzh4E8Haaxkg3E=;
	h=Subject:From:Date:To:Cc:From;
	b=eNWQYbvez4XgaEXBeubRHXMtVfN24HL5g9UEmTaiF26mKmT87MWR6KHKD1bBwK+qK
	 bm/HSFqk4vDdR1AhjRc8z6XH6zmM84tjGxlUSC0aKg+9WDJn470uQe6NcnF8+WVP62
	 fPHSP1Za+Sp+fHXUck/zGQIZLPQEU91090j7j0PTbnBa53WisF2JqC0dnPT9ywfhkY
	 eV3NEA8dMwyi0vvxEHszYYwDWtzkIlO27JnvYBW+8Jg7YjKtVnZ8TUPm56uvplUfJy
	 C1BUtxNqLZm8YLueegg42XzJ9kg9tt47h8wO+0k7a26xplspv7Y7sffBjEVp9YLSUP
	 aQx9P+xlX9cHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7782A3AB8A94;
	Fri,  1 Nov 2024 20:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173049243310.2836087.2374387267946584408.git-patchwork-summary@kernel.org>
Date: Fri, 01 Nov 2024 20:20:33 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fix for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905440
  Lore link: https://lore.kernel.org/r/20241101142414.737828-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905449
  Lore link: https://lore.kernel.org/r/20241101143206.738617-1-andersson@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


