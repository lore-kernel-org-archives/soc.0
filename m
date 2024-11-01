Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460901D2718
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492431; cv=none; b=W0jnueoXTr6Tv+mVRprShO5mcj4fKthvor9d6dJh4tF69XdBhEO1FzcC5LcMz2EpxTl8nCHjsrDLLiInKs4RqjB8PfJlW/7E6WNGEpMEmN4uSn6K0QugvvA8NPybUhCgtDR4jxbXjfk0RVOGfHoy4jYuCYI2lRH07aMuExxKAxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492431; c=relaxed/simple;
	bh=zhhGeeToYTifhF5d7vxydfiS8WbuYR1Hi5c+UOzg7ME=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ebYHrNel7sEMRtFvIJkPyKjBFcYqHC/NQNGpRzl2ftRMjA4xlOVntn8ys79lrnQJzJcbTHmp5Ny+2cAOVhBUAa1qX7qxi6UtTo4ZhhYeWxTMVfS6XdDIXMOHanKFDqatkhGyArvo8kFH8W/MBVIQ/0h7gXiktDMQkfhC2AL8Xzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0gg5NAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0gg5NAM"
Received: by smtp.kernel.org (Postfix)
	id E1496C4CED1; Fri,  1 Nov 2024 20:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAAAC4CECD
	for <soc@kernel.org>; Fri,  1 Nov 2024 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492430;
	bh=zhhGeeToYTifhF5d7vxydfiS8WbuYR1Hi5c+UOzg7ME=;
	h=Subject:From:Date:To:Cc:From;
	b=R0gg5NAMPVI6gn5VKaI2N2hsscU6ndV1qG8VBqTTe8eaKmHp3rMqeIlZcPoeHbQzt
	 Zu6z392UUjxig51CLXu0Xy+BptZwx3gBjrbawDPJWlVquHZt1dpka5QyC1raycE2aA
	 eL0OjBD5JUTcdkZl3uSwthaNlV86iVzR7G/ohHtbRjqL3aXX7zcRqKLjGgBkMc73aX
	 FZ543TSAeakHLBDtXTvEjLE8BPL6v3PWyJvJNZBNcZrRxpaG9sy3jtMhu0sgqsrJHL
	 SSXz2b5Ejvpfy1ZYaSHETa0fnt4oqwPFXR7G8fhPaFXo4poRxF+GeNjgnRGUJLKepe
	 /caQlZJl8OvPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 339F73AB8A94;
	Fri,  1 Nov 2024 20:20:40 +0000 (UTC)
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
 <173049243866.2836087.13606734769413601728.git-patchwork-summary@kernel.org>
Date: Fri, 01 Nov 2024 20:20:38 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

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


