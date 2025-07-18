Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D218E20
	for <soc@lists.linux.dev>; Fri, 18 Jul 2025 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752872649; cv=none; b=irzin2JIKqPlQ5QMX+yXLhaGUpP8XS5TTJLCktf7AdCZFc5WEMkdBYGUrjL0Ux1k3kaj9/ZrM9IaUk4KwHNnr0J5QOOhq+PBFEiBoFh+9sLUO2yWER5RExnA9NISgPm/5ydsntiKbrBXjLdxxXzMPDjNsmRx1EX11dTP4Sr+1PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752872649; c=relaxed/simple;
	bh=morhi4byYWoBO52VtqQnV59XpfSXgqCSmoIqmYP7jA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gX19PF8BYuu66hMH1rXfUo2DstsRPU7XtwwHXLFGqjKy7yGZZZb2l5oIJa2BREZMNddcP0Yl6eorB0qCUS0vaPjf7dkWzLHJwmza861PkMF92A94p/uUynkA5l/GjLUMqd9d1B/TLbzF/S6c5GRPZZfHYcUvzuw4itlL5yWGA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UEY+Mpyh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UEY+Mpyh"
Received: by smtp.kernel.org (Postfix)
	id A86EBC4CEF0; Fri, 18 Jul 2025 21:04:08 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AC47C4CEEB;
	Fri, 18 Jul 2025 21:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AC47C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=f2W8vtsllrDMKUC5FSQQtnrH0k7J4MAbqURujOPxS58=; b=UEY+MpyhejRlM129BcdUcesf6q
	E8FBgYZZ0PFmeekiyUaIXS4wjqofpvKRDzx7HNyce3YCF6kmqkp08Dh4rVTGrZgnrDQ3/lzYMD/ZF
	yHoeNHIH51dprYqBZb8YulNGvN7Lfg8/WLf/49m9SlWUVORWEarOCFwWA7ckpdrAUMDps7GA9GlPP
	Nskvb1wChQ+Xj2IUoFaKgjse7o9bZLz4A7D1fmLF5KLFQ1v5R2bH4DzPX4woapgb3FJ8FdJVfFyb/
	HM2jRQqoGSs3A83MDLQm+TD0OQX5BOQOn4C2rEvc35Pz/zqM5ptSIfXIocTjsCfe6/ICTSYSJHaCO
	ETiGoJIg==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucsFR-0007Fn-BO; Fri, 18 Jul 2025 23:04:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.17 #1
Date: Fri, 18 Jul 2025 23:04:04 +0200
Message-ID: <9025082.MhkbZ0Pkbq@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-defconfig64-1

for you to fetch changes up to edc4a9d1dc1669e42a35b2bd1b711a5da0e83699:

  arm64: defconfig: enable further Rockchip platform drivers (2025-06-30 11:10:05 +0200)

----------------------------------------------------------------
Enable Rockchip DFI + PM_DEVFREQ_EVENT and RGA modules.

----------------------------------------------------------------
Nicolas Frattaroli (1):
      arm64: defconfig: enable further Rockchip platform drivers

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)



