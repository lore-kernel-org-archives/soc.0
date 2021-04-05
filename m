Return-Path: <SRS0=X0hK=JC=ti.com=nm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6358EC433B4
	for <soc@archiver.kernel.org>; Mon,  5 Apr 2021 15:51:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3017F613B1; Mon,  5 Apr 2021 15:51:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFFD61242;
	Mon,  5 Apr 2021 15:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAFFD61242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nm@ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135FpAd4113650;
	Mon, 5 Apr 2021 10:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617637870;
	bh=GX0tEHjw8s50vVGDmsL1wUntCABzM8dGJRzzWDzrEYk=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=Q5xiqwOKOfoVqMT8/RldvqVzSRaVrZAz0g0roljOXx4ZpsDo6J9eU6CWNIPe9rm1x
	 7u0E3szGZsuUt3FCYpATi9xXbX7eYlfe49FJoSjH05T7OWk0Z882n48g2L8pnH4DCO
	 QRpdbIsIoBCrh75+728HAli2qTaJSzcPHBHv7xLM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135FpAr9064031
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Apr 2021 10:51:10 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 10:51:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Apr 2021 10:51:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 135FpAqA044499;
	Mon, 5 Apr 2021 10:51:10 -0500
Date: Mon, 5 Apr 2021 10:51:10 -0500
From: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        <arm@kernel.org>, <soc@kernel.org>
Subject: Re: [GIT PULL] arm64: dts: TI K3 updates for v5.13
Message-ID: <20210405155110.adyjamcl4veq7kxx@unquote>
References: <20210405154935.4mey4ed2ukfve62q@september>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210405154935.4mey4ed2ukfve62q@september>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 10:49-20210405, Nishanth Menon wrote:
> Hi,
> 
> Please pull the following device tree changes for v5.13 cycle.


Gaah... I have to redo this email again, Cant believe I missed to cc
list :( Grrr.. Apologies on the spam.


		[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
