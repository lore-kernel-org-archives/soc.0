Return-Path: <SRS0=oGBH=ME=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09039C10F1A
	for <soc@archiver.kernel.org>; Wed,  1 May 2024 12:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3515C4AF14; Wed,  1 May 2024 12:47:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C11AFC113CC;
	Wed,  1 May 2024 12:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C11AFC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 441Ckxqp093699;
	Wed, 1 May 2024 07:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714567619;
	bh=sVQNjTB3YsNS9qiey7NxwbY5ofBo97tqC1wJrppDR4E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NIM6nKvnhHUtp2sWHMGEgbdIV7NroDKbqwAwC7FxdL2TNC4oMgbacdprW9P1wXsm3
	 HpNl/XsYzbyjf2+GDZyVUCyZuUx5Dx6SUDQjDThIleEPCYPBME29l5wS/lAslkH4W0
	 sHZo6NF2ml+uB4z9GQs3RLYV0a97PzjJ5mSP7Zl0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 441Ckx7J028170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 May 2024 07:46:59 -0500
Received: from lewvowa01.ent.ti.com (10.180.75.79) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 May 2024 07:46:59 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by lewvowa01.ent.ti.com
 (10.180.75.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 1 May
 2024 07:46:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 May 2024 07:46:59 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 441Ckxsv028787;
	Wed, 1 May 2024 07:46:59 -0500
Date: Wed, 1 May 2024 07:46:59 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Arnd <arnd@arndb.de>, Olof <olof@lixom.net>, SoC <soc@kernel.org>
CC: <arm@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Tony Lindgren" <tony@atomide.com>
Subject: Re: [GIT PULL 2/3] ARM: dts: ti: keystone: Updates for v6.9
Message-ID: <20240501124659.vmvl2ahad4nrsbbc@sizable>
References: <20240501124309.3cj5b3gjf3cpimut@outsell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240501124309.3cj5b3gjf3cpimut@outsell>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Sigh.. The $subject should have stated v6.10 instead of v6.9 Here.
Apologies on the mixup.

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
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keystone-dt-for-v6.10
> 
> for you to fetch changes up to 60242b20fe784ef9142050be8b68bd85e94be557:
> 
>   dt-bindings: arm: keystone: Remove ti,system-reboot-controller property (2024-04-09 11:05:19 -0500)
> 
> ----------------------------------------------------------------
> Keystone2 device tree updates for v6.10
> 
> Generic Cleanups/Fixes:
> -  Remove custom ti,system-reboot-controller property
> 
> ----------------------------------------------------------------
> Andrew Davis (2):
>       ARM: dts: ti: keystone: k2g: Remove ti,system-reboot-controller property
>       dt-bindings: arm: keystone: Remove ti,system-reboot-controller property
> 
>  Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 5 -----
>  arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi            | 5 -----
>  2 files changed, 10 deletions(-)
> 
> -- 
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D



-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
