Return-Path: <SRS0=uwzT=FF=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B71BC63777
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 02:03:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2344F20857; Tue,  1 Dec 2020 02:03:10 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AB4207FF
	for <soc@kernel.org>; Tue,  1 Dec 2020 02:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9AB4207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-io1-f66.google.com with SMTP id o8so72429ioh.0
        for <soc@kernel.org>; Mon, 30 Nov 2020 18:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Zy3hLt0xkkBgO7Nur8AYnrY8ZOOFFFXYaDalID7C9w=;
        b=QmS3+kXjYZNUTGqMkTvmP+soaxwAtHbFUb24KhYpV/LbytSQYQBznqNOIOJZhVfE/o
         c7yiUuAIv5r0TRxLQ/ByGycTXMcOABKqLtyQPBH7NobaXhr8v6K4zbtUevm7rMymiQtO
         F1LdUNijw0LCAONADqnr2Qp1CPD2ANUyx5Zk36jFAkyZmd99RcvwLPF3b3UCvR3ENYy+
         p5/SQ/WBwJhrQAq07F6huJMipCBazrtJZeDsHGzTv/qduRCXixkVNDmonAU8fmA6aQ26
         1CEq6osWa/3dI7eUILNWZvCjPwO0Mpw4LB6ewg41pki8QbRRXxSzk92UXEig85u8L9YO
         Sd2w==
X-Gm-Message-State: AOAM530gn9w7j1/Img27jw/3Pwof+tHGjeb3WZDSI/vCtOWY528eNxuJ
	hND7eWQF6wTafHKyFRp2lg==
X-Google-Smtp-Source: ABdhPJyJO19//cOlfXYuKkU69EBSQ7B5q3bGWe2glFhP12AG6qNZC3Z/SLpJjYEVdrkPAxDh5KMhzw==
X-Received: by 2002:a02:85cc:: with SMTP id d70mr658274jai.83.1606788188806;
        Mon, 30 Nov 2020 18:03:08 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 12sm215807ily.42.2020.11.30.18.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 18:03:07 -0800 (PST)
Received: (nullmailer pid 3484888 invoked by uid 1000);
	Tue, 01 Dec 2020 02:02:56 -0000
Date: Mon, 30 Nov 2020 19:02:56 -0700
From: Rob Herring <robh@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, w@1wt.eu
Subject: Re: [PATCH v4 2/5] dt-bindings: gpio: Binding for MStar MSC313 GPIO
 controller
Message-ID: <20201201020256.GA3484800@robh.at.kernel.org>
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <20201129110803.2461700-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129110803.2461700-3-daniel@0x0f.com>

On Sun, 29 Nov 2020 20:07:59 +0900, Daniel Palmer wrote:
> Add a binding description for the MStar/SigmaStar GPIO controller
> found in the MSC313 and later ARMv7 SoCs.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../bindings/gpio/mstar,msc313-gpio.yaml      | 59 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
