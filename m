Return-Path: <SRS0=S99x=TX=opensource.wdc.com=prvs=063b04340=damien.lemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0948DC43217
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 08:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF2F8C340EB; Sat, 12 Mar 2022 08:01:08 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 963DCC340F4
	for <soc@kernel.org>; Sat, 12 Mar 2022 08:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 963DCC340F4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=opensource.wdc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1647072068; x=1678608068;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uvjzLtZ0QuVOYXq3pO1ebVjYlGHyAzBNRpNQOKxDX9s=;
  b=jOm2kKpQoGVAmzAsBB0efrHUSNgix+MsjAEmWlJjPXA53vDOno7HqKKo
   sd5BsELEc7ceBcG7Fdl3ln2NNJ/pfSwSfSuk/xSMugxFn2xQBydCufH3M
   A7VoVTDs5ZLpd7VX++KaVoGzbUWJsUhgtHryV43syAf8/VoG2TzhiaNVl
   jF6S8Pwvy71ZYZptr0JiQVQM/vJq0/B98eUWCMoM2IEqSIWwPFpTX2JrS
   2qjAFrZbqdUedc8anb2WRtIMnMbK5WDdMjLZRTeOwKxEm5M5fp+Xg14A+
   ssMR40cJ+cFZuy4rWaRaAhWyiOvYCcvResBaRzAUTCHvP9+r5rwCscOnI
   g==;
X-IronPort-AV: E=Sophos;i="5.90,175,1643644800"; 
   d="scan'208";a="196114302"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 12 Mar 2022 16:01:00 +0800
IronPort-SDR: Knvz/E3UA3AgyGTTWFXQKqSKS3pd4oO7ltNwGdKLzKub8+g9JB/TuN1ShtUOXxDTd8+OOnpxNg
 ffhmRq0JvpsBMFLyPr0O58laZcK51XBMoLhKdbGaLI3GRiblwYmesGe9DjOwCLbInHaQiN/HhI
 3nWhW572f5AhpoUjJYgghzhMjOxJWPsIw5SPDPa2jKPgI/+tgzmN06CJU4ynGFTg62PLcqbnQU
 RFjuzcHOyfjOecL14+GZh1gjLtuz77T1LyeEUnA0vDes02tN/t/+AkCMt0OOqCqKQVi3pR8OIa
 YkkBc6Z/nlmMZjkxmHwZGhE2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 23:33:10 -0800
IronPort-SDR: Lffs645w13hYTq49q2t44UNYvfcXb36pH+3OhuxkUYuLU1JcRZsXsvDMq/JKX47xbEZy+VDfdA
 WzS4hcCmVQfbVgmo4TbLajxytW66NBMor5ceC4qB7VSrgAWkUNxT/C8OePa3cg8vb11UevfiqH
 f1wnA2VJI6LE6v7yijgFOexNCLZlw4LKDvUrpmA2uRWyapioe3O72QMOZ4N86Br6HHhdqNC7iV
 WP6jIifIh/iEoa0qsZoex3AzhLy7+oa84vUiZb+oftVQzoqg26qCqe4Lxz6by4mKqE9a8Bjv2A
 fJU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2022 00:01:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KFwGg4RSVz1Rwrw
	for <soc@kernel.org>; Sat, 12 Mar 2022 00:00:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1647072059; x=1649664060; bh=uvjzLtZ0QuVOYXq3pO1ebVjYlGHyAzBNRpN
	QOKxDX9s=; b=bBYOo9jhwYPoqTSHBp0YvM2MoBbGU8OqFRCA+z1Jhz0l8gxNVAb
	uAc6F7g6HHG4lG+fRzgKaa+VNgHbJPd+lwZTeCfQK9do2702blXDIw+ZubM3dXeP
	gjTFYdc0fFpEZjK7mRGQMvVw1bCd0/LPc89SMwzlnEv38enPEhc0FtlfA2HId3yL
	RzwBcBgPYji3OzcbebzwBEocXrFVVV2qkx45zDliiOd14/82Rnk62TGqHmni9lM3
	hqHeRQ2rHWEbk08TEeOY2fc8TXITghK06VottOKWDbRo6OdLlm2NlyrZBv10c511
	dlaUmQQMvdBbSKrd1J7Gwn72PSDBlttwCnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5N1pxUW0O8iD for <soc@kernel.org>;
	Sat, 12 Mar 2022 00:00:59 -0800 (PST)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KFwGb0tYyz1Rvlx;
	Sat, 12 Mar 2022 00:00:54 -0800 (PST)
Message-ID: <05309a59-85cd-2434-6435-6fd956fa75d6@opensource.wdc.com>
Date: Sat, 12 Mar 2022 17:00:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v6 0/6] Add sata nodes to rk356x
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>,
 Peter Geis <pgwipeout@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20220311210357.222830-1-linux@fw-web.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220311210357.222830-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/12/22 06:03, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This Series converts the binding for ahci-platform to yaml and adds
> sata nodes to rockchip rk356x device trees.

Rob,

I saw you took patches 1, 4 and 5. What about the others ? Are you
taking them or should I take them through the ATA tree ?


-- 
Damien Le Moal
Western Digital Research
