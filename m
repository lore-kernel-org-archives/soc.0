Return-Path: <SRS0=oGBH=ME=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CD3C4345F
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 12:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B514CC4AF14; Wed,  1 May 2024 12:46:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83A13C113CC;
	Wed,  1 May 2024 12:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83A13C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441CkaMI075050;
	Wed, 1 May 2024 07:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714567596;
	bh=KUVfbo0nuQr8dsfxZADNos1NSoNYG5x48bUxkFbrq4Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fiJTEeXPiB76ZqWofRRoDWlbzr/BAq6pnh1gI1Nig18XFOzD4yAL6td9nDC4UwTQ9
	 AcIFFstB67BHI/IhBOPxIf+BrL0hFexT2Mnxky1ZvjgIUzZAKTKSHxX2HP3rwDJNmb
	 POqBt5RfGR9UfJiKuXo2HqhKuzoqZSZ/A7cJbKxs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441CkaSj035444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 07:46:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 07:46:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 07:46:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441CkZ0M028184;
	Wed, 1 May 2024 07:46:35 -0500
Date: Wed, 1 May 2024 07:46:35 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL 1/3] soc: ti: Driver updates for v6.7
Message-ID: <20240501124635.ufcuolkw4dzybhco@parcel>
References: <20240501124300.i5jzeugdlrlnfg22@undrafted>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240501124300.i5jzeugdlrlnfg22@undrafted>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Sigh.. The $subject should have stated v6.10 instead of v6.7 :(

On 07:43-20240501, Nishanth Menon wrote:
> Hi,
> 
> Please pull:
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driver-soc-for-v6.10
> 
> for you to fetch changes up to ddbf3204f600a4d1f153498f618369fca352ae00:
> 
>   soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer message (2024-04-09 11:11:59 -0500)
> 
> ----------------------------------------------------------------
> TI SoC driver updates for v6.10
> 
> Generic Cleanups/Fixes:
> - wkup_m3_ipc: Minor optimization to send NULL dummy message instead of empty pointer message
> - ti_sci: Register restart handler unconditionally
> 
> ----------------------------------------------------------------
> Andrew Davis (3):
>       firmware: ti_sci: Use devm_register_restart_handler()
>       firmware: ti_sci: Unconditionally register reset handler
>       soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer message
> 
>  drivers/firmware/ti_sci.c    | 24 ++++++------------------
>  drivers/soc/ti/wkup_m3_ipc.c |  7 ++-----
>  2 files changed, 8 insertions(+), 23 deletions(-)
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D



-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
