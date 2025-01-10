Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB7207E08
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736543292; cv=none; b=QQvlrlReN83DMiHA8/UXVsU/XvzcQJ+HyXtwkOmJZjTyHhj7liC0ZMB2v6m1Q/RILjJjjCfHjKOTKm3PlGMIKgmDPrb6MevzgGQngH2xohnHZ8ittAPlb4DqLHtBQiWBqJXFD60sODREjVOb6E8yKXcImUNO3iItcOZZ862I0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736543292; c=relaxed/simple;
	bh=dhe4XV6yO8lC8/J4jpatyb39pOWiveqqsVxcphUhBl8=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPl8QQ8cyJFaOVhdKYfeTKrLMNCPNTbIuPSnUihyS4w+J9cSDv7sCe7MHvma2MWj2I2ysSFF0+vJef/QYnyYFdYmiLFsW60PCmwRlZIEuhwVz0YioRNO/BSXLWc79xc1/AdLgP3kNy8PpNtA1pbDgIkpKNs6x9fAarWgut5KJjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Jx/GnICQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Jx/GnICQ"
Received: by smtp.kernel.org (Postfix)
	id 25265C4CED6; Fri, 10 Jan 2025 21:08:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E5F6C4CEDD;
	Fri, 10 Jan 2025 21:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E5F6C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL7rZI3170329
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 15:07:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736543273;
	bh=hTJ1sU7QR/6/dibeRrwOw2vrZKkscaaABpNVSnE0JWs=;
	h=Date:From:To:CC:Subject;
	b=Jx/GnICQl0qukuVrTWOODnkRnC3IuDEuMDl9myG2HwFe7auzFV0JJKVvR76s/aHkp
	 zkwtMB6BYkOgKChVjUJ1Q6sINw/dXJmzSrxeqtrGysZgZ51fclkN8dMUWM82582Rjc
	 en3eCJHFifjzXZ68wEMLX4d1V83SxiwOgyYMydc0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AL7r68031132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 15:07:53 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 15:07:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 15:07:53 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AL7r9H018236;
	Fri, 10 Jan 2025 15:07:53 -0600
Date: Fri, 10 Jan 2025 15:07:53 -0600
From: Nishanth Menon <nm@ti.com>
To: Arnd <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: <soc@kernel.org>, <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
Subject: [GIT PULL 1/4] soc: ti: Driver updates for v6.14
Message-ID: <20250110210753.exsx5yxmxpcdn64y@amicably>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-for-v6.14

for you to fetch changes up to 202580b60229345dc2637099f10c8a8857c1fdc2:

  soc: ti: pruss: Fix pruss APIs (2025-01-02 10:37:14 -0600)

----------------------------------------------------------------
TI SoC driver updates for v6.14

- Build fixup when CONFIG_TI_PRUSS is disabled.

----------------------------------------------------------------
MD Danish Anwar (1):
      soc: ti: pruss: Fix pruss APIs

 include/linux/pruss_driver.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
