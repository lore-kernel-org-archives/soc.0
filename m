Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417F1E1C3B
	for <soc@lists.linux.dev>; Wed, 30 Oct 2024 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730280240; cv=none; b=lrwI9AJZs3imgqr8SakZfJ7/9xeAnhaxm7ygQQXW6EPSjoYPNX+JpuSKRZg6r8lrBNQKZebw5VMrYwRXTU9VavQEiZ8ydFGXmMxC2z2MRbpkhtiWvCK4zK26KIqOY4hZrioqiWHAZywc2Qw7pfxhgNFHqvVXxim762Qireq0h9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730280240; c=relaxed/simple;
	bh=39agN+7fluEn5zSbv1mqaohmS5Rxwg23faBhpcJb9Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c2nEGw9eu3QEl32V+0y0toQGwe0z18RV1/pNgqlWSPj59EpztuSIR9HmAfO5XEX0VWNj9A75knfD+8CTt26tfVGM/BfSUFSQlxxGwYdzXAXMnAZq3Zj2rgCd5tkWZAGukW4zTX2X8FGrmJhwVA+OQW42LICpGW8uQHpDRzEg4bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=KTPms5k8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="KTPms5k8"
Received: by smtp.kernel.org (Postfix)
	id B6E33C4CEE8; Wed, 30 Oct 2024 09:24:00 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CD17C4CEE6;
	Wed, 30 Oct 2024 09:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CD17C4CEE6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Hisw5ieYkqzn1NRZL7F74ibhzAvrAfnC7G8H4VNcj1I=; b=KTPms5k8M8jMZJkCdocaT5J4wk
	NNtPnpxMuiUvqlxZqyMKPGzQcdpldANfZBuUXN3KLKREjmsnoIYnFfUu1esLVPYRR8To1D13BRZbp
	/sgI8ULRQaeSKTko7SR5Qi+UurM9RBQEQH/VMOtuYttQm7fA3m6sTT5xTo3JcRUYR1T0UuaoAd7vj
	pOQ+tE1Fb4jPQLKP/ayS4RJ9sHP58HkuExJssqffErwPML9xOJfMBZWtcPWhXOZsNraqPLB39xR28
	dEjjFSSY4Ai2wDoPGLgagI6q4STcAd+X9Jk+fG5+xf+BaSFRglsOH9KWAUHF8Oq+ZuhnkGt+t7Eyz
	wI3YnyJA==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t64vl-0000lm-Qb; Wed, 30 Oct 2024 10:23:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.13 #1
Date: Wed, 30 Oct 2024 10:23:57 +0100
Message-ID: <4605658.LvFx2qVVIh@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-armsoc/drivers1

for you to fetch changes up to 22e027cc74488dba49f19f943c2da02726261f08:

  dt-bindings: soc: rockchip: add rk3588 mipi dcphy syscon (2024-10-27 21:28:05 +0100)

----------------------------------------------------------------
Compatibles for some additional "General Register Files" syscons

----------------------------------------------------------------
Frank Wang (2):
      dt-bindings: soc: rockchip: add rk3576 vo1-grf syscon
      dt-bindings: soc: rockchip: add rk3576 usb2phy syscon

Heiko Stuebner (1):
      dt-bindings: soc: rockchip: add rk3588 mipi dcphy syscon

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 5 +++++
 1 file changed, 5 insertions(+)



