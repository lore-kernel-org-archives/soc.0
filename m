Return-Path: <SRS0=ZujC=FN=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81556C4361B
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 16:36:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4291D23B52; Wed,  9 Dec 2020 16:36:35 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41F922210
	for <soc@kernel.org>; Wed,  9 Dec 2020 16:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41F922210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-ot1-f66.google.com with SMTP id b18so1956549ots.0
        for <soc@kernel.org>; Wed, 09 Dec 2020 08:36:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Nrvk3PUoM6SzdFghQZEGJk8ahD1T69zwk8JW2tlVaQ=;
        b=r15sNDg+dWxlc0VXpR/gPNLUijEcZkJcE2F3SWWi+N5CHkvVoD8Ur7uICg3kiWW/8b
         gce5caG+MINEcHEdR8Oh/Pmv4CplgHawaYOfBp8LOYymtA3BZPwWh1vnE6uZBabSr5YL
         548VlcWNwUe3A3UUlaCwZWxm8nuRj7qsw3EOSCz+IYq+DeSQ60e5DlmT3/VzxoaLN9gS
         Y0454ipFtE5jv8wQ6hm1F1DVioTFV8HVNG/Qk9jUqD3dp344e9AOk/g+4YaAoxY2Bwzz
         0sTpG1Hd3KdjOHKIROSemXlYCDPl4j4iTK0cPbmQYrXZXp5D70a6tNdPqxQvZZIwOAX2
         0UUQ==
X-Gm-Message-State: AOAM5310+NKM7I1nNlx28v3DozWEHo39lGb1kWc0Lhs7V6VtXVtquiOM
	Kw5Gg+KoiZAVoiUnLGrQQ9xGS8+Guw==
X-Google-Smtp-Source: ABdhPJyESP95Acad+YcdIIO2pMEpSKBJsfzgBnAA2l+p3gk8d9NrU8YIa9Fq2cFt2jMoPuJAz8jHKQ==
X-Received: by 2002:a9d:3b36:: with SMTP id z51mr2500260otb.272.1607531793795;
        Wed, 09 Dec 2020 08:36:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b25sm447323ooe.18.2020.12.09.08.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:36:31 -0800 (PST)
Received: (nullmailer pid 570767 invoked by uid 1000);
	Wed, 09 Dec 2020 16:36:30 -0000
Date: Wed, 9 Dec 2020 10:36:30 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, w@1wt.eu, olof@lixom.net, devicetree@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH v2 03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2
 to mstar boards
Message-ID: <20201209163630.GA570737@robh.at.kernel.org>
References: <20201201134330.3037007-1-daniel@0x0f.com>
 <20201201134330.3037007-4-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201134330.3037007-4-daniel@0x0f.com>

On Tue, 01 Dec 2020 22:43:23 +0900, Daniel Palmer wrote:
> The Honestar SSD201_HT_V2 is a full size devkit for the SigmaStar
> SSD201 or SSD202D (they are pin compatible).
> 
> Currently only the SSD202D version is supported as that's the one
> I have.
> 
> Link: https://linux-chenxing.org/infinity2/ssd201_ht_v2/
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Documentation/devicetree/bindings/arm/mstar/mstar.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
