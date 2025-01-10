Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8B41ACEB8
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 23:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736553413; cv=none; b=biAK87+EfIjwOkb6b9Me61n+BU53HgIAOoPmtUym12flfepdRR/+CQJqxcqKNVZmUXzbOEztnX1ab/IfVtoq2Y29kEejC2dqyZ4DvL77YWRknHF5+tJP3KGeYW+XCX0fZI/9attUirrj/DG5mFdTQufCkFkhGGN0RV9NsxJaNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736553413; c=relaxed/simple;
	bh=H0Z9kM19YzB4YhgbF4jqua+gWr/fH1Jyhve2ujeYeAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eBOaJedCKfmjhqu7LRSCIEcih5LVKgcODcSHBTd2slsTPKO1EcJvUKbFKQCPpS/f4uR15BR+q/ahA35EPuZsO1N1eL5y194SccarHdKwrPS3Q1TPjxzR1yiZk1J8G0FPZIRTM1GxC4TilNq5hNE0ME0MaCpRwnGTSq54ma0+biQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xNsp6Tt6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xNsp6Tt6"
Received: by smtp.kernel.org (Postfix)
	id 1216FC4CEDF; Fri, 10 Jan 2025 23:56:53 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 745E8C4CED6;
	Fri, 10 Jan 2025 23:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 745E8C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zBMw4h5r1DHd9vdVz86pK744fnpBsE1YtwHZmWop23c=; b=xNsp6Tt6ESw6lcgSZTb42kNonk
	UlSTfW2OMXLK1KXKvWgs9qQkDkCUEAA5GpYt5HLIsMKT3HOFyo1e1TN8qVzpz2YRcZ+1CFzWBeyQU
	hS/Bw7+V/wumPz2o80BDEgo6nFd1T0wzLFKvlszMEYj3PzE0U13jsbiEoUn/NXNKFdL/snPiGmRgu
	Im600I3iHhKCXx0UqN1rwn9ULtO8PRtSIqlCMYkY2d4e/jRjiCLbbiX2W1xap8VJDW0N0Bt5hkEIY
	0jMmQr3AX/fxu2sOnoGZuadPctEg4JQSZJktISSKVi/BYYm9wAY/VPCjpbWhlxtRz5kPWA/yTcUmZ
	FIxWYwfQ==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tWOrx-000105-85; Sat, 11 Jan 2025 00:56:49 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.14 #1
Date: Sat, 11 Jan 2025 00:56:46 +0100
Message-ID: <3095859.687JKscXgg@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-defconfig64-1

for you to fetch changes up to 06835ccec2efb71d54a810265e8ef69b1011608e:

  arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI QP (2025-01-10 00:21:25 +0100)

----------------------------------------------------------------
Rockchip DRM extension for the DW-HDMI-QP controller and rfkill-gpio.

----------------------------------------------------------------
Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW HDMI QP

Nicolas Dufresne (1):
      arm64: defconfig: Enable RFKILL GPIO

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)



