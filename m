Return-Path: <SRS0=Ovpt=NA=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FD7C4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 13:16:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4FF8B6103B; Mon,  9 Aug 2021 13:16:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF0360F93;
	Mon,  9 Aug 2021 13:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF0360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 179DGonv005127;
	Mon, 9 Aug 2021 08:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628515010;
	bh=fUZ0tTf5iMFX3R8HzD3C0My5lq61Sw0xcf1hwlxWfQM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zPlfXqEln3B4EdxUE06FnhYN5c0CaJRJaotvCpUpf8LmmZgTNDtZwBLpZ3jzq6N/Q
	 DDlFYXe7vH36Fe/b+GP/eCm1IdbhD7eT01yLdnBn1GVkO5cY0fbZZendMCdvDooztp
	 TuXWMNliCe+qradd/xmjHeIs1txHl8IPnG0SHzLY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 179DGoA8110694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Aug 2021 08:16:50 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 9 Aug
 2021 08:15:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 9 Aug 2021 08:15:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 179DFFEG061253;
	Mon, 9 Aug 2021 08:15:15 -0500
Date: Mon, 9 Aug 2021 08:15:15 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: arm64: dts: TI K3 updates for v5.15
Message-ID: <20210809131515.akz2k5kvuhzmcavk@jasmine>
References: <20210809130631.pfvntcichsyeekbo@festive>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210809130631.pfvntcichsyeekbo@festive>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 08:06-20210809, Nishanth Menon wrote:
> Hi Arnd and Olof,
> 
> Here is the DT updates for 5.15. Just minor additions this time around.
> 



Ooops.. missed the [GIT PULL] prefix :(

Let me know if you folks want me to resend.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
