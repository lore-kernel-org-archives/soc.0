Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21EB44E644
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913638; cv=none; b=bQTGFoKPRib0kUeB00ETMAYxBLX7sBBixcFPZtwwBE3Oa0E8Tb1I1l03ilrZixc/DTthiykT77YrciJeoBPQ8OwVk5hPYdpWcvTlBZyAg/YewlkSQF09lZApWy8rnwZWUUXBM8abDIwfZFd/wDQ10rBK55/mtgE5uR03ahhKcvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913638; c=relaxed/simple;
	bh=jLAZHZIJ9JCQx4eHVlCjlo2hfY57TS4VHdSxfzp2cSA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=EyJjw6nmH6s0wdEtVnnSt+91wHQoUwvepjD9qGkZisM+mhSMLGqiHOl/HnJYi4MxE6NQ031Bfd/tv0fn/ixK60iDOxmyvQaQbgKyhzwWyeS6Ydi86DiE6MLeqkCx+kY2FiLxYY7jpoxEFu4W9uK/yXohA7SC3MxlLeX4wJSpwZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llAy/OEC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llAy/OEC"
Received: by smtp.kernel.org (Postfix)
	id B49241F00A3A; Fri, 24 Jul 2026 17:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED931F000E9
	for <soc@kernel.org>; Fri, 24 Jul 2026 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784913636;
	bh=f4nsy8hoSZGzYFrwNIOqO/n7PzMqC42ImGUdibkhdh4=;
	h=Subject:From:Date:To:Cc;
	b=llAy/OEC8Epmc8ldyp8XtOEpyoOEXcBQ25Fxg3N16t+dOeAry4s2ZO5M6l/FD7SDh
	 AWY8f8JN2MBkaoR5hQ737JGUoG2hy/sYYiwG0IbN0kFHb+EzMgqq6rN2s+s+48srD7
	 Pl/F29tlbuy5M5y/ve3AboqmX4I0wI6L0gATMiDNbRyrek+CmH/maR2az0VdB0DaKh
	 d56ROiekqWy0TT+/1d2LDgmMerDMnSLjAyLJ/rqJKVjmomuAkqpaNLcEmXltjdgQtF
	 pP4jaRXNGp80zsHY83THYFpw5yixGZx+gsIrlGYwKohN6lHQ5KC3IHdpe79mIGJzvx
	 cGGHOS2eAjd6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C44A39263AC;
	Fri, 24 Jul 2026 17:20:05 +0000 (UTC)
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
 <178491360374.3243435.15248765651990996727.git-patchwork-summary@kernel.org>
Date: Fri, 24 Jul 2026 17:20:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: sa1100: convert gpio-keys to software nodes
  Submitter: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1122761
  Lore link: https://lore.kernel.org/r/20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com
    Patches: [1/4] gpio: sa1100: register software node for GPIO controller
             [2/4] ARM: sa1100: assabet: convert gpio-keys to use software nodes


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


