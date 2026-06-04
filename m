Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DDA381AFB
	for <soc@lists.linux.dev>; Thu,  4 Jun 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565266; cv=pass; b=skZwK36uiz9+Y/lE1+FJMmS0yr0XPZT4O+VXa/0d1rbeHM3U54oQnx2lFmzqnO93KHkRTgS6uG5p6Fhic62oLEN7qsexOpp4OR+Oyu2kx1m/28cV+y43iincXhcWgd+PDJXaXl/HkvV9hgA4r7Ihskf5JNYQV4R/8NELw2DTjTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565266; c=relaxed/simple;
	bh=q8c4zbHii6t+x68azYK7KTMzCgmmnVPFCmjaUCpItlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A++9aNs3glzaPy5vmwBrcmfoHcG6aY/5kWDz8zkpQHhuaATGe/BV98or51KHnD//4pT4oHPtmkMKncLYnYJKygrz8lhVNkySOwJ2swPi5O55rTVfPxSkfhLmaTO1VHakNg3PceEz1cLu4HLU6V/Pw8oCkCWIJL+P6gpdIAj/44o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0TD4G51d; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0TD4G51d"
Received: by smtp.kernel.org (Postfix)
	id E81321F00893; Thu,  4 Jun 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780565263;
	b=Ci4aQQXgGt3x6At+Xxlc7KuDclQlaiD/dP2yHUPltNLBblR0efeU1xBfzH/Bfk5RsTza
	 M7vGtBR0PWm0tmO16JP1lpIV07H1CdhkjPSEKt90RlTfM/OfWfgcVlqarp0x4ygw9b+MJ
	 MznmwrGpfgbOsCEzIXU9HhGTlHkmdIw1FnA8wxuMBKifnEop59qwhLgchCO6XydC7zwo/
	 UCjyVEMunOBfRRUmCa2ofWk45ea1/JYy+riOv6e0uEPc+ZxaMt6Y2t+WPlTu/gjVM2eLb
	 Aw1xNZ4zSW3PZwXt4iTfshNK3RaOZMA2N5Y67l7Q8v78v9nXBiKZ5p0xzlOt7/W77+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780565263;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=+JPtmIpKJxkCCHhFEXHwMh6xG5uc6TqOuOvNrIN6iU0=;
	b=Y2qmm2ROMFbV2Q1w/3XyeitgrP3yFcsOq7duSV0NLVejhNhWG0NLWjYjQ9jsGOSWEprj
	 fkH19Frv4CudDRCSYhO9doatMbyt6EgP6MGM2nKrStheQ9HpkLs0xTWThQxpgLLRmfRU7
	 VW8E8I0bJVMXKV4ldghYho06vXv/Q0bUHjMaZ52rV4BBlVrJcVP9MgFIBVj3G2c8f8m1K
	 oKQ2iecZLnA56UfKtARJ2vHzK8m8TAI/pUEDG6+sH1zSTDuw1g7i+v+T2WECjxOVBkFjN
	 N1H6tfGH9LHBBg45j26tCO1BmGaplYLrB112PaXKi3i47+I/qXmdlBCL4XbWfC2v+Gg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0TD4G51d;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CE6C1F00898;
	Thu,  4 Jun 2026 09:27:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=0TD4G51d
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8CE6C1F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=+JPtmIpKJxkCCHhFEXHwMh6xG5uc6TqOuOvNrIN6iU0=; b=0TD4G51dpPFZcOXT6rd4xHwOJe
	6bN/A4XEMo3hrWK7YcH7kDTvJiibpCuKWtLMUnwbsWA02kDJ+4D/oFdX1lmkCY6JZPvnFRDHD/Rbe
	JJS/ieamJWI9EFIvTzG1l0uHJyTSMTGbqVnf9NkFfb3TtecI2W76uRl7xgt+vne8EwL0DRcohm1P7
	vmjo9eDBTZhPXsLvbshVigoJTLVg4zty3kTb6PNESl8YLQnCk+WTdQdVPfZPLsBj460ZcKVDI9yy9
	7wZRGS1cPrQfZazsToBukBxlaGro9OyvIIc0t5mTSXlD6k4knlsqpwO2fi6k+68KHpOx+Oiv9kBu8
	gA2d9YtQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip arm32 fix for the current 7.1-rc
Date: Thu, 04 Jun 2026 11:27:34 +0200
Message-ID: <4474108.o2A3GueYyp@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

please find a below a fix for an issue in the ARCH code for 32bit
Rockchip SoCs, that appeared with 7.1-rc .


Please pull

Thanks
Heiko


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-arm32fixe

for you to fetch changes up to 6fc5666aa576c6c3bec256fa31d72653210319d5:

  ARM: rockchip: keep reset control around (2026-05-26 23:20:39 +0200)

----------------------------------------------------------------
A change in 7.1-rc improved the general handling for reset controllers
using SRCU, but at the same time broke really early users before work-
queues are available.

So adapt the SMP bringup to keep the core-resets around, instead
of aquiring/releasing them on ever SMP action.

----------------------------------------------------------------
Heiko Stuebner (1):
      ARM: rockchip: keep reset control around

 arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)



