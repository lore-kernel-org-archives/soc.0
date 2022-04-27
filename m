Return-Path: <SRS0=aKq0=VF=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99793C433F5
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 21:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62325C385AE; Wed, 27 Apr 2022 21:24:43 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 10324C385A7;
	Wed, 27 Apr 2022 21:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 10324C385A7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-e922e68b0fso3379567fac.1;
        Wed, 27 Apr 2022 14:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OvoClY7Wo6sAwCkQijL4bMeLDhiKrdnEO3rWf59LH4w=;
        b=BkGyv0197qer3qjsTevp4cbvpWutiT+aEg+sj/rLMSLBsVvVKYw3pQLzQ7TpSVqWJL
         gfZ7S+o2E/0Pr0RJ6ZCHGi1zuSb15CpottpEeIHTab8nSBT+5QyAXqSMyHyXx+mYDIeT
         YpZdQGXrHYGsOxS5K9KZPmlYP56NI8x/IGm22MdWs5Lgck3IWTYmDDxzKgaoXziBkIyN
         zuYZjSdAtwjUq8q7HKfJlFV7dgnNheAevqhIRv+YfaSNPN9aEJePCIKAblUzzus58fxY
         mi9NiNjMG3YJyBTnBWyTOe4KzsW0674qJKmgLLFjXrz+d3Udc2n3DvwBx2S23T4PHEvI
         ISbg==
X-Gm-Message-State: AOAM531UtDrIrDaoCSPvuNfqn71bGO63zyZsvFtzZnK9VDZ6Eod2fhdY
	KekqudKY46OZqjA0VjVjbw==
X-Google-Smtp-Source: ABdhPJx/70ovX3HOazt8zRT+CTgAxkXr29nwoWaE6axRQEDHV4FvWZ3Gtc7RKPYuBMQ2hTUa3jlvlQ==
X-Received: by 2002:a05:6870:c390:b0:e2:602f:d81 with SMTP id g16-20020a056870c39000b000e2602f0d81mr12223269oao.262.1651094681062;
        Wed, 27 Apr 2022 14:24:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j17-20020a056808119100b00322e1b61907sm6337123oil.35.2022.04.27.14.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 14:24:40 -0700 (PDT)
Received: (nullmailer pid 688314 invoked by uid 1000);
	Wed, 27 Apr 2022 21:24:39 -0000
Date: Wed, 27 Apr 2022 16:24:39 -0500
From: Rob Herring <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, f.fainelli@gmail.com, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, masahiroy@kernel.org, michal.lkml@markovi.net, ndesaulniers@google.com, nsaenz@kernel.org, olof@lixom.net, rjui@broadcom.com, sbranden@broadcom.com, soc@kernel.org, stefan.wahren@i2se.com
Subject: Re: [RFC PATCH v2 2/3] of: Add support for -@ when compiling overlays
Message-ID: <Ymm0l2/oGpt/SeDO@robh.at.kernel.org>
References: <20220427185243.173594-1-detlev.casanova@collabora.com>
 <20220427185243.173594-3-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427185243.173594-3-detlev.casanova@collabora.com>

On Wed, Apr 27, 2022 at 02:52:42PM -0400, Detlev Casanova wrote:
> This commit adds an option to compile all device trees with -@ to add the
> symbol table to the Device Tree Blobs.

Why would we want to tie this to the kernel config?

Globally enabling it has already been discussed and rejected.

> It prepares the introduction of device tree overlays that are
> not applied on device trees at compile time (dtbo files.)
> 
> These device tree overlays will be used by either a bootloader or a
> linux userspace tool to extend the base device tree.
> 
> This is used e.g. for drivers that need device tree nodes for optional
> non plug and play devices, like an external DSI touchscreen panel that
> embeds different i2c devices to control it.

You can already set DTC_FLAGS per directory (and target?), so enable it 
for the dtbs that have overlays.

> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/of/Kconfig   | 8 ++++++++
>  scripts/Makefile.lib | 9 +++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
