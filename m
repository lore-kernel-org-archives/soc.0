Return-Path: <SRS0=EM7Q=LI=codeconstruct.com.au=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3ECC6FD1F
	for <soc@archiver.kernel.org>; Wed,  3 Apr 2024 03:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1B88C43390; Wed,  3 Apr 2024 03:30:32 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD20EC433F1;
	Wed,  3 Apr 2024 03:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD20EC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 270AD20075;
	Wed,  3 Apr 2024 11:30:21 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712115030;
	bh=XF2D2sPHroXYyefKd2obQ6jfostNnDcPvmsVRN+demg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bUtKMepZv0QM4/yWwRsJfffJODorh+VnQ7PWH5h4y7I8LiyqOPHErNZc8RoCdrYNV
	 m3w3BPIdVJeB8st3TTGIi14C0r+Vy8hM1A48aGJvquQazkqJZJNvoqF9JySyY1YDjx
	 gNBWjuR5fJyJjcm6AK43GRlHcAM5Te5GREv4X2NPL546io6ZjatZgov2kYGaKbd6Mz
	 lJLFs9fEDvYOt4+Wm7ktzT6txkoQB7QNof2DkRL76tJqkh9TZKTEmiSqzwpURhQC2r
	 oMZc30ylO4yhBm2F3QvYNg2ElHq1bRKBlx7OCH2hkGg03w7P4jPO6vfZ4JXdujSTaM
	 +uSCQWIy/EpyQ==
Message-ID: <3593e51f6e63dfd2b163d422032203d75e8bfb25.camel@codeconstruct.com.au>
Subject: Re: [PATCH 3/3] ARM: dts: Modify I2C bus configuration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
List-Id: <soc.lore.kernel.org>
To: Renze Nicolai <renze@rnplus.nl>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org,  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 joel@jms.id.au,  andrew@aj.id.au
Date: Wed, 03 Apr 2024 14:00:20 +1030
In-Reply-To: <20240329130152.878944-4-renze@rnplus.nl>
References: <20240329130152.878944-1-renze@rnplus.nl>
	 <20240329130152.878944-4-renze@rnplus.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0

Hi Renze,

On Fri, 2024-03-29 at 14:01 +0100, Renze Nicolai wrote:
> This commit enables I2C bus 8 which is exposed on the IPMB_1 connector on=
 the X570D4U mainboard.
> Additionally it adds a descriptive comment to I2C busses 1 and 5.

checkpatch on this one too :)

Cheers,

Andrew
