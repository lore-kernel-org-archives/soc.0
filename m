Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F134214F
	for <soc@lists.linux.dev>; Sat, 14 Mar 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773513685; cv=none; b=S5qfI/p9jgXqW3NviwXwuBqOHpXhlXUjWh7au5wpNsqZ+dIJZNupG7g5Nq+j1t8u1KwpQRJRYVgJcNlUnFIgWRgYUeqwBCGlFRwDVogAfDY+Lxy0Qpw4aomThcY6RFmBcKJ9/htrHoEx+gm67bZpIthFlt+9s8UkvigL6W2RDPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773513685; c=relaxed/simple;
	bh=NowV5ZKBVly0NLSWd/qqNK9XA4e3fOMD/l2d/YOuZxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FVNoKkDWiU1aMv67N44iqyJQr3HdnurhyryvQqV60ue83cqdF47HC4m4ikvrOegg+xlJtDXSofgdVtMZHCiamPII3VSGOOSlodqy56gU/TOT6yHdEu5pVJ9r6rT+CPZkT1ZgLSv8m/NVQIcpPKvSsZivIOyliWMNa8jubC23Jxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=rqpLy3bf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="rqpLy3bf"
Received: by smtp.kernel.org (Postfix)
	id 3950BC2BC86; Sat, 14 Mar 2026 18:41:25 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18879C116C6;
	Sat, 14 Mar 2026 18:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18879C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=NJgmVqDKyi3M0P5AVrJpUB/6e5CaH26d3M8p3nfhSGg=; b=rqpLy3bfMnxLc4ptzdGEVOx4nS
	3cvmrPOIOQlYhskL7UMTdYondSwDoFwEUgSajZuUeouUBHVNI8qUIE6EtjeroAWaKaMJ4PZM2sQMt
	lih/cWVPxz+92Q55gURNigXMARCkU3EFGSin2A6JBlUW9Dux9Nue6jww7QtL2ZTkrah1njaRTsI1W
	kGwG1f3MZEwg1eeKgn9QSDPFIgniEP7WJRfOv/BpROMU6+NcGzoJhNmwrayYJBrtOe+2iDxrhL9AG
	lf7PgDE1Vz3NsHK1r+xPCCMr2/fQnq7rOFK2fRitltIUX26hc1T1kijIfQ1x0aeGGFTRNAe9IZs2J
	Xdz9442w==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver fixes for 7.0 #1
Date: Sat, 14 Mar 2026 19:41:19 +0100
Message-ID: <4719110.LvFx2qVVIh@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-drvfixes1

for you to fetch changes up to 24ed11ee5bacf9a9aca18fc6b47667c7f38d578b:

  soc: rockchip: grf: Add missing of_node_put() when returning (2026-02-22 23:27:20 +0100)

----------------------------------------------------------------
Fixing a missing of_node_put() call.

----------------------------------------------------------------
Shawn Lin (1):
      soc: rockchip: grf: Add missing of_node_put() when returning

 drivers/soc/rockchip/grf.c | 1 +
 1 file changed, 1 insertion(+)



