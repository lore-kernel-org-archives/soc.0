Return-Path: <SRS0=fxVn=GD=jamieiles.com=jamie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D6AC433DB
	for <soc@archiver.kernel.org>; Thu, 31 Dec 2020 12:49:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B23D5223E0; Thu, 31 Dec 2020 12:49:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB128223E8
	for <soc@kernel.org>; Thu, 31 Dec 2020 12:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB128223E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jamieiles.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jamie@jamieiles.com
Received: by mail-wm1-f42.google.com with SMTP id n16so3836061wmc.0
        for <soc@kernel.org>; Thu, 31 Dec 2020 04:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+u96/FdXtTHmr5sq3JveWFw2+/26Jf5HarPYw8gvYCs=;
        b=LRifIyWKZ8eOFZxIGtpU/YPzV43QhXZop2mhbgMeq2j1tJmIEss1L8YfY/wZQzkb+H
         HyhZWcw1B5hI4ZkYVss8CObpO9qKeGPyWTH978tGg37pSCPJlzs1ea0ezfqY8XXyFH16
         K4a3UaO++OmVgGpJuk4WWwyTixpmUWvYecKa6b5FQrENGKFrNQDBhKL3bdiFtK32UMpm
         vi/NjDURR80NlUYY6siwN7Pxwpz6IlZz3ZSh92QiIeiGvVkMKMdjh9tjRqr1+ma3CTBy
         8UFB1cZxKQ8Lma3mRhL2AYlzFeESkAkNbonYqHHJxltr85w5Zr5wQu6YkSmOezjZYzF0
         4uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+u96/FdXtTHmr5sq3JveWFw2+/26Jf5HarPYw8gvYCs=;
        b=N4yYFtGzrsrq6U0qvBZge//UXS3qb4aOagOz+jyP2qdecTpq2KOcEuZeA4UuBpk/wG
         NtW1e8Jl8+1jUu8PQaDL5z6GLAMoOc290HWvZzhFK7owdgZasLZ4pLSmDaMoWvTA46W1
         3PhIvlyiRqEhqDSpXc1rae56pqPRNFARM0fSTflnw2U3GERLW0CmVY6c48OwtX4gqmof
         ywecGlY5sb5NNKm1Zy42BOOljFz2tBwdLis/EVHb4EAHIFivRzsumDgtYdn4bNuqVuHt
         hj3s3RUkeWEvvLJhN2XQXkZHoIlT0hkp8fvHgz+vC5lbIIFcZZf56xt8OaKGB1Q5Ic+0
         sE2g==
X-Gm-Message-State: AOAM531km3iQ9Jz6bHKq3F1m66Sa1iTIIzVShYhXtT9Smu9EPHJfuZIJ
	7XuRx10v1/VzDnsdouYMzbejDA==
X-Google-Smtp-Source: ABdhPJyaaWOCxYGSn5WfpQxWYXqZdpY4FkOhFAEAmVOwUHvAIspHxZt2IHTzFJ/vdcbAAwb8EbljbA==
X-Received: by 2002:a1c:ba07:: with SMTP id k7mr11943033wmf.34.1609418987858;
        Thu, 31 Dec 2020 04:49:47 -0800 (PST)
Received: from localhost ([82.44.17.50])
        by smtp.gmail.com with ESMTPSA id h15sm68233268wru.4.2020.12.31.04.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:49:46 -0800 (PST)
Date: Thu, 31 Dec 2020 12:49:46 +0000
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
Message-ID: <20201231124946.GA2918779@willow>
References: <20201230152010.3914962-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230152010.3914962-1-arnd@kernel.org>

Hi Arnd,

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

Rob has a series to remove Picoxcell as there's no active development on 
this anymore and Intel have stopped producing the chips.

Thanks,

Jamie
