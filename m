Return-Path: <SRS0=VeFV=7T=atomide.com=tony@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C3AC7619A
	for <soc@archiver.kernel.org>; Mon, 27 Mar 2023 08:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A0ECC4339B; Mon, 27 Mar 2023 08:21:40 +0000 (UTC)
Received: from muru.com (muru.com [72.249.23.125])
	by smtp.kernel.org (Postfix) with ESMTP id A9DF5C433D2;
	Mon, 27 Mar 2023 08:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9DF5C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=atomide.com
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 3B5078108;
	Mon, 27 Mar 2023 08:21:38 +0000 (UTC)
Date: Mon, 27 Mar 2023 11:21:37 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, bcousson@baylibre.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap4: add initial support for Epson Moverio
 BT-200
Message-ID: <20230327082137.GH7501@atomide.com>
References: <20230313110409.2294154-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313110409.2294154-1-andreas@kemnade.info>

* Andreas Kemnade <andreas@kemnade.info> [230313 13:04]:
> yes, epson,embt2ws is unknown, is the txt->yaml conversion around the
> corner? I would then resubmit it includding an addition
> to that yaml. If not probably I resubmit the conversion patch with
> the compatible added. But that should not stop the rest of this patch from
> being reviewed.

Yeah let's do the yaml conversion first as otherwise we'll be adding some
extra warnings for the dt folks.

Your patch looks otherwise OK to me.

Thanks,

Tony
