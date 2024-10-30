Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0761E2016
	for <soc@lists.linux.dev>; Wed, 30 Oct 2024 09:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730280224; cv=none; b=hw6H7Zvk80P4l+akW6poHoL18tgZrs1Cw9mG7c/zNiBipAu7sBU50vtUv516UW+6yTiJN4pmagvTRqO7NA/a+dWMoZbaOi2KQSU0vkyhjNcSTdWREjbXOIEKDe5gWspYolUCn8TbAer01h/0Sy0XAwnMr1vftm3C0uj7BsRd2wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730280224; c=relaxed/simple;
	bh=FF84dE5+aroYojgc77XHmyK5sAqsoMRKnhf5Qc4wVS0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KKo758PIiEPh5FtVlm1U7oYLrEG9vC1Si7oyM54oYutH3iASRYpAc+iebgqk0Eb101E4x3RMZinffBUd3YwGLx9XXcNTMTgLbXODvSLYRe/pb1aerRavseiWy/a90z0fCRlkRt8WP/inlg+2DFAA4TyNSVXatMSvHqk1Tg1Ig6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qENsQbh9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qENsQbh9"
Received: by smtp.kernel.org (Postfix)
	id ABE8EC4CEE5; Wed, 30 Oct 2024 09:23:43 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC187C4CEE4;
	Wed, 30 Oct 2024 09:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC187C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Uhdou5cD5+0jzF0FGqaV2hlj7IP/eRGRFKnP2xqKfdo=; b=qENsQbh9M1Km9wcDHNUQJXnAZ+
	W0pmHZ+Kz5GzO46RdDRoEdhSunMrO+d0CV2LIyL43PMkGN7aBz2MjH5QPn+nhUHK32KpkGMpWZ/Ii
	fx559e3xIzqH4tQ+AvUnLzmyJCoJ23L8+Cdso9mQ109VuwnHk9djRrOqG5BhjdO5KTRBG9Okx3pWn
	DNjNkSsVYe1gD/ajv2afKdHtiNowmvucMKGl3kPGiVtcGFEciL7GXcx1cGJT7cYc7Z72YFDrT3LHJ
	HP+8GSpCI9UPqYCki97ert7e9g4P9gD/V1uguu9aGO9niGQG0uu8Jd93Oiiz8KMYWnpNGxROOi6zF
	cqLwl3tA==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t64vT-0000ki-6N; Wed, 30 Oct 2024 10:23:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.13 #1
Date: Wed, 30 Oct 2024 10:23:38 +0100
Message-ID: <6096384.lOV4Wx5bFT@phil>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.13-armsoc/dts32-1

for you to fetch changes up to bdb2696ac5786ed3f43520e700347fe2152ea199:

  ARM: dts: rockchip: Add Relfor Saib board (2024-10-14 11:35:50 +0200)

----------------------------------------------------------------
Watchdog for rv1126 and the RV1109-based Relfor Saib board.

----------------------------------------------------------------
Karthikeyan Krishnasamy (5):
      dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt string
      ARM: dts: rockchip: Add watchdog node for RV1126
      dt-bindings: vendor-prefixes: Add Relfor labs
      dt-bindings: arm: rockchip: Add Relfor Saib board
      ARM: dts: rockchip: Add Relfor Saib board

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |   1 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts  | 422 +++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |   8 +
 6 files changed, 439 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts



