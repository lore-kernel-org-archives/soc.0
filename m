Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C61EB1A6
	for <soc@lists.linux.dev>; Thu, 20 Feb 2025 21:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087925; cv=none; b=XW41KhegZxn73l6rHaAm5txgKjf7vwYPCEefVm1mcq7omEeJ/Fj8f4CePCid/fcjJEsPMwy/ElYr9b94im2zyQjzpby5glMzvt1FmDCSrJDrUVs6AeKIEyQ1mW93Vl6yygTrZROOgiYn8NoEMSO16DJurtfLZQcxuJykZFuUZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087925; c=relaxed/simple;
	bh=pypcEXaOmg93hl4zr03h1GkuPh0ysAad8SOzMfhmxh4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=BZycEB3693C95tr/1JTybViMlfrdEY5TGLZwkWhV+x7aZCfHtu7RsLnfGnXtKBLtOE+nNK8m7sdJPKjFGZLV6ujsNdqvS/SfrQWLD+V1sBw+IyUJGCiueBZ2dUR/PhlkoMPKWW68FsabJxPJmVNIm1QwSrZ+xVKnFbl01Sx9EOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gutiBbG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gutiBbG6"
Received: by smtp.kernel.org (Postfix)
	id 8C085C4CEE3; Thu, 20 Feb 2025 21:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7683AC4CED1
	for <soc@kernel.org>; Thu, 20 Feb 2025 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740087924;
	bh=pypcEXaOmg93hl4zr03h1GkuPh0ysAad8SOzMfhmxh4=;
	h=Subject:From:Date:To:Cc:From;
	b=gutiBbG6jfa9Zw+pT00g9EOfDlSFjudNeMTpcdp9DJefxozB+8TBW+t+b5pnR9uXJ
	 cWg/IXxcboEAJYk0Mh4HfhF/ZCJ1qelKhoijVaaMxbF1SFq/1//RXpV4Dr/LUNn6xK
	 qPz0L9xjtajJxinnchk05EgRVJCXc98t7ALL5zDpwj9RuOL8XWOrGyJRvutfLfRTGE
	 jwvoo6THZg14JddWvIrY8G2W3CQQhk9ibBGLOnduwOl3TFMFouzck5YJgn6wSE7xE/
	 I63HNQlDzYsUS3WJLUZleIf7JD3MVuJXYamo5dooPBMNwybB57WHQphFimGOGaaHb4
	 BKY1S67YFuF5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BC47380CEE2;
	Thu, 20 Feb 2025 21:45:56 +0000 (UTC)
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
 <174008795481.1465804.9424899164028329267.git-patchwork-summary@kernel.org>
Date: Thu, 20 Feb 2025 21:45:54 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [v2] soc: loongson: loongson2_guts: Add check for devm_kstrdup()
  Submitter: Haoxiang Li <haoxiang_li2024@163.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=935888
  Lore link: https://lore.kernel.org/r/20250220081714.2676828-1-haoxiang_li2024@163.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


