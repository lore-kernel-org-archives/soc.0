Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5163E1DE2C4
	for <soc@lists.linux.dev>; Tue, 29 Oct 2024 04:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730177613; cv=none; b=DlU8BwMtdga/Oa8wxs3WiqybwMQy5oss4jsGBbum61UNp+82Q909qh+PYwkCf70WqzauqWgTMJQZHEbHEba8F23nRnEiULEcSXDeP7/wOiOb4qR6p7ObhxgYmCmtN4HUJMD+PIbBc4Gg1HWMPJ7wsOpSnQwX4azPgpICWpK6Otc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730177613; c=relaxed/simple;
	bh=xGj/H86fHC9hw4R1XO7QBjGnIBzxHbuHLjbSP/enpmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzN1elWPONgq9UgZI5oq9NbfO/JcZ5/OxyO7ssqTWjN4Euf2jr4GucTAOw4s0amSK3iBAivkZIfzKJ9Wkn4QmhHUDsLGM/sCyAS41eRngfOfsUBmIhyEs6Pf4vlhCr3DfRnNVNRuV7tCgxGR3XEojGKtS7fm2QAqFxFAwflNeL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id DB0F8C4CEE3; Tue, 29 Oct 2024 04:53:32 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5639C4CECD;
	Tue, 29 Oct 2024 04:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5639C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Tue, 29 Oct 2024 12:53:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Jesse Taube <mr.bossman075@gmail.com>, soc@kernel.org
Subject: Include in next: spacemit/linux
Message-ID: <20241029045326-GYA331364@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Please kindly include spacemit/linux tree into the linux-next:

https://github.com/spacemit-com/linux


branch for master: for-next

branch for pending-fixes: fixes

Repo will be use for collecting patches for SpacemiT's SoC
which recently I took over:

https://lore.kernel.org/r/20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org

The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.

Best regards,

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
