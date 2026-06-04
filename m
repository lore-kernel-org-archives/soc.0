Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA3425CF2
	for <soc@lists.linux.dev>; Thu,  4 Jun 2026 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574405; cv=none; b=W8fujrETWO8sNqYFzV7t3/TfABmZW8hGxx3KRsGAPlzrbQfmg0vjsDYezcCkdlKf/92oUaVRAtS2wnZSQkbVsIyRVCv/sN+rPvLfyn55BgQK0KLcXbg06HMCVzr9SqHhhXRG3FljxWXpI89vjCU2Gl4wWjckvXm3IN3MAOKasXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574405; c=relaxed/simple;
	bh=i+M/NXX0Jw1UTnh0SaxVcPg0Ql5vk28KtWaW/tKugjw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=I0NlXx//4PW5rhiwyOuy0Zn1X2/ylzASbdxbcXV02H/so/4gcyBjDKfz+FP9op6PfSP9mm3bsvMWyHZMpCUVjoffJ22JEPXK6XT0TPYr+L0AapXKcxo0RJ4r9T0A4DW040rp14WHNmeZKIQz+MtKIuJDy+vzBYLVDlY7bfaHUqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGamfgIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGamfgIp"
Received: by smtp.kernel.org (Postfix)
	id 86DFC1F00898; Thu,  4 Jun 2026 12:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711221F00893
	for <soc@kernel.org>; Thu,  4 Jun 2026 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780574404;
	bh=lkAnZ8O7srLilk+iwuDJXNZz1fZB79ktY4BESiaCfWs=;
	h=Subject:From:Date:To:Cc;
	b=iGamfgIpTiWk4KwSQq/nJO6fQHR9AQYMAjaK+4CQg3afhzVJizBvW5g6DY3ymFyJU
	 1ZHHTjcVa5FstD8o5rZNCI0MvQF5+Xa6sY1MQHiy1rXMR3Es6q3zA/T7mglDTMfz9x
	 m7OvoJKVzYXoP1Mr6GVB7u/7/PfOtMh9b1V+Uog5pQOen4DSuFvlNr35XddGNdZYuU
	 gFRHczD8/5Cd5RXfW61hvRKAlJTmn/pSse4Z+BvzzCErOLj3BRExDwqMOWoQPXavaq
	 o3DxQgOzamUrZLuHQv4GK1T3OPaXubTgOD1SHNkIBhwutpoBkm4jesei9rHYXa2KXi
	 kPqCm2A5KSjHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9614C3930936;
	Thu,  4 Jun 2026 12:00:06 +0000 (UTC)
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
 <178057440514.2392999.3449368288377249400.git-patchwork-summary@kernel.org>
Date: Thu, 04 Jun 2026 12:00:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: socfpga: updates for v7.2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Linus Walleij <linusw@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103426
  Lore link: https://lore.kernel.org/r/20260530214027.161945-1-dinguyen@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


