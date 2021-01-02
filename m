Return-Path: <SRS0=QrEK=GF=jamieiles.com=jamie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDE9C433DB
	for <soc@archiver.kernel.org>; Sat,  2 Jan 2021 18:04:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 180B4207FF; Sat,  2 Jan 2021 18:04:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4CA207CD
	for <soc@kernel.org>; Sat,  2 Jan 2021 18:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4CA207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jamieiles.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jamie@jamieiles.com
Received: by mail-wr1-f54.google.com with SMTP id t16so26854508wra.3
        for <soc@kernel.org>; Sat, 02 Jan 2021 10:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PWNWWtqjXuhRBofwhd880gtdlxvyGF0Fap+WwqM+hHI=;
        b=eLkwmntFIPeqPFQewS/PKJ6gDMz4HGYh3W6ZYAGXhokmV6sf5ibtMWI5E+2XB+4idI
         uNCCrtDY6C/B8YgiUE/W5pBcfP8N+NIugHE2bpXA6L4YU4RLE+YeF9bfrFH++ywUHreB
         bL44ihJrCPs3Tdmt9c2y0bn+0+kCQ8qz13085qwaN6P2rua1wopu+dK7zcEf/Ybny58R
         oXD962oNTItAx9o+gO++axdhJ9NL3MukKK84laW+nctEdWIW47S5+rTJ4Wpy0A2RdMTq
         f3S2Y7vnDpWljJltpWBs8tekICKFtP5hfYhgqmfjdpjGM6AZrom3HkWnD5HyRkC7mhA0
         eE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PWNWWtqjXuhRBofwhd880gtdlxvyGF0Fap+WwqM+hHI=;
        b=kFHYgFWO34Mtl7rPcRFovHi004R/7o1OivnNC0XoF9eBIeMdvHn4UOehirZRI32anY
         Pp9771afNwTaFMO2nEIzgXR8LOjFHtnXfSz1vfleYfDfld6YXqKX4iBOiL/rVf2JL6VY
         aGw8E297H5FV9cs9CxSgZzkod3hFZz2uEYHjGCbV/YeLV1Tp95w7/ROjuecsC/rqq+r4
         sQ5aSRLYEy0d+48TEkbppOZCK7UrP/zru21aVKTHC0l/xNsdYBj09J2Ns0K47FkV9JXt
         oisDm8Dic6PeIfDqZIrgjK5Umn4XUi9X9lGTcfVyUzRBxA4YPXLrNuphtJU+xWiB52XX
         x/ug==
X-Gm-Message-State: AOAM5316f17YLoW0tGCVCgWgw5FcYtfoQupUP6AB1y4Vmw9zgygm6EOO
	qz4r3cRbjD9ymkCSbQjgnH2TWN/g/5Sxkg==
X-Google-Smtp-Source: ABdhPJwRL5VBumv1xxr0bh6v+UMGz68EkeaPJuNuO19pyYUeH9obAVZlMtLxE2oY/yePO+FrdyRXsQ==
X-Received: by 2002:a5d:6909:: with SMTP id t9mr71553849wru.327.1609610640397;
        Sat, 02 Jan 2021 10:04:00 -0800 (PST)
Received: from localhost ([82.44.17.50])
        by smtp.gmail.com with ESMTPSA id b7sm75991272wrv.47.2021.01.02.10.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 10:03:59 -0800 (PST)
Date: Sat, 2 Jan 2021 18:03:58 +0000
From: Jamie Iles <jamie@jamieiles.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Jamie Iles <jamie@jamieiles.com>, Rob Herring <robh+dt@kernel.org>,
	soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: picoxcell: fix missing interrupt-parent properties
Message-ID: <20210102180358.GA4063852@willow>
References: <20201230152010.3914962-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230152010.3914962-1-arnd@kernel.org>

On Wed, Dec 30, 2020 at 04:20:05PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> dtc points out that the interrupts for some devices are not parsable:
> 
> picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_property): /paxi/gem@30000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_property): /paxi/dmac@40000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_property): /paxi/dmac@50000: Missing interrupt-parent
> picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
> 
> There are two VIC instances, so it's not clear which one needs to be
> used. I found the BSP sources that reference VIC0, so use that:
> 
> https://github.com/r1mikey/meta-picoxcell/blob/master/recipes-kernel/linux/linux-picochip-3.0/0001-picoxcell-support-for-Picochip-picoXcell-SoC.patch
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Jamie Iles <jamie@jamieiles.com>

Thanks Arnd!

Jamie
