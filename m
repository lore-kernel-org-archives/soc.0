Return-Path: <SRS0=laJX=3W=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB72C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 21:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAA89C433D7; Tue, 22 Nov 2022 21:32:15 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F72CC433D6;
	Tue, 22 Nov 2022 21:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F72CC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AMLW2rm125305;
	Tue, 22 Nov 2022 15:32:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669152722;
	bh=rY02YxqNU3SOwCAnCnuXsADIWM9oy2bHffF9lGaBtpU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nhkFy5gYlPeF7NW6/Yet+6PbGiDeo5dCs6orpeWj6RPKVas9GGBRsgGm2MOQFQQDo
	 pJ8c5W4lbSLn0EVZsiw0cGmYD0W1tRxpUOUQzLqvNGcp9YlBsuX/BsehgkJhyVlE+8
	 x1PYi31He4AiRth8cRtn9IojQw3/Tx+Qr4mJWWZA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AMLW226063220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Nov 2022 15:32:02 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 22
 Nov 2022 15:32:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 22 Nov 2022 15:32:02 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AMLW2Go011269;
	Tue, 22 Nov 2022 15:32:02 -0600
Date: Tue, 22 Nov 2022 15:32:02 -0600
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL 2/4] soc: ti: TI updates for v6.2
Message-ID: <20221122213202.gtrqwc5vsrecdklm@canteen>
References: <20221122190136.avoej5i6zccbcds3@ammonia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221122190136.avoej5i6zccbcds3@ammonia>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 13:01-20221122, Nishanth Menon wrote:
> Hi,
> 
> Please find the TI SoC driver changes for v6.2-rc1 below.
> 

Apologies, I need to drop a few patches and retag the drivers-soc.
Looks like we found a last minute regression[1].

[1] https://lore.kernel.org/all/7ha64iaf6t.fsf@baylibre.com/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
