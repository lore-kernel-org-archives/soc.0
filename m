Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D962A4EBAE7
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557674; cv=none; b=m8ZWjCVos2LiDiRNfS6pklKI1eW2fERJCmZU6a8Q7vTPt8IUKkVNURBB8XbWniHwwIL68/Kvf0nEA1MYw5xaxnQJ4OsYw0Vkjosl0nibzFD1gRr/qMCVYXgO/ExLhYG7AQ1zYanruvgfgWUT44BkzI6xnyOBLAokkCEDyID6Ses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557674; c=relaxed/simple;
	bh=OrM6j+GMveEfYl/3xEi2dsJInKoJjBEnH80P2W5Q1QE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ubp+fNTcdAz2JifpDH0lbdRkC+CwDsg795pIeO121lCA5cIYFq1LK4JumMOU4NdMOC9TwyAi9/VvFWfGuZxdCiL2bFzQPtBqTWCkkm/Pd4X/QabofI76cr/DXe2HqY3/iuMRShOE1LfNA5NTecJD4BPe7R2BNGGY5HrfHB2ggHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMn/18WI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMn/18WI"
Received: by smtp.kernel.org (Postfix)
	id E47631F00893; Wed, 16 Sep 2026 11:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE6F1F000FF
	for <soc@kernel.org>; Wed, 16 Sep 2026 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557668;
	bh=vgjigfR+WjhE6+LKaTUNZ48DzhMFepxBpML7x1M6o8U=;
	h=Subject:From:Date:To:Cc;
	b=ZMn/18WI4aJ+gK1vnzSUVFC8rXpjMDH539GqXxwNyfhyQk/8yjAt5W1jNQX4O+JYf
	 pOFabTkhKDXNOzFVhQ7gZvgI076cd8tCTddh5npkzjimk4mHKgCeKJrSdbrdcJhPTK
	 7Ga7rE7Y7aBXalVp5eH+cfKdqcXg9DcjIaey/am72rmsOPgYvR5K0FoEpH3WN6J88b
	 wBlhocAGMmwLb1Al70mLc0FvukU4nh8H6is/7WuZwjsRkQICKc4silu/5DlP8opN6W
	 aJDy3TyjgKPAnHH911uwpDtDzuYVMUndltrJqw4S7cvCYHcuAXVIsGAR0GKBI8k4W7
	 4xL8+fiziYI4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C2B539D5FF7;
	Wed, 16 Sep 2026 11:20:04 +0000 (UTC)
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
 <178955760259.2572068.24380564262578935.git-patchwork-summary@kernel.org>
Date: Wed, 16 Sep 2026 11:20:02 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] amlogic ARM64 DT fixes for v7.3-rc
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1166344/
  Lore link: https://lore.kernel.org/r/71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


