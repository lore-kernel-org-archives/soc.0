Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E4207E08
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543292; cv=none; b=U+rFh0wnkFAelSKMhJvk15xAaD7su2+Iogf4pbhvGysiKam9t/NB7sdHiZTnpeydwypi0B0eKjuPvUk/fdOLx7loYOqI7azzUhVUpI9kh7Pl/4zoMsfl2EV8BYsuu1I+sgKHfcL+rNmD7+DfFYuPiFX31ZnZ8IvFFnoh5wMno9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543292; c=relaxed/simple;
	bh=AdzdgmAXlnALT2yqiYSKmAH591OGwWvnkSTknul7ABk=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FJN3mpbjmpl53OfY7RTzSN+dF+TOtTQf9xuqDFyP6sogm8QPmMPo0QQTt3Tl8jL+Ll3zFlsBrOiv5A+CgVm1g1hYPulPFmkbk3m16WbH/0Sx70EigzXIKPaJV70ZiIxPSkryUnOLvCsTwkbh0lRPqVfERFZ3xmwLxl4+QonmITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GJJ5XHpy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GJJ5XHpy"
Received: by smtp.kernel.org (Postfix)
	id 7E01EC4CEDF; Fri, 10 Jan 2025 21:08:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88C72C4CED6;
	Fri, 10 Jan 2025 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88C72C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50AL80RP005498;
	Fri, 10 Jan 2025 15:08:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543280;
	bh=c2vzOiHUmpA75QtQSimbJ3xsOFiWjDLHRAn+S8DaIMY=;
	h=Date:From:To:CC:Subject;
	b=GJJ5XHpyk+zbWJcZrsMrSwJ3lzf6OWRbsafgRoxid54y169EgVGUcjlfh0lqDf4Bx
	 MCFTNPAPCPGV0xaDuFIJJWBEs/i66EdpVVKdYvQy7PoXo1Ps8hrZmoOuUjXFioJnCP
	 Vk9YDLkJkOjNA41EzzoAKuF9gNdQVGrXYqgtZ6jA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL80Mh089692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:08:00 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:07:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:07:59 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL7xf0033690;
	Fri, 10 Jan 2025 15:07:59 -0600
Date: Fri, 10 Jan 2025 15:07:59 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 2/4] arm64: defconfig: Driver updates for TI K3 platforms
 for v6.14
Message-ID: <20250110210759.fd6a3ed7q52zkpnw@rogue>
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

Please pull
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v6.14

for you to fetch changes up to 184caba444cfd4b90231de7d071b9966c115c29f:

  arm64: defconfig: Enable TI K3 M4 remoteproc driver (2025-01-08 09:46:14 -0600)

----------------------------------------------------------------
TI K3 defconfig updates for v6.14

- Enable M4F remote proc support for AM62x based platforms such as
  BeaglePlay, phyboard, verdin, SK etc.

----------------------------------------------------------------
Hari Nagalla (1):
      arm64: defconfig: Enable TI K3 M4 remoteproc driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
