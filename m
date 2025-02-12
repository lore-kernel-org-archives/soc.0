Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8739D20B1F3
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359751; cv=none; b=DWqPQCuwr7U0fJoqBj12zw3CO5o2ttddHC3PL9aorMjwA8yGXdLGmsrN0l2vzRbjRmkxFSQzeYluP2TyWzjPrfcsltho+Q4nnC7/jCKsDEpSNU5FMvVH0avVMAZhdMDyi0xWis3D7ZKTb4MbZCO9qUJH0Uj0u3Wt8JGRWe9uFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359751; c=relaxed/simple;
	bh=5TdzermAcWjbhypz8LhaRMGLr/vZLtFdrYPC7ueEmvs=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCutXrRwh9GpwgoZ8Nd+WmLCwEYiTvByc08v7vfXYbLM8gS07XzZ42TgnVUUY4K5LbEZqqzxXdIPkIj10zCTNHastVK5bxQ2JpprG3tGTd5XncTTvNZi8Tq0jELFWTc6Y+iXqyb15JoEL8D36YvWWVwefey4MVMxWOA/CQj5LMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w7LeVGsS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w7LeVGsS"
Received: by smtp.kernel.org (Postfix)
	id 0BEBDC4CEE6; Wed, 12 Feb 2025 11:29:10 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1F87C4CEDF;
	Wed, 12 Feb 2025 11:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1F87C4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CBSwmb517174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Feb 2025 05:28:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739359738;
	bh=C51Vw6EdNVniNG41V7LhTSrg7eW06Bz8eJBE8EVbadY=;
	h=Date:From:To:CC:Subject;
	b=w7LeVGsSvss9bMhGYL3IUIHV1719PQQeOwqpeloNcrL7uwsXckmgLF8aRGUpIhRWm
	 vrXYAcglzmFjOcxTUtDkOQsknBJQ9HsIqobULdnbUmjBh/LNCBr1tHMWi+tH44wGeB
	 VzAqFubKIXUTlgDTb8USTDFsiWvwE6uI8T5eHnOI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CBSwsE033857;
	Wed, 12 Feb 2025 05:28:58 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 05:28:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 05:28:57 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CBSvmO075174;
	Wed, 12 Feb 2025 05:28:57 -0600
Date: Wed, 12 Feb 2025 05:28:57 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: SoC <soc@kernel.org>, <arm@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tero
 Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth
 Menon <nm@ti.com>
Subject: [GIT PULL] arm64: defconfig: Fixes for TI K3 platforms for v6.14-rc1
Message-ID: <20250212112857.pm6ptaqbx545qnv7@eternity>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi SoC maintainers,

Please pull the following which is part of the fixes required to
restore the behavior of all TI K3 platforms.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-fixes-for-v6.14

for you to fetch changes up to c7691aec5e991cec9c5c5fdab08c24856a1fc56f:

  arm64: defconfig: Enable TISCI Interrupt Router and Aggregator (2025-02-06 09:10:24 +0530)

----------------------------------------------------------------
TI K3 defconfig fixes for v6.14

- Enable TISCI Interrupt Router, Interrupt Aggregator and related drivers.

----------------------------------------------------------------
Vaishnav Achath (1):
      arm64: defconfig: Enable TISCI Interrupt Router and Aggregator

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
