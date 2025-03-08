Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21421E8352
	for <soc@lists.linux.dev>; Sat,  8 Mar 2025 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458157; cv=none; b=epd24GJHiiHqsgHL4zZquNoIhUC6U+T44CPro/tnv4nVLYEMBrggHEkzEYcBwg2ifWW8b9IYTyzBTsOvdCpprVR+NzDEGwiqtRwmkHePnJwBSqdePMP0iT9cZ1tKl6J4KEgP99Ig2V7kiyqIB5gXSsc+FKm/tDRBoGb6pZB5uuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458157; c=relaxed/simple;
	bh=s8Bxpo68cM6K7yq1fS33Yck1iDM8jeS5lN1SfwzDdb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MdPaUd8fddyZ3t2Fw/Ztg9yZ5gHJPqz7h8hhB3Gng2nYeA58cZ0RUARnQ7BRXh9AC8dGrjUBRm3UkVI02x7MolvuMyEUjcr9uv/JM6MsxaFP9CxuprpnJnXZz+Aplz+oeXwS8GlskykeUW1ATeI6orTyy9V/bn44WEhOm1fHCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xeofRJmu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xeofRJmu"
Received: by smtp.kernel.org (Postfix)
	id B532CC4CEE8; Sat,  8 Mar 2025 18:22:37 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A71AC4CEE0;
	Sat,  8 Mar 2025 18:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A71AC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2+NrzuFCdvnACFuokn4CvLf7895pJLH7rN7vroqZjKg=; b=xeofRJmuaHiuOdrvK4mjZsWKWW
	ab94xaSGIsS8txIctODOXck4L8YBpEDf1pVW87MKCTh0E/kqQNSAnNi27C+ImygkUFQp0WyQPzuFl
	5AlrpX/MrRfCYOhaPebkSmiOqxMSe7iWyxV1O58Lqc+3MKwajpT2VPSqsQpecGpsS6EXM6FC+Kj64
	jjiTi5v4FEitN0+8Cvy385DyuGuo+nG7a5SGG23W2k/hDBx61xeexXscyd1Xf9HMzBBDykdHLWf6k
	V5ThFp+r1V9Ipb0sGE+/FYtFMdd4I3MGCAleGqnEtzuP6QKk0ebzcuRXjbMmjuwzSBWGmsomVf96M
	ybYIqNOw==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqyok-00050e-J0; Sat, 08 Mar 2025 19:22:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.15 #1
Date: Sat, 08 Mar 2025 19:22:34 +0100
Message-ID: <3415370.aeNJFYEL58@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.15-rockchip-defconfig64-1

for you to fetch changes up to 97d8fe4b7722104b9abdb9cbeb0e884f864c6477:

  arm64: defconfig: Enable Synopsys HDMI receiver (2025-03-06 14:08:26 +0100)

----------------------------------------------------------------
Enabling of the HDMI-receiver driver and new UFS storage driver.

----------------------------------------------------------------
Sebastian Reichel (1):
      arm64: defconfig: Enable Synopsys HDMI receiver

Shawn Lin (1):
      arm64: defconfig: Enable Rockchip UFS host driver

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)



